<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt" 
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:tagsLib="urn:tagsLib" xmlns:BlogLibrary="urn:BlogLibrary" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets tagsLib BlogLibrary ">

<xsl:output method="xml" omit-xml-declaration="yes" />

<xsl:param name="currentPage"/>

<!-- Input the documenttype you want here -->
<xsl:variable name="level" select="1"/>

<xsl:template match="/">
<xsl:call-template name="drawNodes">  
<xsl:with-param name="parent" select="$currentPage/ancestor-or-self::umbBlog"/>  
</xsl:call-template>
</xsl:template>

<xsl:template name="drawNodes">
<xsl:param name="parent"/> 

<xsl:if test="umbraco.library:IsProtected($parent/@id, $parent/@path) = 0 or (umbraco.library:IsProtected($parent/@id, $parent/@path) = 1 and umbraco.library:IsLoggedOn() = 1)">
<ul>
<xsl:for-each select="$parent/umbTextPage [string(./umbracoNaviHide) != '1']"> 
<li class="page_item">
<xsl:attribute name="class">page_item page-item-<xsl:value-of select="./@id"/></xsl:attribute>
  
<a href="{umbraco.library:NiceUrl(@id)}">
<xsl:value-of select="@nodeName"/></a>  
<xsl:if test="count(./node [string(./umbracoNaviHide) != '1']) &gt; 0">   
<xsl:call-template name="drawNodes">    
<xsl:with-param name="parent" select="."/>    
</xsl:call-template>  
</xsl:if> 
</li>
</xsl:for-each>
</ul>
</xsl:if>
</xsl:template>

</xsl:stylesheet>