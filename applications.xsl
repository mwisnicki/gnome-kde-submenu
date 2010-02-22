<?xml version="1.0" encoding="utf-8"?>
<!--
Input:  user's applications.xml menu
Output: user's applications.xml menu with appended MergeFile of KDE4 exclusions
        and KDE4 menu
-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="common.xsl" />
	
	<xsl:template match="/Menu">
		<Menu>
			<xsl:copy-of select="node()" />
			<xsl:if test="not(MergeFile[. = 'applications-kde4-exclude.menu'])">
				<MergeFile type="path">applications-kde4-exclude.menu</MergeFile>
			</xsl:if>
			<xsl:if test="not(MergeFile[. = 'applications-kde4-submenu.menu'])">
				<MergeFile type="path">applications-kde4-submenu.menu</MergeFile>
			</xsl:if>
		</Menu>
	</xsl:template>

</xsl:stylesheet>

