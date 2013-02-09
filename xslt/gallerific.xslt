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

	<div id="thumbs">
    <ul class="thumbs noscript">
		<xsl:for-each select="$currentPage/Artpiece">
        <li>
			<xsl:attribute name="ref">
						<xsl:value-of select="./title"/>
					</xsl:attribute>
            <a class="thumb">
				<xsl:attribute name="href">
					<xsl:value-of select="umbraco.library:GetMedia(./image, 'false')/umbracoFile"/>
				</xsl:attribute>				
				<img>
				  <xsl:attribute name="src">
					<xsl:value-of select="umbraco.library:GetMedia(./imageThumbnail, 'false')/umbracoFile" />
				  </xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="./title"/>
					</xsl:attribute>					
				</img>
            </a>
            <div class="caption">
				<div class="image-title"><xsl:value-of select="./title" /></div>
					<div class="image-size"><xsl:value-of select="./size"/></div>
				<div class="image-desc"><xsl:value-of select="./about" /></div>
			</div>
        </li>
		</xsl:for-each>
    </ul>
</div>
	
	<div id="gallery" class="content">
		<div id="controls" class="controls">&nbsp;</div>
		<div class="slideshow-container">&nbsp;
			<div id="loading" class="loader">&nbsp;</div>
			<div id="slideshow" class="slideshow">&nbsp;</div>
		</div>
		
		<div id="caption" class="caption-container">
			<div class="image-title">&nbsp;</div>
			<div class="image-desc">&nbsp;</div>
			<div class="image-size">&nbsp;</div>
		</div>
	</div>

</xsl:template>
</xsl:stylesheet>