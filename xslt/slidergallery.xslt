<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">

<!-- start writing XSLT -->
	 <div id="slides">
            <div class="slides_container">
                <xsl:for-each select="$currentPage/SliderImage">
                  <div class="slide">
					  <a>
						<xsl:attribute name="href">
							 <xsl:value-of select="./link" />
						</xsl:attribute>
						<img>
						    <xsl:attribute name="src">
							 <xsl:value-of select="umbraco.library:GetMedia(./image, 'false')/umbracoFile" />
						    </xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="./alt"/>
							</xsl:attribute>
							<xsl:attribute name="width">
							 <xsl:value-of select="./width" />
							</xsl:attribute>
							<xsl:attribute name="height">
							 <xsl:value-of select="./height" />
							</xsl:attribute>
						</img>  
					  </a>
						<div class="caption" style="bottom:0">
							<p><xsl:value-of select="./caption"/></p>
						</div>            
                  </div>
				</xsl:for-each>
            </div>
        </div>

</xsl:template>

</xsl:stylesheet>