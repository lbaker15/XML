
<xsl:stylesheet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:dv="http://www.rockwellautomation.com/technologies/data_access/data_views/1.0/"
   xmlns:cip="http://www.rockwellautomation.com/technologies/data_access/data_types/1.0"
   version = "1.0" >

<xsl:import href="format.xsl"/>

<xsl:output method="html" version="1.0" encoding="iso-8859-1" indent="yes"/>

<xsl:variable name="pathToLocalChassis" select="'1,'" />

<xsl:template match="/">

<html style="background-color: #B7B6B6;">
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache"/>
<META HTTP-EQUIV="Expires" CONTENT="-1"/>
<link rel="stylesheet" href="/css/radevice.css" type="text/css" />
<script type="text/javascript" language="JavaScript" src="/scripts/URLhandle.js"></script>
<script type="text/javascript" language="JavaScript" src="/scripts/sorttable.js"></script>
<script type="text/javascript" language="JavaScript">
   function init_form() {
      var path = document.location.href.substring(document.location.href.indexOf("/user/system/dataviews/"));
      document.getElementById("frmupdate").action = path;
      document.getElementById("redirect").value = document.location.href.substring(document.location.href.indexOf("/user/system/dataviews/"));
   }
</script>
</head>
<body onLoad="frame_check();init_form();" bgcolor="#B7B6B6" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" marginwidth="0">
<div style="margin-left: 10px;">
<!-- Start tabs -->
<table width="98%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td nowrap="nowrap" width="6" valign="top"><img src="/images/menustartoff.gif" alt="" width="10" height="16" border="0"/></td>
		<td nowrap="nowrap" background="/images/menubgoff.gif">
			<a class="tab" onClick="highlightTree('/dataviews.asp');" href="/dataviews.asp">Data Views</a></td>
		<td nowrap="nowrap"><img src="/images/mensepoffoff.gif" border="0"/></td>
		<td nowrap="nowrap" background="/images/menubgoff.gif">
			<a class="tab" onClick="highlightTree('/newview.html');" href="/newview.html">New Data View</a></td>
		<td nowrap="nowrap"><img src="/images/mensepoffon.gif" width="23" height="16" border="0"/></td>
		<td nowrap="nowrap" background="/images/menubgon.gif"><xsl:value-of select="/dv:view/@name"/></td>
		<td nowrap="nowrap"><img src="/images/menuendon.gif" width="21" height="16" border="0"/></td>
		<td nowrap="nowrap" width="100%" align="right" background="/images/menuendbg.gif"></td>
	</tr>
</table>
<!-- End tabs -->
<!-- Start tab background -->
<table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#002569">
	<tr>
		<td width="1"><img src="/images/border.gif" width="1" height="1" border="0"/></td>
		<td width="100%" bgcolor="#FFFFFF" style="padding: 10px;">
		
		<!-- Body starts here -->
		<br/><b>
		<font size="4"><xsl:apply-templates select="//view" /></font><br/>
		<font size="2"><xsl:value-of select="/dv:view/@description"/></font>
		</b><br/>

  <form name="frmupdate" id="frmupdate" method="POST">
  <input type="hidden" id="redirect" name="redirect"/>
  <input type="hidden" id="numtags" name="numtags">
    <xsl:attribute name="value"><xsl:number value="count(/dv:view/dv:tag)"/></xsl:attribute>
  </input>

	<table class="sortable" id="dataviewtable" width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr bgcolor="#BDC8DD" class="tablehead" height="24">
			<td align="left" style="padding-left: 10px;"><a href="#" class="sortheader" title="Click to sort by this column" onclick="ts_resortTable(this);return false;">Slot<span class="sortarrow">&#xA0;&#xA0;<img style="border: none;" src="/images/noarr.bmp"/></span></a></td>
			<td align="left"><a href="#" class="sortheader" title="Click to sort by this column" onclick="ts_resortTable(this);return false;">Tag Name<span class="sortarrow">&#xA0;&#xA0;<img style="border: none;" src="/images/noarr.bmp"/></span></a></td>
			<td align="left"><a href="#" class="sortheader" title="Click to sort by this column" onclick="ts_resortTable(this);return false;">Data Type<span class="sortarrow">&#xA0;&#xA0;<img style="border: none;" src="/images/noarr.bmp"/></span></a></td>
			<td align="left"><a href="#" class="sortheader" title="Click to sort by this column" onclick="ts_resortTable(this);return false;">Display<span class="sortarrow">&#xA0;&#xA0;<img style="border: none;" src="/images/noarr.bmp"/></span></a></td>
			<td align="left"><a href="#" class="sortheader" title="Click to sort by this column" onclick="ts_resortTable(this);return false;">Value<span class="sortarrow">&#xA0;&#xA0;<img style="border: none;" src="/images/noarr.bmp"/></span></a></td>
			<td align="left"><a href="#" class="sortheader" title="Click to sort by this column" onclick="ts_resortTable(this);return false;">Access<span class="sortarrow">&#xA0;&#xA0;<img style="border: none;" src="/images/noarr.bmp"/></span></a></td>
		</tr>
  
  <xsl:apply-templates select="/dv:view/dv:tag" />

  </table>

