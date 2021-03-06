<?xml version="1.0" encoding="utf-8"?>
<!--
Input:  system-wide KDE menu file
Output: for every KDE menu exclude everything that does not have KDE category
-->
<xsl:stylesheet version="1.0" exclude-result-prefixes="exslt"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common">

	<xsl:import href="common.xsl" />
	
	<xsl:template match="/">
		<xsl:variable name="pass1">
			<xsl:apply-templates />
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($pass1)/Menu" mode="pass2" />
	</xsl:template>
	
	<xsl:template match="/Menu" mode="pass2">
		<Menu>
			<Name>KDE</Name>
			<Menu>
				<MergeFile type="path">
					<xsl:value-of select="$global-kde4-applications-menu" />
				</MergeFile>
				<xsl:copy-of select="node()" />
				<OnlyUnallocated/>
				<Include>
					<Category>KDE</Category>
				</Include>
			</Menu>
		</Menu>
	</xsl:template>
	
	<xsl:template match="Menu">
		<Menu>
			<Name><xsl:value-of select="Name"/></Name>
			<xsl:apply-templates select="Menu"/>
			<Exclude>
				<Not><Category>KDE</Category></Not>
			</Exclude>
		</Menu>
	</xsl:template>

</xsl:stylesheet>

