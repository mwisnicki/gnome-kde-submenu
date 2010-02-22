<?xml version="1.0" encoding="utf-8"?>
<!--
Input:  users's applications.xml menu
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
	
	<xsl:template match="/">
		<xsl:variable name="pass1">
			<xsl:apply-templates />
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($pass1)/Menu" mode="pass2" />
	</xsl:template>
	
	<xsl:template match="/Menu" mode="pass2">
		<Menu>
			<xsl:copy-of select="node()" />
			<Menu>
				<Name>KDE</Name>
				<MergeFile type="path">applications-kde4-only.menu</MergeFile>
			</Menu>
		</Menu>
	</xsl:template>
	
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

