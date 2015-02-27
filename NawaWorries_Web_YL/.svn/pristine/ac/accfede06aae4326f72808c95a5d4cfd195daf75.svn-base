<%@ page import="iptvNet.NetHander" %>
<%@ page import="common.NetInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-9-23
  Time: 下午8:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    NetHander netHander = new NetHander(application.getInitParameter("ServerURL"), (String) session.getAttribute("UserID"), (String) session.getAttribute("ProductID"), (String) session.getAttribute("adAccount"), (String) session.getAttribute("UserToken"));
    NetInfo netInfo = new NetInfo();
    netInfo.setNetHander(netHander);

    int myScore = netInfo.getMyScore(0);
    int myRank = netInfo.getMyRank__(0);
    String nickname = netInfo.getNickName();
    String[][] scoreList = netInfo.getScoreList__(0,10);
%>
<html>
<head>
    <title></title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript">
        //触发onkeypress事件
        document.onkeypress = onKeyPress;

        function onKeyPress(){
            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                    ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                window.location.href = "main.jsp";
            }
        }
    </script>
</head>
<body >
    <div id="div_bg_id" style="position: absolute;left: 0px;top: 0px;">
        <img src="main/ranking.jpg"/>
    </div>

    <%--<div id="div_mm_id" style="position: absolute;left: 450px;top: 180px;">--%>
        <%--<img src="main/mm.png"/>--%>
    <%--</div>--%>

    <div id="div_id_id" style="color: #ffea38;font-size:16px;font-weight: bold;position: absolute;left: 100px;top: 80px;">
        排名
    </div>

    <div id="div_nick_name_id" style="color: #ffea38;font-size:16px;font-weight: bold;position: absolute;left: 200px;top: 80px;">
        名称
    </div>

    <div id="div_score_id" style="color: #ffea38;font-size:16px;font-weight: bold;position: absolute;left: 400px;top: 80px;">
        积分
    </div>

    <%for (int i =0; i<scoreList.length; i++){

        int top_y=100;

        switch (i){
            case 0:
                top_y=100;
                break;
            case 1:
                top_y=126;
                break;
            case 2:
                top_y=152;
                break;
            case 3:
                top_y=178;
                break;
            case 4:
                top_y=204;
                break;
            case 5:
                top_y=230;
                break;
            case 6:
                top_y=256;
                break;
            case 7:
                top_y=282;
                break;
            case 8:
                top_y=308;
                break;
            case 9:
                top_y=334;
                break;
        }

    %>
        <div id="div_id_id<%=(i+1)%>" style="color: #fdfdfe;font-size:16px;font-weight: bold;position: absolute;left: 100px;top: <%=top_y%>px;">
            <%=(i+1)%>
        </div>

        <div id="div_nick_name_id<%=(i+1)%>" style="color: #fdfdfe;font-size:16px;font-weight: bold;position: absolute;left: 200px;top: <%=top_y%>px;">
            <%=scoreList[i][0]%>
        </div>

        <div id="div_score_id<%=(i+1)%>" style="color: #fdfdfe;font-size:16px;font-weight: bold;position: absolute;left: 400px;top: <%=top_y%>px;">
            <%=scoreList[i][1]%>
        </div>
    <%}%>

    <div id="div_id_id" style="color: #ffea38;font-size:16px;font-weight: bold;position: absolute;left: 100px;top: 400px;">
        我的排名
    </div>

    <div id="div_nick_name_id" style="color: #ffea38;font-size:16px;font-weight: bold;position: absolute;left: 200px;top: 400px;">
        我的名称
    </div>

    <div id="div_score_id" style="color: #ffea38;font-size:16px;font-weight: bold;position: absolute;left: 400px;top: 400px;">
        我的积分
    </div>

    <div id="div_myRank_id" style="color: #fdfdfe;font-size:16px;font-weight: bold;position: absolute;left: 100px;top:420px;">
        <%=myRank%>
    </div>

    <div id="div_my_nick_name_id" style="color: #fdfdfe;font-size:16px;font-weight: bold;position: absolute;left: 200px;top: 420px;">
        <%=nickname%>
    </div>

    <div id="div_myScore_id" style="color: #fdfdfe;font-size:16px;font-weight: bold;position: absolute;left: 400px;top: 420px;">
        <%=myScore%>
    </div>
</body>
</html>