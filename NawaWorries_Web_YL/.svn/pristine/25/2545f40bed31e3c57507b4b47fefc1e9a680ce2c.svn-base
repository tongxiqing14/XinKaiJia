<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-8-20
  Time: 下午3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>
<html>
<head>
    <title></title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="Styles/stageMapScreen/stageMapScreen.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        #div_select_jigsaw_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 0px;
            top: 0px;
        }

        #div_generalbar_01_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 40px;
            top: 460px;
        }

        #div_generalbar_03_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 150px;
            top: 460px;
        }

        #div_generalbar_05_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 420px;
            top: 460px;
        }

        #div_generalbar_07_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 530px;
            top: 460px;
        }

    </style>
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript">
        var selectIndex = 0;

        var selectIndex_x = 0;
        var selectIndex_y = 0;

        var generalbar_selected_flag = false;

        //触发onkeypress事件
        document.onkeypress = onKeyPress;

        function onKeyPress(){
            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            <jsp:include page="topuphtmls/common/zero_back.jsp"/>

            <jsp:include page="topuphtmls/jigsaw/select_up_down.jsp"/>

            if(!generalbar_selected_flag){
                /**普通按OK键*/
                <jsp:include page="topuphtmls/jigsaw/jigsaw_ok.jsp"/>

                /**selectIndex_x参数已经响应上下左右的按键*/
                <jsp:include page="topuphtmls/shoproom/topup_up_down_left_right.jsp">
                    <jsp:param name="length_x" value="8"/>
                </jsp:include>

                var x = (selectIndex_x+4)%4;
                var y = selectIndex_y;

                var left = 50+x*136;
                var top = 90+y*157;

                document.getElementById("div_select_rect_id").style.left = left+'px';
                document.getElementById("div_select_rect_id").style.top = top+'px';

            }else{
                /**generalbar按OK键*/
                <jsp:include page="topuphtmls/common/generalbar_ok.jsp"/>

                /**selectIndex_x参数已经响应上下左右的按键*/
                <jsp:include page="topuphtmls/shoproom/topup_up_down_left_right.jsp">
                    <jsp:param name="length_x" value="4"/>
                </jsp:include>

                <jsp:include page="topuphtmls/common/generalbar.jsp"/>
            }

        }
    </script>
</head>
<body>
    <div id="div_select_jigsaw_id" style='position: absolute;'>
        <img id="img_select_jigsaw_id" src="jigsaw/select_jigsaw1.jpg" />
    </div>

    <div id="div_title_01_id" style='position: absolute;'>
        <img id="img_title_01_id" src="jigsaw/1.png" />
    </div>

    <div id="div_title_02_id" style='position: absolute;'>
        <img id="img_title_02_id" src="jigsaw/2.png" />
    </div>

    <div id="div_title_03_id" style='position: absolute;'>
        <img id="img_title_03_id" src="jigsaw/3.png" />
    </div>

    <div id="div_title_04_id" style='position: absolute;'>
        <img id="img_title_04_id" src="jigsaw/4.png" />
    </div>

    <div id="div_title_05_id" style='position: absolute;'>
        <img id="img_title_05_id" src="jigsaw/5.png" />
    </div>

    <div id="div_title_06_id" style='position: absolute;'>
        <img id="img_title_06_id" src="jigsaw/6.png" />
    </div>

    <div id="div_title_07_id" style='position: absolute;'>
        <img id="img_title_07_id" src="jigsaw/7.png" />
    </div>

    <div id="div_title_08_id" style='position: absolute;'>
        <img id="img_title_08_id" src="jigsaw/8.png" />
    </div>

    <div id="div_generalbar_01_id" style='position: absolute;'>
        <img id="img_generalbar_01_id" src="generalbar/generalbar_grey_01.png" />
    </div>

    <div id="div_generalbar_03_id" style='position: absolute;'>
        <img id="img_generalbar_03_id" src="generalbar/generalbar_grey_03.png" />
    </div>

    <div id="div_generalbar_05_id" style='position: absolute;'>
        <img id="img_generalbar_05_id" src="generalbar/generalbar_grey_05.png" />
    </div>

    <div id="div_generalbar_07_id" style='position: absolute;'>
        <img id="img_generalbar_07_id" src="generalbar/generalbar_grey_07.png" />
    </div>

    <div id="div_select_rect_id" style='position: absolute;z-index: 1;left: 50px; top: 90px;'>
        <img id="img_select_rect_id" src="jigsaw/select1.png" />
    </div>
</body>
</html>