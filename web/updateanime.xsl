<?xml version="1.0"?>
<xsl:transform  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="cima.xsl"/>  

    <xsl:param name="title"></xsl:param>        

    <xsl:template match="//anime">
        <xsl:if test="./title=$title">
			<div class="titulowrap">
				<h2 class="title">
					<xsl:value-of select="./title"/>
				</h2>
			</div>
                        
			<div class="content">						
				<div id="left">
					<div id="dentroleft">
                                         <xsl:element name="form">
                                            <xsl:attribute name="action">BuscaServlet</xsl:attribute>
                                            <xsl:attribute name="method">post</xsl:attribute>
                                            
                                            <xsl:element name="input">
                                                 <xsl:attribute name="value"><xsl:value-of select="$title"/></xsl:attribute>
                                                 <xsl:attribute name="type">hidden</xsl:attribute>
                                                 <xsl:attribute name="name">title</xsl:attribute>
                                            </xsl:element>
                                            
                                            
                                           	<ul>
											
							<li><span class="label">Type:</span> <xsl:value-of select="./type"/></li>
							<li><span class="label">Year:</span> <xsl:value-of select="./year"/></li>
							<li>
                                                           <span class="label">Episodes:</span>
                                                        
                                                        <xsl:element name="input">
														
                                                        <xsl:attribute name="value"><xsl:value-of select="./episodes"/></xsl:attribute>
                                                        <xsl:attribute name="type">integer</xsl:attribute>
                                                        <xsl:attribute name="name">episodes</xsl:attribute>
														
                                                        </xsl:element>

                                                        </li>
							<li class="generos">
								<span class="label">Genres:</span>
								<span id="generos">								
									<xsl:for-each select="./animegenres/animegenre">
										<xsl:param name="genreid" select="@id"/>
										
										<xsl:for-each select="//genre">
											<xsl:if test="@id=$genreid">	 
												<xsl:element name="a"> 
													<xsl:attribute name="src"></xsl:attribute> 
													<xsl:text><xsl:value-of select="./genrename"/></xsl:text>
												</xsl:element>
											</xsl:if>
										</xsl:for-each>
										<xsl:choose>
											<xsl:when test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
								</span>
							</li>
							
						</ul>
                                                 <input type="submit" value="Update"/>
                                                <a class="anchor">
                                                    <xsl:attribute name="href">BuscaServlet?title=<xsl:value-of select="$title"/></xsl:attribute>
                                                    <input type="button" value="Cancel"/>
                                                </a>            
                    
                                            </xsl:element>
					</div>
				</div>
				<div id="right">						
					<span id="posterspan">						
						<xsl:element name="img">
							<xsl:attribute name="width">242</xsl:attribute>
							<xsl:attribute name="height">339</xsl:attribute>
							<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
							<xsl:attribute name="alt"><xsl:value-of select="./title"/></xsl:attribute>
							<xsl:attribute name="src"><xsl:text>images-animes/</xsl:text><xsl:value-of select="./title"/><xsl:text>.jpg</xsl:text></xsl:attribute>
						</xsl:element>
					</span>
					<div id="borawrappar">
						<h3 >Synopsis</h3>
						<span id="sinopse">
							<xsl:value-of select="./description"/>
						</span>								
					</div>								
				</div>
			</div>  
             </xsl:if>

    </xsl:template>
                 
<xsl:template match="animecatalogue">
    <xsl:apply-templates select="//anime"/>                       
</xsl:template>

</xsl:transform>