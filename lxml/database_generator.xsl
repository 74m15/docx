<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	
	xmlns:s="http://schemas.openxmlformats.org/spreadsheetml/2006/main"
	xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
	
	xmlns:regexp="http://exslt.org/regular-expressions"
    extension-element-prefixes="regexp">
	
	<xsl:include href="debug.xsl"/>
	
	<xsl:output method="xml" encoding="utf-8" version="1.0" indent="yes" standalone="yes"/>
	
	<xsl:param name="base_dir">./database.xlsx/xl/</xsl:param>
	<xsl:param name="workbook_filename">workbook.xml</xsl:param>
	<xsl:param name="shared_strings_filename">sharedStrings.xml</xsl:param>
	<xsl:param name="db" select="document(concat($base_dir, $workbook_filename))"/>
	<xsl:param name="strings" select="document(concat($base_dir, $shared_strings_filename))"/>
	<xsl:param name="config_filename">config.xml</xsl:param>
	<xsl:param name="config" select="document($config_filename)"/>
	
	<xsl:template match="/">
		<xsl:call-template name="log_debug">
			<xsl:with-param name="msg">Entering DOM root element</xsl:with-param>
		</xsl:call-template>
		
		<xsl:element name="Database">
			<xsl:for-each select="$db//s:sheet">
				<xsl:variable name="sheet_name" select="@name"/>
				<xsl:variable name="sheet_id" select="substring-after(@r:id, 'rId')"/>
				
				<xsl:if test="count($config//Table[@id = $sheet_name]) &gt; 0">
					<xsl:call-template name="log_info">
						<xsl:with-param name="msg">Processing sheet "<xsl:value-of select="$sheet_name"/>"</xsl:with-param>
					</xsl:call-template>
					
					<xsl:call-template name="process_sheet">
						<xsl:with-param name="sheet_name" select="$sheet_name"/>
						<xsl:with-param name="sheet_id" select="$sheet_id"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</xsl:element>
		
		<xsl:call-template name="log_debug">
			<xsl:with-param name="msg">That's all folks!</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="process_sheet">
		<xsl:param name="sheet_name"/>
		<xsl:param name="sheet_id"/>
		
		<xsl:variable name="sheet_filename" select="concat($base_dir, 'worksheets/sheet',$sheet_id,'.xml')"/>
		
		<xsl:call-template name="log_debug">
			<xsl:with-param name="msg">Loading sheet file <xsl:value-of select="$sheet_filename"/></xsl:with-param>
		</xsl:call-template>
		
		<xsl:variable name="sheet" select="document($sheet_filename)"/>
		
		<xsl:choose>
			<xsl:when test="$sheet">
				<xsl:element name="Table">
					<xsl:attribute name="name"><xsl:value-of select="$sheet_name"/></xsl:attribute>
					
					<xsl:for-each select="$sheet//s:row">
						<xsl:element name="Row">
							<xsl:attribute name="R"><xsl:value-of select="@r"/></xsl:attribute>
							
							<xsl:for-each select="s:c">
								<xsl:variable name="c_id" select="@r"/>
								<xsl:variable name="c_col" select="regexp:match(@r,'([A-Z]+)[0-9]+')[2]"/>
								<xsl:variable name="v" select="s:v"/>
								
								<xsl:element name="Cell">
									<xsl:attribute name="id"><xsl:value-of select="$c_id"/></xsl:attribute>
									<xsl:attribute name="C"><xsl:value-of select="$c_col"/></xsl:attribute>
									<xsl:choose>
										<xsl:when test="@t"><xsl:value-of select="$strings//s:si[number($v) + 1]/s:t"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="$v"/></xsl:otherwise>
									</xsl:choose>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="log_error">
					<xsl:with-param name="msg">Sheet file <xsl:value-of select="$sheet_filename"/> not found</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
