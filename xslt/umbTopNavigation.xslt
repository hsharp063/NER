<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library"
  exclude-result-prefixes="msxml umbraco.library">


    <xsl:output method="xml" omit-xml-declaration="yes" />

    <xsl:param name="currentPage"/>

    <!-- Input the documenttype you want here -->
    <xsl:variable name="level" select="1"/>
	<xsl:variable name="maxLevel" select="3"/>
	  
    <xsl:template match="/">

      
 <ul id="topNavigation">
       <li class="home">
         <xsl:if test="$currentPage/@id = $currentPage/ancestor-or-self::* [@level=$level]/@id">
             <xsl:attribute name="class">home current</xsl:attribute>
         </xsl:if>
         <a href="/">Home</a>
       </li>
      <xsl:for-each select="$currentPage/ancestor-or-self::* [@level=$level]/* [@isDoc and string(umbracoNaviHide) != '1']">
	  <li class="level-one">
		 <xsl:if test="@id = $currentPage/@id">
			<xsl:attribute name="class">current</xsl:attribute>
		  </xsl:if>
		<a class="navigation" href="{umbraco.library:NiceUrl(@id)}">
		  <span><xsl:value-of select="./navigationTitle"/></span>
		</a>
	  </li>
	  <!--if there are any child pages, throw in another list-->
		<xsl:if test="./*[@isDoc]">
		<ul class="level-two-ul">
			<xsl:for-each select="./ancestor-or-self::* [@level=2]/* [@isDoc and string(umbracoNaviHide) != '1']">
			<li class="level-two">
				<xsl:if test="@id = $currentPage/@id">
					<xsl:attribute name="class">level-two-current</xsl:attribute>
				</xsl:if>
				<a class="navigation level-two-a" href="{umbraco.library:NiceUrl(@id)}">
					<span><xsl:value-of select="./navigationTitle"/></span>
				</a>
			</li>
				<xsl:if test="./*[@isDoc]">
					<ul class="level-three-ul">
					<xsl:for-each select="./ancestor-or-self::* [@level=3]/* [@isDoc and string(umbracoNaviHide) != '1']">
						<li class="level-three">
							<xsl:if test="@id = $currentPage/@id">
								<xsl:attribute name="class">level-three-current</xsl:attribute>
							</xsl:if>
							<a class="navigation level-three-a" href="{umbraco.library:NiceUrl(@id)}">
								<span><xsl:value-of select="./navigationTitle"/></span>
							</a>
						</li>
					</xsl:for-each>
					</ul>
				</xsl:if>
			</xsl:for-each>
		</ul>
		</xsl:if>
</xsl:for-each>
</ul>

    </xsl:template>

</xsl:stylesheet>