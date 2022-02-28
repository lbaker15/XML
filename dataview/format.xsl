
<xsl:stylesheet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:cip="http://www.rockwellautomation.com/technologies/data_access/data_types/1.0"
   version = "1.0" >

<xsl:variable name="hexDigits" select="'0123456789ABCDEF'" />
<xsl:variable name="octalDigits" select="'01234567'" />
<xsl:variable name="binaryDigits" select="'01'" />

<xsl:template name="toHex">
   <xsl:param name="decimalNumber" />
   <xsl:param name="datatype" />
   <xsl:if test="$decimalNumber &lt; 0">
      <xsl:choose>
         <xsl:when test="$datatype='cip:dt_SINT'">
            <xsl:call-template name="toHex">
               <xsl:with-param name="decimalNumber" select="256 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$datatype='cip:dt_INT'">
            <xsl:call-template name="toHex">
               <xsl:with-param name="decimalNumber" select="65536 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$datatype='cip:dt_DINT'">
            <xsl:call-template name="toHex">
               <xsl:with-param name="decimalNumber" select="4294967296 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
      </xsl:choose>
   </xsl:if>
   <xsl:if test="$decimalNumber &gt;= 0">
      <xsl:if test="$decimalNumber > 15">
         <xsl:call-template name="toHex">
            <xsl:with-param name="decimalNumber"
                            select="floor($decimalNumber div 16)" />
            <xsl:with-param name="datatype" select="$datatype"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:value-of select="substring($hexDigits,
                                      ($decimalNumber mod 16) + 1, 1)" />
   </xsl:if>
</xsl:template>

<xsl:template name="toOctal">
   <xsl:param name="decimalNumber" />
   <xsl:param name="datatype" />
   <xsl:if test="$decimalNumber &lt; 0">
      <xsl:choose>
         <xsl:when test="$datatype='cip:dt_SINT'">
            <xsl:call-template name="toOctal">
               <xsl:with-param name="decimalNumber" select="256 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$datatype='cip:dt_INT'">
            <xsl:call-template name="toOctal">
               <xsl:with-param name="decimalNumber" select="65536 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$datatype='cip:dt_DINT'">
            <xsl:call-template name="toOctal">
               <xsl:with-param name="decimalNumber" select="4294967296 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
      </xsl:choose>
   </xsl:if>
   <xsl:if test="$decimalNumber &gt;= 0">
      <xsl:if test="$decimalNumber > 7">
         <xsl:call-template name="toOctal">
            <xsl:with-param name="decimalNumber"
                            select="floor($decimalNumber div 8)" />
            <xsl:with-param name="datatype" select="$datatype"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:value-of select="substring($octalDigits,
                                      ($decimalNumber mod 8) + 1, 1)" />
   </xsl:if>
</xsl:template>

<xsl:template name="toBinary">
   <xsl:param name="decimalNumber" />
   <xsl:param name="datatype" />
   <xsl:if test="$decimalNumber &lt; 0">
      <xsl:choose>
         <xsl:when test="$datatype='cip:dt_SINT'">
            <xsl:call-template name="toBinary">
               <xsl:with-param name="decimalNumber" select="256 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$datatype='cip:dt_INT'">
            <xsl:call-template name="toBinary">
               <xsl:with-param name="decimalNumber" select="65536 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="$datatype='cip:dt_DINT'">
            <xsl:call-template name="toBinary">
               <xsl:with-param name="decimalNumber" select="4294967296 + $decimalNumber" />
               <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:call-template>
         </xsl:when>
      </xsl:choose>
   </xsl:if>
   <xsl:if test="$decimalNumber &gt;= 0">
      <xsl:if test="$decimalNumber > 1">
         <xsl:call-template name="toBinary">
            <xsl:with-param name="decimalNumber"
                            select="floor($decimalNumber div 2)" />
            <xsl:with-param name="datatype" select="$datatype"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:value-of select="substring($binaryDigits,
                                      ($decimalNumber mod 2) + 1, 1)" />
   </xsl:if>
</xsl:template>

</xsl:stylesheet>