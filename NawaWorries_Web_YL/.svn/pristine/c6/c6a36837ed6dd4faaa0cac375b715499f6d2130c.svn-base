<%@ page import="screen.stage.StageBtnItem" %>
<%@ page import="java.util.List" %>
<%--<%@ page import="com.fancyy.json.util.JSON" %>--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.StageInfoOp" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-8-11
  Time: 上午10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

//    String selectIndex=request.getParameter("selectIndex");
    List<StageBtnItem> stageBtnItemList = new ArrayList<StageBtnItem>();

    if(session.getAttribute("UserID")!=null){
//        String account = (String) session.getAttribute("UserID");
        if(session.getAttribute("_StageData")!=null){
            stageBtnItemList = StageInfoOp.getStageDataList().subList(0,(Integer.valueOf((String)session.getAttribute("_StageData"))));
        }
    }

    Integer stage_btn_index = (Integer.valueOf((String)session.getAttribute("_StageData")))-1;
//    if(session.getAttribute("stage_map_stage_btn_index")!=null){
//        stage_btn_index = (Integer) session.getAttribute("stage_map_stage_btn_index");
//    }

    if(request.getParameter("stage_btn_index")!=null){
        stage_btn_index = Integer.valueOf(request.getParameter("stage_btn_index"));
    }

    session.setAttribute("preScreen","stageMapScreen");

    List<StageBtnItem> showStageBtnItemList = new ArrayList<StageBtnItem>();
    for(int i=0; i<stageBtnItemList.size(); i++){
        if(stageBtnItemList.get(i).getStage_num()==stageBtnItemList.get(stage_btn_index).getStage_num()){
            showStageBtnItemList.add(stageBtnItemList.get(i));
        }
    }
    int selectIndex_max = stageBtnItemList.size()-1;
%>
<html>
<head>
<title></title>
<style type="text/css">

    #div11
    {
        position:absolute;
        z-index:1;
        left: 40px;
        top: 82px;
    }

    #div3
    {
        position:absolute;
        z-index:1;
        left: 40px;
        top: 212px;
    }

    #div4
    {
        position:absolute;
        z-index:1;
        left: 560px;
        top: 212px;
    }

    #div_generalbar_01_id
    {
        position:absolute;
        z-index:1;
        left: 40px;
        top: 460px;
    }

    #div_generalbar_03_id
    {
        position:absolute;
        z-index:1;
        left: 150px;
        top: 460px;
    }

    #div_generalbar_05_id
    {
        position:absolute;
        z-index:1;
        left: 420px;
        top: 460px;
    }

    #div_generalbar_07_id
    {
        position:absolute;
        z-index:1;
        left: 530px;
        top: 460px;
    }

</style>
<link href="Styles/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="include/The9.Web.Key.js"></script>
<script type="text/javascript" src="include/stageMapScreen/stageMapScreen.js"></script>
<script type="text/javascript">

var selectIndex = <%=stage_btn_index%>;
var selectIndex_max = <%=selectIndex_max%>;
var indexframe = 0;
var indexframe_mouse = 0;

var pressNum = 0;

var generalbar_selected_flag = false;
var generalbar_selected_index = 0;

//document.div_mouse_left_x = 100;
//document.div_mouse_top_y = 295;

Box.OK = "teamscreen.jsp";

//触发onkeypress事件
document.onkeypress = onKeyPress;

