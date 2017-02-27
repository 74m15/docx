<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	
	xmlns:str="http://exslt.org/strings"
	xmlns:date="http://exslt.org/dates-and-times"
	
    extension-element-prefixes="str date">
    
	<!--
		4	Fatal error (stylesheet dies)
		3	Error
		2	Warning
		1	Info
		0	Debug
	-->
	<xsl:param name="log_level">2</xsl:param>
	
	<xsl:template name="log">
		<xsl:param name="level"/>
		<xsl:param name="msg"/>
		
		<xsl:if test="$log_level &lt;= $level">
			<xsl:for-each select="str:split($msg,'__newline__')">
				<xsl:message><xsl:value-of select="concat(translate($level, '01234', 'DIWEF'), ' [', date:date-time(), '] > ', normalize-space(string(.)))"/></xsl:message>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="log_debug">
		<xsl:param name="msg"/>
		
		<xsl:call-template name="log">
			<xsl:with-param name="level" select="0"/>
			<xsl:with-param name="msg" select="$msg"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="log_info">
		<xsl:param name="msg"/>
		
		<xsl:call-template name="log">
			<xsl:with-param name="level" select="1"/>
			<xsl:with-param name="msg" select="$msg"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="log_warning">
		<xsl:param name="msg"/>
		
		<xsl:call-template name="log">
			<xsl:with-param name="level" select="2"/>
			<xsl:with-param name="msg" select="$msg"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="log_error">
		<xsl:param name="msg"/>
		
		<xsl:call-template name="log">
			<xsl:with-param name="level" select="3"/>
			<xsl:with-param name="msg" select="$msg"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="log_fatal">
		<xsl:param name="msg"/>
		
		<xsl:call-template name="log">
			<xsl:with-param name="level" select="4"/>
			<xsl:with-param name="msg" select="$msg"/>
		</xsl:call-template>
		
		<xsl:message terminate="yes">TERMINATING XSLT!</xsl:message>
	</xsl:template>

</xsl:stylesheet>
