<%@ page import="beans.EquipMaxIndexBean" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-8-15
  Time: 上午11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String preScreen = "";

    if(request.getParameter("preScreen")!=null){
        preScreen =  request.getParameter("preScreen");
    }

    EquipMaxIndexBean equipMaxIndexBean = (EquipMaxIndexBean) session.getAttribute("_EquipMaxIndex");

    session.getAttribute("armorbase_hero_index");
%>
<html>
<head>
    <title></title>

    <link href="Styles/taskscreen/taskscreen.css" rel="stylesheet" type="text/css" />
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript">

        var selectIndex_y = 0;

        //触发onkeypress事件
        document.onkeypress = onKeyPress;

        //按0,back键返回
        function onKeyPress(){
            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                    ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                <%if(preScreen.equals("mainscreen")){%>
                    window.location.href = "main.jsp";
                <%}else { %>
                    window.location.href = "stageMapScreen.jsp";
                <%}%>
            }

            <jsp:include page="topuphtmls/taskscreen/trantion_ok.jsp"/>

            /**在弹出时selectIndex_x参数已经响应上下左右的按键*/
            <jsp:include page="topuphtmls/common/up_down_key.jsp">
                <jsp:param name="length_y" value="6"/>
            </jsp:include>

            <jsp:include page="topuphtmls/taskscreen/button_change.jsp"/>

        }

        function transitdd(){
            window.location.href = "taskscreen.jsp?preScreen=mainscreen";
        }
    </script>

</head>
<body style="background-Repeat:no-repeat" width="640" height="530">
    <div id="div1" style='position: absolute;'>
        <img id="id01" src="task/achievement.jpg" />
    </div>

    <div id="div2" style='position: absolute;'>
        <img id="id02" src="task/tiao.png" />
        <div id="div2_achieve" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 10px; left: 80px;color: #221eff;">
            飞影侠获得了<%=equipMaxIndexBean.getEquipMaxIndex(1)%>个装备
        </div>
    </div>

    <div id="div3" style='position: absolute;'>
        <img id="id03" src="task/button.png" />
    </div>

    <%--**************--%>
    <div id="div4" style='position: absolute;'>
        <img id="id04" src="task/tiao.png" />
        <div id="div4_achieve" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 10px; left: 80px;color: #221eff;">
            刑天侠获得了<%=equipMaxIndexBean.getEquipMaxIndex(2)%>个装备
        </div>
    </div>

    <div id="div5" style='position: absolute;'>
        <img id="id05" src="task/button2.png" />
    </div>

    <%--**************--%>
    <div id="div6" style='position: absolute;'>
        <img id="id06" src="task/tiao.png" />
        <div id="div6_achieve" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 10px; left: 80px;color: #221eff;">
            金刚侠获得了<%=equipMaxIndexBean.getEquipMaxIndex(3)%>个装备
        </div>
    </div>

    <div id="div7" style='position: absolute;'>
        <img id="id07" src="task/button2.png" />
    </div>

    <%--**************--%>
    <div id="div8" style='position: absolute;'>
        <img id="id08" src="task/tiao.png" />
        <div id="div8_achieve" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 10px; left: 80px;color: #221eff;">
            超级飞影侠获得了<%=equipMaxIndexBean.getEquipMaxIndex(4)%>个装备
        </div>
    </div>

    <div id="div9" style='position: absolute;'>
        <img id="id09" src="task/button2.png" />
    </div>

    <%--**************--%>
    <div id="div10" style='position: absolute;'>
        <img id="id010" src="task/tiao.png" />
        <div id="div10_achieve" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 10px; left: 80px;color: #221eff;">
            超级刑天获得了<%=equipMaxIndexBean.getEquipMaxIndex(5)%>个装备
        </div>
    </div>

    <div id="div11" style='position: absolute;'>
        <img id="id011" src="task/button2.png" />
    </div>

    <%--**************--%>
    <div id="div12" style='position: absolute;'>
        <img id="id012" src="task/tiao.png" />
        <div id="div12_achieve" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 10px; left: 80px;color: #221eff;">
            超级金刚获得了<%=equipMaxIndexBean.getEquipMaxIndex(6)%> 个装备
        </div>
    </div>

    <div id="div13" style='position: absolute;'>
        <img id="id013" src="task/button2.png" />
    </div>

    <jsp:include page="topuphtmls/the9input/topup.jsp"></jsp:include>

    <a>
        <img id="NewStory1" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory2" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory3" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory4" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory5" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory6" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory7" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory8" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory9" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory10" src="touming.png" width="194" height="65" />
    </a>

    <a>
        <img id="NewStory11" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory12" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory13" src="touming.png" width="194" height="65" />
    </a>
</body>
</html>