function run(){
//    selectIndex = selectIndex_max;
    arrow();
    mouse();
//    document.getElementById("test_div").innerHTML = "selectIndex:"+selectIndex;
    if(selectIndex == 0){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 100;
        document.getElementById("div_mouse_id").style.top = 295;
        document.div_mouse_left_x = 110;
        document.div_mouse_top_y = 285;
    }else if(selectIndex == 1){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 100;
        document.getElementById("div_mouse_id").style.top = 157;
        document.div_mouse_left_x = 110;
        document.div_mouse_top_y = 147;
    }else if(selectIndex == 2){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 202;
        document.getElementById("div_mouse_id").style.top = 230;
        document.div_mouse_left_x = 212;
        document.div_mouse_top_y = 220;
    }else if(selectIndex == 3){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 308;
        document.getElementById("div_mouse_id").style.top = 175;
        document.div_mouse_left_x = 318;
        document.div_mouse_top_y = 165;
    }else if(selectIndex == 4){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 402;
        document.getElementById("div_mouse_id").style.top = 285;
        document.div_mouse_left_x = 412;
        document.div_mouse_top_y = 275;
    }else if(selectIndex == 5){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 452;
        document.getElementById("div_mouse_id").style.top = 182;
        document.div_mouse_left_x = 462;
        document.div_mouse_top_y = 172;
    }

    if(selectIndex == 6){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 144;
        document.getElementById("div_mouse_id").style.top = 161;
        document.div_mouse_left_x = 154;
        document.div_mouse_top_y = 151;
    }else if(selectIndex == 7){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 145;
        document.getElementById("div_mouse_id").style.top = 285;
        document.div_mouse_left_x = 155;
        document.div_mouse_top_y = 275;
    }else if(selectIndex == 8){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 274;
        document.getElementById("div_mouse_id").style.top = 200;
        document.div_mouse_left_x = 284;
        document.div_mouse_top_y = 190;
    }else if(selectIndex == 9){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 397;
        document.getElementById("div_mouse_id").style.top = 133;
        document.div_mouse_left_x = 407;
        document.div_mouse_top_y = 123;
    }else if(selectIndex == 10){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 365;
        document.getElementById("div_mouse_id").style.top = 280;
        document.div_mouse_left_x = 375;
        document.div_mouse_top_y = 290;
    }else if(selectIndex == 11){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 474;
        document.getElementById("div_mouse_id").style.top = 230;
        document.div_mouse_left_x = 484;
        document.div_mouse_top_y = 220;
    }

    if(selectIndex == 12){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 100;
        document.getElementById("div_mouse_id").style.top = 263;
        document.div_mouse_left_x = 110;
        document.div_mouse_top_y = 253;
    }else if(selectIndex == 13){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 210;
        document.getElementById("div_mouse_id").style.top = 285;
        document.div_mouse_left_x = 220;
        document.div_mouse_top_y = 275;
    }else if(selectIndex == 14){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 127;
        document.getElementById("div_mouse_id").style.top = 123;
        document.div_mouse_left_x = 137;
        document.div_mouse_top_y = 113;
    }else if(selectIndex == 15){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 285;
        document.getElementById("div_mouse_id").style.top = 135;
        document.div_mouse_left_x = 295;
        document.div_mouse_top_y = 125;
    }else if(selectIndex == 16){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 350;
        document.getElementById("div_mouse_id").style.top = 235;
        document.div_mouse_left_x = 360;
        document.div_mouse_top_y = 225;
    }else if(selectIndex == 17){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 435;
        document.getElementById("div_mouse_id").style.top = 295;
        document.div_mouse_left_x = 445;
        document.div_mouse_top_y = 285;
    }else if(selectIndex == 18){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 472;
        document.getElementById("div_mouse_id").style.top = 127;
        document.div_mouse_left_x = 482;
        document.div_mouse_top_y = 117;
    }

    if(selectIndex == 19){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 82;
        document.getElementById("div_mouse_id").style.top = 128;
        document.div_mouse_left_x = 92;
        document.div_mouse_top_y = 118;
    }else if(selectIndex == 20){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 87;
        document.getElementById("div_mouse_id").style.top = 242;
        document.div_mouse_left_x = 97;
        document.div_mouse_top_y = 232;
    }else if(selectIndex == 21){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 179;
        document.getElementById("div_mouse_id").style.top = 287;
        document.div_mouse_left_x = 189;
        document.div_mouse_top_y = 277;
    }else if(selectIndex == 22){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 290;
        document.getElementById("div_mouse_id").style.top = 242;
        document.div_mouse_left_x = 300;
        document.div_mouse_top_y = 232;
    }else if(selectIndex == 23){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 258;
        document.getElementById("div_mouse_id").style.top = 103;
        document.div_mouse_left_x = 268;
        document.div_mouse_top_y = 93;
    }else if(selectIndex == 24){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 405;
        document.getElementById("div_mouse_id").style.top = 125;
        document.div_mouse_left_x = 415;
        document.div_mouse_top_y = 115;
    }else if(selectIndex == 25){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 492;
        document.getElementById("div_mouse_id").style.top = 205;
        document.div_mouse_left_x = 502;
        document.div_mouse_top_y = 195;
    }else if(selectIndex == 26){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 414;
        document.getElementById("div_mouse_id").style.top = 302;
        document.div_mouse_left_x = 424;
        document.div_mouse_top_y = 292;
    }

    if(selectIndex == 27){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 87;
//        document.getElementById("div2").style.top = 222;
        document.div_mouse_left_x = 97;
        document.div_mouse_top_y = 212;
    }else if(selectIndex == 28){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 172;
//        document.getElementById("div2").style.top = 107;
        document.div_mouse_left_x = 182;
        document.div_mouse_top_y = 97;
    }else if(selectIndex == 29){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 330;
//        document.getElementById("div2").style.top = 126;
        document.div_mouse_left_x = 340;
        document.div_mouse_top_y = 116;
    }else if(selectIndex == 30){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 427;
//        document.getElementById("div2").style.top = 171;
        document.div_mouse_left_x = 437;
        document.div_mouse_top_y = 161;
    }else if(selectIndex == 31){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 230;
//        document.getElementById("div2").style.top = 242;
        document.div_mouse_left_x = 240;
        document.div_mouse_top_y = 232;
    }else if(selectIndex == 32){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 325;
//        document.getElementById("div2").style.top = 275;
        document.div_mouse_left_x = 335;
        document.div_mouse_top_y = 265;
    }else if(selectIndex == 33){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 470;
//        document.getElementById("div2").style.top = 265;
        document.div_mouse_left_x = 480;
        document.div_mouse_top_y = 255;
    }

    if(selectIndex == 34){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 165;
//        document.getElementById("div2").style.top = 115;
        document.div_mouse_left_x = 175;
        document.div_mouse_top_y = 105;
    }else if(selectIndex == 35){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 80;
//        document.getElementById("div2").style.top = 210;
        document.div_mouse_left_x = 90;
        document.div_mouse_top_y = 200;
    }else if(selectIndex == 36){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 168;
//        document.getElementById("div2").style.top = 305;
        document.div_mouse_left_x = 158;
        document.div_mouse_top_y = 295;
    }else if(selectIndex == 37){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 272;
//        document.getElementById("div2").style.top = 195;
        document.div_mouse_left_x = 282;
        document.div_mouse_top_y = 185;
    }else if(selectIndex == 38){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 402;
//        document.getElementById("div2").style.top = 141;
        document.div_mouse_left_x = 412;
        document.div_mouse_top_y = 131;
    }else if(selectIndex == 39){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 430;
//        document.getElementById("div2").style.top = 280;
        document.div_mouse_left_x = 440;
        document.div_mouse_top_y = 270;
    }else if(selectIndex == 40){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 495;
//        document.getElementById("div2").style.top = 195;
        document.div_mouse_left_x = 505;
        document.div_mouse_top_y = 185;
    }
}


