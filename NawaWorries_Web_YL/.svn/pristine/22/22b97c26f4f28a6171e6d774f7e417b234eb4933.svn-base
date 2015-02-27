<%@ page import="elements.armorbase.EquipItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="screen.armorbase.Items_Select_Per_Hero" %>
<%@ page import="beans.FighterBean" %>
<%@ page import="java.util.Properties" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="common.JsonToBean" %>
<%@ page import="beans.EquipMaxIndexBean" %>
<%@ page import="beans.FighterItemBean" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-8-18
  Time: 下午7:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

    List<Items_Select_Per_Hero> items_select_per_heros = new ArrayList<Items_Select_Per_Hero>();
    Items_Select_Per_Hero items_select_per_hero = new Items_Select_Per_Hero(1,"armorbase/base/backpack_03.jpg",335,70);
    items_select_per_heros.add(items_select_per_hero);
    items_select_per_hero = new Items_Select_Per_Hero(2,"armorbase/base/backpack_04.jpg",440,70);
    items_select_per_heros.add(items_select_per_hero);

    String preScreen = "";

    if(session.getAttribute("preScreen")!=null){
        preScreen = (String) session.getAttribute("preScreen");
    }

//    Integer armor_or_skill = 0;
//    if(request.getParameter("armor_or_skill")!=null){
//        armor_or_skill = Integer.valueOf(request.getParameter("armor_or_skill"));
//    }

    PropertiesOp propertiesOp = new PropertiesOp();
    Properties properties = propertiesOp.load("/initial/equip.properties");
    EquipMaxIndexBean equipMaxIndexBean = (EquipMaxIndexBean) session.getAttribute("_EquipMaxIndex");

    /**获取 fighter list*/
    List<FighterBean> fighterList = (List<FighterBean>) session.getAttribute("_FighterData");

    /**获取 hero list*/
    List<FighterItemBean> heroList = (List<FighterItemBean>) session.getAttribute("_HeroData");

    Integer hero_index = 0;
//    Integer hero_index_test = 0;
//    Integer hero_index_final = 0;
    if(request.getParameter("task_selectIndex_y")!=null){         /**首先判断外部页面传入的参数*/
        hero_index = Integer.valueOf(request.getParameter("task_selectIndex_y"));
    }else {
        if(request.getParameter("preScreen")!=null&&request.getParameter("preScreen").equals("self")){
            if(session.getAttribute("armorbase_hero_index")!=null){
                hero_index = Integer.valueOf((String) session.getAttribute("armorbase_hero_index"));
            }

            if(request.getAttribute("armorbase_hero_index")!=null){
                hero_index = Integer.valueOf((String) request.getAttribute("armorbase_hero_index"));
            }
//            if(request.getParameter("direct")!=null&&request.getParameter("direct").equals("toleft")){
//                if(hero_index>=3&&fighterList.get(hero_index).isGot_flag()<=0){
//                    do{
//                       hero_index--;
//                        hero_index = (hero_index+7)%7;
//                    }while ((hero_index>=3&&fighterList.get(hero_index).isGot_flag()>0)||hero_index<3);
//                }
//            }else if(request.getParameter("direct")!=null&&request.getParameter("direct").equals("toright")){
//                if(hero_index>=3&&fighterList.get(hero_index).isGot_flag()<=0){
//                    do{
//                        hero_index++;
//                        hero_index = (hero_index+7)%7;
//                    }while ((hero_index>=3&&fighterList.get(hero_index).isGot_flag()>0)||hero_index<3);
//                }
//            }
        }else {
            if(session.getAttribute("heroScreen_selectIndex")!=null){
                hero_index = Integer.valueOf((String) session.getAttribute("heroScreen_selectIndex"));
//                hero_index_test = hero_index_final;
            }
        }
    }
