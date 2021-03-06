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
		<head>
		
		<script type="text/javascript">
				function clickhouse(ID)
			{
			  var gameIDlocal = '<xsl:value-of select="/*/@gameID"/>';
			  var loc= window.location;
			  window.location=("http://localhost:8984/clicked?ID="+ID+"&amp;gameID="+gameIDlocal);
			  
			 
			}
			
			<!-- not really used-->
				function loadcon()
			{
				var loc2= window.location;
				window.location="http://localhost:8984/loadcon";
			}
			
				function clicknewgame()
			{
			  var loc= window.location;
			  window.location="http://localhost:8984/clickednewgame";
			}
			</script> 
		
		</head>
		
		<body>
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="98vw" height="97vh">
    
    		<title>Kalah Mancala</title>
    		<desc>The GUI playground for the Kalah Mancala game</desc>
    
    		<defs>      
		        <!-- Store	-->
		        <ellipse id="store" rx="5.5%" ry="29%" stroke-width="5" />
		        <!-- House player 2 -->
		        <circle id="house-p2" cy="17.5%" r="7%" stroke="black" stroke-width="5" fill="peru" />
		        <!-- House player 1 -->
		        <circle id="house-p1" cy="52.5%" r="7%" stroke="black" stroke-width="5" fill="peru" />
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
		        <use id="btn-newgame" xlink:href="#button" x="42.5%" onclick="clicknewgame()" />
		        <text x="50%" y="81%" font-size="25" fill="black" text-anchor="middle" >NEW GAME</text>
		    </g>
			
			 <!-- test -->
			
			<svg>
			<rect x="85%" y="75%" width="10%" height="20%" stroke="black" fill="black" onclick="loadcon()" />
			
			</svg>
			<xsl:if test="//finished = 1">
			<svg>
			<text x="90%" y="85%" font-size="20" fill="white" text-anchor="middle" >Game Over</text>
			</svg>
			</xsl:if>
			
			<xsl:if test="//finished = 2">
			<svg>
			<text x="90%" y="85%" font-size="20" fill="white" text-anchor="middle" >Game Over</text>
			</svg>
			</xsl:if>
			
			<svg>
		      <text x="90%" y="82%" font-size="20" fill="white" text-anchor="middle" > <xsl:value-of select="/*/@gameID"/> </text>
			
			</svg>
		
		<svg>
		      <text x="90%" y="91%" font-size="50" fill="white" text-anchor="middle" > <xsl:value-of select="//curplayer"/> </text>
		</svg>
			
		    
		    <!-- Stores -->
		    <use id="store-p1" xlink:href="#store" x="7%" y="35%" stroke="black" fill="saddlebrown" />
		    <use id="store-p2" xlink:href="#store" x="93%" y="35%" stroke="black" fill="saddlebrown" />
		    
		    <!-- Houses 
			hard coded gameIds this needs to be changed -->
			<use id="house-p1-1" xlink:href="#house-p1" x="18.75%" onclick="clickhouse(0)"/>
		    <use id="house-p1-2" xlink:href="#house-p1" x="31.25%" onclick="clickhouse(1)"/>
		    <use id="house-p1-3" xlink:href="#house-p1" x="43.75%" onclick="clickhouse(2)"/>
		    <use id="house-p1-4" xlink:href="#house-p1" x="56.25%" onclick="clickhouse(3)"/>
		    <use id="house-p1-5" xlink:href="#house-p1" x="68.75%" onclick="clickhouse(4)"/>
		    <use id="house-p1-6" xlink:href="#house-p1" x="81.25%" onclick="clickhouse(5)"/>
			
		    <use id="house-p2-1" xlink:href="#house-p2" x="18.75%" onclick="clickhouse(12)"/>
		    <use id="house-p2-2" xlink:href="#house-p2" x="31.25%" onclick="clickhouse(11)"/>
		    <use id="house-p2-3" xlink:href="#house-p2" x="43.75%" onclick="clickhouse(10)"/>
		    <use id="house-p2-4" xlink:href="#house-p2" x="56.25%" onclick="clickhouse(9)"/>
		    <use id="house-p2-5" xlink:href="#house-p2" x="68.75%" onclick="clickhouse(8)"/>
		    <use id="house-p2-6" xlink:href="#house-p2" x="81.25%" onclick="clickhouse(7)"/>
		    		    
		    <!-- Example seeds -->
		    <!-- Number of seeds in stores represented as numbers -->
		    
		    <!-- Number of seeds in houses represented as black dots -->
		   
		    <xsl:apply-templates />
			</svg>
			
			<!-- test2 skript-->
		    <!-- <form name="myform" action="handle-data.php">
				Search: <input type='text' name='query' />

				<a href="javascript: submitform()">Search</a>
			</form>


			<script type="text/javascript">
				function submitform()
			{
			  document.myform.submit();
			}
			</script>
			-->
			<!-- test2 skript  ende -->
			
		</body>
	</html>
	</xsl:template>
	
	<!-- start of the finished screen not working and not even thought through change it -->


	
	
	
	<xsl:template match="slot">
	 
	 	<xsl:call-template name="iterate"/>
	 	
    </xsl:template>
	
    
   <xsl:template name="iterate">
		<xsl:param name="count2">
			<xsl:value-of select="count" />
		</xsl:param>
		<xsl:param name="i" select="1" />
		<xsl:param name="pos2">
			<xsl:value-of select="pos" />
		</xsl:param>
		<xsl:param name="cx2">
			<xsl:value-of select="18.75 + 12.5*$pos2" />
		</xsl:param>
		<svg>
			<!-- <xsl:value-of select="pos"/> <xsl:value-of select="$cx"/> -->
			<xsl:value-of select="position()"/>
			
			<!-- <circle cx="{18.75 +(12.5*(pos))}%" cy="{17.5-$i}%" r="1%" stroke="black" fill="white" /> 
			Würde auch funktionieren ich bin mir aber nicht sicher warum ...
			post() greift auf die absolute stelle in der liste in der xml zu glaub ich-->
			
			<xsl:if test="owner = 2">
				<xsl:if test= "$count2>0">
			<circle cx="{18.75 +(12.5*($pos2))}%" cy="{17.5-$i}%" r="2%" stroke="black" fill="white" />
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="owner = 1">
			<xsl:if test= "$count2>0">
			<circle cx="{18.75 +(12.5*($pos2))}%" cy="{52.5-$i}%" r="2%" stroke="black" fill="white" />
			</xsl:if>
			</xsl:if>
		</svg>
		<xsl:if test="$count2 > 1">
			<xsl:call-template name="iterate">
				<xsl:with-param name="count2" select="$count2 - 1" />
				<xsl:with-param name="i" select="$i + 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	
	<!-- not really working my start to try to get the actual game Id out ouf the xml so the clickhouse methode can use it-->
	<xsl:template match= "" >
	<svg>
		      <text x="90%" y="82%" font-size="50" fill="white" text-anchor="middle" > <xsl:value-of select="/*/@gameID"/> </text>
		</svg>
	<!--<xsl:param name="count2">
			<xsl:value-of select="@gameID" />
		</xsl:param>
    	<ref id="gameID" param="count2" default="0"/>-->
  	</xsl:template>
	
	
	<xsl:template match="slot[@ID=13]">
    	<svg>
		      <text x="7%" y="36%" font-size="50" fill="black" text-anchor="middle" > <xsl:value-of select="count"/> </text>
		</svg>
  	</xsl:template>
  	
  	<xsl:template match="slot[@ID=6]">
    	<svg>
		      <text x="93%" y="36%" font-size="50" fill="black" text-anchor="middle" > <xsl:value-of select="count"/> </text>
		</svg>
  	</xsl:template>
	
  
 
</xsl:stylesheet>