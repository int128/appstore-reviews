<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i="http://www.apple.com/itms/">
  <xsl:output method="xml" encoding="UTF-8" />

  <xsl:template match="/">
    <app><xsl:apply-templates /></app>
  </xsl:template>

  <xsl:template match="/i:Document/i:View/i:ScrollView/i:VBoxView/i:View/i:MatrixView/i:VBoxView/i:HBoxView[1]/i:VBoxView[1]/i:VBoxView/i:MatrixView/i:VBoxView">
    <xsl:attribute name="name">
      <xsl:value-of select="normalize-space(i:TextView[1]/i:SetFontStyle/i:GotoURL/text())" />
    </xsl:attribute>
    <xsl:attribute name="category">
      <xsl:value-of select="normalize-space(i:TextView[2]/i:SetFontStyle/text())" />
    </xsl:attribute>
    <xsl:attribute name="updated">
      <xsl:value-of select="normalize-space(i:TextView[3]/i:SetFontStyle/text())" />
    </xsl:attribute>
    <xsl:attribute name="version">
      <xsl:value-of select="normalize-space(i:TextView[4]/i:SetFontStyle/text())" />
    </xsl:attribute>
    <xsl:attribute name="size">
      <xsl:value-of select="normalize-space(i:TextView[6]/i:SetFontStyle/text())" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="/i:Document/i:View/i:ScrollView/i:VBoxView/i:View/i:MatrixView/i:VBoxView/i:VBoxView/i:VBoxView">
    <review>
      <xsl:attribute name="title">
        <xsl:value-of select="normalize-space(i:HBoxView[1]/i:TextView/i:SetFontStyle/i:b/text())" />
      </xsl:attribute>
      <xsl:attribute name="stars">
        <xsl:value-of select="count(i:HBoxView[1]/i:HBoxView[1]/i:HBoxView[1]/i:PictureView)" />
      </xsl:attribute>
      <xsl:attribute name="author">
        <xsl:value-of select="normalize-space(i:HBoxView[2]/i:TextView/i:SetFontStyle/i:GotoURL/text())" />
      </xsl:attribute>
      <xsl:attribute name="version">
        <xsl:value-of select="normalize-space(substring-before(substring-after(i:HBoxView[2]/i:TextView/i:SetFontStyle/text()[2], '-'), '-'))" />
      </xsl:attribute>
      <xsl:attribute name="date">
        <xsl:value-of select="normalize-space(substring-after(substring-after(i:HBoxView[2]/i:TextView/i:SetFontStyle/text()[2], '-'), '-'))" />
      </xsl:attribute>
      <xsl:attribute name="id">
        <xsl:value-of select="normalize-space(i:HBoxView[3]/i:HBoxView/@viewName)" />
      </xsl:attribute>
      <xsl:value-of select="i:TextView/i:SetFontStyle/text()" />
    </review>
  </xsl:template>

  <xsl:template match="text()|@*"></xsl:template>
</xsl:stylesheet>
