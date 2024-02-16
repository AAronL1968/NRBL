<html>
<head>
 <meta http-equiv="refresh" content="60" />
 <title>NRBL Draft</title>
   <SCRIPT LANGUAGE="JavaScript">  
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
   </SCRIPT>
<style type="text/css">
<!--
.style2 {
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #0A4C7C;
}
.style3 {
	font-size: 14px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #0A4C7C;
}
.style4 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #0A4C7C;
}
.style5 {font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #094c7a; }
.style6 {
	font-size: 8px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FFFFFF;
}
.style7 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FFFFFF;
}
.style8 {color: #FFFF00}
.style12 {font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF; }
.style14 {font-size: 15px; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF; }
-->
</style>
</head>
<body>
<%
    iOwnerID = request("oid")
    if iOwnerID = "" then
        iOwnerID = clng(11)
    end if
    if not isnumeric(iOwnerID) then
        iOwnerID = clng(11)
    end if
    
    SQLQuery = "get_NRBL_info_by_owner_id @owner_id = " & iOwnerID
    Set OBJdbConnection = Server.CreateObject("ADODB.Connection")
    OBJdbConnection.Open "AAron", "NRBL", "Redlegs4L!fe"
    set curs = OBJdbConnection.execute(SQLQuery)          
    strOwnerFull = curs("NRBL_team")
    iCurOwnerID = curs("owner_id")
	curs.close
    OBJdbConnection.close          
    
%>
    <table border="0">
      <tr>
        <td colspan="5" bgcolor="#0A4C7C" align="left" valign="top" nowrap>
          <span class="style12">NRBL Auction Results</span>
        </td>
      </tr>
      <tr>
        <td colspan="5" bgcolor="#0A4C7C" align="left" valign="top" nowrap>
          <span class="style2">
            <select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
          <%
                SQLQuery = "NRBL_owner_selector " & iCurOwnerID
                Set OBJdbConnection = Server.CreateObject("ADODB.Connection")
                OBJdbConnection.Open "AAron", "NRBL", "Redlegs4L!fe"
                set curs = OBJdbConnection.execute(SQLQuery)    
                do while not curs.eof
                    iSelected = clng(curs("selected"))
                    if iSelected = 0 then
                        strSelected = " "
                    else
                        strSelected = " selected "                    
                    end if
                    strOpt = "<option " & strSelected & " value=" & """" & "draft_results_by_team.asp?oid=" & curs("owner_id") & """" & ">" & curs("NRBL_team") & "</option>"
                    response.Write strOpt
                    curs.movenext
                loop                
          %>
            </select>
          <%
            curs.close
            OBJdbConnection.Close
          %>       
          </span>
        </td>
      </tr>
      <tr>
        <td bgcolor="#0A4C7C" align="center" valign="top" nowrap>
          <span class="style12">
            Pos
          </span>
        </td>
        <td bgcolor="#0A4C7C" align="center" valign="top" nowrap>
          <span class="style12">
            Name
          </span>
        </td>
        <td bgcolor="#0A4C7C" align="center" valign="top" nowrap>
          <span class="style12">
            NL
          </span>
        </td>
        <td bgcolor="#0A4C7C" align="center" valign="top" nowrap>
          <span class="style12">
            Cont
          </span>
        </td>
        <td bgcolor="#0A4C7C" align="center" valign="top" nowrap>
          <span class="style12">
            Sal
          </span>
        </td>
      </tr>
<%  
    SQLQuery = "get_NRBL_team_position_slots @owner_id = " & iCurOwnerID
    Set OBJdbConnection = Server.CreateObject("ADODB.Connection")
    OBJdbConnection.Open "AAron", "NRBL", "Redlegs4L!fe"
    set curs = OBJdbConnection.execute(SQLQuery)
           ' payroll,
       ' rostered_ct,
       ' draft_budget,
       ' players_needed,
       ' budget_per_player,
       ' max_bid_amt
    curPayroll = curs("payroll")
    curBudget = curs("draft_budget")
    iPlayersNeeded = curs("players_needed")
    curBudgetPerPlayer = curs("budget_per_player")
    curMaxBid = curs("max_bid_amt")
    do while not curs.eof
        strStatus = curs("Status")
        strBG = "#ffffff"
        if strStatus = "Drafted" then
            strBG = "yellow"
        end if
        if curs("Player") = "&nbsp;" then
            strBG = "pink"
        end if
%>

      <tr>
        <td bgcolor="<% =strBG %>" align="left" valign="top" nowrap>
          <span class="style2">
            <% =curs("position") %>
          </span>
        </td>
        <td bgcolor="<% =strBG %>" align="left" valign="top" nowrap>
          <span class="style2">
            <% =curs("Player") %>
          </span>
        </td>
        <td bgcolor="<% =strBG %>" align="left" valign="top" nowrap>
          <span class="style2">
            <% =curs("NL") %>
          </span>
        </td>
        <td bgcolor="<% =strBG %>" align="left" valign="top" nowrap>
          <span class="style2">
            <% =curs("Contract") %>
          </span>
        </td>
        <td bgcolor="<% =strBG %>" align="right" valign="top" nowrap>
          <span class="style2">
            <% =curs("Sal") %>
          </span>
        </td>
      </tr>
<%
        curs.movenext
    loop
	curs.close
    OBJdbConnection.close          
    
%>            

    </table>
    <table border="1">
      <tr>
        <td bgcolor="#0A4C7C" align="center" valign="top" nowrap>
          <span class="style12">
            Budget
          </span>
        </td>
        <td bgcolor="#0A4C7C" align="center" valign="top" nowrap>
          <span class="style12">
            Players Needed
          </span>
        </td>
        <td bgcolor="#0A4C7C" align="center" valign="top" nowrap>
          <span class="style12">
            Max Bid
          </span>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top" nowrap>
          <span class="style2">
            <% =formatcurrency(curBudget, 0) %>
          </span>
        </td>
        <td align="right" valign="top" nowrap>
          <span class="style2">
            <% =iPlayersNeeded %>
          </span>
        </td>
        <td align="right" valign="top" nowrap>
          <span class="style2">
            <% =formatcurrency(curMaxBid, 0) %>
          </span>
        </td>
      </tr>
    </table>    
</body>
</html>