function mouse(){
    indexframe_mouse ++;
    indexframe_mouse  = (indexframe_mouse+5)%5;
    document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x-indexframe_mouse;
    document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y+indexframe_mouse;

    setTimeout("mouse()",150);
}

function arrow(){
    indexframe ++ ;
    indexframe = (indexframe+5)%5;

    document.getElementById("div3").style.left = 40-indexframe;
    document.getElementById("div4").style.left = 560+indexframe;

    setTimeout("arrow()",150);
}

var url = "<%=host%>/HttpService/StageToTeam.ashx?selectIndex=";
var stage2stage_url = "<%=host%>/HttpService/Stage2StageAction.ashx";

function onKeyPress(){

    var evt = window.event;
    var keyCode = evt.which ? evt.which : evt.keyCode;

    if(keyCode == ZTE.UP
            || keyCode == HW.UP
            || keyCode == UT.UP) {
        select_generalbar_element_initial();
        generalbar_selected_flag = false;
    }else if(keyCode == ZTE.DOWN
            || keyCode == HW.DOWN
            || keyCode == UT.DOWN){
        generalbar_selected_flag = true;
    }

    if(!generalbar_selected_flag){
        if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
            url = url+ selectIndex;

            xmlhttp = MakeHttpRequest();
            xmlhttp.open("Post", url, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].id == 0){
                        window.location.href = "teamscreen.jsp?select_Index=0";
                    }else{

                    }
                }
            }
        }else{
            select_stage(keyCode);
        }
    }else{
        if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
            if(generalbar_selected_index == 0){
                window.location.href = "armorbasescreen.jsp";
            }else if(generalbar_selected_index == 1){
                window.location.href = "backpackscreen.jsp";
            }else if(generalbar_selected_index == 2){
                window.location.href = "taskscreen.jsp";
            }else if(generalbar_selected_index == 3){
                window.location.href = "jigsawscreen.jsp";
            }
        }else{
            select_generalbar_element(keyCode);
        }
    }

}

</script>
</head>
<body onload="run()" style="background-Repeat:no-repeat" width="640" height="530">
<div id="div1" style='position: absolute;'>
    <img id="id00" src="stage/mapfloor.jpg" />
</div>

<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 380px;color: #fe8464;">

</div>

<div id="div_command" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 280px;color: #fe8464;">
            按左右键选择关卡
</div>

<div id="div11" style='position: absolute;'>
    <img id="id11" src="stage/map1/map-1_03.jpg" />
    <div id="div2_stage_name_id" style="position: absolute; left: 40px;top: -10px;" >
        <img id="div2_img_stage_name_id" src="stage/1(2).png"/>
    </div>
</div>

<%for(int i=0; i<showStageBtnItemList.size(); i++){%>
<div id="div_stage_btn_item_id" style='position: absolute;z-index: 1; left: <%=showStageBtnItemList.get(i).getLeft_x()%>px; top:<%=showStageBtnItemList.get(i).getLeft_y()%>px;'>
    <img id="img_stage_btn_item_id" src="<%=showStageBtnItemList.get(i).getItem_img_path()%>" />
</div>
<%}%>

<div id="div_mouse_id" style="position: absolute;z-index: 3;left: 100px;top: 295px;">
    <img id="img_mouse_id" src="stage/mouse.png">
</div>

<div id="div3" style='position: absolute;'>
    <img id="id_left" src="stage/left.png" />
</div>

<div id="div4" style='position: absolute;'>
    <img id="id_right" src="stage/right.png" />
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

</body>
</html>