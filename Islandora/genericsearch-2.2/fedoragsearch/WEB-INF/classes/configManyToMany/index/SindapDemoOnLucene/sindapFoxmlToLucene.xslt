<?xml version="1.0" encoding="UTF-8"?> 
<!-- $Id: sindapFoxmlToLucene.xslt 5734 2006-11-28 11:20:15Z gertsp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   
    	xmlns:exts="xalan://dk.defxws.fedoragsearch.server.XsltExtensions"
    		exclude-result-prefixes="exts"
		xmlns:zs="http://www.loc.gov/zing/srw/"
		xmlns:foxml="info:fedora/fedora-system:def/foxml#"
		xmlns:dc="http://purl.org/dc/elements/1.1/"
		xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
		xmlns:uvalibdesc="http://dl.lib.virginia.edu/bin/dtd/descmeta/descmeta.dtd"
		xmlns:uvalibadmin="http://dl.lib.virginia.edu/bin/admin/admin.dtd/">
		
<!-- This xslt stylesheet will receive fedora objects with  
     demo: PIDs from the repository DemoAtDtu and 
     sindap: PIDs from the repository SindapAtDtu,
     demonstrating the case, where one index (this one, SindapDemoOnLucene)
     contains index documents from two repositories.
     Each index document (one per fedora object) contains
     an index field named repositoryName,
     which is used by the rest/demoGfindObjects stylesheet
     in order to include the correct url for search hits.
-->
		
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

	<xsl:param name="REPOSITORYNAME" select="repositoryName"/>
	<xsl:variable name="PID" select="/foxml:digitalObject/@PID"/>
	
	<xsl:template match="/">
		<IndexDocument> 
		    <!-- The PID attribute is mandatory for indexing to work -->
			<xsl:attribute name="PID">
				<xsl:value-of select="$PID"/>
			</xsl:attribute>
		<!-- The following allows only active FedoraObjects to be indexed. -->
		<xsl:if test="foxml:digitalObject/foxml:objectProperties/foxml:property[@NAME='info:fedora/fedora-system:def/model#state' and @VALUE='Active']">
			<xsl:if test="foxml:digitalObject/foxml:objectProperties/foxml:property[@NAME='http://www.w3.org/1999/02/22-rdf-syntax-ns#type' and @VALUE='FedoraObject']">
				<xsl:apply-templates mode="activeFedoraObject"/>
			</xsl:if>
		</xsl:if>
		</IndexDocument>
	</xsl:template>

	<xsl:template match="/foxml:digitalObject" mode="activeFedoraObject">
			<IndexField IFname="PID" index="UN_TOKENIZED" store="YES" termVector="NO" boost="2.5">
				<xsl:value-of select="$PID"/>
			</IndexField>
			<IndexField IFname="repositoryName" index="UN_TOKENIZED" store="YES" termVector="NO">
				<xsl:value-of select="$REPOSITORYNAME"/>
			</IndexField>
			<xsl:for-each select="foxml:objectProperties/foxml:property">
				<IndexField index="UN_TOKENIZED" store="YES" termVector="NO">
					<xsl:attribute name="IFname"> 
						<xsl:value-of select="concat('fgs.', substring-after(@NAME,'#'))"/>
					</xsl:attribute>
					<xsl:value-of select="@VALUE"/>
				</IndexField>
			</xsl:for-each>
			<xsl:for-each select="foxml:datastream/foxml:datastreamVersion/foxml:xmlContent/oai_dc:dc/*">
				<IndexField index="TOKENIZED" store="YES" termVector="YES">
					<xsl:attribute name="IFname">
						<xsl:value-of select="concat('dc.', substring-after(name(),':'))"/>
					</xsl:attribute>
					<xsl:value-of select="text()"/>
				</IndexField>
			</xsl:for-each>

			<!-- a datastream identified in dsId is fetched, if its mimetype 
			     can be handled, the text becomes the value of the IndexField. -->
			     
			<IndexField IFname="fgs.DS1.text" dsId="DS1" index="TOKENIZED" store="YES" termVector="NO">
			</IndexField>
			
			
	</xsl:template>
	
</xsl:stylesheet>	
