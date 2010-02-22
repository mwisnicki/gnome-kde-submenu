<?xml version="1.0" encoding="utf-8"?>
<!--
Input:  system-wide gnome menu file
Output: all of gnome's menus with KDE entries excluded
        and a KDE menu from applications-kde4-only menu
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

