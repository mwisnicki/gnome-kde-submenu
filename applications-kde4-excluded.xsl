<?xml version="1.0" encoding="utf-8"?>
<!--
Input:  system-wide gnome menu file
Output: all of gnome's menus with KDE entries excluded
        and a KDE menu from applications-kde4-only menu
-->
<xsl:stylesheet version="1.0" exclude-result-prefixes="exslt"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common">

	<xsl:output method="xml" indent="yes"
		doctype-public="-//freedesktop//DTD Menu 1.0//EN"
		doctype-system="http://standards.freedesktop.org/menu-spec/menu-1.0.dtd"
	/>
	
	<xsl:template match="Menu">
		<Menu>
			<Name><xsl:value-of select="Name"/></Name>
			<xsl:apply-templates select="Menu"/>
			<Exclude>
				<Category>KDE</Category>
			</Exclude>
		</Menu><xsl:comment>End of: <xsl:value-of select="Name"/> </xsl:comment>
	</xsl:template>

</xsl:stylesheet>

