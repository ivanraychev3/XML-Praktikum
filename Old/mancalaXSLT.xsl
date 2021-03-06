<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
     method="xml"
     doctype-system="about:legacy-compat"
     omit-xml-declaration = "yes"
     encoding="UTF-8"
     indent="yes" />
     
	<xsl:template match="/">
	<html xmlns="http://www.w3.org/1999/xhtml">
		<body>
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="98vw" height="97vh">
    
    		<title>Kalah Mancala</title>
    		<desc>The GUI playground for the Kalah Mancala game</desc>
    
    		<defs>      
		        <!-- Store -->
		        <ellipse id="store" rx="5.5%" ry="29%" stroke-width="5" />
		        <!-- House player 1 -->
		        <circle id="house-p1" cy="17.5%" r="7%" stroke="black" stroke-width="5" fill="peru" />
		        <!-- House player 2 -->
		        <circle id="house-p2" cy="52.5%" r="7%" stroke="black" stroke-width="5" fill="peru" />
		        <!-- Button -->
		        <rect id="button" y="77%" width="15%" height="6%" stroke="black" stroke-width="5" fill="saddlebrown" />
				
    		</defs>
    
		    <!-- Background -->
		    <svg>
		        <rect rx="20" ry="20" width="100%" height="70%" fill="white" stroke="black" stroke-width="5" />
				
				<svg>
					<rect x="13%" rx="20" ry="20" width="74%" height="70%" fill="saddlebrown" stroke="black" stroke-width="5"/>
				</svg>
		    </svg>
			
		    <svg>
		        <text x="50%" y="76%" font-size="50" fill="darkred" text-anchor="middle" >MANCALA</text>
		    </svg>
		    <g>
		        <use id="btn-newgame" xlink:href="#button" x="42.5%" />
		        <text x="50%" y="81%" font-size="25" fill="black" text-anchor="middle" >NEW GAME</text>
		    </g>
		    
		    
		    <!-- Stores -->
		    <use id="store-p1" xlink:href="#store" x="7%" y="35%" stroke="black" fill="saddlebrown" />
		    <use id="store-p2" xlink:href="#store" x="93%" y="35%" stroke="black" fill="saddlebrown" />
		    
		    <!-- Houses -->
		    <use id="house-p1-1" xlink:href="#house-p1" x="18.75%" />
		    <use id="house-p1-2" xlink:href="#house-p1" x="31.25%" />
		    <use id="house-p1-3" xlink:href="#house-p1" x="43.75%" />
		    <use id="house-p1-4" xlink:href="#house-p1" x="56.25%" />
		    <use id="house-p1-5" xlink:href="#house-p1" x="68.75%" />
		    <use id="house-p1-6" xlink:href="#house-p1" x="81.25%" />
		    
		    <use id="house-p2-1" xlink:href="#house-p2" x="18.75%" />
		    <use id="house-p2-2" xlink:href="#house-p2" x="31.25%" />
		    <use id="house-p2-3" xlink:href="#house-p2" x="43.75%" />
		    <use id="house-p2-4" xlink:href="#house-p2" x="56.25%" />
		    <use id="house-p2-5" xlink:href="#house-p2" x="68.75%" />
		    <use id="house-p2-6" xlink:href="#house-p2" x="81.25%" />
		    
		    <!-- Example seeds -->
		    <!-- Number of seeds in stores represented as numbers -->
		    
		    <!-- Number of seeds in houses represented as black dots -->
		   
		    <xsl:apply-templates/>
			</svg>
		</body>
	</html>
</xsl:template>
	
	<xsl:template match="house">
	 
	 	<xsl:call-template name="iterate"/>
	 	
    </xsl:template>
    
    <xsl:template name="iterate">
        <xsl:param name="count2"> <xsl:value-of select="count"/> </xsl:param>
        <xsl:param name="i" select="1"/>
        <xsl:param name="pos2"> <xsl:value-of select="pos"/> </xsl:param>
        <xsl:param name="cx"> <xsl:value-of select="18.75 + 12.5*pos2"/> </xsl:param>
        <svg>
		   <circle cx="" cy="55%" r="1%" stroke="black" fill="white" /> 
		</svg>
        <xsl:if test="$count2 > 1">
            <xsl:call-template name="iterate">
                <xsl:with-param name="count2" select="$count2 - 1"/>
                <xsl:with-param name="i" select="$i + 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
	
	<xsl:template match="store[@ID=0]">
    	<svg>
		      <text x="7%" y="36%" font-size="50" fill="black" text-anchor="middle" > <xsl:value-of select="count"/> </text>
		</svg>
  	</xsl:template>
  	
  	<xsl:template match="store[@ID=7]">
    	<svg>
		      <text x="93%" y="36%" font-size="50" fill="black" text-anchor="middle" > <xsl:value-of select="count"/> </text>
		</svg>
  	</xsl:template>
  
</xsl:stylesheet>