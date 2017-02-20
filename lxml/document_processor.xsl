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
	
	xmlns:exsl="http://exslt.org/common"
	xmlns:set="http://exslt.org/sets"
	xmlns:func="http://exslt.org/functions"
	xmlns:str="http://exslt.org/strings"
	xmlns:dyn="http://exslt.org/dynamic"
	xmlns:regexp="http://exslt.org/regular-expressions"
	xmlns:math="http://exslt.org/math"
	
	extension-element-prefixes="exsl set func str dyn regexp math"	
	exclude-result-prefixes="_ni ni">
	
	
	<xsl:import href="debug.xsl"/>
	<xsl:import href="table_templates.xsl"/>
	
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
	

	<xsl:decimal-format name="it-format" decimal-separator="," grouping-separator="."/>
	
	<xsl:param name="money-format">#.##0</xsl:param>
	<xsl:param name="double-format">#.##0,00</xsl:param>
	<xsl:param name="percent-format">#.##0,00%</xsl:param>
	<xsl:param name="percent3-format">#.##0,000%</xsl:param>
	<xsl:param name="integer-format">#.##0</xsl:param>
	
	<xsl:param name="dummy_fill">0</xsl:param>
	
	<func:function name="ni:string">
		<xsl:param name="value"/>
		
		<func:result select="$value"/>
	</func:function>
	
	<func:function name="ni:money">
		<xsl:param name="value"/>
		
		<xsl:choose>
			<xsl:when test="string-length(normalize-space($value)) &gt; 0">
				<func:result select="format-number($value, $money-format, 'it-format')"/>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="ni:double">
		<xsl:param name="value"/>
		
		<xsl:choose>
			<xsl:when test="string-length(normalize-space($value)) &gt; 0">
				<func:result select="format-number($value, $double-format, 'it-format')"/>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="ni:percent">
		<xsl:param name="value"/>
		
		<xsl:choose>
			<xsl:when test="string-length(normalize-space($value)) &gt; 0">
				<func:result select="format-number($value, $percent-format, 'it-format')"/>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="ni:percent3">
		<xsl:param name="value"/>
		
		<xsl:choose>
			<xsl:when test="string-length(normalize-space($value)) &gt; 0">
				<func:result select="format-number($value, $percent3-format, 'it-format')"/>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="ni:integer">
		<xsl:param name="value"/>
		
		<xsl:choose>
			<xsl:when test="string-length(normalize-space($value)) &gt; 0">
				<func:result select="format-number($value, $integer-format, 'it-format')"/>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="ni:C">
		<xsl:param name="addr"/>
		
		<xsl:variable name="partRC" select="regexp:match($addr, '([A-Za-z0-9]+)!R([0-9]+)C([0-9]+)')"/>
		
		<xsl:choose>			
			<xsl:when test="number($partRC[3]) &gt; 0">
				<xsl:variable name="table" select="$partRC[2]"/>
				<xsl:variable name="row" select="$partRC[3]"/>
				<xsl:variable name="cell" select="$partRC[4]"/>

				<func:result select="$db/Database/Table[@name = $table]/Row[number($row)]/Cell[number($cell)]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="part" select="regexp:match($addr, '([A-Za-z0-9]+)!([A-Z]+)([0-9]+)')"/>
				<xsl:variable name="table" select="$part[2]"/>
				<xsl:variable name="row" select="$part[3]"/>
				<xsl:variable name="cell" select="$part[4]"/>
				
				<func:result select="$db/Database/Table[@name = $table]/Row[@R = $row]/Cell[@C = $cell]"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="_ni:convert-xpath-formula-exp">
		<xsl:param name="formula"/>
		
		<xsl:variable name="part" select="regexp:match($formula, '([^{]*)(\{([A-Za-z0-9]+)\}/Row\[([0-9]+)\]/Cell\[([0-9]+)\])(.*)')"/>
		
		<xsl:variable name="f_prefix" select="$part[2]"/>
		<xsl:variable name="f_table" select="$part[4]"/>
		<xsl:variable name="f_row" select="$part[5]"/>
		<xsl:variable name="f_cell" select="$part[6]"/>
		<xsl:variable name="f_suffix" select="$part[7]"/>
		
		<xsl:choose>
			<xsl:when test="string-length($part[3]) = 0">
				<func:result select="$formula"/>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="concat(_ni:convert-xpath-formula-exp($f_prefix), '[', $f_table, '!R', $f_row, 'C', $f_cell, ']', _ni:convert-xpath-formula-exp($f_suffix))"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>

	<func:function name="_ni:convert-xpath-formula">
		<xsl:param name="old_formula"/>
		
		<xsl:variable name="part" select="regexp:match($old_formula, '([^\|]+)(?:\|(.*))?')"/>
		
		<xsl:variable name="formula" select="normalize-space($part[2])"/>
		<xsl:variable name="formatter" select="normalize-space($part[3])"/>
		
		<xsl:choose>
			<xsl:when test="string-length($formatter) = 0">
				<func:result select="_ni:convert-xpath-formula-exp($formula)"/>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="concat('ni:', $formatter, '(', _ni:convert-xpath-formula-exp($formula), ')')"/>
			</xsl:otherwise>
		</xsl:choose>
		
	</func:function>
	
	<func:function name="_ni:get-formula">
		<xsl:param name="comment_id"/>
		
		<xsl:variable name="comment" select="$comments/w:comments/w:comment[@w:id = $comment_id]"/>
		<xsl:variable name="formula" select="str:concat($comment//w:t)"/>
		
		<xsl:choose>
			<xsl:when test="starts-with($formula, 'xpath:')">
				<func:result>
					<original><xsl:value-of select="$formula"/></original>
					<runnable><xsl:value-of select="_ni:convert-xpath-formula(normalize-space(substring-after($formula, 'xpath:')))"/></runnable>
				</func:result> 
			</xsl:when>
			<xsl:when test="starts-with($formula, 'xml:')">
				<func:result>
					<original><xsl:value-of select="$formula"/></original>
					<runnable><xsl:value-of select="normalize-space(substring-after($formula, 'xml:'))"/></runnable>
				</func:result>
			</xsl:when>
			<xsl:otherwise>
				<func:result/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="_ni:resolve-data-ref">
		<xsl:param name="s"/>
		<xsl:param name="evaluate"/>
		
		<xsl:variable name="part" select="regexp:match($s, '([^\[]*)(\[([A-Za-z0-9]+!R[0-9]+C[0-9]+|[A-Za-z0-9]+![A-Z]+[0-9]+)\])?(.*)')"/>
		
		<xsl:choose>
			<xsl:when test="string-length($part[4]) &gt; 0">
				<xsl:choose>
					<xsl:when test="$evaluate">
						<func:result select="concat($part[2], dyn:evaluate(concat('ni:C(&quot;', $part[4], '&quot;)')), _ni:resolve-data-ref($part[5], $evaluate))"/>
					</xsl:when>
					<xsl:otherwise>
						<func:result select="concat($part[2], 'ni:C(&quot;', $part[4], '&quot;)', _ni:resolve-data-ref($part[5], $evaluate))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="$s"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="_ni:resolve-config-ref">
		<xsl:param name="s"/>
		<xsl:param name="evaluate"/>
		
		<xsl:variable name="part" select="regexp:match($s, '([^$]*)(\$\{(.+)\})?(.*)')"/>
		
		<xsl:choose>
			<xsl:when test="string-length($part[4]) &gt; 0">
				<xsl:choose>
					<xsl:when test="$evaluate">
						<func:result select="concat($part[2], dyn:evaluate(concat('$config//', $part[4])), _ni:resolve-config-ref($part[5], $evaluate))"/>
					</xsl:when>
					<xsl:otherwise>
						<func:result select="concat($part[2], '$config//', $part[4], _ni:resolve-config-ref($part[5], $evaluate))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<func:result select="$s"/>
			</xsl:otherwise>
		</xsl:choose>
	</func:function>
	
	<func:function name="_ni:pretty-print">
		<xsl:param name="s0"/>
		<xsl:param name="evaluate" select="true()"/>
		
		<xsl:choose>
			<xsl:when test="boolean(number($dummy_fill))">
				<func:result>DUMMY</func:result>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="s1" select="_ni:resolve-data-ref($s0, not($evaluate))"/>
				<xsl:variable name="s2" select="_ni:resolve-config-ref($s1, not($evaluate))"/>

				<xsl:choose>
					<xsl:when test="$evaluate"><func:result select="string(dyn:evaluate($s2))"/></xsl:when>
					<xsl:otherwise><func:result select="string($s2)"/></xsl:otherwise>
				</xsl:choose>
				
			</xsl:otherwise>
		</xsl:choose>		
	</func:function>


	<xsl:template match="/">
		<xsl:call-template name="log_info">
			<xsl:with-param name="msg">
				Configuration: base_dir="<xsl:value-of select="$base_dir"/>" __newline__
				Configuration: document_filename="<xsl:value-of select="$document_filename"/>" (present: <xsl:value-of select="boolean(count($document/*))"/>) __newline__
				Configuration: comments_filename="<xsl:value-of select="$comments_filename"/>" (present: <xsl:value-of select="count($comments//w:comment)"/>) __newline__
				Configuration: db_filename="<xsl:value-of select="$db_filename"/>" (present: <xsl:value-of select="count($db//Table)"/>) __newline__
				Configuration: dummy_fill="<xsl:value-of select="$dummy_fill"/>" (dummy: <xsl:value-of select="boolean(number($dummy_fill))"/>)
			</xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="log_info">
			<xsl:with-param name="msg">Transformation starting...</xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="log_debug">
			<xsl:with-param name="msg">Entering DOM root element</xsl:with-param>
		</xsl:call-template>
				
		<xsl:apply-templates select="$document/*" mode="copy"/>
				
		<xsl:call-template name="log_info">
			<xsl:with-param name="msg">That's all folks!</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="*" mode="copy">
		<xsl:copy>
			<xsl:for-each select="@*">
				<xsl:attribute name="{name(.)}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>
			<xsl:apply-templates select="node()|text()" mode="copy"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="w:p[count(w:commentRangeStart) &gt; 0 and count(w:commentRangeEnd) &gt; 0]" mode="copy">
		<xsl:copy>
			<xsl:for-each select="@*">
				<xsl:attribute name="{name(.)}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>

			<xsl:call-template name="annotated-p-copy">
				<xsl:with-param name="shift">1</xsl:with-param>
			</xsl:call-template>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template name="annotated-p-copy">
		<xsl:param name="shift"/>
		
		<xsl:if test="$shift &lt;= count(node())">
			<xsl:variable name="body" select="node()[position() &gt;= $shift]"/>
			<xsl:variable name="comment" select="node()[local-name(.)='commentRangeStart' and position() &gt;= $shift][1]"/>
			<xsl:variable name="comment_id" select="$comment/@w:id"/>
			
			<xsl:choose>
				<xsl:when test="$comment">
					<xsl:variable name="head" select="set:leading($body, $comment)"/>
					<xsl:variable name="last_r" select="w:r[w:commentReference/@w:id = $comment_id]"/>
					<xsl:variable name="tail" select="set:trailing($body, $last_r)"/>
					<xsl:variable name="r_section" select="set:intersection(set:difference(set:difference($body, $head), $tail), *)"/>

					<xsl:copy-of select="$head"/>
					
					<xsl:call-template name="r_p_evaluation">
						<xsl:with-param name="r_section" select="$r_section"/>
						<xsl:with-param name="comment_id" select="$comment_id"/>
					</xsl:call-template>
					
					<xsl:call-template name="annotated-p-copy">
						<xsl:with-param name="shift" select="count(set:leading(node(), $last_r))+2"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="$body"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="r_p_evaluation">
		<xsl:param name="r_section"/>
		<xsl:param name="comment_id"/>
		
		<xsl:variable name="formula" select="exsl:node-set(_ni:get-formula($comment_id))"/>
		
		<xsl:call-template name="log_debug">
			<xsl:with-param name="msg">Processing formula [w:id = <xsl:value-of select="$comment_id"/>]: "<xsl:value-of select="$formula/original"/>"</xsl:with-param>
		</xsl:call-template>
		
		<xsl:choose>
			<xsl:when test="string-length($formula) = 0">
				<xsl:copy-of select="$r_section"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="result" select="_ni:pretty-print($formula/runnable, true())"/>
				
				<xsl:choose>
					<xsl:when test="string-length($result) &gt; 0">
						<xsl:call-template name="log_debug">
							<xsl:with-param name="msg">Formula evaluation: "<xsl:value-of select="$formula/runnable"/>" => "<xsl:value-of select="$result"/>"</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="log_warning">
							<xsl:with-param name="msg">Please check formula: "<xsl:value-of select="$formula/original"/>" (runnable is "<xsl:value-of select="$formula/runnable"/>")</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				
				<xsl:copy-of select="$r_section[local-name(.) = 'commentRangeStart']"/>
				<xsl:for-each select="$r_section[local-name(.) = 'r' and position() = 2]">
					<xsl:copy>
						<xsl:for-each select="@*">
							<xsl:attribute name="{name(.)}"><xsl:value-of select="."/></xsl:attribute>
						</xsl:for-each>
						
						<xsl:copy-of select="w:rPr"/>
						<xsl:element name="w:t"><xsl:value-of select="$result"/></xsl:element>
					</xsl:copy>
				</xsl:for-each>
				<xsl:copy-of select="$r_section[local-name(.) = 'commentRangeEnd']"/>
				<xsl:copy-of select="$r_section[position()=last()]"/>
			</xsl:otherwise>
		</xsl:choose>		
	</xsl:template>
	
	<xsl:template match="w:tbl" mode="copy">
		<xsl:variable name="comment_start" select="preceding-sibling::w:p[count(w:commentRangeStart) &gt; 0 and count(w:commentRangeEnd) = 0][1]"/>
		<xsl:variable name="comment_id" select="$comment_start/w:commentRangeStart/@w:id"/>
		<xsl:variable name="comment_end" select="following-sibling::w:commentRangeEnd[@w:id = $comment_id]"/>
		
		<xsl:choose>
			<xsl:when test="$comment_start and $comment_end">
				<xsl:variable name="tag" select="str:concat($comments//w:comment[@w:id = $comment_id]//w:t)"/>
				<xsl:variable name="table" select="regexp:match($tag, 'table:([A-Za-z0-9]+)')[2]"/>
				
				<xsl:choose>
					<xsl:when test="string-length($table) = 0">
						<xsl:call-template name="log_error">
							<xsl:with-param name="msg">Cannot process table: tag="<xsl:value-of select="$tag"/>"! Just copying...</xsl:with-param>
						</xsl:call-template>
						<xsl:copy-of select="."/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="log_debug">
							<xsl:with-param name="msg">Processing table "<xsl:value-of select="$table"/>"...</xsl:with-param>
						</xsl:call-template>
						
						<xsl:variable name="table_template" select="$config//Table[@id = $table]/@template"/>
						
						<xsl:call-template name="log_debug">
							<xsl:with-param name="msg">Applying table template "<xsl:value-of select="$table_template"/>"...</xsl:with-param>
						</xsl:call-template>
						
						<xsl:choose>
							<xsl:when test="$table_template = 'table_0010'">
								<xsl:call-template name="log_error">
									<xsl:with-param name="msg">Template 'table_0010' not implemented yet! just copying table "<xsl:value-of select="$table"/>"...</xsl:with-param>
								</xsl:call-template>
								<xsl:copy-of select="."/>
							</xsl:when>
							<xsl:when test="$table_template = 'table_0020'">
								<xsl:call-template name="table_0020">
									<xsl:with-param name="table-id" select="$table_template"/>
									<xsl:with-param name="table-data" select="$db//Table[@name = $table]"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$table_template = 'table_0030'">
								<xsl:call-template name="log_error">
									<xsl:with-param name="msg">Template 'table_0030' not implemented yet! just copying table "<xsl:value-of select="$table"/>"...</xsl:with-param>
								</xsl:call-template>
								<xsl:copy-of select="."/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="log_error">
									<xsl:with-param name="msg">Unrecognized template '<xsl:value-of select="$table_template"/>'! just copying table "<xsl:value-of select="$table"/>"...</xsl:with-param>
								</xsl:call-template>
								<xsl:copy-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="log_warning">
					<xsl:with-param name="msg">It seems that there is a simple table in the document...</xsl:with-param>
				</xsl:call-template>
				<xsl:copy-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
