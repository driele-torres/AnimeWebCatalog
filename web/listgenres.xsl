<?xml version="1.0"?>
<xsl:transform  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:include href="cima.xsl"/>  
	
	<xsl:template match="animecatalogue">   
	
		<div class="titulowrap">
			<h2 class="title">List of Genres</h2>
		</div>
		<xsl:apply-templates select="//genre"/>    

	</xsl:template>				
	<xsl:template match="//genre">
			<xsl:element name="a">
                        <xsl:attribute name="id"><xsl:text>info</xsl:text></xsl:attribute>	

                        <xsl:attribute name="href">BuscaGenreServlet?id=<xsl:value-of select="@id"/></xsl:attribute>
                        	<span id="posterspan">
					<h2>
					<xsl:value-of select="./genrename"/>
					</h2>
					<xsl:element name="div">
                                            <xsl:attribute name="id">genreinfo</xsl:attribute>
                                            <xsl:value-of select="./information"/>					
					</xsl:element>
				</span>
			</xsl:element>
	</xsl:template>
</xsl:transform>