<?xml version="1.0"?>
<xsl:transform  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

        <xsl:include href="cima.xsl"/>
        <xsl:template match="info">	
			<div class="node clearfix">
			
				<div class="titulowrap">
					<h2 class="title">About</h2>
				</div>
				
				<div class="content">
					<blockquote>
						<p><xsl:value-of select="./about"/></p>
					</blockquote>
				</div>
			</div> <!-- /.node -->
			
        </xsl:template>
        <xsl:template match="animecatalogue">
            <xsl:apply-templates select="info" />
        </xsl:template>
</xsl:transform>