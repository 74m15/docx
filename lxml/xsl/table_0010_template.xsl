<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	
	xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" 
	xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" 
	xmlns:o="urn:schemas-microsoft-com:office:office" 
	xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" 
	xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" 
	xmlns:v="urn:schemas-microsoft-com:vml" 
	xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" 
	xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
	xmlns:w10="urn:schemas-microsoft-com:office:word" 
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
	xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" 
	xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" 
	xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" 
	xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" 
	xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
	
	xmlns:_ni="urn:informatica-aci.it:sap:private:ni"
	xmlns:ni="urn:informatica-aci.it:sap:public:ni"
	
	xmlns:regexp="http://exslt.org/regular-expressions"
	
	extension-element-prefixes="regexp">
	

	<xsl:import href="debug.xsl"/>

	<xsl:template name="table_0010">
		<xsl:param name="table-id"/>
		<xsl:param name="table-data"/>
		
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="5000" w:type="pct"/>
				<w:jc w:val="center"/>
				<w:tblBorders>
					<w:top w:val="single" w:sz="4" w:space="0" w:color="auto"/>
					<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
					<w:insideH w:val="single" w:sz="4" w:space="0" w:color="auto"/>
				</w:tblBorders>
				<w:tblCellMar>
					<w:left w:w="70" w:type="dxa"/>
					<w:right w:w="70" w:type="dxa"/>
				</w:tblCellMar>
				<w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="2229"/>
				<w:gridCol w:w="1314"/>
				<w:gridCol w:w="1206"/>
				<w:gridCol w:w="1108"/>
				<w:gridCol w:w="915"/>
				<w:gridCol w:w="977"/>
				<w:gridCol w:w="1241"/>
				<w:gridCol w:w="1241"/>
				<w:gridCol w:w="1040"/>
				<w:gridCol w:w="1067"/>
				<w:gridCol w:w="1238"/>
			</w:tblGrid>
			<w:tr>
				<w:trPr>
					<w:trHeight w:val="405"/>
					<w:jc w:val="center"/>
				</w:trPr>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="821" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:noWrap/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t> </w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1336" w:type="pct"/>
						<w:gridSpan w:val="3"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:noWrap/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t>Movimentazioni esercizi precedenti</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="2387" w:type="pct"/>
						<w:gridSpan w:val="6"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:noWrap/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t>Movimentazioni dell'esercizio</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="456" w:type="pct"/>
						<w:vMerge w:val="restart"/>
						<w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Valore netto </w:t>
						</w:r>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t><xsl:value-of select="_ni:pretty-print('${year.current}', false())"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr>
				<w:trPr>
					<w:trHeight w:val="578"/>
					<w:jc w:val="center"/>
				</w:trPr>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="821" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t>Descrizione</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="484" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Costo storico </w:t>
						</w:r>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t><xsl:value-of select="_ni:pretty-print('${year.previous}', false())"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="444" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t>Ammortam. esercizi precedenti</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="408" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Valore netto </w:t>
						</w:r>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t><xsl:value-of select="_ni:pretty-print('${year.previous}', false())"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="337" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Alienaz. </w:t>
						</w:r>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t><xsl:value-of select="_ni:pretty-print('${year.current}', false())"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="360" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Acquisiz. </w:t>
						</w:r>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t><xsl:value-of select="_ni:pretty-print('${year.current}', false())"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="457" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Costo storico </w:t>
						</w:r>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t><xsl:value-of select="_ni:pretty-print('${year.current}', false())"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="457" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Ammortam. </w:t>
						</w:r>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t><xsl:value-of select="_ni:pretty-print('${year.current}', false())"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="383" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Movimenti fondo Ammort.</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="393" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t xml:space="preserve">Fondo ammort. </w:t>
						</w:r>
						<w:r>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
							<w:t><xsl:value-of select="_ni:pretty-print('${year.current}', false())"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="456" w:type="pct"/>
						<w:vMerge/>
						<w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
						<w:vAlign w:val="center"/>
						<w:hideMark/>
					</w:tcPr>
					<w:p w:rsidR="0050760E" w:rsidRPr="00B014AA" w:rsidRDefault="0050760E" w:rsidP="0050760E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Trebuchet MS" w:hAnsi="Trebuchet MS"/>
								<w:b/>
								<w:bCs/>
								<w:color w:val="000000"/>
								<w:sz w:val="16"/>
								<w:szCs w:val="16"/>
							</w:rPr>
						</w:pPr>
					</w:p>
				</w:tc>
			</w:tr>
			<xsl:for-each select="$table-data/Row">
				<xsl:choose>
					<xsl:when test="Cell[1]/@C = 'A' and regexp:test(normalize-space(Cell[1]), 'header|row-highlight|row-normal') and count(Cell) &gt; 1">
						<xsl:variable name="row-type" select="Cell[1]"/>
					
						<w:tr>
							<w:trPr>
								<w:cantSplit/>
							</w:trPr>
							<xsl:for-each select="Cell[position() &gt; 1]">
								<xsl:variable name="pos" select="count(preceding-sibling::Cell) + 1"/>
								<xsl:variable name="cell-type" select="../../Row[1]/Cell[position() = $pos]"/>
								
								<xsl:if test="string-length($cell-type) &gt; 0 and $cell-type != '#'">
									<w:tc>
										<w:tcPr>
											<w:tcW w:w="0" w:type="auto"/>
											<w:tcBorders>
												<w:top w:val="single" w:sz="4" w:space="0" w:color="BFBFBF"/>
												<w:left w:val="single" w:sz="4" w:space="0" w:color="BFBFBF"/>
												<w:bottom w:val="single" w:sz="4" w:space="0" w:color="BFBFBF"/>
												<w:right w:val="single" w:sz="4" w:space="0" w:color="BFBFBF"/>
											</w:tcBorders>
											<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
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
													<xsl:if test="$row-type = 'header' or $row-type = 'row-highlight'">
														<w:b/>
														<w:bCs/>
													</xsl:if>
													<w:sz w:val="16"/>
													<w:szCs w:val="16"/>
												</w:rPr>
												<xsl:element name="w:t">
													<xsl:choose>
														<xsl:when test="$row-type = 'header' or $cell-type = 'string'">
															<xsl:value-of select="_ni:pretty-print(string(.), false())"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="_ni:pretty-print(concat('ni:', $cell-type, '(&quot;', string(.), '&quot;)'), true())"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:element>
											</w:r>
										</w:p>
									</w:tc>
								</xsl:if>
							</xsl:for-each>
						</w:tr>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="not(Cell[1] = '#' and Cell[1]/@C = 'A')">
							<xsl:call-template name="log_warning">
								<xsl:with-param name="msg">Skipping row <xsl:value-of select="@R"/> of table "<xsl:value-of select="../@name"/>"</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</w:tbl>
	</xsl:template>
	
</xsl:stylesheet>
