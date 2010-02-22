<?xml version="1.0" encoding="utf-8"?>
<!--
Input:  user's applications.xml menu
Output: user's applications.xml menu with appended MergeFile of KDE4 exclusions
        and KDE4 menu
-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="common.xsl" />
	
	<!-- TODO only append if it is not there yet -->
	<xsl:template match="/Menu">
		<Menu>
			<xsl:copy-of select="node()" />
			<MergeFile type="path">applications-kde4-exclude.menu</MergeFile>
			<MergeFile type="path">applications-kde4-submenu.menu</MergeFile>
		</Menu>
	</xsl:template>

</xsl:stylesheet>

