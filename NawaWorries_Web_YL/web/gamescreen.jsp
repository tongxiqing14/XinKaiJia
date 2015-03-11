<%@ page import="elements.EnemyTeam" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fancyy.json.util.JSON" %>
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

    String ServerURL = application.getInitParameter("ServerURL");
    String UserID = (String)session.getAttribute("UserID");
    String UserPassword = "1";
    String adAccount = (String)session.getAttribute("adAccount");
    String NickName = "1";
    String IconAddr = "1";
    String ProductID = (String)session.getAttribute("ProductID");
    String ReturnURL = (String)session.getAttribute("ReturnURL");
    String UserToken = (String)session.getAttribute("UserToken");
    String IsAutoTopUp = application.getInitParameter("IsAutoTopUp");
    String IsActiveOnOK = application.getInitParameter("IsActiveOnOK");
    String ImageURL = application.getInitParameter("ImageURL");

    String[] jadNames = {"CP901001/FishFeiFei.jad","CP901001/XinKaiJia2.jad"};
    String[] jarNames = {"CP901001/FishFeiFei.jar","CP901001/XinKaiJia2.jar"};


    if(UserID==null||UserID.equals("")){
        //response.sendRedirect(ReturnURL);
        UserID = (String)session.getAttribute("UserID");
        UserPassword = (String)session.getAttribute("UserPassword");
        adAccount = (String)session.getAttribute("adAccount");
        NickName = (String)session.getAttribute("NickName");
        IconAddr = (String)session.getAttribute("IconAddr");
        ProductID = (String)session.getAttribute("ProductID");
        ReturnURL = (String)session.getAttribute("ReturnURL");
        UserToken = (String)session.getAttribute("UserToken");
    }else{
        session.setAttribute("UserID",UserID);
        session.setAttribute("UserPassword",UserPassword);
        session.setAttribute("adAccount",adAccount);
        session.setAttribute("NickName",NickName);
        session.setAttribute("IconAddr",IconAddr);
        session.setAttribute("ProductID",ProductID);
        session.setAttribute("ReturnURL",ReturnURL);
        session.setAttribute("UserToken",UserToken);
    }

    /**获取敌方成员*/
    List<EnemyTeam> enemyTeamList = new ArrayList<EnemyTeam>();

    if(session.getAttribute("enemy_team")!=null){
        enemyTeamList = (List<EnemyTeam>) JSON.toObject((String) session.getAttribute("enemy_team"), EnemyTeam.class);
    }

    double sum_enemy_hp_num = 0;

    for(int h = 0; h < enemyTeamList.size(); h++){
        sum_enemy_hp_num = enemyTeamList.get(h).getHpNumber();
    }

    String enemyTeamStr = (String) session.getAttribute("enemy_team");

    Integer selected_stage= Integer.valueOf((String) session.getAttribute("selected_stage"));

%>

<html>
<head>


</head>

<!--script language="javascript">
 	window.document.onkeypress = function(keyEvent) 
	{
		keyEvent = keyEvent ? keyEvent : window.event;
		var keyvalue = keyEvent.which ? keyEvent.which : keyEvent.keyCode;
		
		if( keyvalue == 0x0300 )
		{
			document.write("���������ֵ�¼�");
		}
	}
 	
</script-->

<script language="javascript1.3">
    function PageScroll(evt)
    {
    evt = evt ? evt : window.event;
    var keyCode = evt.which ? evt.which : evt.keyCode;

    window.location.href = "teamscreen.jsp?select_Index=0";

    }
    setTimeout("document.onkeypress = PageScroll",4000);
</script>

<%--<script type="text/javascript">--%>
    <%----%>
    <%--function on_load(){--%>
         <%--if--%>
    <%--}--%>
    <%----%>

<%--</script>--%>

<body onload="on_load()"  style="background-color:#000000">



<img id="loading" src="images/loading.png" style="position:absolute; left:0px; top:0px; z-index:1"/>

<%--<div id="test_div4" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 145px; left: 80px;color: #ffffff;"><%=enemyTeamStr%></div>--%>

<div style="position:absolute; left:0px; top:0px; width:640px; height:526px; z-index:1">
    <!--<object id="j2meapp" classid="clsid:72E6F181-D1B0-4C22-B0D7-4A0740EEAEF5" width="640" height="530">-->
    <object id="j2meapp" classid="ipanel:j2me-midp2" width="640" height="530">
        <param name="-Xkeypass" value="true" />
        <param name="bgcolor" value="#000000" />
        <param name="jad" value="<%=jadNames[selected_stage]%>" />
        <param name="jar" value="<%=jarNames[selected_stage]%>" />
        <param name="J2MEVersion" value=" MIDP 2.0,CLDC 1.1" />
        <param name="ServerURL" value="<%=ServerURL%>" />
        <param name="Account" value="<%=UserID%>" />
        <param name="ADAccount" value="<%=adAccount%>" />
        <param name="GameID" value="<%=ProductID%>" />
        <param name="UserToken" value="<%=UserToken%>" />
        <param name="IsAutoTopUp" value="<%=IsAutoTopUp%>" />
        <param name="IsActiveOnOK" value="<%=IsActiveOnOK%>" />
        <param name="ImageURL" value="<%=ImageURL%>" />
        <param name="enemyTeamStr" value="<%=sum_enemy_hp_num%>" />
        <param name="sessionId" value="<%=session.getId()%>" />
        <param name="game_info_url" value="<%=host%>/HttpService/GameInfoServlet.ashx" />
        <param name="return_url" value="<%=host%>" />
    </object>
</div>
</body>
</html>
