<?xml version="1.0"?>
<xsl:transform  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="cima.xsl"/>  

    <xsl:param name="title"></xsl:param>        
    <xsl:param name="prevanime"></xsl:param>
    <xsl:param name="nextanime"></xsl:param>

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
						<ul>
							<li><span class="label">Type:</span> <xsl:value-of select="./type"/></li>
							<li><span class="label">Year:</span> <xsl:value-of select="./year"/></li>
							<li><span class="label">Episodes:</span><xsl:value-of select="@aired"/><xsl:value-of select="./episodes"/></li>
							<li class="generos">
								<span class="label">Genres:</span>
								<span id="generos"  onmouseover="showtarget()"  onmouseout="hidetarget()">								
									<xsl:for-each select="./animegenres/animegenre">
										<xsl:param name="genreid" select="@id"/>
										<xsl:for-each select="//genre">
											<xsl:if test="@id=$genreid">	 
												 
													<xsl:choose>
														<xsl:when test="./genrename='Action'">
														<a onmouseover="getData('genretxts/action.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>  
														<xsl:when test="./genrename='Adventure'">
														<a onmouseover="getData('genretxts/adventure.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Animation'">
														<a onmouseover="getData('genretxts/animation.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Comedy'">
														<a onmouseover="getData('genretxts/comedy.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Demons'">
														<a onmouseover="getData('genretxts/demons.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Drama'">
														<a onmouseover="getData('genretxts/drama.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Ecchi'">
														<a onmouseover="getData('genretxts/ecchi.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Fantasy'">
														<a onmouseover="getData('genretxts/fantasy.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Game'">
														<a onmouseover="getData('genretxts/game.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Harem'">
														<a onmouseover="getData('genretxts/harem.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Historical'">
														<a onmouseover="getData('genretxts/historical.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Horror'">
														<a onmouseover="getData('genretxts/horror.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Josei'">
														<a onmouseover="getData('genretxts/josei.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Magic'">
														<a onmouseover="getData('genretxts/magic.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Martial Arts'">
														<a onmouseover="getData('genretxts/martialarts.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Military'">
														<a onmouseover="getData('genretxts/military.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Music'">
														<a onmouseover="getData('genretxts/music.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Mystery'">
														<a onmouseover="getData('genretxts/mystery.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Parody'">
														<a onmouseover="getData('genretxts/parody.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Police'">
														<a onmouseover="getData('genretxts/police.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Psychological'">
														<a onmouseover="getData('genretxts/psychological.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Romance'">
														<a onmouseover="getData('genretxts/romance.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Samurai'">
														<a onmouseover="getData('genretxts/samurai.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='School'">
														<a onmouseover="getData('genretxts/school.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Sci-Fi'">
														<a onmouseover="getData('genretxts/sci-fi.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Seinen'">
														<a onmouseover="getData('genretxts/seinen.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Shoujo'">
														<a onmouseover="getData('genretxts/shoujo.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Shounen'">
														<a onmouseover="getData('genretxts/shounen.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Slice of Life'">
														<a onmouseover="getData('genretxts/sliceoflife.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Space'">
														<a onmouseover="getData('genretxts/space.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Super Power'">
														<a onmouseover="getData('genretxts/superpower.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Supernatural'">
														<a onmouseover="getData('genretxts/supernatural.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Thriller'">
														<a onmouseover="getData('genretxts/thriller.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
                                                                                                                <xsl:when test="./genrename='Vampire'">
														<a onmouseover="getData('genretxts/vampire.txt','targetDIV')">
															<xsl:value-of select="./genrename"/>
														</a>
														</xsl:when>
													</xsl:choose>
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
					</div>
                                        <div id="targetDIV">
                                            
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
                              
			<div class="nodesecao">
				<h2>Characters</h2>			
			</div>
			<div id="downsdentro" class="nodesecao-dentro">											
				<span id="screens">
                                <xsl:param name="id" select="@id"/>
                                 <xsl:for-each select="//character">
                                    <xsl:if test="./idanime=$id">
                                        <div class="highslide">
                                                        <xsl:element name="img">
                                                                <xsl:attribute name="width">100</xsl:attribute>
                                                                <xsl:attribute name="height">156</xsl:attribute>				
                                                                <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
                                                                <xsl:attribute name="alt"><xsl:value-of select="./name"/></xsl:attribute>
                                                                <xsl:attribute name="src"><xsl:text>images-characters/</xsl:text><xsl:value-of select="./name"/><xsl:text>.jpg</xsl:text></xsl:attribute>
                                                        </xsl:element>

                                                        <div id="dentroleft">
                                                                <ul>
                                                                        <li><span class="label">Name:</span><xsl:value-of select="./name"/></li>
                                                                        <li><span class="label">Voice:</span><xsl:value-of select="./voice"/></li>
                                                                </ul>
                                                        </div>
                                             </div>
                                    </xsl:if>
                                  </xsl:for-each>
                                    
                                </span>
			</div>
		</xsl:if>
    </xsl:template>
    
    <xsl:template match="animecatalogue">
		<xsl:apply-templates select="//anime"/>
		<div id="nav">
			<xsl:element name="a"><xsl:attribute name="class">but prev</xsl:attribute><xsl:attribute name="href">BuscaServlet?title=<xsl:value-of select="$prevanime"/></xsl:attribute>before</xsl:element>				
			<xsl:element name="a"><xsl:attribute name="class">but update</xsl:attribute><xsl:attribute name="href">UpAnimeServlet?title=<xsl:value-of select="$title"/></xsl:attribute>update</xsl:element>   
			<xsl:element name="a"><xsl:attribute name="class">but next</xsl:attribute><xsl:attribute name="href">BuscaServlet?title=<xsl:value-of select="$nextanime"/></xsl:attribute>next</xsl:element>				   	                
		</div>       
    </xsl:template>    
</xsl:transform>