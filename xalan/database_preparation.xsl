<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:java="http://xml.apache.org/xalan/java" 
	extension-element-prefixes="java">

	<xsl:output method="xml" encoding="utf-8" version="1.0" indent="no"/>

	<!--
		4	Fatal error (stylesheet dies)
		3	Error
		2	Warning
		1	Info
		0	Debug
	-->
	<xsl:param name="log-level">2</xsl:param>

	<xsl:template match="/">
		<xsl:if test="$log-level &lt;= 0">
			<xsl:message>D Entering DOM root element</xsl:message>
		</xsl:if>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
	<xsl:template match="*" name="copy">
		<xsl:element name="{local-name()}">
			<xsl:for-each select="@*">
				<xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[local-name()='Cell']">
		<xsl:element name="{local-name()}">
			<xsl:for-each select="@*">
				<xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>
			<xsl:for-each select="*[local-name()='Data']/@*">
				<xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>
			<xsl:value-of select="*[local-name()='Data']"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="*[local-name()='DocumentProperties' or local-name()='ExcelWorkbook' or local-name()='Styles' or local-name()='WorksheetOptions' or local-name()='ConditionalFormatting']">
		<xsl:if test="$log-level &lt;= 0">
			<xsl:message>D Skipping node <xsl:value-of select="name(.)"/></xsl:message>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*[local-name()='Worksheet']">
		<xsl:variable name="name" select="java:java.lang.String.new(string(@*[local-name()='Name']))"/>
		<xsl:variable name="keep" select="java:matches($name, 'T\d{4}')"/>
		
		<xsl:if test="$log-level &lt;= 0">
			<xsl:message>D name=<xsl:value-of select="$name"/>, keep=<xsl:value-of select="$keep"/></xsl:message>
		</xsl:if>
		
		<xsl:if test="$keep">
			<xsl:if test="$log-level &lt;= 1">
				<xsl:message>I Copying Worksheet <xsl:value-of select="$name"/>...</xsl:message>
			</xsl:if>
			
			<xsl:call-template name="copy"/>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
