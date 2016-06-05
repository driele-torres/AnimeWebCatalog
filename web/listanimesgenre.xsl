<?xml version="1.0"?>
<xsl:transform  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:include href="cima.xsl"/>  
	<xsl:param name="id"></xsl:param>        

	
	<xsl:template match="animecatalogue">   
	
		<div class="titulowrap">
			<h2 class="title">Animes of 
			<xsl:for-each select="//genre">
				<xsl:if test="@id=$id">
					<xsl:text>
						<xsl:value-of select="./genrename"/>
					</xsl:text>										
				</xsl:if>
			</xsl:for-each>
			</h2>
		</div>
		<xsl:apply-templates select="//anime"/>    

	</xsl:template>
									
	<xsl:template match="//anime">
		<xsl:for-each select="./animegenres/animegenre">
			<xsl:if test="@id=$id">
		<xsl:element name="a">
            <xsl:attribute name="href">BuscaServlet?title=<xsl:value-of select="../../title"/></xsl:attribute>
            <xsl:attribute name="id"><xsl:text>eachanime</xsl:text></xsl:attribute>	
				<span id="posterspan">
					<h2 class="title">
						<xsl:value-of select="../../title"/>
					</h2>
					<xsl:element name="img">
						<xsl:attribute name="width">242</xsl:attribute>
						<xsl:attribute name="height">339</xsl:attribute>						
						<xsl:attribute name="id">
							<xsl:value-of select="../../@id"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="../../title"/>
						</xsl:attribute>
						<xsl:attribute name="src"><xsl:text>images-animes/</xsl:text><xsl:value-of select="../../title"/><xsl:text>.jpg</xsl:text></xsl:attribute>
					</xsl:element>
				</span>
			</xsl:element>
					
			</xsl:if>
		</xsl:for-each>
		
	</xsl:template>
</xsl:transform>