<%@ page import="java.util.List" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="java.util.Properties" %>
<%@ page import="beans.FighterItemBean" %>
<%@ page import="beans.FighterBean" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-8-18
  Time: 下午9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

    PropertiesOp propertiesOp = new PropertiesOp();
    Properties properties2 = propertiesOp.load("/heroname.properties");
    Properties properties = propertiesOp.load("/titleimgpath.properties");
    Properties properties1 = propertiesOp.load("/titleitemimg.properties");

    Integer selectIndex_x = 0;
    if(session.getAttribute("backpack_selectIndex_x")!=null){
        selectIndex_x = Integer.valueOf((String) session.getAttribute("backpack_selectIndex_x"));
    }

    Integer selectIndex_y = 0;
    if(session.getAttribute("backpack_selectIndex_y")!=null){
        selectIndex_y = Integer.valueOf((String) session.getAttribute("backpack_selectIndex_y"));
    }

    String preScreen = "";

    if(request.getParameter("preScreen")!=null){
        preScreen =  request.getParameter("preScreen");
    }

    List<FighterItemBean> monsterList;
    List<FighterBean> monsterList_in_heroList;
    Integer hero_human_pet_flag;

    if(selectIndex_x<3){
        hero_human_pet_flag = 1;
        /**获取 monster list*/
        monsterList = (List<FighterItemBean>) session.getAttribute("_MonsterData");
        /**筛选 hero list中的monster list*/
        monsterList_in_heroList = ((List<FighterBean>) session.getAttribute("_FighterData")).subList(7,19);
    }else {
        hero_human_pet_flag = 2;
        /**获取 pet list*/
        monsterList = (List<FighterItemBean>) session.getAttribute("_PetData");
        /**筛选 hero list中的pet list*/
        monsterList_in_heroList = ((List<FighterBean>) session.getAttribute("_FighterData")).subList(19,28);
    }

    Integer hero_human_pet_index = (selectIndex_x+3)%3+selectIndex_y*3;

    String[] animation_img_array = new String[]{"king_left_monster_Img","green_left_monster_Img","atack_left_Img","blue_left_monster_Img","gun_left_king_Img","yellow_left_king_Img","blue_left_bear_Img","red_left_wolf_Img","blue2_left_monster_Img","hammer_left_Img","white_left_wolf_Img","renwu_left_Img"};
    String[] animation_img_array1 = new String[]{"left_horseImg","left_frogfishImg","left_clownImg","left_rabbitImg","left_batImg","left_tigerImg","left_birdImg","left_mouseImg","left_tortoiseImg"};
    String[] shen_array = new String[]{"armorbase/shen.png", "armorbase/shen1.png"};
    String[] buy_array = new String[]{"armorbase/buy.png", "armorbase/buy1.png"};

    /**取出价格的json数据*/
    String propname00 = "/follow_consume/consume_info.properties";
    PropertiesOp propertiesOp0 = new PropertiesOp();
    Properties properties0 = propertiesOp0.load(propname00);
    String buy_prices = properties0.getProperty("buy_prices");

    String IsButtonOnOK = application.getInitParameter("IsButtonOnOK");        /**设置初始选中是否为OK按钮*/
    Integer button_index;

    if(IsButtonOnOK.equals("true")){
        button_index = 0;
    }else {
        button_index = 1;
    }
