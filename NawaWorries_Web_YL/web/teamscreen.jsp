<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Properties" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="beans.FighterBean" %>
<%@ page import="elements.EnemyTeam" %>
<%@ page import="com.fancyy.json.util.JSON" %>
<%--<%@include file="topuphtmls/confirm.jsp"%>--%>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-8-14
  Time: 下午10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String followingPage = session.getAttribute("followingPage")!=null ? (String) session.getAttribute("followingPage") : null;

    session.removeAttribute("followingPage");

    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

    /**Fighter分页变量*/
    int select_Index=0;
    if(session.getAttribute("grouptype")!=null){
        select_Index = Integer.valueOf((String) session.getAttribute("grouptype"));
    }
    if(request.getParameter("select_Index")!=null){
        select_Index = Integer.valueOf(request.getParameter("select_Index"));
    }

    /**X选择变量*/
    int select_title_horizontal_Index=0;
    if(request.getParameter("select_title_horizontal_Index")!=null){
        select_title_horizontal_Index = Integer.valueOf(request.getParameter("select_title_horizontal_Index"));
    }

    /**获取 hero list*/
    List<FighterBean> heroList = (List<FighterBean>) session.getAttribute("_FighterData");

    /**筛选已购买 hero list*/
    List<FighterBean> getHeroList = new ArrayList<FighterBean>();
    for(FighterBean heroItem : heroList){   /**显示全部伙伴 heroList==getHeroList*/
//       if(heroItem.isGot_flag())
           getHeroList.add(heroItem);
    }

    session.setAttribute("getHeroList",getHeroList);

    /**筛选未选中 hero list*/
    List<FighterBean> unSelectHeroList = new ArrayList<FighterBean>();

    for (FighterBean heroItem : heroList){       /**Fighter分页变量作为type*/
        if(!heroItem.isSelect_flag()){
            if(heroItem.getType() == select_Index){
//                if(select_Index==0){
//                    if(heroItem.getFighter_id()>3){
//                        if(heroItem.isGot_flag()>0){
//                            unSelectHeroList.add(heroItem);
//                        }
//                    }else {
//                        unSelectHeroList.add(heroItem);
//                    }
//                }else {
                    unSelectHeroList.add(heroItem);
//                }
            }
        }
    }

    /**筛选已选中 hero list*/
    List<FighterBean> selectHeroList = new ArrayList<FighterBean>();

    for (FighterBean heroItem : getHeroList){
         if(heroItem.isSelect_flag())
             selectHeroList.add(heroItem);
    }
    int selectHeroListSize = selectHeroList.size();

    session.setAttribute("selectHeroList",selectHeroList);

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
    <link href="Styles/stageMapScreen/stageMapScreen.css" rel="stylesheet" type="text/css" />
    <link href="Styles/stageMapScreen/rowelements.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript" src="include/teamscreen/teamscreen.js"></script>
    <script type="text/javascript">

    var fighter_name_array1 = new Array("购买飞影侠","购买刑天侠","购买金刚侠","购买超级飞影侠","购买超级刑天侠","购买超级金刚侠","购买修罗侠");
    var fighter_name_array2 = new Array("购买阿姆特","购买混世螳螂","购买犀牛王","购买傀儡妖人","购买金角大王","购买双刀战士","购买傀儡妖人","购买狂血战魔","购买鹿角大王","购买巨锤战士","购买努尔哈赤","购买百变火女");
    var fighter_name_array3 = new Array("购买靓靓","购买卡卡","购买乌拉拉","购买跳跳","购买小飞侠","购买小哈","购买仔仔","购买鼠小弟","购买霹雳");

    var price_json = <%=buy_prices%>;   /**js 解析json数据*/

        var row_element_array = new Array("titles/pets/A.png","titles/pets/B.png",
                "titles/pets/C.png","titles/pets/D.png","titles/pets/E.png");

        var selectIndex = <%=select_Index%>;
        var select_title_vertical_Index = 0;
        var select_title_horizontal_Index = <%=select_title_horizontal_Index%>;

        var url = "<%=host%>/HttpService/TeamToGame.ashx";
        var team2team_url = "<%=host%>/HttpService/TeamToTeam.ashx";
        var is_got_url = "<%=host%>/HttpService/IsGotAction.ashx";
        var balance_support_url = "<%=host%>/HttpService/BalanceSupport.ashx";
        var top_consume_url = "<%=host%>/HttpService/hero.ashx?Type=0&GameID=100536&Number=10&consume_item_index=";

        var selectHeroListSize = <%=selectHeroListSize%>;
        var consume_step = 0;
        var consume_item_index = 0;
        var mouse_index = <%=button_index%>;
        var js;

        //触发onkeypress事件
        document.onkeypress = onKeyPress;
        document.currentlistnum = <%=((unSelectHeroList.size()/5)+((unSelectHeroList.size()%5)>0?1:0))%>;
        document.topupflag = false;

        function onKeyPress(){
            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            if(keyCode==UT.FIVE||keyCode==ZTE.FIVE||keyCode==HW.FIVE){
                if(selectHeroListSize<3){
                    document.div_mouse_left_x = 250;
                    document.div_mouse_top_y = 280;
                    document.getElementById("div_div_msg_id").innerHTML = "请选择至少三名类型不同的斗士";
                    document.getElementById("msgDiv").style.left=120+'px';
                    document.getElementById("msgDiv").style.top=90+'px';
                    document.getElementById("div_confirm_id").style.left=250+'px';
                    document.getElementById("div_confirm_id").style.top=300+'px';
                    document.topupflag = true;
                }else{
                    xmlhttp = MakeHttpRequest();
                    xmlhttp.open("Post", url, true);
                    xmlhttp.send();

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4) {
                            var js = eval(xmlhttp.responseText);
                            if(js[0].id == 0){
                                var pattern = new RegExp("zte");       // 中兴机顶盒进gamescreen jsp
                                if (!pattern.exec(navigator.appName+"")){
                                    window.location.href = "teamscreen.jsp?select_Index="+selectIndex+"&select_Index_=-1";
                                }else{
                                    window.location.href = "gamescreen.jsp?selectIndex="+selectIndex;
                                }

                            }else{

                            }
                        }
                    }
                }
            }

            if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
                if(consume_step == 400){    //处理中状态

                }else if(consume_step == 2){
                    if(mouse_index==0){                //control action
                        /**index换为消费id*/
//                        if(selectIndex==0){
//                            consume_item_index = 1 + (select_title_vertical_Index*5+select_title_horizontal_Index);
//                        }else if(selectIndex==1){
//                            consume_item_index = 61+(select_title_vertical_Index*5+select_title_horizontal_Index);
//                        }else if(selectIndex==2){
//                            consume_item_index = 181+(select_title_vertical_Index*5+select_title_horizontal_Index);
//                        }
//                        document.getElementById("test_div").innerHTML = "consume_item_index:"+consume_item_index;
                        window.location.href = "the9InputScreen.jsp?consume_item_index="+consume_item_index+"&preScreen=teamscreen"+"&grouptype="+selectIndex; /**传送的是消费id*/
                    }else if(mouse_index==1){
                        <jsp:include page="topuphtmls/teamscreen/consume_direct_result2_1.jsp"></jsp:include>
//                        window.location.href = "teamscreen.jsp?select_Index="+selectIndex;
                    }
                }else if(consume_step==3){
                    /**index换为消费id*/
//                    if(selectIndex==0){
//                        consume_item_index = (select_title_vertical_Index*5+select_title_horizontal_Index);
//                    }else if(selectIndex==1){
//                        consume_item_index = 61+(select_title_vertical_Index*5+select_title_horizontal_Index);
//                    }else if(selectIndex==2){
//                        consume_item_index = 181+(select_title_vertical_Index*5+select_title_horizontal_Index);
//                    }
//                    mouse();

                    if(mouse_index==0){
                        xmlhttp = MakeHttpRequest();
                        xmlhttp.open("Post", top_consume_url+consume_item_index+"&grouptype="+selectIndex, true);
                        xmlhttp.send();
                        consume_step=400;

                        xmlhttp.onreadystatechange = function () {
                            if (xmlhttp.readyState == 4) {
                                var js = eval(xmlhttp.responseText);
//                                if(js[0].result == 0){
                                    <jsp:include page="topuphtmls/common/consume_direct_result.jsp"></jsp:include>
//                                window.location.href = "teamscreen.jsp?select_Index="+selectIndex;
//                                }
                            }
                        }
                    }else if(mouse_index==1){
                        <jsp:include page="topuphtmls/teamscreen/consume_direct_result2_1.jsp"></jsp:include>
//                        window.location.href = "teamscreen.jsp?select_Index="+selectIndex;
                    }

                }else{
                    if(document.topupflag){
                        window.location.href = "teamscreen.jsp?select_Index="+selectIndex;
                    }else {
                        if(select_title_vertical_Index == 3){
                            if(select_title_horizontal_Index<5){
                                xmlhttp = MakeHttpRequest();
                                xmlhttp.open("Post", team2team_url+"?selected_item_index="+(select_title_horizontal_Index)+"&grouptype="+selectIndex, true);
                                xmlhttp.send();

                                xmlhttp.onreadystatechange = function () {
                                    if (xmlhttp.readyState == 4) {
                                        var js = eval(xmlhttp.responseText);
                                        if(js[0].id == 0){
                                            window.location.href = "teamscreen.jsp?select_Index="+selectIndex;
                                        }else{

                                        }
                                    }
                                }
                            }else {
                                if(selectHeroListSize<3){
                                    document.getElementById("div_div_msg_id").innerHTML = "请选择至少三名类型不同的斗士";
                                    document.getElementById("msgDiv").style.left=120+'px';
                                    document.getElementById("msgDiv").style.top=90+'px';
                                    document.getElementById("div_confirm_id").style.left=250+'px';
                                    document.getElementById("div_confirm_id").style.top=300+'px';
                                    document.topupflag = true;
                                }else{
                                    xmlhttp = MakeHttpRequest();
                                    xmlhttp.open("Post", url, true);
                                    xmlhttp.send();

                                    xmlhttp.onreadystatechange = function () {
                                        if (xmlhttp.readyState == 4) {
                                            var js = eval(xmlhttp.responseText);
                                            if(js[0].id == 0){
                                                var pattern = new RegExp("zte");
                                                if (!pattern.exec(navigator.appName+"")){
                                                    window.location.href = "teamscreen.jsp?select_Index="+selectIndex+"&select_Index_=-1";
                                                }else{
                                                    window.location.href = "gamescreen.jsp?selectIndex="+selectIndex;
                                                }
//                                                window.location.href = "teamscreen.jsp?select_Index="+2+"&select_Index_=-1";
                                            }else{

                                            }
                                        }
                                    }
                                }
                            }

                        } else {
//                            var num_array = new Array(3,7,12);
                            if(select_title_vertical_Index*5+select_title_horizontal_Index<<%=unSelectHeroList.size()%>){
                                /**判断是否已购买*/
                                xmlhttp = MakeHttpRequest();
                                xmlhttp.open("Post", is_got_url+"?item_index="+(select_title_vertical_Index*5+select_title_horizontal_Index)+"&grouptype="+selectIndex, true);    /**item id per page*/
                                xmlhttp.send();

                                xmlhttp.onreadystatechange = function () {
                                    if (xmlhttp.readyState == 4) {
                                        js = eval(xmlhttp.responseText);
                                        if(js[0].result == 0){
                                            //已经购买，则直接选中
                                            xmlhttp = MakeHttpRequest();
                                            xmlhttp.open("Post", team2team_url+"?item_index="+(select_title_vertical_Index*5+select_title_horizontal_Index)+"&grouptype="+selectIndex, true);
                                            xmlhttp.send();

                                            xmlhttp.onreadystatechange = function () {
                                                if (xmlhttp.readyState == 4) {
                                                    var js = eval(xmlhttp.responseText);
                                                    if(js[0].id == 0){
                                                        window.location.href = "teamscreen.jsp?select_Index="+selectIndex;
                                                    }else{

                                                    }
                                                }
                                            }
                                        }else if(js[0].result == 1){
                                            //未购买，则先购买
                                            if(selectIndex==0){
                                                    if(js[0].fighter_id>=5){
                                                        consume_item_index = -1+js[0].fighter_id;
                                                        var fighter_id_temp = js[0].fighter_id;
//                                                        document.getElementById("test_div").innerHTML = js[0].fighter_id;
                                                        <jsp:include page="topuphtmls/taskscreen/is_got__.jsp"></jsp:include>
                                                    }else{
                                                        consume_item_index = -1+js[0].fighter_id;
                                                        <jsp:include page="topuphtmls/taskscreen/consume_.jsp"></jsp:include>
                                                    }
                                            }else if(selectIndex==1){
                                                consume_item_index = 60+js[0].fighter_id-7;
                                                <jsp:include page="topuphtmls/taskscreen/consume_.jsp"></jsp:include>
                                            }else if(selectIndex==2){
                                                consume_item_index = 180+js[0].fighter_id-19;
                                                <jsp:include page="topuphtmls/taskscreen/consume_.jsp"></jsp:include>
                                            }

                                        }
                                    }
                                }
                            }
                        }
                    }

                }
            }

            if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                    ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                window.location.href = "stageMapScreen.jsp";
            }

            if(consume_step==2||consume_step==3){       /**处于消费充值状态*/
                if(keyCode == ZTE.LEFT
                        || keyCode == HW.LEFT
                        || keyCode == UT.LEFT ) {
                    mouse_index--;
                    mouse_index = (mouse_index+2)%2;
                    if(mouse_index==0){
                        document.div_mouse_left_x = 250;
                        document.div_mouse_top_y = 280;
                    }else if(mouse_index==1){
                        document.div_mouse_left_x = 330;
                        document.div_mouse_top_y = 280;
                    }
                }else if(keyCode == ZTE.RIGHT
                        || keyCode == HW.RIGHT
                        || keyCode == UT.RIGHT){
                    mouse_index++;
                    mouse_index = (mouse_index+2)%2;            //control show
                    if(mouse_index==0){
                        document.div_mouse_left_x = 250;
                        document.div_mouse_top_y = 280;
                    }else if(mouse_index==1){
                        document.div_mouse_left_x = 330;
                        document.div_mouse_top_y = 280;
                    }
                }
            }else {
                select_Item(keyCode);
            }
        }

        function transitdd(){
            window.location.href = "teamscreen.jsp?select_Index="+selectIndex;
        }

        function select_Item(keyCode){
            if(keyCode == ZTE.UP
                    || keyCode == HW.UP
                    || keyCode == UT.UP) {            /**向上切换*/
                if(select_title_vertical_Index==3){
                    select_title_vertical_Index=document.currentlistnum-1; /**从已选中栏向被选中栏跳*/
                }else{
                    if(select_title_vertical_Index==0){
                        selectIndex--;
                        if(selectIndex<0){     /**不可从最上跳到最下*/
                            selectIndex = 0;
                        }
                        selectIndex = (selectIndex+4)%4;
                        if(selectIndex!=3) window.location.href = "teamscreen.jsp?select_Index="+selectIndex+"&select_title_horizontal_Index=0";
                    }else{
                        select_title_vertical_Index--;
                    }
                }
            }else if(keyCode == ZTE.DOWN
                    || keyCode == HW.DOWN
                    || keyCode == UT.DOWN){
                if(select_title_vertical_Index==document.currentlistnum-1){      /**向下切换*/
                    if(selectIndex==2){
                        select_title_vertical_Index=3;
                    }else{
                        selectIndex++;
                        if(selectIndex>3){     /**不可从最下跳到最上*/
                            selectIndex = 3;
                        }
                        selectIndex = (selectIndex+4)%4;
                        if(selectIndex!=3) window.location.href = "teamscreen.jsp?select_Index="+selectIndex+"&select_title_horizontal_Index=0";
                    }
                }else{
                    select_title_vertical_Index++;
                }
            }

            if(keyCode == ZTE.LEFT
                    || keyCode == HW.LEFT
                    || keyCode == UT.LEFT
                    ) {
                select_title_horizontal_Index--;
                if(select_title_horizontal_Index==5&&select_title_vertical_Index==3){
                    selectIndex=3;                                   /**战斗*/
                }
            }else if(keyCode == ZTE.RIGHT
                    || keyCode == HW.RIGHT    || keyCode == HW.FOUR
                    || keyCode == UT.RIGHT){
                select_title_horizontal_Index++;
                if(select_title_horizontal_Index==5&&select_title_vertical_Index==3){
                    selectIndex=3;                              /**战斗*/
                }
            }

            if(select_title_vertical_Index<3){         /**未选中*/
                if(select_title_horizontal_Index>4){
                    select_title_horizontal_Index = 4;
                }else if(select_title_horizontal_Index<0){
                    select_title_horizontal_Index = 0;
                }
            }else{
                if(select_title_horizontal_Index>5){      /**已选中*/
                    select_title_horizontal_Index = 5;
                }else if(select_title_horizontal_Index<0){
                    select_title_horizontal_Index = 0;
                }
            }


            if(select_title_vertical_Index>3){
                select_title_vertical_Index = 3;
            }else if(select_title_vertical_Index<0){
                select_title_vertical_Index = 0;
            }

            if(select_title_horizontal_Index==5){
                document.getElementById("div_select_id").style.left = -70;
                document.getElementById("div_select_id").style.top = -80;
            }else{
                if(select_title_vertical_Index!=3){
                    document.getElementById("div_select_id").style.left = 70+select_title_horizontal_Index*80;
                    document.getElementById("div_select_id").style.top = 100+select_title_vertical_Index*80;
                    document.div_mouse_left_x = 70+select_title_horizontal_Index*80;
                    document.div_mouse_top_y = 100+select_title_vertical_Index*80;
                }else{
                    document.getElementById("div_select_id").style.left = 55+select_title_horizontal_Index*80;
                    document.getElementById("div_select_id").style.top = 378+'px';
                    document.div_mouse_left_x = 55+select_title_horizontal_Index*80;
                    document.div_mouse_top_y = 378;
                }
            }

            if(selectIndex == 0){
                document.getElementById("img_team_id1").src = "team/front.png";
                document.getElementById("div_command").innerHTML = '<br>请选择一位铠甲勇士参战   <font size="4px" color="#ff2c50">【按5键快速进入游戏】</font>';
            }else if(selectIndex == 1){
                document.getElementById("img_team_id2").src = "team/middle.png";
                document.getElementById("div_command").innerHTML = '<br>请选择一到两位随从参战   <font size="4px" color="#ff2c50">【按5键快速进入游戏】</font>';
            }else if(selectIndex == 2){
                document.getElementById("img_team_id3").src = "team/behind.png";
                document.getElementById("div_command").innerHTML = '<br>请选择一到两位宠物参战   <font size="4px" color="#ff2c50">【按5键快速进入游戏】</font>';
            }else if(selectIndex == 3){
                document.getElementById("img_team_id4").src = "team/fight.png";
                document.getElementById("div_team_id4").style.left = '462px';
                document.getElementById("div_team_id4").style.top = '375px';
                document.div_mouse_left_x = 77+select_title_horizontal_Index*80;      /**鼠标调到战斗图标上*/
                document.div_mouse_top_y = 383;
            }

        }

        function run(){

            mouse();

            if("<%=(followingPage == null)%>" == "true"){
                /**根据选择变化关卡背景*/

                document.getElementById("img_select_id").src = "team/select.png";
                document.getElementById("div_select_id").style.left = '70px';
                document.getElementById("div_select_id").style.top = '100px';

                if(selectIndex == 0){
                    document.getElementById("img_team_id1").src = "team/front.png";
                    document.getElementById("div_command").innerHTML = '<br>请选择一位铠甲勇士参战   <font size="4px" color="#ff2c50">【按5键快速进入游戏】</font>';
                }else if(selectIndex == 1){
                    document.getElementById("img_team_id2").src = "team/middle.png";
                    document.getElementById("div_command").innerHTML = '<br>请选择一到两位随从参战   <font size="4px" color="#ff2c50">【按5键快速进入游戏】</font>';
                }else if(selectIndex == 2){
                    document.getElementById("img_team_id3").src = "team/behind.png";
                    document.getElementById("div_command").innerHTML = '<br>请选择一到两位宠物参战   <font size="4px" color="#ff2c50">【按5键快速进入游戏】</font>';
                }else if(selectIndex == 3){
                    document.getElementById("img_team_id4").src = "team/fight.png";
                    document.getElementById("div_team_id4").style.left = '462px';
                    document.getElementById("div_team_id4").style.top = '375px';
                    document.div_mouse_left_x = 77+select_title_horizontal_Index*80;      /**鼠标调到战斗图标上*/
                    document.div_mouse_top_y = 383;
                }

                if(select_title_horizontal_Index==5){
                    document.getElementById("div_select_id").style.left = -70;
                    document.getElementById("div_select_id").style.top = -80;
                }else{
                    document.getElementById("div_select_id").style.left = 70+select_title_horizontal_Index*80;
                    document.getElementById("div_select_id").style.top = 100+select_title_vertical_Index*80;
                    document.div_mouse_left_x = 70+select_title_horizontal_Index*80;
                    document.div_mouse_top_y = 100+select_title_vertical_Index*80;
                }
            }else{
                /**从jar返回到jsp界面*/

                window.location.href = "<%=followingPage%>";
            }

        }

        function ajax_send(url,src){
            xmlhttp = MakeHttpRequest();
            xmlhttp.open("Post", url, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].id == 0){
                        window.location.href = src;
                    }else{

                    }
                }
            }
        }

        <jsp:include page="topuphtmls/teamscreen/mouse_js_method.jsp"></jsp:include>

         /**获取账户余额信息*/
        function ajax_show_balance(){
            xmlhttp = MakeHttpRequest();
            xmlhttp.open("Post", balance_support_url, true);
            xmlhttp.send();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(selectIndex==0){
                        if(js[0].balance-price_json.item2[1] < 0){
                            document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币"+"<br>余额不足，需充值"+(price_json.item2[1]-js[0].balance)+"代币";
                            document.getElementById("div_div_msg2_id").innerHTML = "<br><br>(1代币=1人民币)";
                        }else{
                            document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币";
                            consume_step = 3;
                        }
                    }else if(selectIndex==1){
                        if(js[0].balance-price_json.item62[1] < 0){
                            document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币"+"<br>余额不足，需充值"+(price_json.item62[1]-js[0].balance)+"代币";
                            document.getElementById("div_div_msg2_id").innerHTML = "<br><br>(1代币=1人民币)";
                        }else{
                            document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币";
                            consume_step = 3;
                        }
                    }else if(selectIndex==2){
                        if(js[0].balance-price_json.item182[1] < 0){
                            document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币"+"<br>余额不足，需充值"+(price_json.item182[1]-js[0].balance)+"代币";
                            document.getElementById("div_div_msg2_id").innerHTML = "<br><br>(1代币=1人民币)";
                        }else{
                            document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币";
                            consume_step = 3;
                        }
                    }

                }
            }
        }

    </script>
