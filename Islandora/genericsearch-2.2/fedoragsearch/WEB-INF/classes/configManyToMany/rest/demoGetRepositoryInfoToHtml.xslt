<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		
<!-- This xslt stylesheet puts the repository specific info into a table,
     each element text being put into one table cell.
-->
	
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>

	<xsl:param name="ERRORMESSAGE" select="''"/>

	<xsl:include href="CONFIGPATH/rest/demoCommon.xslt"/>

	<xsl:template name="opSpecifics">
		<xsl:variable name="REPOSITORYNAME" select="@repositoryName"/>
		<h2>getRepositoryInfo</h2>
			<form method="get" action="rest">
				<table border="3" cellpadding="5" cellspacing="0">
					<tr>
						<td>
							<xsl:text> </xsl:text>Repository name: 
								<select name="repositoryName">
									<xsl:choose>
										<xsl:when test="$REPOSITORYNAME='DemoAtDtu'">
											<option value="DemoAtDtu" selected="true">DemoAtDtu</option>
											<option value="SindapAtDtu">SindapAtDtu</option>
										</xsl:when>
										<xsl:when test="$REPOSITORYNAME='SindapAtDtu'">
											<option value="DemoAtDtu">DemoAtDtu</option>
											<option value="SindapAtDtu" selected="true">SindapAtDtu</option>
										</xsl:when>
										<xsl:otherwise>
											<option value="DemoAtDtu">DemoAtDtu</option>
											<option value="SindapAtDtu">SindapAtDtu</option>
										</xsl:otherwise>
									</xsl:choose>
								</select>
						</td>
						<td>
							<input type="hidden" name="operation" value="getRepositoryInfo"/>
							<xsl:text> </xsl:text><input type="submit" value="Show it"/>
						</td>
					</tr>
				</table>
			</form>
			<p/>
		<table border="3" cellpadding="5" cellspacing="0" width="784">
			<xsl:for-each select="repositoryInfo/*">
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





				