%>
<html>
<head>
    <title></title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <link href="Styles/armorbasescreen/armorbasescreen.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript" src="include/stageMapScreen/stageMapScreen.js"></script>
    <script type="text/javascript" src="include/gamescreen.js"></script>
    <script type="text/javascript">

        var price_json__$$ = <%=buy_prices%>;   /**js 解析json数据*/

        //触发onkeypress事件
        document.onkeypress = onKeyPress;
        document.consume_step = 0;
        document.mouse_index = <%=button_index%>;

        document.money_balance = 0;

        var selectIndex_x = <%=selectIndex_x%>;
        var selectIndex_y = <%=selectIndex_y%>;
        var hero_human_pet_index = <%=hero_human_pet_index%>;
        var hero_human_pet_flag = <%=hero_human_pet_flag%>;

        var temp_animation_img;
        var ren_wu_index = 0;
        var king_left_monster_Img = new Array("follow/left/4/41.png","follow/left/4/42.png","follow/left/4/43.png");
        var green_left_monster_Img = new Array("follow/left/3/31.png","follow/left/3/32.png","follow/left/3/33.png");
        var atack_left_Img = new Array("follow/left/2/2.png","follow/left/2/2atack1.png","follow/left/2/2atack2.png","follow/left/2/2atack3.png");
        var blue_left_monster_Img = new Array("follow/left/12/bluemonster1.png","follow/left/12/bluemonster2.png","follow/left/12/bluemonster3.png");
        var gun_left_king_Img = new Array("follow/left/11/111.png","follow/left/11/112.png","follow/left/11/113.png");
        var yellow_left_king_Img = new Array("follow/left/10/1.png","follow/left/10/2.png","follow/left/10/3.png","follow/left/10/4.png");
        var blue_left_bear_Img = new Array("follow/left/9/3.png","follow/left/9/11.png","follow/left/9/111.png");
        var red_left_wolf_Img = new Array("follow/left/8/81.png","follow/left/8/82.png","follow/left/8/83.png");
        var blue2_left_monster_Img = new Array("follow/left/7/71.png","follow/left/7/72.png","follow/left/7/73.png");
        var hammer_left_Img = new Array("follow/left/6/61.png","follow/left/6/62.png","follow/left/6/63.png");
        var white_left_wolf_Img = new Array("follow/left/5/51.png","follow/left/5/52.png","follow/left/5/53.png");
        var renwu_left_Img = new Array("follow/left/1/renwu1_03.png","follow/left/1/renwu2_03.png","follow/left/1/renwu3_03.png");

        var indexframe = 0;
        var indexframe_mouse = 0;
        document.div_mouse_left_x = 385+((<%=selectIndex_x%>+3)%3)*80;
        document.div_mouse_top_y = 100+((<%=selectIndex_y%>+4)%4)*75;
        var consume_item_index = 0;

        var generalbar_selected_index = 0;
        var generalbar_selected_flag = false;

        var backpack2backpack_url = "<%=host%>/HttpService/Backpack2BackpackAction.ashx";
        var balance_support_url = "<%=host%>/HttpService/BalanceSupport.ashx";
        var top_consume_url = "<%=host%>/HttpService/hero.ashx?Type=0&GameID=100536&Number=10&consume_item_index=";

        var fighter_name_array2 = new Array("阿姆特","混世螳螂","犀牛王","傀儡妖人","金角大王","双刀战士","傀儡妖人","狂血战魔","鹿角大王","巨锤战士","努尔哈赤","百变火女");
        var fighter_name_array3 = new Array("靓靓","卡卡","乌拉拉","跳跳","小飞侠","小哈","仔仔","鼠小弟","霹雳");

        document.money_balance = 0;

        function run(){

//            mouse_select_upgrade_shift();
            var select_rect_x = 345+((<%=selectIndex_x%>+3)%3)*80;
            var select_rect_y = 120+((<%=selectIndex_y%>+4)%4)*75;

            if(selectIndex_x<3){
                consume_item_index = 61 + hero_human_pet_index;   /**消费id*/
            }else{
                consume_item_index = 181 + hero_human_pet_index;   /**消费id*/
            }

            document.getElementById("div_select_rect_id").style.left=select_rect_x+'px';
            document.getElementById("div_select_rect_id").style.top=select_rect_y+'px';

//            document.div_mouse_left_x = select_rect_x+40;
//            document.div_mouse_top_y = select_rect_y-20;

//            document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x;
//            document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y;

            <%if(selectIndex_x<3){%>
                temp_animation_img = <%=animation_img_array[hero_human_pet_index<animation_img_array.length?hero_human_pet_index:animation_img_array.length-1]%>;
            <%}else {%>
                temp_animation_img = <%=animation_img_array1[hero_human_pet_index<animation_img_array1.length?hero_human_pet_index:animation_img_array1.length-1]%>;
            <%}%>

            hero_animation();
            arrow();
            mouse();
        }

        function mouse(){
            indexframe_mouse ++;
            indexframe_mouse  = (indexframe_mouse+5)%5;
            document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x-indexframe_mouse;
            document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y+indexframe_mouse;

            if(document.div_mouse_left_x == 240){
                document.getElementById("img_upgrade_id").src = "<%=monsterList_in_heroList.get(hero_human_pet_index>=monsterList_in_heroList.size()?0:hero_human_pet_index).isGot_flag()>0?shen_array[1]:buy_array[1]%>";
            }

            setTimeout("mouse()",150);
        }

        function arrow(){
            indexframe ++ ;
            indexframe = (indexframe+5)%5;

            document.getElementById("div_arrow_left_id").style.left = 320-indexframe;
            document.getElementById("div_arrow_right_id").style.left = 570+indexframe;

            setTimeout("arrow()",150);
        }

        function hero_animation(){

            document.getElementById("img_ren_wu_id").src = temp_animation_img[ren_wu_index];    /**人物动画*/
            if(selectIndex_x >= 3){
                document.getElementById("div_ren_wu_id").style.top = '240px';    /**宠物的坐标*/
            }else{
                document.getElementById("div_ren_wu_id").style.top = '210px';     /**人物的坐标*/
            }

            ren_wu_index++;
            if (ren_wu_index>=temp_animation_img.length) ren_wu_index = 0;

            if(ren_wu_index == 1){
                setTimeout("hero_animation()",600);         // control the FPS
            }else{
                setTimeout("hero_animation()",250);         // control the FPS
            }
        }

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

            if(keyCode == ZTE.UP
                    || keyCode == HW.UP
                    || keyCode == UT.UP) {
//                select_generalbar_element_initial();
                selectIndex_y--;
                if(selectIndex_y<0){
                    selectIndex_y = 0;
                }else{
                    selectIndex_y = (selectIndex_y+5)%5;
                }

                if(selectIndex_y==3){
                    generalbar_selected_flag = false;
                }else{
                    xmlhttp = MakeHttpRequest();
                    xmlhttp.open("Post", backpack2backpack_url+"?selectIndex_x="+selectIndex_x
                            +"&selectIndex_y="+selectIndex_y, true);
                    xmlhttp.send();

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4) {
                            var js = eval(xmlhttp.responseText);
                            if(js[0].id == 0){
                                window.location.href = "backpackscreen.jsp?preScreen=mainscreen";
                            }else{

                            }
                        }
                    }
