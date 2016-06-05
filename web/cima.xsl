<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


    <xsl:template match="/" priority="10">
        <html>

            <head>
                <title>Catalogue of Animes</title>
                <link type="text/css" rel="stylesheet" media="all" href="design/animecatalog.css" />
                <script type="text/javascript" src="slideimages.js"></script>
                <script type="text/javascript" src="showhide.js"></script>
                <script type="text/javascript" src="animeget.js"></script>
            </head>

            <body class="not-front no-sidebars">

                <div id="page">
			
                    <div id="header">
				
                        <div class="section clearfix">
					
                            <div id="logodiv">
                                <img alt="Anime Catalogue">
                                    <xsl:attribute name="src">design/site-images/logo.png</xsl:attribute>
                                </img>
                            </div>
						
                        </div>
				
                    </div> <!-- /.section, /#header -->
				
                    <div id="main-wrapper">
				
                        <div id="navigation">
					
                            <div class="section clearfix">
                                <ul id="main-menu" class="links clearfix">
                                    <li>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">HomeServlet</xsl:attribute>Home
                                        </xsl:element>
                                    </li>
                                    <li>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">AnimesServlet</xsl:attribute>Animes
                                        </xsl:element>
                                    </li>
                                    <li>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">GenresServlet</xsl:attribute>Genres
                                        </xsl:element>
                                    </li>
                                    <li>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">CharactersServlet</xsl:attribute>Characters
                                        </xsl:element>
                                    </li>
                                    <li>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">AboutServlet</xsl:attribute>About
                                        </xsl:element>
                                    </li>
                                </ul>
                            </div>
						
                        </div> <!-- /.section, /#navigation -->
					
                        <div id="main" class="clearfix">
						
                            <div class="region-header block odd content view view-banoes view-content views-row">
                                <span class="field-content">
                                    <a href="">
                                        <img id="slide" width="1012" height="266">
                                            <xsl:attribute name="src">design/site-images/banner0.jpg</xsl:attribute>
                                        </img>													
                                    </a>
                                </span>
											
                            </div> <!-- /.region -->
						
                            <div id="content" class="column">
						
                                <div class="section">
							
                                    <div id="content-area">
									
                                        <div id="" class="node clearfix">
                                            <!-- Here we have to put the page info, whatever will be-->
                                            <xsl:apply-templates />
                                        </div>
                                        <!-- /.node -->
                                    </div>
                                </div>
	
                            </div> <!-- /.section, /#content -->
					
                        </div>
					
                    </div> <!-- /#main, /#main-wrapper -->
                    <!-- here we have put the nav part, when we calling each anime info-->
                    <div id="footer">
                        <div class="section">
                            <div id="footer-message">
                                <p>All material here is for academic use. All rights for their respective owners.</p>
                            </div>
                        </div>
                    </div> <!-- /.section, /#footer -->    

                </div> <!-- /#page -->
            </body>
            

        </html>   
    </xsl:template>
</xsl:transform>

