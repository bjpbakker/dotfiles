<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:pom="http://maven.apache.org/POM/4.0.0">
  <xsl:output method="text" indent="no"/>

  <xsl:variable name="newline"><xsl:text>
</xsl:text></xsl:variable>

<xsl:template match="/pom:project">
  <xsl:variable name="groupId">
    <xsl:choose>
      <xsl:when test="pom:groupId != ''">
        <xsl:value-of select="pom:groupId" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="pom:parent/pom:groupId" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="packaging">
    <xsl:choose>
      <xsl:when test="pom:packaging != ''">
        <xsl:value-of select="pom:packaging" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>jar</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:value-of select="concat($groupId, ':', pom:artifactId, ':', $packaging, $newline)"/>

</xsl:template>
</xsl:stylesheet> 