//                    var select_rect_x = 345+((selectIndex_x+3)%3)*80;
//                    var select_rect_y = 120+((selectIndex_y+4)%4)*75;
//
//                    document.div_mouse_left_x = select_rect_x;
//                    document.div_mouse_top_y = select_rect_y;
//
//                    document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x;
//                    document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y;
//
//                    document.getElementById("div_select_rect_id").style.left=select_rect_x+'px';
//                    document.getElementById("div_select_rect_id").style.top=select_rect_y+'px';
                }

            }else if(keyCode == ZTE.DOWN
                    || keyCode == HW.DOWN
                    || keyCode == UT.DOWN){
                if(!(selectIndex_x>=3&&selectIndex_y>3)){
                    selectIndex_y++;
                    selectIndex_y = (selectIndex_y+5)%5;
                    if(selectIndex_x>=3&&selectIndex_y>=3){
                        generalbar_selected_flag = true;
                    }else if(selectIndex_y>3){
                        generalbar_selected_flag = true;
                    }else{
                        xmlhttp = MakeHttpRequest();
                        xmlhttp.open("Post", backpack2backpack_url+"?selectIndex_x="+selectIndex_x
                                +"&selectIndex_y="+selectIndex_y, true);
                        xmlhttp.send();

                        xmlhttp.onreadystatechange = function () {
                            if (xmlhttp.readyState == 4) {
                                var js = eval(xmlhttp.responseText);
                                if(js[0].id == 0){
                                    window.location.href = "backpackscreen.jsp?preScreen=mainscreen";
                                }else{

                                }
                            }
                        }
//                        var select_rect_x = 345+((selectIndex_x+3)%3)*80;
//                        var select_rect_y = 120+((selectIndex_y+4)%4)*75;
//
//                        document.div_mouse_left_x = select_rect_x;
//                        document.div_mouse_top_y = select_rect_y;
//
//                        document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x;
//                        document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y;
//
//                        document.getElementById("div_select_rect_id").style.left=select_rect_x+'px';
//                        document.getElementById("div_select_rect_id").style.top=select_rect_y+'px';
                    }
                }
            }

            if(!generalbar_selected_flag){
                select_pack_elements(keyCode);
            }else{
                if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
                    if(generalbar_selected_index == 0){
                        window.location.href = "armorbasescreen.jsp";
                    }else if(generalbar_selected_index == 1){
                        window.location.href = "backpackscreen.jsp?preScreen=mainscreen";
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

        var price_ = 0;
        <jsp:include page="topuphtmls/backpack/ajax_show_balance.jsp"></jsp:include>

        function select_pack_elements(keyCode){

            if(keyCode == ZTE.LEFT
                    || keyCode == HW.LEFT
                    || keyCode == UT.LEFT) {
                if(document.consume_step == 2||document.consume_step == 3){
                    document.mouse_index--;
                    document.mouse_index = (document.mouse_index+2)%2;   //control show
//                    document.getElementById("test_div").innerHTML = document.mouse_index;
                    if(document.mouse_index==0){
                        document.div_mouse_left_x = 300;
                        document.div_mouse_top_y = 280;
                    }else if(document.mouse_index==1){
                        document.div_mouse_left_x = 400;
                        document.div_mouse_top_y = 280;
                    }
//                    document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x;
//                    document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y;
                }else{
                    selectIndex_x--;
                    if(selectIndex_x<0) selectIndex_x=0;
                    selectIndex_x = (selectIndex_x+6)%6;
                    xmlhttp = MakeHttpRequest();
                    xmlhttp.open("Post", backpack2backpack_url+"?selectIndex_x="+selectIndex_x
                            +"&selectIndex_y="+selectIndex_y, true);
                    xmlhttp.send();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4) {
                            var js = eval(xmlhttp.responseText);
                            if(js[0].id == 0){
                                window.location.href = "backpackscreen.jsp?preScreen=mainscreen";
                            }else{

                            }
                        }
                    }
//                    var select_rect_x = 345+((selectIndex_x+3)%3)*80;
//                    var select_rect_y = 120+((selectIndex_y+4)%4)*75;
//
//                    document.div_mouse_left_x = select_rect_x;
//                    document.div_mouse_top_y = select_rect_y;
//
//                    document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x;
//                    document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y;
//
//                    document.getElementById("div_select_rect_id").style.left=select_rect_x+'px';
//                    document.getElementById("div_select_rect_id").style.top=select_rect_y+'px';
                }

            }else if(keyCode == ZTE.RIGHT
                    || keyCode == HW.RIGHT
                    || keyCode == UT.RIGHT){
                if(document.consume_step == 2||document.consume_step == 3){
                    document.mouse_index++;
                    document.mouse_index = (document.mouse_index+2)%2;            //control show
//                    document.getElementById("test_div").innerHTML = document.mouse_index;
                    if(document.mouse_index==0){
                        document.div_mouse_left_x = 300;
                        document.div_mouse_top_y = 280;
                    }else if(document.mouse_index==1){
                        document.div_mouse_left_x = 400;
                        document.div_mouse_top_y = 280;
                    }
//                    document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x;
//                    document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y;
                }else{
                    if(!(selectIndex_y==3&&selectIndex_x==2)){         /**排除在第4行翻页*/
                        selectIndex_x++;
                        if(selectIndex_x>5) selectIndex_x=5;
                        selectIndex_x = (selectIndex_x+6)%6;
                        xmlhttp = MakeHttpRequest();
                        xmlhttp.open("Post", backpack2backpack_url+"?selectIndex_x="+selectIndex_x
                                +"&selectIndex_y="+selectIndex_y, true);
                        xmlhttp.send();

                        xmlhttp.onreadystatechange = function () {
                            if (xmlhttp.readyState == 4) {
                                var js = eval(xmlhttp.responseText);
                                if(js[0].id == 0){
                                    window.location.href = "backpackscreen.jsp?preScreen=mainscreen";
                                }else{

                                }
                            }
                        }
//                        var select_rect_x = 345+((selectIndex_x+3)%3)*80;
//                        var select_rect_y = 120+((selectIndex_y+4)%4)*75;
//
//                        document.div_mouse_left_x = select_rect_x;
//                        document.div_mouse_top_y = select_rect_y;
//
//                        document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x;
//                        document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y;
//
//                        document.getElementById("div_select_rect_id").style.left=select_rect_x+'px';
//                        document.getElementById("div_select_rect_id").style.top=select_rect_y+'px';
                    }
                }

            }

            if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
                if(document.consume_step==400){

                }else if(document.consume_step==2){
                    if(document.mouse_index==0){                //control action
//                        document.getElementById("test_div").innerHTML = "consume_item_index="+consume_item_index;
                        window.location.href = "the9InputScreen.jsp?consume_item_index="+consume_item_index;
                    }else if(document.mouse_index==1){
                        <jsp:include page="topuphtmls/common/consume_direct_result2_1.jsp"></jsp:include>
//                        window.location.href = "backpackscreen.jsp?preScreen=mainscreen";
                    }
                }else if(document.consume_step==3){
                    if(document.mouse_index==0){
//                        document.getElementById("div_div_msg_id").innerHTML = "test0";
                          <jsp:include page="topuphtmls/backpack/consume_direct3_1.jsp"></jsp:include>
                    }else if(document.mouse_index==1){
                        <jsp:include page="topuphtmls/common/consume_direct_result2_1.jsp"></jsp:include>
                    }

                }else {

                    <%if((monsterList_in_heroList.get(hero_human_pet_index>=monsterList_in_heroList.size()?0:hero_human_pet_index).isGot_flag()>0)){
                         if(monsterList.get(hero_human_pet_index).getStar_nums()<=10){%>
                            document.consume_step = 2;
//                            document.getElementById("test_div").innerHTML = "test0";
                            if(0==<%=button_index%>){
                                document.div_mouse_left_x = 300;
                                document.div_mouse_top_y = 280;
                            }else if(1==<%=button_index%>){
                                document.div_mouse_left_x = 400;
                                document.div_mouse_top_y = 280;
                            }
                    <%--document.getElementById("test_div").innerHTML = <%=button_index%>;--%>
                            ajax_show_balance();
                            consume_item_index = 4000+consume_item_index;
                            price_  =  price_json__$$.item4000[1];
                            if(selectIndex_x>=3){
                                document.getElementById("div_div_consume_info_id").innerHTML = "您是否要升级"+fighter_name_array3[selectIndex_x-3+selectIndex_y*3]+"宠物的等级?<br>资费:"+price_json__$$.item4000[1]+"代币";
                            }else{
                                document.getElementById("div_div_consume_info_id").innerHTML = "您是否要升级"+fighter_name_array2[selectIndex_x+selectIndex_y*3]+"随从的等级?<br>资费:"+price_json__$$.item4000[1]+"代币";
                            }
                            document.getElementById("div_consume_info_id").style.left = '160px';
                            document.getElementById("img_consume_info_id").src = "stage/popupbox.png";
                            document.getElementById("img_confirm_btm_id").src = "hero/que.png";
                        <%}else {%>
                            document.getElementById("div_div_msg_id").innerHTML = "已经到最高等级";
                            document.getElementById("msgDiv").style.left=120;
                            document.getElementById("msgDiv").style.top=90;
                            setTimeout("transitdd()",500);
                        <%}%>
                    <%}else{%>
                        document.consume_step = 2;
//                        document.getElementById("test_div").innerHTML = "test0";
                        if(0==<%=button_index%>){
                            document.div_mouse_left_x = 300;
                            document.div_mouse_top_y = 280;
                        }else if(1==<%=button_index%>){
                            document.div_mouse_left_x = 400;
                            document.div_mouse_top_y = 280;
                        }
                    <%--document.getElementById("test_div").innerHTML = <%=button_index%>;--%>
                        ajax_show_balance();
                        price_  =  price_json__$$.item62[1];
                        if(selectIndex_x>=3){
                            document.getElementById("div_div_consume_info_id").innerHTML = "您是否要购买"+fighter_name_array3[selectIndex_x-3+selectIndex_y*3]+"宠物?<br>资费:"+price_json__$$.item62[1]+"代币";
                        }else{
                            document.getElementById("div_div_consume_info_id").innerHTML = "您是否要购买"+fighter_name_array2[selectIndex_x+selectIndex_y*3]+"随从?<br>资费:"+price_json__$$.item62[1]+"代币";
                        }
                        document.getElementById("div_consume_info_id").style.left = '160px';
                        document.getElementById("img_consume_info_id").src = "stage/popupbox.png";
                        document.getElementById("img_confirm_btm_id").src = "hero/que.png";
                    <%}%>

                }

            }

        }

        function mouse_select_upgrade_shift(){

            if(!generalbar_selected_flag&&document.consume_step == 0){    /**鼠标切换的情况*/
                if(!(document.div_mouse_left_x == 300&&div_mouse_top_y == 280)){
                    document.div_mouse_left_x = 240;
                    document.div_mouse_top_y = 330;
                    setTimeout("mouse_select_upgrade_shift()",500);
                }
            }else{
                setTimeout("mouse_select_upgrade_shift()",500);
            }

        }

        function draw(imgname,divname,top_y,left_x,src){
            document.getElementById(imgname).src = src;
            document.getElementById(divname).style.top = top_y;
            document.getElementById(divname).style.left = left_x;
        }

        function transitdd(){
            window.location.href = "backpackscreen.jsp?preScreen=mainscreen";
        }
    </script>
