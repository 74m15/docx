<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:aml="http://schemas.microsoft.com/aml/2001/core" 
	xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" 
	xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" 
	xmlns:o="urn:schemas-microsoft-com:office:office" 
	xmlns:v="urn:schemas-microsoft-com:vml" 
	xmlns:w10="urn:schemas-microsoft-com:office:word" 
	xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml" 
	xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint" 
	xmlns:wsp="http://schemas.microsoft.com/office/word/2003/wordml/sp2"
	 xmlns:sl="http://schemas.microsoft.com/schemaLibrary/2003/core" 
	 xmlns:st1="urn:schemas-microsoft-com:office:smarttags" 
	 
	 xmlns:ni="urn:sapcc:nota_integrativa" 
	 
	 xmlns:str="http://exslt.org/strings" 
	 xmlns:exsl="http://exslt.org/common" 
	 xmlns:java="http://xml.apache.org/xalan/java" 
	 xmlns:redirect="http://xml.apache.org/xalan/redirect" 
	 xmlns:info="xalan://org.apache.xalan.lib.NodeInfo"
	 
	 extension-element-prefixes="str exsl java info redirect">
	 
	<xsl:output method="xml" version="1.0" encoding="utf-8" indent="no"/>

	<!--
		4	Fatal error (stylesheet dies)
		3	Error
		2	Warning
		1	Info
		0	Debug
	-->
	<xsl:param name="log-level">2</xsl:param>

	<xsl:param name="type_string_str">|string</xsl:param>
	<xsl:param name="type_double_str">|double</xsl:param>
	<xsl:param name="type_money_str">|money</xsl:param>
	<xsl:param name="type_percent_str">|percent</xsl:param>
	<xsl:param name="type_percent3_str">|percent3</xsl:param>
	<xsl:param name="type_integer_str">|integer</xsl:param>

	<xsl:param name="type_string">string</xsl:param>
	<xsl:param name="type_double">double</xsl:param>
	<xsl:param name="type_money">money</xsl:param>
	<xsl:param name="type_percent">percent</xsl:param>
	<xsl:param name="type_percent3">percent3</xsl:param>
	<xsl:param name="type_integer">integer</xsl:param>
	
	<xsl:param name="config-file">config.xml</xsl:param>
	<xsl:param name="config" select="document($config-file)"/>

	<xsl:param name="shortcut_open">\{</xsl:param>
	<xsl:param name="shortcut_close">\}</xsl:param>
	
	<xsl:param name="preprocessor_templates">preprocessor_templates.xsl</xsl:param>

	<xsl:template match="/">
		<xsl:if test="$log-level &lt;= 0">
			<xsl:message>D Entering DOM root element</xsl:message>
		</xsl:if>
		
		<xsl:processing-instruction name="mso-application">progid="Word.Document"</xsl:processing-instruction>

		<xsl:if test="$log-level &lt;= 0">
			<xsl:message>D Opening file <xsl:value-of select="$preprocessor_templates"/> for creating dynamic templates</xsl:message>
		</xsl:if>
		<redirect:open file="{$preprocessor_templates}"/>
		<redirect:write file="{$preprocessor_templates}">
			<xsl:text disable-output-escaping="yes">&lt;xsl:stylesheet version="1.0" 
					xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
					xmlns:ni="urn:sapcc:nota_integrativa"
					xmlns:exsl="http://exslt.org/common" 
					xmlns:math="http://exslt.org/math" 
					extension-element-prefixes="exsl math"></xsl:text>
		</redirect:write>

		<xsl:apply-templates select="w:wordDocument" mode="copy"/>

		<xsl:if test="$log-level &lt;= 0">
			<xsl:message>D Closing file <xsl:value-of select="$preprocessor_templates"/></xsl:message>
		</xsl:if>
		<redirect:write file="{$preprocessor_templates}">
			<xsl:text disable-output-escaping="yes">&lt;/xsl:stylesheet></xsl:text>
		</redirect:write>
		<redirect:close file="{$preprocessor_templates}"/>
	</xsl:template>

	<xsl:template match="*" mode="copy">
		<xsl:call-template name="copy-template"/>
	</xsl:template>

	<xsl:template name="copy-template">
		<xsl:copy>
			<xsl:for-each select="@*[not(starts-with(name(.),'wsp:'))]">
				<xsl:attribute name="{name(.)}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>
			<xsl:apply-templates select="node()[not(starts-with(name(.),'wsp:'))]|text()" mode="copy"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="w:p" mode="copy">
		<xsl:choose>
			<xsl:when test="count(aml:annotation[@w:type = 'Word.Comment.Start']) > 0">
				<xsl:element name="{name(.)}">
					<xsl:call-template name="annotated-p-copy">
						<xsl:with-param name="body" select="*[exsl:objectType(.) = 'node-set']"/>
						<xsl:with-param name="shift" select="1"/>
					</xsl:call-template>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="copy-template"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="w:body | wx:sect | wx:sub-section" mode="copy">
		<xsl:choose>
			<xsl:when test="count(aml:annotation[@w:type = 'Word.Comment.End']) > 0">
				<xsl:element name="{name(.)}">
					<xsl:call-template name="annotated-sect-copy">
						<xsl:with-param name="body" select="*[exsl:objectType(.) = 'node-set']"/>
						<xsl:with-param name="shift" select="1"/>
					</xsl:call-template>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="copy-template"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="annotated-sect-copy">
		<xsl:param name="body"/>
		<xsl:param name="shift"/>

		<xsl:variable name="current-node" select="$body[$shift]"/>

		<xsl:if test="count($body) >= $shift">
			<xsl:choose>
				<xsl:when test="name($current-node) = 'w:p' and $current-node/aml:annotation[@w:type = 'Word.Comment.Start'] and not($current-node/aml:annotation[@w:type = 'Word.Comment.End'])">
					<xsl:for-each select="$current-node">
						<xsl:call-template name="copy-template"/>
					</xsl:for-each>
					
					<xsl:variable name="aml_id" select="$current-node/aml:annotation/@aml:id"/>
					<xsl:variable name="aml_pos"
						><xsl:choose>
							<xsl:when test="name($body[$shift + 3]) = 'aml:annotation'">3</xsl:when>
							<xsl:when test="name($body[$shift + 4]) = 'aml:annotation'">4</xsl:when>
							<xsl:when test="name($body[$shift + 5]) = 'aml:annotation'">5</xsl:when>
							<xsl:when test="name($body[$shift + 6]) = 'aml:annotation'">6</xsl:when>
							<xsl:otherwise>
								<xsl:if test="$log-level &lt;= 3">
									<xsl:message>E Cannot find element aml:annotation in element <xsl:value-of select="name(.)"/> at position (row: <xsl:value-of select="info:lineNumber(.)"/>, col: <xsl:value-of select="info:columnNumber(.)"/>). Transformation stops!</xsl:message>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose
					></xsl:variable>

					<xsl:variable name="table" select="normalize-space(str:concat($body[$shift + $aml_pos + 1]//aml:annotation[@aml:id = $aml_id]//aml:content//w:t))"/>

					<xsl:choose>
						<xsl:when test="starts-with($table,'table:')">
							<xsl:if test="$log-level &lt;= 1">
								<xsl:message>I Found table reference "<xsl:value-of select="$table"/>"</xsl:message>
							</xsl:if>
							
							<!-- per assunzione, alla posizione $shift + 1 c'è la tabella -->
							<xsl:call-template name="table-replacement">
								<xsl:with-param name="table-id" select="normalize-space(substring-after($table,'table:'))"/>
								<xsl:with-param name="table-node" select="$body[$shift+1]"/>
							</xsl:call-template>
							
							<!-- per assunzione, alla posizione $shift + 2 c'è la didascalia -->
							<xsl:for-each select="$body[$shift+2]">
								<xsl:call-template name="copy-template"/>
							</xsl:for-each>
							
							<xsl:if test="$aml_pos > 3">
								<xsl:for-each select="$body[$shift+3]">
									<xsl:call-template name="copy-template"/>
								</xsl:for-each>
							</xsl:if>
							
							<xsl:if test="$aml_pos > 4">
								<xsl:for-each select="$body[$shift+4]">
									<xsl:call-template name="copy-template"/>
								</xsl:for-each>
							</xsl:if>
							
							<xsl:if test="$aml_pos > 5">
								<xsl:for-each select="$body[$shift+5]">
									<xsl:call-template name="copy-template"/>
								</xsl:for-each>
							</xsl:if>
	
							<!-- copia la chiusura del blocco commento -->
							<xsl:for-each select="$body[$shift + $aml_pos]">
								<xsl:call-template name="copy-template"/>
							</xsl:for-each>

							<xsl:call-template name="annotated-sect-copy">
								<xsl:with-param name="body" select="$body"/>
								<xsl:with-param name="shift" select="$shift + $aml_pos + 1"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="annotated-sect-copy">
								<xsl:with-param name="body" select="$body"/>
								<xsl:with-param name="shift" select="$shift + 1"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="$current-node">
						<xsl:apply-templates select="." mode="copy"/>
					</xsl:for-each>

					<xsl:call-template name="annotated-sect-copy">
						<xsl:with-param name="body" select="$body"/>
						<xsl:with-param name="shift" select="$shift + 1"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="annotated-p-copy">
		<xsl:param name="body"/>
		<xsl:param name="shift"/>

		<xsl:variable name="current-node" select="$body[$shift]"/>

		<xsl:if test="count($body) >= $shift">
			<xsl:choose>
				<xsl:when test="name($current-node) = 'aml:annotation' and $current-node/@w:type = 'Word.Comment.Start'">
					<xsl:for-each select="$current-node">
						<xsl:call-template name="copy-template"/>
					</xsl:for-each>
					
					<xsl:variable name="aml_pos"
						><xsl:choose>
							<xsl:when test="name($body[$shift + 2]) = 'aml:annotation'">2</xsl:when>
							<xsl:when test="name($body[$shift + 3]) = 'aml:annotation'">3</xsl:when>
							<xsl:when test="name($body[$shift + 4]) = 'aml:annotation'">4</xsl:when>
							<xsl:when test="name($body[$shift + 5]) = 'aml:annotation'">5</xsl:when>
							<xsl:otherwise>
								<xsl:message terminate="yes">F Cannot find element aml:annotation in element <xsl:value-of select="name(.)"/> at position (row: <xsl:value-of select="info:lineNumber(.)"/>, col: <xsl:value-of select="info:columnNumber(.)"/>). Transformation stops!</xsl:message>
							</xsl:otherwise>
						</xsl:choose
					></xsl:variable>
					
					<xsl:variable name="s1" select="java:java.lang.String.new(str:concat($body[$shift + $aml_pos + 1]//aml:content//w:t))"/>
					<xsl:variable name="s2" select="java:replaceAll($s1, $shortcut_open, java:java.util.regex.Matcher.quoteReplacement($config//shortcut.open))"/>
					<xsl:variable name="xpath" select="normalize-space(java:replaceAll($s2, $shortcut_close, java:java.util.regex.Matcher.quoteReplacement($config//shortcut.close)))"/>
					
					<xsl:choose>
						<xsl:when test="starts-with($xpath,'xpath:')">
							<xsl:if test="$log-level &lt;= 1">
								<xsl:message>I Found XPath reference "<xsl:value-of select="$xpath"/>"</xsl:message>
							</xsl:if>
							
							<xsl:call-template name="r-replacement">
								<xsl:with-param name="r-node" select="$body[$shift + 1]"/>
								<xsl:with-param name="xpath" select="translate(normalize-space(substring-after($xpath,'xpath:')),'”','&quot;')"/>
							</xsl:call-template>
							
							<xsl:for-each select="$body[$shift + $aml_pos]">
								<xsl:call-template name="copy-template"/>
							</xsl:for-each>
							<xsl:for-each select="$body[$shift + $aml_pos + 1]">
								<xsl:call-template name="copy-template"/>
							</xsl:for-each>
		
							<xsl:call-template name="annotated-p-copy">
								<xsl:with-param name="body" select="$body"/>
								<xsl:with-param name="shift" select="$shift + $aml_pos + 2"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="annotated-p-copy">
								<xsl:with-param name="body" select="$body"/>
								<xsl:with-param name="shift" select="$shift + 1"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="$body[$shift]">
						<xsl:call-template name="copy-template"/>
					</xsl:for-each>

					<xsl:call-template name="annotated-p-copy">
						<xsl:with-param name="body" select="$body"/>
						<xsl:with-param name="shift" select="$shift + 1"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="table-replacement">
		<xsl:param name="table-id"/>
		<xsl:param name="table-node"/>

		<xsl:variable name="gen-id" select="generate-id($table-node)"/>
		<xsl:variable name="table-name" select="$config//Table[@id = $table-id]/@template"/>

		<xsl:call-template name="outputTableNode">
			<xsl:with-param name="id" select="generate-id($table-node)"/>
			<xsl:with-param name="table-id" select="$table-id"/>
			<xsl:with-param name="table-root" select="$config//Table[@id = $table-id]/@root"/>
			<xsl:with-param name="table-name" select="$table-name"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="r-replacement">
		<xsl:param name="r-node"/>
		<xsl:param name="xpath"/>

		<xsl:element name="w:r">
			<xsl:for-each select="$r-node/@*[not(starts-with(name(.),'wsp:'))]">
				<xsl:attribute name="{name(.)}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>

			<xsl:for-each select="$r-node/*[not(name(.) = 'w:t')]">
				<xsl:copy-of select="."/>
			</xsl:for-each>

			<xsl:variable name="gen-id" select="generate-id($r-node)"/>

			<xsl:element name="w:t">
				<xsl:choose>
					<xsl:when test="contains($xpath,$type_double_str)">
						<xsl:call-template name="outputValueNode">
							<xsl:with-param name="value-root" select="normalize-space(substring-before($xpath,$type_double_str))"/>
							<xsl:with-param name="value-type" select="$type_double"/>
							<xsl:with-param name="id" select="$gen-id"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($xpath,$type_money_str)">
						<xsl:call-template name="outputValueNode">
							<xsl:with-param name="value-root" select="normalize-space(substring-before($xpath,$type_money_str))"/>
							<xsl:with-param name="value-type" select="$type_money"/>
							<xsl:with-param name="id" select="$gen-id"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($xpath,$type_integer_str)">
						<xsl:call-template name="outputValueNode">
							<xsl:with-param name="value-root" select="normalize-space(substring-before($xpath,$type_integer_str))"/>
							<xsl:with-param name="value-type" select="$type_integer"/>
							<xsl:with-param name="id" select="$gen-id"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($xpath,$type_percent_str)">
						<xsl:call-template name="outputValueNode">
							<xsl:with-param name="value-root" select="normalize-space(substring-before($xpath,$type_percent_str))"/>
							<xsl:with-param name="value-type" select="$type_percent"/>
							<xsl:with-param name="id" select="$gen-id"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($xpath,$type_percent3_str)">
						<xsl:call-template name="outputValueNode">
							<xsl:with-param name="value-root" select="normalize-space(substring-before($xpath,$type_percent3_str))"/>
							<xsl:with-param name="value-type" select="$type_percent3"/>
							<xsl:with-param name="id" select="$gen-id"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="outputValueNode">
							<xsl:with-param name="value-root" select="$xpath"/>
							<xsl:with-param name="value-type" select="'string'"/>
							<xsl:with-param name="id" select="$gen-id"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="outputTableNode">
		<xsl:param name="table-root"/>
		<xsl:param name="table-name"/>
		<xsl:param name="table-id"/>
		<xsl:param name="id"/>

		<xsl:if test="$log-level &lt;= 1">
			<xsl:message>I Inserting ni:Table element with ni:table-id="<xsl:value-of select="$table-id"/>", ni:table-root="<xsl:value-of select="$table-root"/>", ni:table-name="<xsl:value-of select="$table-name"/>"</xsl:message>
		</xsl:if>
		
		<xsl:element name="ni:Table">
			<xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
			<xsl:attribute name="ni:table-id"><xsl:value-of select="$table-id"/></xsl:attribute>
			<xsl:attribute name="ni:table-root"><xsl:value-of select="$table-root"/></xsl:attribute>
			<xsl:attribute name="ni:table-name"><xsl:value-of select="$table-name"/></xsl:attribute>
		</xsl:element>

		<redirect:write file="{$preprocessor_templates}">
			<xsl:element name="xsl:template">
				<xsl:attribute name="match">ni:Table[@id = '<xsl:value-of select="$id"/>']</xsl:attribute>
				<xsl:attribute name="mode">copy</xsl:attribute>
				<xsl:element name="xsl:call-template">
					<xsl:attribute name="name"><xsl:value-of select="$table-name"/></xsl:attribute>
					<xsl:element name="xsl:with-param">
						<xsl:attribute name="name">table-id</xsl:attribute>
						<xsl:value-of select="$table-id"/>
					</xsl:element>
					<xsl:element name="xsl:with-param">
						<xsl:attribute name="name">table-data</xsl:attribute>
						<xsl:attribute name="select"><xsl:value-of select="$table-root"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</redirect:write>
	</xsl:template>

	<xsl:template name="outputValueNode">
		<xsl:param name="value-root"/>
		<xsl:param name="value-type"/>
		<xsl:param name="id"/>

		<xsl:if test="$log-level &lt;= 1">
			<xsl:message>I Inserting ni:Value element with id="<xsl:value-of select="$id"/>", ni:value-root="<xsl:value-of select="$value-root"/>", ni:value-type="<xsl:value-of select="$value-type"/>"</xsl:message>
		</xsl:if>
		
		<xsl:element name="ni:Value">
			<xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
			<xsl:attribute name="ni:value-root"><xsl:value-of select="$value-root"/></xsl:attribute>
			<xsl:attribute name="ni:value-type"><xsl:value-of select="$value-type"/></xsl:attribute>
		</xsl:element>

		<redirect:write file="{$preprocessor_templates}">
			<xsl:element name="xsl:template">
				<xsl:attribute name="match">ni:Value[@id = '<xsl:value-of select="$id"/>']</xsl:attribute>
				<xsl:attribute name="mode">copy</xsl:attribute>
				<xsl:element name="xsl:choose">
					<xsl:element name="xsl:when">
						<xsl:attribute name="test">exsl:object-type(<xsl:value-of select="$value-root"/>) = 'node-set'</xsl:attribute>
						<xsl:element name="xsl:apply-templates">
							<xsl:attribute name="select"><xsl:value-of select="$value-root"/></xsl:attribute>
							<xsl:attribute name="mode">value</xsl:attribute>
							<xsl:element name="xsl:with-param">
								<xsl:attribute name="name">type</xsl:attribute>
								<xsl:attribute name="select">'<xsl:value-of select="$value-type"/>'</xsl:attribute>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:element name="xsl:otherwise">
						<xsl:element name="xsl:call-template">
							<xsl:attribute name="name">pretty-print</xsl:attribute>
							<xsl:element name="xsl:with-param">
								<xsl:attribute name="name">type</xsl:attribute>
								<xsl:attribute name="select">'<xsl:value-of select="$value-type"/>'</xsl:attribute>
							</xsl:element>
							<xsl:element name="xsl:with-param">
								<xsl:attribute name="name">value</xsl:attribute>
								<xsl:element name="xsl:value-of">
									<xsl:attribute name="select"><xsl:value-of select="$value-root"/></xsl:attribute>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</redirect:write>
	</xsl:template>
</xsl:stylesheet>
