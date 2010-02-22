<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes"
		doctype-public="-//freedesktop//DTD Menu 1.0//EN"
		doctype-system="http://standards.freedesktop.org/menu-spec/menu-1.0.dtd"
	/>
	
	<xsl:template match="Menu">
		<Menu>
			<Name><xsl:value-of select="Name"/></Name>
			<xsl:apply-templates select="Menu"/>
			<Exclude>
				<Not><Category>KDE</Category></Not>
			</Exclude>
		</Menu><xsl:comment>End of: <xsl:value-of select="Name"/> </xsl:comment>
	</xsl:template>

</xsl:stylesheet>

