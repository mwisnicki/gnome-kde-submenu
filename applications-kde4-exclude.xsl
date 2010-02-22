<?xml version="1.0" encoding="utf-8"?>
<!--
Input:  system-wide GNOME menu file
Output: mergeable menu file with KDE exclusions for every GNOME menu
-->
<xsl:stylesheet version="1.0" exclude-result-prefixes="exslt"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common">

	<xsl:import href="common.xsl" />
	
	<xsl:template match="Menu">
		<xsl:if test="Name != 'Debian'">
			<Menu>
				<Name><xsl:value-of select="Name"/></Name>
				<xsl:apply-templates select="Menu"/>
				<Exclude>
					<Category>KDE</Category>
				</Exclude>
			</Menu>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>

