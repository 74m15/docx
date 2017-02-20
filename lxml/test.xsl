<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	
	xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" 
	xmlns:o="urn:schemas-microsoft-com:office:office" 
	xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" 
	xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" 
	xmlns:v="urn:schemas-microsoft-com:vml" 
	xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
	xmlns:w10="urn:schemas-microsoft-com:office:word" 
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
	xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
	
	xmlns:exsl="http://exslt.org/common"
	xmlns:set="http://exslt.org/sets"
	extension-element-prefixes="exsl set"
	
	exclude-result-prefixes="ve o r m v wp w10 w wne">
	
	
	<xsl:include href="debug.xsl"/>
	
	<xsl:output method="xml" encoding="utf-8" version="1.0" indent="yes" standalone="yes" omit-xml-declaration="no"/>
	
	<xsl:param name="base_dir">./template.docx/word/</xsl:param>
	<xsl:param name="document_filename">document.xml</xsl:param>
	<xsl:param name="comments_filename">comments.xml</xsl:param>
	<xsl:param name="document" select="document(concat($base_dir, $document_filename))"/>
	<xsl:param name="comments" select="document(concat($base_dir, $comments_filename))"/>
	<xsl:param name="db_filename">database.xml</xsl:param>
	<xsl:param name="db" select="document($db_filename)"/>
	<xsl:param name="config_filename">config.xml</xsl:param>
	<xsl:param name="config" select="document($config_filename)"/>
	
	<xsl:template match="/">
		<xsl:call-template name="log_debug">
			<xsl:with-param name="msg">Entering DOM root element</xsl:with-param>
		</xsl:call-template>
		
		<xsl:call-template name="log_debug">
			<xsl:with-param name="msg">Processing file "<xsl:value-of select="concat($base_dir, $document_filename)"/>: <xsl:value-of select="count($document/*)"/></xsl:with-param>
		</xsl:call-template>
			
		<xsl:element name="stats">
			<xsl:apply-templates select="$document/node()" mode="copy"/>
		</xsl:element>
				
		<xsl:call-template name="log_debug">
			<xsl:with-param name="msg">That's all folks!</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="node()" mode="copy">
		<xsl:apply-templates select="node()" mode="copy"/>
	</xsl:template>
	
	<xsl:template match="w:p[count(w:commentRangeStart) &gt; 0 and count(w:commentRangeEnd) &gt; 0]" mode="copy">
		<xsl:call-template name="annotated-p-copy">
			<xsl:with-param name="shift">1</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="annotated-p-copy">
		<xsl:param name="shift"/>
		
		<xsl:if test="$shift &lt; count(node())">
			<xsl:variable name="comment" select="node()[local-name(.)='commentRangeStart' and position() &gt;= $shift][1]"/>
			<xsl:variable name="comment_id" select="$comment/@w:id"/>
			
			<xsl:choose>
				<xsl:when test="$comment">
					<xsl:variable name="last_r" select="w:r[w:commentReference/@w:id = $comment_id]"/>
					<xsl:element name="par_comm">
						<xsl:attribute name="_id"><xsl:value-of select="$comment_id"/></xsl:attribute>
						<xsl:value-of select="count(set:leading(set:trailing(*, $comment), $last_r)) + 2"/>
					</xsl:element>
					<xsl:call-template name="annotated-p-copy">
						<xsl:with-param name="shift" select="count(set:leading(node(), $last_r))+2"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="w:tbl" mode="copy">
		<xsl:variable name="comment_start" select="preceding-sibling::w:p[count(w:commentRangeStart) &gt; 0 and count(w:commentRangeEnd) = 0][1]"/>
		<xsl:variable name="comment_id" select="$comment_start/w:commentRangeStart/@w:id"/>
		<xsl:variable name="comment_end" select="following-sibling::w:commentRangeEnd[@w:id = $comment_id]"/>
		
		<xsl:choose>
			<xsl:when test="$comment_start and $comment_end">
				<xsl:message>Table to be further analyzed!</xsl:message>
				<xsl:element name="table"><xsl:value-of select="$comment_id"/></xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message>A simple table? verify, please!</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