</head>
<body onload="run()">

<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"></div>

    <div id="div_bg_id" style='position: absolute;'>
        <img id="img_bg_id" src="armorbase/backpack/backpack1.jpg" />
        <div id="div_div_hp_id" style="font-size:16px;font-weight: bold;position: absolute;left: 60px;top: 160px;color: #ffffff;">
                   等级:<%=monsterList.get(hero_human_pet_index).getStar_nums()%>   <font size="3px" color="#ff2c50">+1 Max:11</font>
              <br> 血量:<%=monsterList.get(hero_human_pet_index).getHp_num()*100%>     <font size="5px" color="#ff2c50">+500</font>
              <br> 攻击力:<%=monsterList.get(hero_human_pet_index).getFight_num()*10%>  <font size="5px" color="#ff2c50">+20</font>
              <%--<br> 技能:<%=heroList.get(hero_human_pet_index < heroList.size() ? hero_human_pet_index : (heroList.size() - 1))%>--%>
        </div>
    </div>

    <div id="div_backpack_id" style="position: absolute; z-index: 1; left: 60px; top: 80px;">
        <img id="img_backpack_id" src=""/>
    </div>

    <%if(hero_human_pet_flag == 1){%>
        <div id="div_backpack_03_id" style='position: absolute;'>
            <img id="img_backpack_03_id" src="armorbase/backpack/backpack_03.jpg" />
        </div>
    <%}else if(hero_human_pet_flag == 2){%>
        <div id="div_backpack_04_id" style='position: absolute;'>
            <img id="img_backpack_04_id" src="armorbase/backpack/backpack_04.jpg" />
        </div>
    <%}%>

    <div id="div_ren_wu_id" style='position: absolute;'>
        <img id="img_ren_wu_id" src="" />
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

    <%
        if(monsterList_in_heroList!=null){
            for(int i=0; i<monsterList_in_heroList.size(); i++){
                int x = i%3;
                int y = i/3;

                int left = 345+x*80;
                int top = 120+y*75;
    %>
    <div id="div_hero_human_bottom_kuang<%=i+1%>_id" style='position:absolute;left:<%=left%>px;top:<%=top%>px;'>
        <img id="img_hero_human_bottom_kuang<%=i+1%>_id" src="team/kuang.png" />
    </div>

    <div id="div_hero_human_id<%=i+1%>" style='position: absolute;left:<%=left%>px;top:<%=top%>px;'>
        <%if(!(monsterList_in_heroList.get(hero_human_pet_index<monsterList_in_heroList.size()?i:(monsterList_in_heroList.size()-1)).isGot_flag()>0)){%>
            <img id="img_hero_human_id<%=i+1%>" src=<%=properties.getProperty("titlepath"+(monsterList_in_heroList.get(hero_human_pet_index<monsterList_in_heroList.size()?i:(monsterList_in_heroList.size()-1)).getFighter_id()))%> />
        <%}else {%>
            <img id="img_hero_human_id<%=i+1%>" src=<%=properties1.getProperty("titleItem"+(monsterList_in_heroList.get(hero_human_pet_index<monsterList_in_heroList.size()?i:(monsterList_in_heroList.size()-1)).getFighter_id()))%> />
        <%}%>
    </div>
    <%}
    }%>

    <div id="div_upgrade_id" style='position: absolute;left: 130px;top: 370px;'>
        <img id="img_upgrade_id" src="<%=monsterList_in_heroList.get(hero_human_pet_index>=monsterList_in_heroList.size()?0:hero_human_pet_index).isGot_flag()>0?shen_array[0]:buy_array[0]%>" />
    </div>

    <div id="div_star_id" style='position: absolute;left: 90px;top: 350px;'>
        <div>
            <img id="img_star_id" src="armorbase/star.png" />
        </div>
    </div>

    <div id="div_select_rect_id" style='position: absolute;left: -3045px;top: 120px;'>
        <img id="img_select_rect_id" src="team/select.png" />
    </div>

    <div id="div_mouse_id" style="position: absolute;z-index: 3;left:-3405px;top: 120px;">
        <img id="img_mouse_id" src="stage/mouse.png">
    </div>

    <div id="div_arrow_left_id" style='position: absolute;left: 10px;top: 240px;'>
        <img id="img_arrow_left_id" src="stage/left.png" />
    </div>

    <div id="div_arrow_right_id" style='position: absolute;left: 590px;top: 240px;'>
        <img id="img_arrow_right_id" src="stage/right.png" />
    </div>

    <div id="div_human_or_pet_name_id" style='position: absolute;left: 130px;top: 80px;'>
        <img id="img_human_or_pet_name_id" src=<%=properties2.getProperty("heroname"+(monsterList_in_heroList.get(hero_human_pet_index<monsterList_in_heroList.size()?hero_human_pet_index:(monsterList_in_heroList.size()-1)).getFighter_id()))%>/>
    </div>

    <div id="div_consume_info_id" style="position: absolute;left: -360;top: 100;z-index: 2;">
        <img id="img_consume_info_id" src="">
        <div id="div_confirm_btn_id" style="position: absolute;left: 115;top: 200;z-index: 2;">
            <img id="img_confirm_btm_id" src="">
        </div>
        <div id="div_cancel_id" style='position: absolute;z-index: 2;left: 220px;top: 200px;'>
            <img id="img_cancel_id" src="hero/back.png" />
        </div>
        <div id="div_div_consume_info_id" style="font-size:16px;font-weight: bold;position: absolute; top: 60px; left: 80px;">购买人物</div>
        <div id="div_div_consume_info_id1" style="font-size:16px;font-weight: bold;position: absolute; top: 80px; left: 80px;"></div>
        <div id="div_div_consume_info_id2" style="font-size:16px;font-weight: bold;position: absolute; top: 80px; left: 80px;color: red;"></div>
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
</body>
</html>