<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		
<!-- This xslt stylesheet puts the index specific info into a table,
     each element text being put into one table cell.
-->
	
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>

	<xsl:param name="ERRORMESSAGE" select="''"/>

	<xsl:include href="CONFIGPATH/rest/srfCommon.xslt"/>

	<xsl:template name="opSpecifics">
		<xsl:variable name="INDEXNAME" select="@indexName"/>
		<h2>getIndexInfo</h2>
			<form method="get" action="rest">
				<table border="3" cellpadding="5" cellspacing="0">
					<tr>
						<td>
							<input type="hidden" name="operation" value="getIndexInfo"/>
							<xsl:text> </xsl:text><input type="submit" value="Show it"/>
						</td>
					</tr>
				</table>
			</form>
			<form method="get" action="rest">
				<table border="3" cellpadding="5" cellspacing="0">
					<tr>
						<td>
							<xsl:text> </xsl:text>Index name: 
								<select name="indexName">
									<xsl:choose>
										<xsl:when test="$INDEXNAME='AllObjectsIndex'">
											<option value="AllObjectsIndex" selected="true">AllObjectsIndex</option>
											<option value="SmileyAdminIndex">SmileyAdminIndex</option>
											<option value="SmileyUserIndex">SmileyUserIndex</option>
										</xsl:when>
										<xsl:when test="$INDEXNAME='SmileyAdminIndex'">
											<option value="AllObjectsIndex">AllObjectsIndex</option>
											<option value="SmileyAdminIndex" selected="true">SmileyAdminIndex</option>
											<option value="SmileyUserIndex">SmileyUserIndex</option>
										</xsl:when>
										<xsl:when test="$INDEXNAME='SmileyUserIndex'">
											<option value="AllObjectsIndex">AllObjectsIndex</option>
											<option value="SmileyAdminIndex">SmileyAdminIndex</option>
											<option value="SmileyUserIndex" selected="true">SmileyUserIndex</option>
										</xsl:when>
										<xsl:otherwise>
											<option value="AllObjectsIndex">AllObjectsIndex</option>
											<option value="SmileyAdminIndex">SmileyAdminIndex</option>
											<option value="SmileyUserIndex">SmileyUserIndex</option>
										</xsl:otherwise>
									</xsl:choose>
								</select>
						</td>
						<td>
							<input type="hidden" name="operation" value="getIndexInfo"/>
							<xsl:text> </xsl:text><input type="submit" value="Show it"/>
						</td>
					</tr>
				</table>
			</form>
			<p/>
		<table border="3" cellpadding="5" cellspacing="0" width="784">
			<xsl:for-each select="indexInfo/*">
			<tr>
				<td>
					<xsl:value-of select="local-name()"/>
				</td>			
				<td>
					<xsl:copy-of select="node()"/>
				</td>			
			</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
</xsl:stylesheet>	





				