</head>
<body style="background-Repeat:no-repeat" width="640" height="530" onload="run()" >

<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"></div>

    <div id="div1" style='position: absolute;'>
        <img id="id01" src="team/bg.jpg" />
    </div>

    <%
        PropertiesOp propertiesOp = new PropertiesOp();
        Properties properties = propertiesOp.load("/common.properties");
        Properties properties1 = propertiesOp.load("/titleimgpath.properties");
        Properties properties2 = propertiesOp.load("/titleitemimg.properties");

        for (int i = 0; i< unSelectHeroList.size(); i++){
        int x = i%5;
        int y = i/5;

        int left = 70+x*80;
        int top = 100+y*80;
    %>

        <div id="div_row<%=y%>_column<%=x%>_id" style='position:absolute;left:<%=left%>px;top:<%=top%>px;'>
        <img id="img_row<%=y%>_column<%=x%>_id" src=<%=properties.getProperty("titleBgImg")%> />
        </div>

        <div id="div_row<%=y%>_column<%=x%>_item_id" style='position:absolute;left:<%=left%>px;top:<%=top%>px;'>
            <%if(!(unSelectHeroList.get(i).isGot_flag()>0)){%>
            <img id="img_hero_human_id<%=i+1%>" src=<%=properties1.getProperty("titlepath"+(unSelectHeroList.get(i).getFighter_id()))%> />
            <%--未购--%>
            <%}else {%>
            <img id="img_hero_human_id<%=i+1%>" src=<%=properties2.getProperty("titleItem"+(unSelectHeroList.get(i).getFighter_id()))%> />
            <%--已购--%>
            <%}%>
        </div>
    <%}%>

    <%for (int i = 0; i< 5; i++){
        int left = 55+i*80;
    %>
    <div id="div_bottom<%=i%>_id" style='position:absolute;left:<%=left%>px;top:378px;'>
        <img id="img_bottom<%=i%>_id" src="team/kuang.png" />
    </div>
    <%}%>

    <%for (int i = 0; i< selectHeroList.size(); i++){
        int left = 55+i*80;
    %>

    <div id="div_bottom<%=i%>_item_id" style='position:absolute;left:<%=left%>px;top:378px;'>
        <img id="img_bottom<%=i%>_item_id" src=<%=properties2.getProperty("titleItem"+(+selectHeroList.get(i).getFighter_id()))%> />    <%--未购--%>
    </div>
    <%}%>

    <%for (int i = 0; i< 4; i++){
    %>
        <div id="div_team_id<%=i+1%>" style='position: absolute;'>
            <img id="img_team_id<%=i+1%>" src="" />
        </div>
    <%}%>

    <div id="div_select_id">
        <img id="img_select_id" src="" />
    </div>

    <div id="div_command" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 60px; left: 80px;color: #fe8464;">

    </div>

    <jsp:include page="topuphtmls/teamscreen/confirm.jsp"></jsp:include>
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
    <img id="NewStory9" src="touming.png" width="194" height="65" />