<!-- Insert a footer bar -->
	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr bgcolor="#BDC8DD" height="24"><td style="color: #BDC8DD;">.</td></tr>
	</table>

  <p align="center"><input type="submit" name="submit" id="submit" value="Update"/></p>

  </form>

		<!-- Do not modify below this point -->
		
		</td>
		<td width="1"><img src="/images/border.gif" width="1" height="1" border="0"/></td>
	</tr>
	<tr>
		<td colspan="">
		</td>
	</tr>
	
</table>
<br/>Copyright &#169; 2013 Rockwell Automation, Inc. All Rights Reserved.
<!-- End body background -->
</div>
</body>
</html>

</xsl:template>

<xsl:template match="/dv:view">
  <xsl:value-of select="@name" />
</xsl:template>

<xsl:template match="/dv:view/dv:tag">
  <tr height="26">
	<xsl:if test="position() mod 2 = '0'">
		<xsl:attribute name="bgcolor">#dedede</xsl:attribute>
	</xsl:if>
    <td style="padding-left: 10px;">
      <xsl:value-of select="substring-after(@path, $pathToLocalChassis)"/>
    </td>
    <td>
      <xsl:value-of select="@name"/>
    </td>
    <td>
      <xsl:choose>
         <xsl:when test="@valueType='cip:dt_BOOL'">
            BOOL
         </xsl:when>
         <xsl:when test="@valueType='cip:dt_SINT'">
            SINT
         </xsl:when>
         <xsl:when test="@valueType='cip:dt_INT'">
            INT
         </xsl:when>
         <xsl:when test="@valueType='cip:dt_DINT'">
            DINT
         </xsl:when>
         <xsl:when test="@valueType='cip:dt_REAL'">
            REAL
         </xsl:when>
         <xsl:when test="@valueType='cip:dt_STRINGI'">
            STRING
         </xsl:when>
      </xsl:choose>
    </td>
    <td>
      <xsl:value-of select="@display"/>
    </td>
    <td>
      <xsl:choose>
         <xsl:when test="dv:value/@xsi:type">
            <xsl:choose>
              <xsl:when test="@access='write' or @access='admin'">
		<xsl:attribute name="style">padding-top: 4px;</xsl:attribute>
                <input type="hidden">
                  <xsl:attribute name="name">t_<xsl:number/>_tagname</xsl:attribute>
                  <xsl:attribute name="id">t_<xsl:number/>_tagname</xsl:attribute>
                  <xsl:attribute name="value"><xsl:value-of select="@name" /></xsl:attribute>
                </input>
                <input type="hidden">
                  <xsl:attribute name="name">t_<xsl:number/>_slot</xsl:attribute>
                  <xsl:attribute name="id">t_<xsl:number/>_slot</xsl:attribute>
                  <xsl:attribute name="value"><xsl:value-of select="substring-after(@path, $pathToLocalChassis)" /></xsl:attribute>
                </input>
                <input type="hidden">
                  <xsl:attribute name="name">t_<xsl:number/>_type</xsl:attribute>
                  <xsl:attribute name="id">t_<xsl:number/>_type</xsl:attribute>
                  <xsl:attribute name="value"><xsl:value-of select="@valueType" /></xsl:attribute>
                </input>
                <input type="hidden">
                  <xsl:attribute name="name">t_<xsl:number/>_display</xsl:attribute>
                  <xsl:attribute name="id">t_<xsl:number/>_display</xsl:attribute>
                  <xsl:attribute name="value"><xsl:value-of select="@display" /></xsl:attribute>
                </input>
                <input type="hidden">
                  <xsl:attribute name="name">t_<xsl:number/>_changed</xsl:attribute>
                  <xsl:attribute name="id">t_<xsl:number/>_changed</xsl:attribute>
                  <xsl:attribute name="value">0</xsl:attribute>
                </input>
                <input type="text" maxlength="82" class="copy">
                  <xsl:attribute name="name">t_<xsl:number/>_value</xsl:attribute>
                  <xsl:attribute name="id">t_<xsl:number/>_value</xsl:attribute>
                  <xsl:attribute name="value">
                    <xsl:choose>
                      <xsl:when test="@display='Hexadecimal'">0x<xsl:call-template name="toHex"><xsl:with-param name="decimalNumber" select="dv:value" /><xsl:with-param name="datatype" select="dv:value/@xsi:type" /></xsl:call-template>
                      </xsl:when>
                      <xsl:when test="@display='Octal'">0<xsl:call-template name="toOctal"><xsl:with-param name="decimalNumber" select="dv:value" /><xsl:with-param name="datatype" select="dv:value/@xsi:type" /></xsl:call-template>
                      </xsl:when>
                      <xsl:when test="@display='Binary'">b<xsl:call-template name="toBinary"><xsl:with-param name="decimalNumber" select="dv:value" /><xsl:with-param name="datatype" select="dv:value/@xsi:type" /></xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise><xsl:value-of select="dv:value" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="onChange">document.getElementById("frmupdate").t_<xsl:number/>_changed.value="1";</xsl:attribute>
                </input>
              </xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                  <xsl:when test="@display='Hexadecimal'">
                    0x<xsl:call-template name="toHex">
                      <xsl:with-param name="decimalNumber" select="dv:value" />
                      <xsl:with-param name="datatype" select="dv:value/@xsi:type" />
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="@display='Octal'">
                    0<xsl:call-template name="toOctal">
                      <xsl:with-param name="decimalNumber" select="dv:value" />
                      <xsl:with-param name="datatype" select="dv:value/@xsi:type" />
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="@display='Binary'">
                    b<xsl:call-template name="toBinary">
                      <xsl:with-param name="decimalNumber" select="dv:value" />
                      <xsl:with-param name="datatype" select="dv:value/@xsi:type" />
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="dv:value" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@error">
            <b>Error:<xsl:value-of select="@error" /></b>
         </xsl:when>
         <xsl:otherwise>
            <b>Invalid document!</b>
         </xsl:otherwise>
       </xsl:choose>
    </td>
    <td>
      <xsl:choose><xsl:when test="@access='admin'">Admin<br/></xsl:when></xsl:choose>
      <xsl:choose><xsl:when test="@access='read'">Read only</xsl:when></xsl:choose>
      <xsl:choose><xsl:when test="@access='write'">Read/Write</xsl:when></xsl:choose>
    </td>
  </tr>
</xsl:template>

</xsl:stylesheet>
