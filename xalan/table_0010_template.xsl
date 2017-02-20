<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
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

	<xsl:template name="table_0010">
		<xsl:param name="table-id"/>
		<xsl:param name="table-data"/>
		
		<xsl:for-each select="$table-data">
			<w:tbl>
				<w:tblPr>
					<w:tblW w:w="14042" w:type="dxa"/>
					<w:tblInd w:w="70" w:type="dxa"/>
					<w:tblCellMar>
						<w:left w:w="70" w:type="dxa"/>
						<w:right w:w="70" w:type="dxa"/>
					</w:tblCellMar>
				</w:tblPr>
				<w:tr wsp:rsidR="0075321B" wsp:rsidTr="008B4DE6">
					<w:trPr>
						<w:cantSplit/>
						<w:trHeight w:val="236"/>
					</w:trPr>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="2136" w:type="dxa"/>
							<w:tcBorders>
								<w:top w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:left w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t/>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="3605" w:type="dxa"/>
							<w:gridSpan w:val="3"/>
							<w:tcBorders>
								<w:top w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Movimentazioni esercizi precedenti</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="7099" w:type="dxa"/>
							<w:gridSpan w:val="6"/>
							<w:tcBorders>
								<w:top w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Movimentazioni dell'esercizio</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="1202" w:type="dxa"/>
							<w:vmerge w:val="restart"/>
							<w:tcBorders>
								<w:top w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:left w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Valore netto <xsl:value-of select="$config//year.current"/></w:t>
							</w:r>
						</w:p>
					</w:tc>
				</w:tr>
				<w:tr wsp:rsidR="0075321B" wsp:rsidTr="008B4DE6">
					<w:trPr>
						<w:cantSplit/>
						<w:trHeight w:val="649"/>
					</w:trPr>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="2136" w:type="dxa"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>DESCRIZIONE</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Costo storico <xsl:value-of select="$config//year.previous"/></w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="1202" w:type="dxa"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:proofErr w:type="spellStart"/>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Ammortam.</w:t>
							</w:r>
							<w:proofErr w:type="spellEnd"/>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t> esercizi precedenti</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Valore netto <xsl:value-of select="$config//year.previous"/></w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Alienazioni</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Acquisizioni</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Costo storico <xsl:value-of select="$config//year.current"/></w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:proofErr w:type="spellStart"/>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Ammortam. <xsl:value-of select="$config//year.current"/></w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Movimenti del Fondo Ammort.</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:tcBorders>
								<w:top w:val="nil"/>
								<w:left w:val="nil"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:shd w:val="clear" w:color="FFFFFF" w:fill="FFFFFF"/>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:jc w:val="center"/>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
								<w:t>Fondo <xsl:value-of select="$config//year.current"/></w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="0" w:type="auto"/>
							<w:vmerge/>
							<w:tcBorders>
								<w:top w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:left w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:bottom w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
								<w:right w:val="double" w:sz="6" wx:bdrwidth="45" w:space="0" w:color="BFBFBF"/>
							</w:tcBorders>
							<w:vAlign w:val="center"/>
						</w:tcPr>
						<w:p wsp:rsidR="0075321B" wsp:rsidRDefault="0075321B">
							<w:pPr>
								<w:rPr>
									<w:rFonts w:ascii="Verdana" w:h-ansi="Verdana" w:cs="Verdana"/>
									<wx:font wx:val="Verdana"/>
									<w:b/>
									<w:b-cs/>
									<w:sz w:val="14"/>
									<w:sz-cs w:val="14"/>
								</w:rPr>
							</w:pPr>
						</w:p>
					</w:tc>
				</w:tr>
	
				<xsl:call-template name="table_0020_template_row">
					<xsl:with-param name="table-id" select="$table-id"/>
					<xsl:with-param name="table-data" select="$table-data"/>
				</xsl:call-template>
			</w:tbl>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>