//    int canshow_hero_num=4;
//    if(fighterList.get(4).isGot_flag()==1){
//        canshow_hero_num++;
//    }
//
//    if(fighterList.get(5).isGot_flag()==1){
//        canshow_hero_num++;
//    }
//
//    if(fighterList.get(6).isGot_flag()==1){
//        canshow_hero_num++;
//    }

    /**获取 equip list*/
    List<EquipItem> equipItemList = new ArrayList<EquipItem>();
    boolean all_equip_got = false;
    if(equipMaxIndexBean.getEquipMaxIndex(hero_index+1)>=8){
        all_equip_got = true;
        equipItemList = JsonToBean.jsonTobean4(properties.getProperty("equip1")).subList(0,equipMaxIndexBean.getEquipMaxIndex(hero_index+1));
    }else {
        equipItemList = JsonToBean.jsonTobean4(properties.getProperty("equip1")).subList(0,equipMaxIndexBean.getEquipMaxIndex(hero_index+1));
    }

    String[] shen_array = new String[]{"armorbase/shen.png", "armorbase/shen1.png"};
    String[] buy_array = new String[]{"armorbase/buy.png", "armorbase/buy1.png"};
    String[] animation_name_array = new String[]{"hero_blueImg","hero_redImg","hero_yellowImg","hero_blueImg1","hero_redImg1","hero_yellowImg1","hero_purpleImg"};

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
    <script type="text/javascript">

        var price_json = <%=buy_prices%>;   /**js 解析json数据*/

        //触发onkeypress事件
        document.onkeypress = onKeyPress;
        document.all_equip_got = <%=all_equip_got%>;
        document.div_mouse_left_x = 190;
        document.div_mouse_top_y = 345;
        document.indexframe_mouse = 0;
        <%--document.armor_or_skill = <%=armor_or_skill%>;--%>
        document.consume_step = 0;
        document.mouse_index = <%=button_index%>;
        document.consume_info_array = new Array("飞影侠","刑天侠","金刚侠","超级飞影侠","超级刑天侠","超级金刚侠","修罗侠");

        var hero_greenImg = new Array("hero/blue1/1.png","hero/blue1/2.png","hero/blue1/3.png");
        var hero_blueImg = new Array("hero/blue/action1_03.png","hero/blue/action2_03.png","hero/blue/action3_03.png");
        var hero_blueImg1 = new Array("hero/blue1/1.png","hero/blue1/2.png","hero/blue1/3.png");
        var hero_redImg1 = new Array("hero/red1/1.png","hero/red1/2.png","hero/red1/3.png");
        var hero_yellowImg1 = new Array("hero/yellow1/1.png","hero/yellow1/2.png","hero/yellow1/3.png");
        var hero_purpleImg = new Array("hero/purple/hero1_03.png","hero/purple/hero2_03.png","hero/purple/hero3_03.png");
        var hero_redImg = new Array("hero/red/action1_06.png","hero/red/action2_06.png","hero/red/action3_06.png");
        var hero_yellowImg = new Array("hero/yellow/action1_03.png","hero/yellow/action2_03.png","hero/yellow/action3_03.png");

        var armor_array = new Array("armorbase/1.png","armorbase/2.png","armorbase/3.png","armorbase/4.png","armorbase/5.png","armorbase/6.png","armorbase/7.png");

        var selectIndex = 0;
        var indexframe = 0;

        var hero_img_array = <%=animation_name_array[hero_index]%>;
        var hero_i = 0;

        var hero_index = <%=hero_index%>;
        <%--var hero_index_test = <%=hero_index_test%>;--%>
        <%--var hero_index_final = <%=hero_index_final%>;--%>
        var armor2armor_url = "<%=host%>/HttpService/Armorbases2ArmorbasesAction.ashx";
        var balance_support_url = "<%=host%>/HttpService/BalanceSupport.ashx";
        var top_consume_url = "<%=host%>/HttpService/hero.ashx?Type=0&GameID=100536&Number=10&consume_item_index=";
        var select_index_array = new Array(0,0,0,0,0);

        var generalbar_selected_flag = false;
        var generalbar_selected_index = 0;
        var consume_item_index = 0;

        function select_armor(keyCode){
            if(keyCode == ZTE.LEFT
                    || keyCode == HW.LEFT
                    || keyCode == UT.LEFT) {
                if(document.consume_step == 2||document.consume_step == 3){
                    document.mouse_index--;
                    document.mouse_index = (document.mouse_index+2)%2;   //control show
                    if(document.mouse_index==0){
                        document.div_mouse_left_x = 300;
                        document.div_mouse_top_y = 280;
                    }else if(document.mouse_index==1){
                        document.div_mouse_left_x = 400;
                        document.div_mouse_top_y = 280;
                    }
//                    document.getElementById("div_mouse_id").style.left = div_mouse_left_x;
//                    document.getElementById("div_mouse_id").style.top = div_mouse_top_y;
                }else{
                    hero_index --;
                    hero_index = (hero_index+7)%7;
                    xmlhttp = MakeHttpRequest();
                    xmlhttp.open("Post", armor2armor_url+"?hero_index="+hero_index, true);
                    xmlhttp.send();

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4) {
                            var js = eval(xmlhttp.responseText);
                            if(js[0].id == 0){
                                window.location.href = "armorbasescreen.jsp?preScreen=self&direct=toleft";
                            }else{

                            }
                        }
                    }
                }
            }else if(keyCode == ZTE.RIGHT
                    || keyCode == HW.RIGHT
                    || keyCode == UT.RIGHT){
                if(document.consume_step == 2||document.consume_step == 3){
                    document.mouse_index++;
                    document.mouse_index = (document.mouse_index+2)%2;            //control show
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
                    hero_index ++;
                    hero_index = (hero_index+7)%7;
                    xmlhttp = MakeHttpRequest();
                    xmlhttp.open("Post", armor2armor_url+"?hero_index="+hero_index, true);
                    xmlhttp.send();

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4) {
                            var js = eval(xmlhttp.responseText);
                            if(js[0].id == 0){
                                window.location.href = "armorbasescreen.jsp?preScreen=self&direct=toright";
                            }else{

                            }
                        }
                    }
                }
            }

            if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
                if(document.all_equip_got){
                    xmlhttp = MakeHttpRequest();
                    xmlhttp.open("Post", armor2armor_url+"?hero_index="+hero_index+"&all_equip_got="+1, true);
                    xmlhttp.send();

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4) {
                            var js = eval(xmlhttp.responseText);
                            if(js[0].id == 0){
                                window.location.href = "armorbasescreen.jsp?task_selectIndex_y="+hero_index;
                            }else{

                            }
                        }
                    }
                }else{

                    if(document.consume_step==400){

                    }else if(document.consume_step==2){
                        if(document.mouse_index==0){                //control action
//                            document.getElementById("test_div").innerHTML = "consume_item_index:"+consume_item_index;
                            window.location.href = "the9InputScreen.jsp?consume_item_index="+consume_item_index+"&task_selectIndex_y="+hero_index;
                        }else if(document.mouse_index==1){
                            <jsp:include page="topuphtmls/common/consume_direct_result2_1.jsp"></jsp:include>
//                            window.location.href = "armorbasescreen.jsp?preScreen=self&armorbase_hero_index="+hero_index;
                        }
                    }else if(document.consume_step==3){
                        if(document.mouse_index==0){
                            <jsp:include page="topuphtmls/armorbase/consume_direct3_0.jsp"></jsp:include>
                        }else if(document.mouse_index==1){
                            <jsp:include page="topuphtmls/common/consume_direct_result2_1.jsp"></jsp:include>
                        }

                    }else {

                        <%if((fighterList.get(hero_index).isGot_flag()>0)){
                             if(heroList.get(hero_index).getStar_nums()<=10){%>
                                if(document.mouse_index==0){
                                    document.div_mouse_left_x = 300;
                                    document.div_mouse_top_y = 280;
                                }else if(document.mouse_index==1){
                                    document.div_mouse_left_x = 400;
                                    document.div_mouse_top_y = 280;
                                }
                                ajax_show_balance();
                                consume_item_index = 281+hero_index;
                                consume_item_index = 4000+consume_item_index;
                                price_ =  price_json.item4000[1];
//                                document.getElementById("test_div").innerHTML = "test0";
                                document.getElementById("div_div_consume_info_id").innerHTML = "您是否要升级"+document.consume_info_array[hero_index]+"的等级?<br>资费:"+price_json.item4000[1]+"代币";
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
                            <%if(((hero_index==3||hero_index==4||hero_index==5)&&fighterList.get(hero_index-3).isGot_flag()>0)||(hero_index==6&&fighterList.get(hero_index-1).isGot_flag()>0)||(hero_index==0||hero_index==1||hero_index==2)){%>
                                if(document.mouse_index==0){
                                    document.div_mouse_left_x = 300;
                                    document.div_mouse_top_y = 280;
                                }else if(document.mouse_index==1){
                                    document.div_mouse_left_x = 400;
                                    document.div_mouse_top_y = 280;
                                }
                                consume_item_index = 281+hero_index;
                                ajax_show_balance();
                                price_ =  price_json.item2[1];
//                                document.getElementById("test_div").innerHTML = "test1";
                                document.getElementById("div_div_consume_info_id").innerHTML = document.consume_info_array[(hero_index)]+"铠甲未购买,您是否要购买?<br>资费:"+price_json.item2[1]+"代币";
                                document.getElementById("div_consume_info_id").style.left = '160px';
                                document.getElementById("img_consume_info_id").src = "stage/popupbox.png";
                                document.getElementById("img_confirm_btm_id").src = "hero/que.png";
                            <%}else {%>
                                if((hero_index==3||hero_index==4||hero_index==5)){
                                    document.getElementById("div_div_msg_id").innerHTML = "请先购买"+document.consume_info_array[hero_index-3];
                                }else  if((hero_index==6)){
                                    document.getElementById("div_div_msg_id").innerHTML = "请先购买"+document.consume_info_array[hero_index-1];
                                }
                                document.getElementById("msgDiv").style.left=120;
                                document.getElementById("msgDiv").style.top=90;
                                setTimeout("transitdd()",500);
                            <%}%>

                        <%}%>

                    }
                }
            }

        }

        var price_ = 0;
        <jsp:include page="topuphtmls/armorbase/ajax_show_balance.jsp"></jsp:include>

        function hero_green_action(){
//            document.getElementById("test_div").innerHTML = "test1";
            document.getElementById("img_warriors_id1").src = armor_array[hero_index];
            document.getElementById("img_hero_green_id").src = hero_img_array[hero_i];
            document.getElementById("img_hero_green_id").style.top = 250;

            hero_i++;
            if (hero_i>=hero_img_array.length) hero_i = 0;

            setTimeout("hero_green_action()",250);         // control the FPS
        }

        function arrow(){
            indexframe ++ ;
            indexframe = (indexframe+5)%5;

            document.getElementById("div3").style.left = 20-indexframe;

            document.getElementById("div4").style.left = 280+indexframe;

            setTimeout("arrow()",150);
        }

        function run(){

            mouse();

            <%--<%if((fighterList.get(hero_index).isGot_flag()>0)){%>--%>
            <%--document.getElementById("img_shen_id").innerHTML = document.consume_info_array[hero_index];--%>
            <%--document.getElementById("img_shen_id").src = "<%=fighterList.get(hero_index).isGot_flag()>0?shen_array[1]:buy_array[1]%>";--%>

            <%--<%}else{%>--%>
            document.getElementById("img_shen_id").src = "<%=fighterList.get(hero_index).isGot_flag()>0?shen_array[0]:buy_array[0]%>";

            <%--<%}%>--%>


            if(document.all_equip_got){
                document.div_mouse_left_x = 280;
                document.div_mouse_top_y = 230;
                document.getElementById("div_div_msg_id").innerHTML = "可使用收集的装备免费升级一次";
                document.getElementById("msgDiv").style.left=120+'px';
                document.getElementById("msgDiv").style.top=90+'px';
                document.getElementById("div_confirm_id").style.left=170+'px';
                document.getElementById("div_confirm_id").style.top=170+'px';
                document.getElementById("div_mouse_id").style.left=230+'px';
                document.getElementById("div_mouse_id").style.top=300+'px';
//                setTimeout("shift_page()",1500);
            }

//            if(document.armor_or_skill==0){
//                document.div_mouse_left_x = 190;
//                document.div_mouse_top_y = 345;
//            }else{
//                document.div_mouse_left_x = 550;
//                document.div_mouse_top_y = 110;
//            }

//            document.getElementById("test_div").innerHTML = "test0";
            hero_green_action();
            arrow();
        }

        function shift_page(){
            xmlhttp = MakeHttpRequest();
            xmlhttp.open("Post", armor2armor_url+"?hero_index="+hero_index+"&all_equip_got="+1, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].id == 0){
                        window.location.href = "armorbasescreen.jsp?preScreen=self&armorbase_hero_index="+hero_index;
                    }else{

                    }
                }
            }
        }

        function onKeyPress(){
            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                    ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                <%if(preScreen.equals("mainscreen")||preScreen.equals("self")){%>
                    window.location.href = "main.jsp";
                <%}else { %>
                    window.location.href = "stageMapScreen.jsp";
                <%}%>

            }

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
                    select_armor(keyCode);
            }else{
                if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
                    if(generalbar_selected_index == 0){
                        window.location.href = "armorbasescreen.jsp?preScreen=self&armorbase_hero_index="+hero_index;
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

        function mouse(){
            document.indexframe_mouse ++;
            document.indexframe_mouse  = (document.indexframe_mouse+5)%5;
            document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x-document.indexframe_mouse;
            document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y+document.indexframe_mouse;
            <%--if(document.div_mouse_left_x == 190){--%>
                <%--if(document.armor_or_skill==0){--%>
//                    consume_item_index = 281+hero_index;
                    <%--document.getElementById("img_shen_id").innerHTML = document.consume_info_array[hero_index];--%>
                    <%--document.getElementById("img_shen_id").src = "<%=fighterList.get(hero_index).isGot_flag()>0?shen_array[1]:buy_array[1]%>";--%>
                    <%--document.getElementById("img_item_select_per_hero_id1").src = "armorbase/base/backpack_03.jpg";--%>
                    <%--document.getElementById("div_item_select_per_hero_id1").style.left = '<%=items_select_per_heros.get(0).getLeft_x()%>px';--%>
                    <%--document.getElementById("div_item_select_per_hero_id1").style.top = '<%=items_select_per_heros.get(0).getTop_y()%>px';--%>
                <%--}else{--%>
                    <%--consume_item_index = 287;--%>
                    <%--document.getElementById("img_shen_id").src = "<%=fighterList.get(hero_index).isGot_flag()>0?shen_array[0]:buy_array[0]%>";--%>
                    <%--document.getElementById("img_item_select_per_hero_id2").src = "armorbase/base/backpack_04.jpg";--%>
                    <%--document.getElementById("div_item_select_per_hero_id2").style.left = '<%=items_select_per_heros.get(1).getLeft_x()%>px';--%>
                    <%--document.getElementById("div_item_select_per_hero_id2").style.top = '<%=items_select_per_heros.get(1).getTop_y()%>px';--%>
                <%--}--%>
            <%--}--%>
            setTimeout("mouse()",150);
        }

        function transitdd(){
            window.location.href = "armorbasescreen.jsp?preScreen=self&armorbase_hero_index="+hero_index;
        }

    </script>
</head>
<body onload="run()">

<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"></div>

    <div id="div_bg_id" style='position: absolute;'>
        <img id="img_bg_id" src="armorbase/base/base1.jpg" />
        <div id="div_div_hp_id" style="font-size:16px;font-weight: bold;position: absolute;left: 60px;top: 160px;color: #ffffff;">
                 等级:<%=heroList.get(hero_index).getStar_nums()%>   <font size="3px" color="#ff2c50">+1 Max:11</font>
            <br> 血量:<%=heroList.get(hero_index).getHp_num()*100%>     <font size="5px" color="#ff2c50">+500</font>
            <br> 攻击力:<%=heroList.get(hero_index).getFight_num()*10%>  <font size="5px" color="#ff2c50">+20</font>
            <%--<br> 技能:<%=heroList.get(hero_index<heroList.size()?hero_index:(heroList.size()-1)).getSkill_levels()%>--%>
        </div>
    </div>

    <% if(equipItemList!=null){
        for(int i=0; i<equipItemList.size();i++){
        int x = i%3;
        int y = i/3;

        int left = 330+x*80;
        int top = 120+y*75;
    %>
        <div id="div_equip_item_bottom_kuang<%=i+1%>_id" style='position:absolute;left:<%=left%>px;top:<%=top%>px;'>
            <img id="img_equip_item_bottom_kuang<%=i+1%>_id" src="team/kuang.png" />
        </div>

        <div id="div_armorbase_id<%=i+1%>" style='position: absolute;left:<%=left%>px;top:<%=top%>px;'>
            <img id="img_armorbase_id<%=i+1%>" src="<%=equipItemList.get(i).getImg_path()%>" />
        </div>
    <%}
    }%>

    <div id="div_buy_id4" style='position: absolute;'>
        <img id="img_buy_id4" src="armorbase/base/buy.png" />
    </div>

    <div id="div_warriors_id1" style='position: absolute;'>
        <img id="img_warriors_id1" src="" />
    </div>

    <div id="div_hero_green_id" style='position: absolute;'>
        <img id="img_hero_green_id" src="" />
    </div>

    <div id="div_shen_id" style='position: absolute;'>
        <img id="img_shen_id" src="armorbase/shen.png" />
    </div>

    <%--<%for(int i=0;i<items_select_per_heros.size();i++){%>--%>
        <div id="div_item_select_per_hero_id1" style='position: absolute;z-index: 2; left: <%=items_select_per_heros.get(0).getLeft_x()%>px;top: <%=items_select_per_heros.get(0).getTop_y()%>px;'>
            <img id="img_item_select_per_hero_id1" src="<%=items_select_per_heros.get(0).getSrc_img_path()%>" />
        </div>
    <%--<%}%>--%>

    <div id="div_star_id1" style='position: absolute;z-index:1;left: 80px;top: 340px;'>
        <img id="img_star_id1" src="armorbase/star.png" />
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

    <div id="div3" style='position: absolute;'>
        <img id="id_left" src="stage/left.png" />
    </div>

    <div id="div4" style='position: absolute;z-index:1;left: 390px;top: 220px;'>
        <img id="id_right" src="stage/right.png" />
    </div>

    <div id="div_mouse_id" style="position: absolute;z-index: 3;left: 345px;top: 120px;">
        <img id="img_mouse_id" src="stage/mouse.png">
    </div>

    <div id="div_consume_info_id" style="position: absolute;left: -360;top: 100;z-index: 2;">
        <img id="img_consume_info_id" src="">
        <div id="div_confirm_btn_id" style="position: absolute;left: 115;top: 200;z-index: 2;">
            <img id="img_confirm_btm_id" src="">
        </div>
        <div id="div_cancel_id" style='position: absolute;z-index: 2;left: 220px;top: 200px;'>
            <img id="img_cancel_id" src="hero/back.png" />
        </div>
        <div id="div_div_consume_info_id" style="font-size:16px;font-weight: bold;position: absolute; top: 60px; left: 80px;">购买或升级英雄</div>
        <div id="div_div_consume_info_id1" style="font-size:16px;font-weight: bold;position: absolute; top: 80px; left: 80px;"></div>
        <div id="div_div_consume_info_id2" style="font-size:16px;font-weight: bold;position: absolute; top: 80px; left: 80px;color: red;"></div>
    </div>

    <div id="msgDiv" style='position: absolute;z-index: 3;left: -800px; top: 60px;'>
        <img id="img_popupbox_id" src="stage/popupbox.png" />
        <div id="div_div_msg_id" style="font-size:16px;font-weight: bold;position: absolute; z-index: 2; left: 80px; top: 60px;"></div>
        <div id="div_div_msg1_id" style="font-size:16px;font-weight: bold;position: absolute; z-index: 2; left: 80px; top: 80px;"></div>
        <div id="div_div_msg2_id" style="font-size:16px;font-weight: bold;position: absolute; left: 80px; top: 100px; color: red;"></div>
        <div id="div_confirm_id" style='position: absolute;z-index: 4;left: 115px;top: 200px;'>
            <img id="img_confirm_id" src="hero/que.png" />
        </div>
    </div>

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