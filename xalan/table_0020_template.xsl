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
	xmlns:html="http://www.w3.org/TR/REC-html40">

	<xsl:template name="table_0020">
		<xsl:param name="table-id"/>
		<xsl:param name="table-data"/>

		<xsl:for-each select="$table-data">
			<w:tbl>
				<w:tblPr>
					<w:tblW w:w="0" w:type="auto"/>
				</w:tblPr>
				<xsl:call-template name="table_0020_template_row">
					<xsl:with-param name="table-id" select="$table-id"/>
					<xsl:with-param name="table-data" select="$table-data"/>
				</xsl:call-template>
			</w:tbl>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="table_0020_template_row">
		<xsl:param name="table-id"/>
		<xsl:param name="table-data"/>
		
		<xsl:for-each select="Row">
			<xsl:if test="not(Cell[1] = '#')">
				<xsl:variable name="row-type" select="Cell[1]"/>
				
				<xsl:if test="string($row-type)">
					<w:tr>
						<w:trPr>
							<w:cantSplit/>
							<w:trHeight w:val="300"/>
						</w:trPr>
						
						<xsl:for-each select="Cell[position() &gt; 1]">
							<xsl:variable name="pos" select="count(preceding-sibling::Cell) + 1"/>
							<xsl:variable name="cell-type" select="../../Row[1]/Cell[position() = $pos]"/>
							
							<w:tc>
								<w:tcPr>
									<w:tcW w:w="0" w:type="auto"/>
									<w:tcBorders>
										<w:top w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
										<w:left w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
										<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
										<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
									</w:tcBorders>
									<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
									<w:vAlign w:val="center"/>
								</w:tcPr>
								<w:p>
									<w:pPr>
										<xsl:choose>
											<xsl:when test="$row-type = 'header'">
												<w:jc w:val="center"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>
													<xsl:when test="$cell-type = 'string'"><w:jc w:val="left"/></xsl:when>
													<xsl:otherwise><w:jc w:val="right"/></xsl:otherwise>
												</xsl:choose>
											</xsl:otherwise>
										</xsl:choose>
									</w:pPr>
									<w:r>
										<w:rPr>
											<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
											<wx:font wx:val="Verdana"/>
											<xsl:choose>
												<xsl:when test="$row-type = 'header' or $row-type = 'row-highlight'">
													<w:b/>
													<w:b-cs/>
												</xsl:when>
											</xsl:choose>
											<w:sz w:val="14"/>
											<w:sz-cs w:val="14"/>
										</w:rPr>
										<w:t
											><xsl:choose>
												<xsl:when test="$row-type = 'header'">
													<xsl:call-template name="pretty-print">
														<xsl:with-param name="type" select="'string'"/>
														<xsl:with-param name="value" select="."/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="pretty-print">
														<xsl:with-param name="type" select="$cell-type"/>
														<xsl:with-param name="value" select="."/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose
										></w:t>
									</w:r>
								</w:p>
							</w:tc>
						</xsl:for-each>
					</w:tr>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