</a>

<a>
    <img id="NewStory10" src="touming.png" width="194" height="65" />
</a>

    <%
//        String[] jadNames = {"CP901001/XinKaiJia1.jad","CP901001/XinKaiJia2.jad","CP901001/XinKaiJia3.jad",
//                "CP901001/XinKaiJia4.jad","CP901001/XinKaiJia5.jad"};
//        String[] jarNames = {"CP901001/XinKaiJia1.jar","CP901001/XinKaiJia2.jar","CP901001/XinKaiJia3.jar",
//                "CP901001/XinKaiJia4.jar","CP901001/XinKaiJia5.jar"};

        Integer selected_stage= Integer.valueOf((String) session.getAttribute("selected_stage"));

        String ServerURL = application.getInitParameter("ServerURL");
        String UserID = (String)session.getAttribute("UserID");
        String adAccount = (String)session.getAttribute("adAccount");
        String ProductID = (String)session.getAttribute("ProductID");
        String UserToken = (String)session.getAttribute("UserToken");
        String IsAutoTopUp = application.getInitParameter("IsAutoTopUp");
        String IsActiveOnOK = application.getInitParameter("IsActiveOnOK");
        String ImageURL = application.getInitParameter("ImageURL");

        /**获取敌方成员*/
        List<EnemyTeam> enemyTeamList = new ArrayList<EnemyTeam>();
        double sum_enemy_hp_num = 0;

        if(session.getAttribute("enemy_team")!=null){
            enemyTeamList = (List<EnemyTeam>) JSON.toObject((String) session.getAttribute("enemy_team"), EnemyTeam.class);
        }

        for(int h = 0; h < enemyTeamList.size(); h++){
            sum_enemy_hp_num = enemyTeamList.get(h).getHpNumber();
        }

        int select_Index_ = 0;
        if(request.getParameter("select_Index_")!=null){
            select_Index_ = Integer.valueOf(request.getParameter("select_Index_"));
        }
    %>


     <%if(select_Index_ == -1){%>

        <div style="position:absolute; left:0px; top:0px; width:640px; height:526px; z-index:1">
            <!--<object id="j2meapp" classid="clsid:72E6F181-D1B0-4C22-B0D7-4A0740EEAEF5" width="640" height="530">-->
            <object id="j2meapp" classid="ipanel:j2me-midp2" width="640" height="530">
                <param name="-Xkeypass" value="true" />
                <param name="bgcolor" value="#000000" />
                <param name="jad" value="CP901001/XinKaiJia1.jad" />
                <param name="jar" value="CP901001/XinKaiJia1.jar" />
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
                <param name="selected_stage" value="<%=selected_stage%>" />
                <param name="game_info_url" value="<%=host%>/HttpService/GameInfoServlet.ashx" />
                <param name="return_url" value="<%=host%>" />
            </object>
        </div>

     <%}%>
</body>
</html>