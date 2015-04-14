<%@ page import="java.util.List" %>
<%@ page import="beans.FighterBean" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="java.util.Properties" %>
<%@ page import="com.fancyy.json.util.JSON" %>
<%@ page import="common.JsonToBean" %>
<%@ page import="iptvNet.NetHander" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-7-22
  Time: 下午8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

    /**获取 hero list*/
    List<FighterBean> heroList = (List<FighterBean>) session.getAttribute("_FighterData");

    int selectIndex = 0;

    if(session.getAttribute("=selectIndex=")!=null){
        selectIndex = ((Integer) session.getAttribute("=selectIndex=")).intValue();
    }

    if(request.getParameter("selectIndex")!=null){
        selectIndex = Integer.valueOf(request.getParameter("selectIndex")).intValue();
    }

    NetHander netHander = new NetHander(application.getInitParameter("ServerURL"), (String) session.getAttribute("UserID"), (String) session.getAttribute("ProductID"), (String) session.getAttribute("adAccount"), (String) session.getAttribute("UserToken"));


    if(heroList.get(3).isGot_flag()>0){
        heroList.get(0).setGot_flag(2);
    }
    if(heroList.get(4).isGot_flag()>0){
        heroList.get(1).setGot_flag(2);
    }
    if(heroList.get(5).isGot_flag()>0){
        heroList.get(2).setGot_flag(2);
    }
    if(heroList.get(6).isGot_flag()>0){
        heroList.get(2).setGot_flag(3);
    }

    String updateHeroData = JSON.toJson(heroList);
    session.setAttribute("_FighterData", JsonToBean.jsonTobean(updateHeroData));
    netHander.saveGameData(updateHeroData, 1);

    String[] feiying_light_array = new String[]{"xinxuanren/biesheng3/images/xinxuanrenfei.jpg","xinxuanren/biesheng3/images/xinxuanrenfei.jpg","xinxuanren/biesheng3/xinxuanrenqiangfeilight.jpg"};
    String[] feiying_gloomy_array = new String[]{"xinxuanren/biesheng3/huixinxuanrenfei.jpg","xinxuanren/biesheng3/huixinxuanrenfei.jpg","xinxuanren/biesheng3/xinxuanrenqiangfei.jpg"};

    String[] xingtian_light_array = new String[]{"xinxuanren/biesheng3/images/xinxuanren_04.jpg","xinxuanren/biesheng3/images/xinxuanren_04.jpg","xinxuanren/biesheng3/images/xinxuanrenqiangxing.jpg"};
    String[] xingtian_gloomy_array = new String[]{"xinxuanren/biesheng3/huixinxuanren_04.jpg","xinxuanren/biesheng3/huixinxuanren_04.jpg","xinxuanren/biesheng3/huixinxuanrenqiangxing.jpg"};

    String[] jinggang_light_array = new String[]{"xinxuanren/biesheng3/images/xinxuanren_06.jpg","xinxuanren/biesheng3/images/xinxuanren_06.jpg","xinxuanren/biesheng3/images/xinxuanrenqiang.jpg","xinxuanren/biesheng3/xinxuanren_02.jpg"};
    String[] jinggang_gloomy_array = new String[]{"xinxuanren/biesheng3/xinxuanren_06.jpg","xinxuanren/biesheng3/xinxuanren_06.jpg","xinxuanren/biesheng3/huixinxuanrenqiang.jpg","xinxuanren/biesheng3/huixinxuanren_02.jpg"};

    /**取出价格的json数据*/
    String propname0 = "/follow_consume/consume_info.properties";
    PropertiesOp propertiesOp = new PropertiesOp();
    Properties properties = propertiesOp.load(propname0);
    String buy_prices = properties.getProperty("buy_prices");
