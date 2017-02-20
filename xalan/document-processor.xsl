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
	
	xmlns:x="urn:schemas-microsoft-com:office:excel" 
	xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" 
	xmlns:html="http://www.w3.org/TR/REC-html40"

	xmlns:ni="urn:sapcc:nota_integrativa"
	
	xmlns:math="http://exslt.org/math"
	xmlns:java="http://xml.apache.org/xalan/java" 
	
	extension-element-prefixes="math java">

	<xsl:include href="preprocessor_templates.xsl"/>
	<xsl:include href="table_templates.xsl"/>
	
	<xsl:output method="xml" version="1.0" encoding="utf-8" indent="no"/>

	<xsl:decimal-format name="it-format" decimal-separator="," grouping-separator="."/>

	<!--
		4	Fatal error (stylesheet dies)
		3	Error
		2	Warning
		1	Info
		0	Debug
	-->
	<xsl:param name="log-level">2</xsl:param>

	<xsl:param name="dummy-fill">false</xsl:param>
	<xsl:param name="dummy-string">TEXT</xsl:param>
	<xsl:param name="dummy-money">MONEY</xsl:param>
	<xsl:param name="dummy-double">DOUBLE</xsl:param>
	<xsl:param name="dummy-percent">PERCENT</xsl:param>
	<xsl:param name="dummy-percent3">PERCENT3</xsl:param>
	<xsl:param name="dummy-integer">INTEGER</xsl:param>
	
	<xsl:param name="money-format">#.##0</xsl:param>
	<xsl:param name="double-format">#.##0,00</xsl:param>
	<xsl:param name="percent-format">#.##0,00%</xsl:param>
	<xsl:param name="percent3-format">#.##0,000%</xsl:param>
	<xsl:param name="integer-format">#.##0</xsl:param>
	
	<xsl:param name="type_string">string</xsl:param>
	<xsl:param name="type_double">double</xsl:param>
	<xsl:param name="type_money">money</xsl:param>
	<xsl:param name="type_percent">percent</xsl:param>
	<xsl:param name="type_percent3">percent3</xsl:param>
	<xsl:param name="type_integer">integer</xsl:param>

	<xsl:param name="data-file">database.xml</xsl:param>
	<xsl:param name="data" select="document($data-file)"/>
	
	<xsl:param name="config-file">config.xml</xsl:param>
	<xsl:param name="config" select="document($config-file)"/>
	
	<xsl:param name="template-suffix">_template.xsl</xsl:param>

	<xsl:template match="/">
		<xsl:if test="$log-level &lt;= 0">
			<xsl:message>D Entering DOM root element</xsl:message>
		</xsl:if>
		
		<xsl:processing-instruction name="mso-application">progid="Word.Document"</xsl:processing-instruction>
		
		<xsl:apply-templates select="w:wordDocument" mode="copy"/>
	</xsl:template>
		
	<xsl:template match="*" mode="copy">
		<xsl:copy>
			<xsl:for-each select="@*[not(starts-with(name(.),'wsp:'))]">
				<xsl:attribute name="{name(.)}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>
			
			<xsl:apply-templates select="node()[not(starts-with(name(.),'wsp:'))]|text()" mode="copy"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="*" mode="value">
		<xsl:param name="type"/>
	
		<xsl:call-template name="pretty-print">
			<xsl:with-param name="type" select="$type"/>
			<xsl:with-param name="value" select="."/>
		</xsl:call-template>		
	</xsl:template>

	<xsl:template name="pretty-print">
		<xsl:param name="type"/>
		<xsl:param name="value"/>
		
		<xsl:choose>
			<xsl:when test="$dummy-fill = string(true())">
				<xsl:choose>
					<xsl:when test="$type = $type_money"><xsl:value-of select="$dummy-money"/></xsl:when>
					<xsl:when test="$type = $type_double"><xsl:value-of select="$dummy-double"/></xsl:when>
					<xsl:when test="$type = $type_percent"><xsl:value-of select="$dummy-percent"/></xsl:when>
					<xsl:when test="$type = $type_percent3"><xsl:value-of select="$dummy-percent3"/></xsl:when>
					<xsl:when test="$type = $type_integer"><xsl:value-of select="$dummy-integer"/></xsl:when>
					<xsl:when test="$type = $type_string"><xsl:value-of select="$dummy-string"/></xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="string($value)">
					<xsl:variable name="s0" select="java:java.lang.String.new($value)"/>
					<xsl:variable name="replace" select="java:matches($s0, '.*\$\{.*\}.*')"/>
					<xsl:variable name="to_print_tmp"
						><xsl:choose>
							<xsl:when test="$replace">
								<xsl:variable name="param" select="substring-before(substring-after($value,'${'),'}')"/>
								<xsl:value-of select="concat(substring-before($value,'${'), $config//*[name() = $param], substring-after($value, '}'))"
							/></xsl:when>
							<xsl:otherwise><xsl:value-of select="$value"/></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="to_print"
						><xsl:choose>
							<xsl:when test="$type = $type_string"><xsl:value-of select="$to_print_tmp"/></xsl:when>
							<xsl:when test="contains(translate($to_print_tmp,'e','E'), 'E')"
								><xsl:value-of select="number(substring-before(translate($to_print_tmp,'e','E'), 'E')) * math:power(10, number(substring-after(translate($to_print_tmp,'e','E'), 'E')))"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="$to_print_tmp"/></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
		
					<xsl:if test="$to_print != $to_print_tmp">
						<xsl:if test="$log-level &lt;= 2">
							<xsl:message>W Value normalization, original="<xsl:value-of select="$to_print_tmp"/>", new="<xsl:value-of select="$to_print"/>"</xsl:message>
						</xsl:if>
					</xsl:if>
					
					<xsl:choose>
						<xsl:when test="$type = $type_double">
							<xsl:value-of select="format-number($to_print,$double-format,'it-format')"/></xsl:when>
						<xsl:when test="$type = $type_money">
							<xsl:value-of select="format-number($to_print,$money-format,'it-format')"/></xsl:when>
						<xsl:when test="$type = $type_percent">
							<xsl:value-of select="format-number($to_print,$percent-format,'it-format')"/></xsl:when>
						<xsl:when test="$type = $type_percent3">
							<xsl:value-of select="format-number($to_print,$percent3-format,'it-format')"/></xsl:when>
						<xsl:when test="$type = $type_integer">
							<xsl:value-of select="format-number($to_print,$integer-format,'it-format')"/></xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$to_print"/></xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