//    buy_prices=new String(buy_prices.getBytes("ISO-8859-1"),"gbk");

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
    <title>hero</title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        #select_01
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 0px;
            top: 0px;
        }

        #select_02
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 215px;
            top: 490px;
        }

        #select_03
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 430px;
            top: 490px;
        }

        #select_04
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 410px;
            top: -500px;
        }

        #msgDiv
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: -320px;
            top: -390px;
        }

    </style>
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript" src="include/common.js"></script>
    <script type="text/javascript">

        var price_json = <%=buy_prices%>;   /**js 解析json数据*/

        var selectIndex = <%=selectIndex%>;
        var num = 0;

        var two_pressed = false;

        var top_up = false;

        var temp_video_img_array;
        var hou_video_img_array_index=0;
        var hou_video_img_array = new Array("xinxuanren/biesheng2/1.jpg","xinxuanren/biesheng2/2.jpg","xinxuanren/biesheng2/3.jpg","xinxuanren/biesheng2/4.jpg","xinxuanren/biesheng2/5.jpg","xinxuanren/biesheng2/6.jpg","xinxuanren/biesheng2/7.jpg","xinxuanren/biesheng2/8.jpg","xinxuanren/biesheng2/9.jpg","xinxuanren/biesheng2/10.jpg","xinxuanren/biesheng2/11.jpg","xinxuanren/biesheng2/12.jpg","xinxuanren/biesheng2/13.jpg","xinxuanren/biesheng2/14.jpg","xinxuanren/biesheng2/15.jpg","xinxuanren/biesheng2/16.jpg","xinxuanren/biesheng2/17.jpg","xinxuanren/biesheng2/18.jpg","xinxuanren/biesheng2/19.jpg","xinxuanren/biesheng2/20.jpg","xinxuanren/biesheng2/21.jpg","xinxuanren/biesheng2/22.jpg","xinxuanren/biesheng2/23.jpg");
        var earth_video_img_array_index=0;
        var earth_video_img_array = new Array("xinxuanren/fei/1.jpg","xinxuanren/fei/2.jpg","xinxuanren/fei/3.jpg","xinxuanren/fei/4.jpg","xinxuanren/fei/5.jpg","xinxuanren/fei/6.jpg","xinxuanren/fei/7.jpg","xinxuanren/fei/8.jpg","xinxuanren/fei/9.jpg","xinxuanren/fei/10.jpg","xinxuanren/fei/11.jpg","xinxuanren/fei/12.jpg","xinxuanren/fei/13.jpg","xinxuanren/fei/14.jpg","xinxuanren/fei/15.jpg","xinxuanren/fei/16.jpg","xinxuanren/fei/17.jpg","xinxuanren/fei/18.jpg","xinxuanren/fei/19.jpg","xinxuanren/fei/20.jpg");
        var water_video_img_array_index=0;
        var water_video_img_array = new Array("xinxuanren/fei/1.jpg","xinxuanren/fei/2.jpg","xinxuanren/fei/3.jpg","xinxuanren/fei/4.jpg","xinxuanren/fei/5.jpg","xinxuanren/fei/6.jpg","xinxuanren/fei/7.jpg","xinxuanren/fei/8.jpg","xinxuanren/fei/9.jpg","xinxuanren/fei/10.jpg","xinxuanren/fei/11.jpg","xinxuanren/fei/12.jpg","xinxuanren/fei/13.jpg","xinxuanren/fei/14.jpg","xinxuanren/fei/15.jpg","xinxuanren/fei/16.jpg","xinxuanren/fei/17.jpg","xinxuanren/fei/18.jpg","xinxuanren/fei/19.jpg","xinxuanren/fei/20.jpg");
        var wind_video_img_array_index=0;
        var wind_video_img_array = new Array("xinxuanren/biesheng1/1.jpg","xinxuanren/biesheng1/2.jpg","xinxuanren/biesheng1/3.jpg","xinxuanren/biesheng1/4.jpg","xinxuanren/biesheng1/5.jpg","xinxuanren/biesheng1/6.jpg","xinxuanren/biesheng1/7.jpg","xinxuanren/biesheng1/8.jpg","xinxuanren/biesheng1/9.jpg","xinxuanren/biesheng1/10.jpg","xinxuanren/biesheng1/11.jpg","xinxuanren/biesheng1/12.jpg","xinxuanren/biesheng1/13.jpg","xinxuanren/biesheng1/14.jpg","xinxuanren/biesheng1/15.jpg","xinxuanren/biesheng1/16.jpg","xinxuanren/biesheng1/17.jpg","xinxuanren/biesheng1/18.jpg","xinxuanren/biesheng1/19.jpg","xinxuanren/biesheng1/20.jpg");

        var consume_item_index = 0;
        var consume_step = 0;
        var hero2MainAction_url = "<%=host%>/HttpService/Hero2MainAction.ashx";
        var hero2heroAction_url = "<%=host%>/HttpService/Hero2HeroAction.ashx";
        var balance_support_url = "<%=host%>/HttpService/BalanceSupport.ashx";
        var top_consume_url = "<%=host%>/HttpService/hero.ashx?Type=0&GameID=100536&Number=10&consume_item_index=";

        var mouse_index = <%=button_index%>;
        var indexframe_mouse = 0;
        var div_mouse_left_x = -250;
        var div_mouse_top_y = -280;

        var price_ = 0;

        //触发onkeypress事件
        document.onkeypress = onKeyPress;
        document.button_up_and_down = 1;

        $(document.body).css({
           "overflow-x":"hidden",
           "overflow-y":"hidden"
        });

        function onKeyPress(){

            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                    ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                window.location.href = "limboscreen.jsp";
            }

            <jsp:include page="topuphtmls/heroscreen/up_down_key.jsp"></jsp:include>

            <jsp:include page="topuphtmls/heroscreen/left_right_key.jsp"></jsp:include>

            if(consume_step!=2&&consume_step!=4){     /**处于非消费状态*/
                document.getElementById("select_01").style.top = 75;
                document.getElementById("select_02").style.top = 75;
                document.getElementById("select_03").style.top = 75;
                document.getElementById("select_04").style.top = -500;

                if(document.button_up_and_down==0){
                    /**选中上排按钮*/
                    document.getElementById("attack1").src="xinxuanren/go_01.png";
                    <%if(heroList!=null&&heroList.get(1).isGot_flag()>0){%>
                    document.getElementById("div_img_attack22").src="xinxuanren/go_01.png";
                    <%}else {%>
                    document.getElementById("div_img_attack22").src="xinxuanren/icon_01.png";
                    <%}%>
                    <%if(heroList!=null&&heroList.get(2).isGot_flag()>0){%>
                    document.getElementById("div_img_attack33").src="xinxuanren/go_01.png";
                    <%}else {%>
                    document.getElementById("div_img_attack33").src="xinxuanren/icon_01.png";
                    <%}%>

                    /**选中上排按钮切换*/
                    document.getElementById("img_qianghua").src="xinxuanren/qiang_01.png";
                    document.getElementById("img_qianghua2").src="xinxuanren/qiang_01.png";
                    document.getElementById("img_qianghua3").src="xinxuanren/qiang_01.png";

                    document.getElementById("id_select1").src="<%=feiying_gloomy_array[heroList.get(0).isGot_flag()]%>";
                    document.getElementById("id_select2").src="<%=xingtian_gloomy_array[heroList.get(1).isGot_flag()]%>";
                    document.getElementById("id_select3").src="<%=jinggang_gloomy_array[heroList.get(2).isGot_flag()]%>";

                    switch(selectIndex){
                        case 0:

                            /**选中上排按钮切换*/
                            document.getElementById("img_qianghua").src="xinxuanren/qiang_03.png";
                            document.getElementById("id_select1").src="<%=feiying_light_array[heroList.get(0).isGot_flag()]%>";
                            break;
                        case 1:

                            /**选中上排按钮切换*/
                            document.getElementById("img_qianghua2").src="xinxuanren/qiang_03.png";
                            document.getElementById("id_select2").src="<%=xingtian_light_array[heroList.get(1).isGot_flag()]%>";

                            break;
                        case 2:

                            /**选中上排按钮切换*/
                            document.getElementById("img_qianghua3").src="xinxuanren/qiang_03.png";
                            document.getElementById("id_select3").src="<%=jinggang_light_array[heroList.get(2).isGot_flag()]%>";
                            break;

                    }
                }else{
                    /**选中上排按钮切换*/
                    document.getElementById("img_qianghua").src="xinxuanren/qiang_01.png";
                    document.getElementById("img_qianghua2").src="xinxuanren/qiang_01.png";
                    document.getElementById("img_qianghua3").src="xinxuanren/qiang_01.png";

                    document.getElementById("id_select1").src="<%=feiying_gloomy_array[heroList.get(0).isGot_flag()]%>";
                    document.getElementById("id_select2").src="<%=xingtian_gloomy_array[heroList.get(1).isGot_flag()]%>";
                    document.getElementById("id_select3").src="<%=jinggang_gloomy_array[heroList.get(2).isGot_flag()]%>";

                    /**选中底排按钮*/
                    document.getElementById("attack1").src="xinxuanren/go_01.png";
                    <%if(heroList!=null&&heroList.get(1).isGot_flag()>0){%>
                    document.getElementById("div_img_attack22").src="xinxuanren/go_01.png";
                    <%}else {%>
                    document.getElementById("div_img_attack22").src="xinxuanren/icon_01.png";
                    <%}%>
                    <%if(heroList!=null&&heroList.get(2).isGot_flag()>0){%>
                    document.getElementById("div_img_attack33").src="xinxuanren/go_01.png";
                    <%}else {%>
                    document.getElementById("div_img_attack33").src="xinxuanren/icon_01.png";
                    <%}%>

//                    document.getElementById("test_div").innerHTML = "selectIndex:"+selectIndex;

                    switch(selectIndex){
                        case 0:
                                /**选中底排按钮*/
                                document.getElementById("attack1").src="xinxuanren/go_03.png";
                                document.getElementById("id_select1").src="<%=feiying_light_array[heroList.get(0).isGot_flag()]%>";

                            break;
                        case 1:
                                /**选中底排按钮*/
                                document.getElementById("div_img_attack22").src="xinxuanren/go_03.png";
                                document.getElementById("id_select2").src="<%=xingtian_light_array[heroList.get(1).isGot_flag()]%>";
                                <%if(heroList!=null&&heroList.get(1).isGot_flag()>0){%>
                                     document.getElementById("div_img_attack22").src="xinxuanren/go_03.png";
                                <%}else {%>
                                     document.getElementById("div_img_attack22").src="xinxuanren/icon_03.png";
                                <%}%>

                            break;
                        case 2:
                                /**选中底排按钮*/

                                document.getElementById("id_select3").src="<%=jinggang_light_array[heroList.get(2).isGot_flag()]%>";
                                <%if(heroList!=null&&heroList.get(2).isGot_flag()>0){%>
                                    document.getElementById("div_img_attack33").src="xinxuanren/go_03.png";
                                <%}else {%>
                                    document.getElementById("div_img_attack33").src="xinxuanren/icon_03.png";
                                <%}%>

                            break;

                    }
                }

            }

            if(keyCode == ZTE.OK || keyCode == UT.OK || keyCode == HW.OK) {
                if(consume_step==400){

                }else if(consume_step==6){                                         /**已经完成强化*/
                    window.location.href = "hero.jsp?selectIndex="+selectIndex;
                }else if(consume_step==4){                                         /**强化直充消费id 1000~1002*/
                    if(mouse_index==0){                //control action
//                        document.getElementById("test_div").innerHTML = "consume_item_index="+(1000+selectIndex);
                        if(selectIndex==2){
                            selectIndex = selectIndex + <%=heroList.get(5).isGot_flag()%>;
                        }
                        window.location.href = "the9InputScreen.jsp?consume_item_index="+(1000+selectIndex);
                    }else if(mouse_index==1){
                        <jsp:include page="topuphtmls/heroscreen/consume_direct_result2_1.jsp"></jsp:include>
//                        window.location.href = "hero.jsp?selectIndex="+selectIndex;
                    }
                }else if(consume_step==5){                    /**强化直接扣费id 1000~1002*/
                    if(mouse_index==0){
                        if(selectIndex==2){
                            selectIndex = selectIndex + <%=heroList.get(5).isGot_flag()%>;
                        }
                       <jsp:include page="topuphtmls/heroscreen/consume_direct5_0.jsp"></jsp:include>
                    }else if(mouse_index==1){
                       <jsp:include page="topuphtmls/heroscreen/consume_direct_result2_1.jsp"></jsp:include>
                    }

                }else if(consume_step==2){
                    if(mouse_index==0){                //control action
//                        document.getElementById("test_div").innerHTML = "consume_item_index="+selectIndex;
                        window.location.href = "the9InputScreen.jsp?consume_item_index="+selectIndex;
                    }else if(mouse_index==1){
                        <jsp:include page="topuphtmls/heroscreen/consume_direct_result2_1.jsp"></jsp:include>
//                        window.location.href = "hero.jsp?selectIndex="+selectIndex;
                    }
                }else if(consume_step==3){
                    if(mouse_index==0){
                        <jsp:include page="topuphtmls/heroscreen/consume_direct3_0.jsp"></jsp:include>
                        <%--<jsp:include page="topuphtmls/heroscreen/consume_direct5_0.jsp"></jsp:include>--%>
                    }else if(mouse_index==1){
                        <jsp:include page="topuphtmls/heroscreen/consume_direct_result2_1.jsp"></jsp:include>
                    }

                }else{
                    if(document.button_up_and_down==0){   /**上下排判断*/
                        if(selectIndex==0){
                            <%if(heroList!=null&&heroList.get(0).isGot_flag()!=2){%>
                                earth_video_array_play();   /**强化*/
                            <%}else {%>
                                <jsp:include page="topuphtmls/heroscreen/finish_topup.jsp"></jsp:include>
                            <%}%>
                        }else if(selectIndex==1){
                            <%if(heroList!=null&&heroList.get(1).isGot_flag()!=2){%>
                                wind_video_array_play();    /**强化*/
                            <%}else {%>
                                <jsp:include page="topuphtmls/heroscreen/finish_topup.jsp"></jsp:include>
                            <%}%>
                        }else if(selectIndex==2){
                            <%if(heroList!=null&&heroList.get(2).isGot_flag()!=3){%>
                                hou_video_array_play();    /**强化*/
                            <%}else {%>
                                <jsp:include page="topuphtmls/heroscreen/finish_topup.jsp"></jsp:include>
                            <%}%>
                        }
                    }else{
                        if(selectIndex==0){
                            earth_video_array_play1();   /**进入游戏*/
                        }else if(selectIndex==1){
                            wind_video_array_play1();    /**进入游戏*/
                        }else if(selectIndex==2){
                            hou_video_array_play1();    /**进入游戏*/
                        }
                    }

                }
            }
        }

        function transitdd(){
            window.location.href = "hero.jsp?selectIndex="+selectIndex;
        }

        function earth_video_array_play(){
            consume_step = 4;         /**更新为充值状态*/
            document.getElementById("select_01").style.top = -575;
            document.getElementById("select_02").style.top = -575;
            document.getElementById("select_03").style.top = -575;
            document.getElementById("img_video_id").src = earth_video_img_array[(earth_video_img_array_index+earth_video_img_array.length)%earth_video_img_array.length];
            earth_video_img_array_index++;
            if(earth_video_img_array_index<earth_video_img_array.length){
                document.getElementById("div_video_id").style.left = -1000;
            }else{
                document.getElementById("div_video_id").style.left = 35;
            }
            if(earth_video_img_array_index<earth_video_img_array.length){
                setTimeout("earth_video_array_play()",100);         // download img src
            }else if (earth_video_img_array_index<earth_video_img_array.length*2){
                setTimeout("earth_video_array_play()",200);         // control the FPS
            }else{

                document.getElementById("div_div_msg_id").innerHTML = "您是否要强化铠甲勇士飞影侠? <br>资费:"+price_json.item1000[1]+"代币";
                price_  =  price_json.item1000[1];
                ajax_show_balance1();
                document.getElementById("msgDiv").style.left=120;
                document.getElementById("msgDiv").style.top=90;
                document.getElementById("div_confirm_id").style.left=230+'px';
                document.getElementById("div_confirm_id").style.top=300+'px';
                document.getElementById("div_cancel_id").style.left=310+'px';
                document.getElementById("div_cancel_id").style.top=300+'px';
                document.getElementById("div_mouse_id").style.left=230+'px';
                document.getElementById("div_mouse_id").style.top=300+'px';
                if(0==<%=button_index%>){
                    div_mouse_left_x = 250;
                    div_mouse_top_y = 280;
                }else if(1==<%=button_index%>){
                    div_mouse_left_x = 330;
                    div_mouse_top_y = 280;
                }
            }
        }

        function earth_video_array_play1(){    /**进入游戏*/
            xmlhttp = MakeHttpRequest();

            xmlhttp.open("Post", hero2MainAction_url+"?selectIndex="+selectIndex, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].id == 0){
                        window.location.href =  "hero2main.jsp?hero_index="+selectIndex;
                    }else{

                    }
                }
            }
        }

        function wind_video_array_play(){
            consume_step = 4;         /**更新为充值状态*/
            <%if(heroList!=null&&heroList.get(1).isGot_flag()==0){%>
                <jsp:include page="topuphtmls/heroscreen/finish_topup.jsp"></jsp:include>
                document.getElementById("div_div_msg_id").innerHTML = "请您先召唤该铠甲勇士。";
                consume_step = 6;
                div_mouse_left_x = 300;
                div_mouse_top_y = 280;
            <%}else{%>
                document.getElementById("select_01").style.top = -575;
                document.getElementById("select_02").style.top = -575;
                document.getElementById("select_03").style.top = -575;
                document.getElementById("img_video_id").src = wind_video_img_array[(wind_video_img_array_index+wind_video_img_array.length)%wind_video_img_array.length];
                wind_video_img_array_index++;
                if(wind_video_img_array_index<wind_video_img_array.length){
                    document.getElementById("div_video_id").style.left = -1000;
                }else{
                    document.getElementById("div_video_id").style.left = 35;
                }
                if(wind_video_img_array_index<wind_video_img_array.length){
                    setTimeout("wind_video_array_play()",100);         // download img src
                }else if (wind_video_img_array_index<wind_video_img_array.length*2){
                    setTimeout("wind_video_array_play()",200);         // control the FPS
                }else{
                    <%if(heroList!=null&&heroList.get(1).isGot_flag()==1){%>

                        document.getElementById("div_div_msg_id").innerHTML = "您是否要强化铠甲勇士刑天侠? <br>资费:"+price_json.item1001[1]+"代币";
                        price_  =  price_json.item1001[1];
                        ajax_show_balance1();
                    <%}%>
                    document.getElementById("msgDiv").style.left=120;
                    document.getElementById("msgDiv").style.top=90;
                    document.getElementById("div_confirm_id").style.left=230+'px';
                    document.getElementById("div_confirm_id").style.top=300+'px';
                    document.getElementById("div_cancel_id").style.left=310+'px';
                    document.getElementById("div_cancel_id").style.top=300+'px';
                    document.getElementById("div_mouse_id").style.left=230+'px';
                    document.getElementById("div_mouse_id").style.top=300+'px';
                    if(0==<%=button_index%>){
                        div_mouse_left_x = 250;
                        div_mouse_top_y = 280;
                    }else if(1==<%=button_index%>){
                        div_mouse_left_x = 330;
                        div_mouse_top_y = 280;
                    }
                }
            <%}%>
        }

        function wind_video_array_play1(){                /**进入游戏*/
            <%if(heroList!=null&&heroList.get(1).isGot_flag()>0){%>
            xmlhttp = MakeHttpRequest();

            xmlhttp.open("Post", hero2MainAction_url+"?selectIndex="+selectIndex, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].id == 0){
                        window.location.href =  "hero2main.jsp?hero_index="+selectIndex;
                    }else{

                    }
                }
            }
            <%}else {%>
                consume_step = 2;         /**更新为充值状态*/
                document.getElementById("div_div_msg_id").innerHTML = "您是否要购买铠甲勇士刑天侠? <br>资费:"+price_json.item1[1]+"代币";
                price_  =  price_json.item1[1];
                ajax_show_balance1();
                document.getElementById("msgDiv").style.left=120;
                document.getElementById("msgDiv").style.top=90;
                document.getElementById("div_confirm_id").style.left=230+'px';
                document.getElementById("div_confirm_id").style.top=300+'px';
                document.getElementById("div_cancel_id").style.left=310+'px';
                document.getElementById("div_cancel_id").style.top=300+'px';
                document.getElementById("div_mouse_id").style.left=230+'px';
                document.getElementById("div_mouse_id").style.top=300+'px';
                if(0==<%=button_index%>){
                    div_mouse_left_x = 250;
                    div_mouse_top_y = 280;
                }else if(1==<%=button_index%>){
                    div_mouse_left_x = 330;
                    div_mouse_top_y = 280;
                }
            <%}%>
        }

        function hou_video_array_play(){
            consume_step = 4;         /**更新为充值状态*/
            <%if(heroList!=null&&heroList.get(2).isGot_flag()==0){%>
                <jsp:include page="topuphtmls/heroscreen/finish_topup.jsp"></jsp:include>
                document.getElementById("div_div_msg_id").innerHTML = "请您先召唤该铠甲勇士。";
                consume_step = 6;
                div_mouse_left_x = 300;
                div_mouse_top_y = 280;
            <%}else {%>
                document.getElementById("select_01").style.top = -575;
                document.getElementById("select_02").style.top = -575;
                document.getElementById("select_03").style.top = -575;
                document.getElementById("img_video_id").src = hou_video_img_array[(hou_video_img_array_index+hou_video_img_array.length)%hou_video_img_array.length];
                hou_video_img_array_index++;
                if(hou_video_img_array_index<hou_video_img_array.length){
                    document.getElementById("div_video_id").style.left = -1000;
                }else{
                    document.getElementById("div_video_id").style.left = 35;
                }
                if(hou_video_img_array_index<hou_video_img_array.length){
                    setTimeout("hou_video_array_play()",100);         // download img src
                }else if (hou_video_img_array_index<hou_video_img_array.length*2){
                    setTimeout("hou_video_array_play()",200);         // control the FPS
                }else{
                    <%if(heroList!=null&&heroList.get(2).isGot_flag()==1){%>
                        consume_step = 4;         /**更新为充值状态*/
                        document.getElementById("div_div_msg_id").innerHTML = "您是否要强化铠甲勇士金刚侠? <br>资费:"+price_json.item1002[1]+"代币";
                        price_  =  price_json.item1002[1];
                        ajax_show_balance1();
                    <%}else if(heroList!=null&&heroList.get(2).isGot_flag()==2){%>
                        consume_step = 4;         /**更新为充值状态*/
                        document.getElementById("div_div_msg_id").innerHTML = "是否强化铠甲勇士超级金刚侠? <br>资费:"+price_json.item1002[1]+"代币";
                        price_  =  price_json.item1002[1];
                        ajax_show_balance1();
                    <%}%>
                        document.getElementById("msgDiv").style.left=120;
                        document.getElementById("msgDiv").style.top=90;
                        document.getElementById("div_confirm_id").style.left=230+'px';
                        document.getElementById("div_confirm_id").style.top=300+'px';
                        document.getElementById("div_cancel_id").style.left=310+'px';
                        document.getElementById("div_cancel_id").style.top=300+'px';
                        document.getElementById("div_mouse_id").style.left=230+'px';
                        document.getElementById("div_mouse_id").style.top=300+'px';
                        if(0==<%=button_index%>){
                            div_mouse_left_x = 250;
                            div_mouse_top_y = 280;
                        }else if(1==<%=button_index%>){
                            div_mouse_left_x = 330;
                            div_mouse_top_y = 280;
                        }
                }
            <%}%>
        }

        function hou_video_array_play1(){   /**进入游戏*/
            <%if(heroList!=null&&heroList.get(2).isGot_flag()>0){%>
            xmlhttp = MakeHttpRequest();

            xmlhttp.open("Post", hero2MainAction_url+"?selectIndex="+selectIndex, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].id == 0){
                        window.location.href =  "hero2main.jsp?hero_index="+selectIndex;
                    }else{

                    }
                }
            }
            <%}else {%>
                consume_step = 2;         /**更新为充值状态*/
                document.getElementById("div_div_msg_id").innerHTML = "您是否要购买铠甲勇士金刚侠? <br>资费:"+price_json.item2[1]+"代币";
                price_  =  price_json.item2[1];
                ajax_show_balance1();
                document.getElementById("msgDiv").style.left=120;
                document.getElementById("msgDiv").style.top=90;
                document.getElementById("div_confirm_id").style.left=230+'px';
                document.getElementById("div_confirm_id").style.top=300+'px';
                document.getElementById("div_cancel_id").style.left=310+'px';
                document.getElementById("div_cancel_id").style.top=300+'px';
                document.getElementById("div_mouse_id").style.left=230+'px';
                document.getElementById("div_mouse_id").style.top=300+'px';
                if(0==<%=button_index%>){
                    div_mouse_left_x = 250;
                    div_mouse_top_y = 280;
                }else if(1==<%=button_index%>){
                    div_mouse_left_x = 330;
                    div_mouse_top_y = 280;
                }
            <%}%>
        }

        function run(){
            mouse();

            /**根据是否购买显示召唤or出击*/
            document.getElementById("attack1").src="xinxuanren/go_01.png";
            <%if(heroList!=null&&heroList.get(1).isGot_flag()>0){%>
                document.getElementById("div_img_attack22").src="xinxuanren/go_01.png";
            <%}else {%>
                document.getElementById("div_img_attack22").src="xinxuanren/icon_01.png";
            <%}%>
            <%if(heroList!=null&&heroList.get(2).isGot_flag()>0){%>
                document.getElementById("div_img_attack33").src="xinxuanren/go_01.png";
            <%}else {%>
                document.getElementById("div_img_attack33").src="xinxuanren/icon_01.png";
            <%}%>

//            document.getElementById("test_div").innerHTML = "selectIndex:"+selectIndex;
            <%--document.getElementById("test_div").innerHTML = <%=session.getAttribute("=selectIndex=")%>;--%>

            document.getElementById("select_01").style.top = 75;
            document.getElementById("select_02").style.top = 75;
            document.getElementById("select_03").style.top = 75;
            document.getElementById("select_04").style.top = -500;

            if(selectIndex>=3){
                /**选中上排按钮*/
                document.getElementById("attack1").src="xinxuanren/go_01.png";
                <%if(heroList!=null&&heroList.get(1).isGot_flag()>0){%>
                document.getElementById("div_img_attack22").src="xinxuanren/go_01.png";
                <%}else {%>
                document.getElementById("div_img_attack22").src="xinxuanren/icon_01.png";
                <%}%>
                <%if(heroList!=null&&heroList.get(2).isGot_flag()>0){%>
                document.getElementById("div_img_attack33").src="xinxuanren/go_01.png";
                <%}else {%>
                document.getElementById("div_img_attack33").src="xinxuanren/icon_01.png";
                <%}%>

                /**选中上排按钮切换*/
                document.getElementById("img_qianghua").src="xinxuanren/qiang_01.png";
                document.getElementById("img_qianghua2").src="xinxuanren/qiang_01.png";
                document.getElementById("img_qianghua3").src="xinxuanren/qiang_01.png";

                document.getElementById("id_select1").src="<%=feiying_gloomy_array[heroList.get(0).isGot_flag()]%>";
                document.getElementById("id_select2").src="<%=xingtian_gloomy_array[heroList.get(1).isGot_flag()]%>";
                document.getElementById("id_select3").src="<%=jinggang_gloomy_array[heroList.get(2).isGot_flag()]%>";
            }else{
                /**选中上排按钮切换*/
                document.getElementById("img_qianghua").src="xinxuanren/qiang_01.png";
                document.getElementById("img_qianghua2").src="xinxuanren/qiang_01.png";
                document.getElementById("img_qianghua3").src="xinxuanren/qiang_01.png";

                document.getElementById("id_select1").src="<%=feiying_gloomy_array[heroList.get(0).isGot_flag()]%>";
                document.getElementById("id_select2").src="<%=xingtian_gloomy_array[heroList.get(1).isGot_flag()]%>";
                document.getElementById("id_select3").src="<%=jinggang_gloomy_array[heroList.get(2).isGot_flag()]%>";

                /**选中底排按钮*/
                document.getElementById("attack1").src="xinxuanren/go_01.png";
                <%if(heroList!=null&&heroList.get(1).isGot_flag()>0){%>
                document.getElementById("div_img_attack22").src="xinxuanren/go_01.png";
                <%}else {%>
                document.getElementById("div_img_attack22").src="xinxuanren/icon_01.png";
                <%}%>
                <%if(heroList!=null&&heroList.get(2).isGot_flag()>0){%>
                document.getElementById("div_img_attack33").src="xinxuanren/go_01.png";
                <%}else {%>
                document.getElementById("div_img_attack33").src="xinxuanren/icon_01.png";
                <%}%>
            }

            switch(selectIndex){
                case 0:
                    /**选中底排按钮*/
                    document.getElementById("attack1").src="xinxuanren/go_03.png";
                    document.getElementById("id_select1").src="<%=feiying_light_array[heroList.get(0).isGot_flag()]%>";

                    break;
                case 1:
                    /**选中底排按钮*/
                    document.getElementById("div_img_attack22").src="xinxuanren/go_03.png";
                    document.getElementById("id_select2").src="<%=xingtian_light_array[heroList.get(1).isGot_flag()]%>";
                <%if(heroList!=null&&heroList.get(1).isGot_flag()>0){%>
                    document.getElementById("div_img_attack22").src="xinxuanren/go_03.png";
                <%}else {%>
                    document.getElementById("div_img_attack22").src="xinxuanren/icon_03.png";
                <%}%>

                    break;
                case 2:
                    /**选中底排按钮*/

                    document.getElementById("id_select3").src="<%=jinggang_light_array[heroList.get(2).isGot_flag()]%>";
                <%if(heroList!=null&&heroList.get(2).isGot_flag()>0){%>
                    document.getElementById("div_img_attack33").src="xinxuanren/go_03.png";
                <%}else {%>
                    document.getElementById("div_img_attack33").src="xinxuanren/icon_03.png";
                <%}%>

                    break;
                case 3:

                    /**选中上排按钮切换*/
                    document.getElementById("img_qianghua").src="xinxuanren/qiang_03.png";
                    document.getElementById("id_select1").src="<%=feiying_light_array[heroList.get(0).isGot_flag()]%>";
                    break;
                case 4:

                    /**选中上排按钮切换*/
                    document.getElementById("img_qianghua2").src="xinxuanren/qiang_03.png";
                    document.getElementById("id_select2").src="<%=xingtian_light_array[heroList.get(1).isGot_flag()]%>";

                    break;
                case 5:

                    /**选中上排按钮切换*/
                    document.getElementById("img_qianghua3").src="xinxuanren/qiang_03.png";
                    document.getElementById("id_select3").src="<%=jinggang_light_array[heroList.get(2).isGot_flag()]%>";
                    break;
                case 6:

                    /**选中上排按钮切换*/
                    document.getElementById("img_qianghua3").src="xinxuanren/qiang_03.png";
                    document.getElementById("id_select3").src="<%=jinggang_light_array[heroList.get(2).isGot_flag()]%>";
                    break;
            }
        }

        <jsp:include page="topuphtmls/heroscreen/ajax_show_balance.jsp"></jsp:include>

        function mouse(){
            indexframe_mouse ++;
            indexframe_mouse  = (indexframe_mouse+5)%5;
            document.getElementById("div_mouse_id").style.left = div_mouse_left_x-indexframe_mouse;
            document.getElementById("div_mouse_id").style.top = div_mouse_top_y+indexframe_mouse;

            setTimeout("mouse()",150);
        }

        Box.OK = "main.jsp";

    </script>
</head>
<body style="background-Repeat:no-repeat" onload="run()">
<div id="test_div0" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 40px; left: 80px;color: #ffffff;"></div>

<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"></div>

    <div id="div1" style='position: absolute;'>
        <img id="id00" src="xinxuanren/xinxuanren.jpg" />
    </div>

    <div id="div_video_id" style="position: absolute; z-index:2;left: 50px;top: 75px;">
        <img id="img_video_id" src=""/>
    </div>

    <div id="select_01" style='position: absolute;'>
        <img id="id_select1" src="<%=feiying_light_array[heroList.get(0).isGot_flag()]%>" />
    </div>

    <div id="select_02" style='position: absolute;'>
        <img id="id_select2" src="<%=xingtian_gloomy_array[heroList.get(1).isGot_flag()]%>" />
    </div>

    <div id="select_03" style='position: absolute;'>
        <img id="id_select3" src="<%=jinggang_gloomy_array[heroList.get(2).isGot_flag()]%>" />
    </div>

    <div id="select_04" style='position: absolute;'>
        <img id="id_select4" src="hero/select_04.jpg" />
    </div>

    <%--强化按钮--%>
    <div id="div_qianghua" style='position: absolute;left: 30px; top: 420px;'>
        <img id="img_qianghua" src="xinxuanren/qiang_01.png" />
    </div>

    <div id="div_qianghua2" style='position: absolute;left: 250px; top: 420px;'>
        <img id="img_qianghua2" src="xinxuanren/qiang_01.png" />
    </div>

    <div id="div_qianghua3" style='position: absolute;left: 470px; top: 420px;'>
        <img id="img_qianghua3" src="xinxuanren/qiang_01.png" />
    </div>

    <%--召唤出击按钮--%>
    <div id="attack" style='position: absolute;left: 30px;top: 460px;'>
        <img id="attack1" src="xinxuanren/go_01.png" />
    </div>

    <div id="div_attack22" style='position: absolute; left: 250px; top: 460px;'>
        <img id="div_img_attack22" src="xinxuanren/go_01.png" />
    </div>

    <div id="div_attack33" style='position: absolute; left: 470px; top: 460px;'>
        <img id="div_img_attack33" src="xinxuanren/go_01.png" />
    </div>

    <jsp:include page="topuphtmls/heroscreen/topup.jsp"></jsp:include>

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