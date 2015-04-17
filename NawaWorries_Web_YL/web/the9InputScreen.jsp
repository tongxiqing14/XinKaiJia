<%@ page import="java.util.Properties" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="org.json.me.JSONObject" %>
<%@ page import="org.json.me.JSONArray" %>
<%@ page import="iptvNet.NetHander" %>
<%@ page import="common.NetInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-7-28
  Time: 下午3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

    String consume_item_index=request.getParameter("consume_item_index");
    String preScreen = "";
    if(request.getParameter("preScreen")!=null){
        preScreen = request.getParameter("preScreen");
    }

    if(request.getParameter("selectIndex_item")!=null){
        session.setAttribute("selectIndex_item", request.getParameter("selectIndex_item"));
    }

    if(request.getParameter("grouptype")!=null){
        session.setAttribute("grouptype",request.getParameter("grouptype"));
    }

    Integer hero_index = 0;
    if(request.getParameter("task_selectIndex_y")!=null){         /**首先判断外部页面传入的参数*/
        hero_index = Integer.valueOf(request.getParameter("task_selectIndex_y"));
    }

    String IsActiveOnOK = application.getInitParameter("IsActiveOnOK");        /**设置初始选中是否为OK按钮*/
    Integer button_index;

    if(IsActiveOnOK.equals("true")){
        button_index = 0;
    }else {
        button_index = 1;
    }

    NetHander netHander = new NetHander(application.getInitParameter("ServerURL"), (String) session.getAttribute("UserID"), (String) session.getAttribute("ProductID"), (String) session.getAttribute("adAccount"), (String) session.getAttribute("UserToken"));

    NetInfo netInfo = new NetInfo();
    netInfo.setNetHander(netHander);

    /**取出价格的json数据*/
    String propname0 = "/follow_consume/consume_info.properties";
    PropertiesOp propertiesOp = new PropertiesOp();
    Properties properties = propertiesOp.load(propname0);
    String buy_prices = properties.getProperty("buy_prices");
    JSONObject json1 = new JSONObject(buy_prices);
    JSONArray arr11;
    if((Integer.valueOf(consume_item_index)>=4061&&Integer.valueOf(consume_item_index)<=4072)
            ||(Integer.valueOf(consume_item_index)>=4181&&Integer.valueOf(consume_item_index)<=4189)
            || (Integer.valueOf(consume_item_index)>=4001&&Integer.valueOf(consume_item_index)<=4006)
            || (Integer.valueOf(consume_item_index)>=4281&&Integer.valueOf(consume_item_index)<=4287)){
        arr11 = json1.getJSONArray("item4000");
    }else {
        arr11 = json1.getJSONArray("item"+(Integer.valueOf(consume_item_index)));
    }
%>
<html>
<head>
<title></title>
<link href="Styles/default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    #div1
    {
        position:absolute;
        /*width:200px;*/
        /*height:115px;*/
        z-index:1;
        left: -2px;
        top: -2px;
    }

        /*#div2*/
        /*{*/
        /*position:absolute;*/
        /*width:200px;*/
        /*height:115px;*/
        /*z-index:1;*/
        /*left: 90px;*/
        /*top: 100px;*/
        /*}*/

        /*#div3*/
        /*{*/
        /*position:absolute;*/
        /*width:200px;*/
        /*height:115px;*/
        /*z-index:1;*/
        /*left: 130px;*/
        /*top: 350px;*/
        /*}*/

        /*#div4*/
        /*{*/
        /*position:absolute;*/
        /*width:200px;*/
        /*height:115px;*/
        /*z-index:1;*/
        /*left: 330px;*/
        /*top: 350px;*/
        /*}*/

</style>
<script type="text/javascript" src="include/The9.Web.Key.js"></script>
<script type="text/javascript" src="include/raphael-min.js"></script>
<script type="text/javascript">

//var consume_name_array = new Array("靓靓","卡卡","乌拉拉","跳跳","小飞侠","小哈","仔仔","鼠小弟","霹雳");

var hasTongsuoOrNot = false;
var topupIsOver = false;
var topupIsOver1 = false;

var selectIndex = 1;
var url = "<%=host%>/HttpService/the9input.ashx?consume_item_index=<%=consume_item_index%>";
var consume_item_index =<%=consume_item_index%>;

var inputString = "";
var starInput = "";
var starCount = 0;

var ajax_processing = false;

var js;

//触发onkeypress事件
document.onkeypress = onKeyPress;

function on_load(){
    <%--document.getElementById("test_div").innerHTML = "consume_item_index:"+"<%=consume_item_index%>";--%>
    if(0==<%=button_index%>){
        document.getElementById("id22").src = "the9Input/3_1.png";
    }else{
        document.getElementById("id33").src = "the9Input/3_2.png";
    }
}

function onKeyPress(){

//            if(!topupIsOver) {
    var evt = window.event;
    var keyCode = evt.which ? evt.which : evt.keyCode;

    if(hasTongsuoOrNot == true && !ajax_processing){



        if(starCount < 6){
            if(keyCode == ZTE.ZERO || keyCode == HW.ZERO || keyCode == UT.ZERO){
                inputString += 0;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.ONE || keyCode == HW.ONE || keyCode == UT.ONE){
                inputString += 1;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.TWO || keyCode == HW.TWO || keyCode == UT.TWO){
                inputString += 2;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.THREE || keyCode == HW.THREE || keyCode == UT.THREE){
                inputString += 3;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.FOUR || keyCode == HW.FOUR || keyCode == UT.FOUR){
                inputString += 4;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.FIVE || keyCode == HW.FIVE || keyCode == UT.FIVE){
                inputString += 5;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.SIX || keyCode == HW.SIX || keyCode == UT.SIX){
                inputString += 6;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.SEVEN || keyCode == HW.SEVEN || keyCode == UT.SEVEN){
                inputString += 7;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.EIGHT || keyCode == HW.EIGHT || keyCode == UT.EIGHT){
                inputString += 8;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }else if(keyCode == ZTE.NINE || keyCode == HW.NINE || keyCode == UT.NINE){
                inputString += 9;
                starInput += "*";
                starCount ++;
                document.getElementById("div_span_password_id").innerText = starInput;
            }
        }





        if(starCount == 6){

            if(keyCode == ZTE.LEFT
                    || keyCode == HW.LEFT
                    || keyCode == UT.LEFT) {
                selectIndex--;
            }else if(keyCode == ZTE.RIGHT
                    || keyCode == HW.RIGHT
                    || keyCode == UT.RIGHT){
                selectIndex++;
            }

//                    selectIndex = (selectIndex+2)%2;

            if(selectIndex<0){
                selectIndex=0;
            }else if(selectIndex>1){
                selectIndex=1;
            }

            if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
                if(selectIndex == 0){
                    ajax_processing = true;
                    xmlhttp = MakeHttpRequest();
                    xmlhttp.open("Post", url+"&password="+inputString, true);
                    xmlhttp.send();

                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4) {
                            js = eval(xmlhttp.responseText);
    //                                        document.getElementById("test_div").innerHTML = "js[0].id:"+js[0].id+"---js[0].result:"+js[0].result;
                            if(js[0].result != 0 && js[0].result != 1){
                                topupIsOver1 = true;
                                <jsp:include page="topuphtmls/the9input/finish_topup.jsp"></jsp:include>
                                document.getElementById("div_div_msg_id").innerHTML = "请去大厅充值";
                                js[0].result = 0;
                                setTimeout("transit(js)",1000);
                            }else if(js[0].result == 0){        /**如果消费成功，弹出消费成功提示*/
                            topupIsOver1 = true;
                                <jsp:include page="topuphtmls/the9input/finish_topup.jsp"></jsp:include>
                                setTimeout("transit$(js)",1000);
                            }else {
                                <%--<jsp:include page="topuphtmls/the9input/err_input.jsp"></jsp:include>--%>
                                inputString = "";
                                starCount == 0;
                                document.getElementById("id22").src = "the9Input/12.png";
                                setTimeout("transit$_err_input(js)",1000);
                            }

                        }
                    }
                    ajax_processing = false;
                }else if(!topupIsOver1){
                    <jsp:include page="topuphtmls/the9input/finish_topup.jsp"></jsp:include>
                    document.getElementById("div_div_msg_id").innerHTML = "消费失败";
                    setTimeout("transit__(js)",1000);
                }
            }


            if(0==selectIndex){
                document.getElementById("id22").src = "the9Input/10.png";
//        document.getElementById("id33").src = "the9Input/2_2.png";
            }else{
                document.getElementById("id22").src = "the9Input/11.png";
//        document.getElementById("id33").src = "the9Input/3_2.png";
            }

            starCount == 0;
        }


    }else if(!topupIsOver){
        if(keyCode == ZTE.LEFT
                || keyCode == HW.LEFT
                || keyCode == UT.LEFT) {
            selectIndex--;
        }else if(keyCode == ZTE.RIGHT
                || keyCode == HW.RIGHT
                || keyCode == UT.RIGHT){
            selectIndex++;
        }

//                    selectIndex = (selectIndex+2)%2;
        if(selectIndex<0){
            selectIndex=0;
        }else if(selectIndex>1){
            selectIndex=1;
        }

//                    document.getElementById("test_div").innerHTML = "selectIndex:"+selectIndex;

        if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){

            if(selectIndex == 0){
                topupIsOver = true;
                xmlhttp = MakeHttpRequest();
                xmlhttp.open("Post", url, true);
                xmlhttp.send();

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4) {
                        js = eval(xmlhttp.responseText);
                        if(js[0].result != 0 && js[0].result != 1){
                            <jsp:include page="topuphtmls/the9input/finish_topup.jsp"></jsp:include>
                            document.getElementById("div_div_msg_id").innerHTML = "请去大厅充值";
                            js[0].result = 0;
                            setTimeout("transit(js)",1000);
                        }else if(js[0].result == 0){        /**如果消费成功，弹出消费成功提示*/
                        <jsp:include page="topuphtmls/the9input/finish_topup.jsp"></jsp:include>
                        setTimeout("transit(js)",1000);
                        }else {
                            transit(js);
                        }
                    }
                }
            }else{
                <jsp:include page="topuphtmls/the9input/finish_topup.jsp"></jsp:include>
                document.getElementById("div_div_msg_id").innerHTML = "消费失败";
                setTimeout("transit__(js)",1000);
                /**蓝色充值界面【返回】*/
            }
        }

        if(0==selectIndex){
            document.getElementById("id22").src = "the9Input/2_2.png";
//        document.getElementById("id33").src = "the9Input/2_2.png";
        }else{
            document.getElementById("id22").src = "the9Input/2_1.png";
//        document.getElementById("id33").src = "the9Input/3_2.png";
        }
    }


}

function transit$_err_input(js){         //输入童锁密码错误
    <jsp:include page="topuphtmls/the9input/err_input2.jsp"></jsp:include>
    transit$(js);
}

function transit$(js){
//            document.getElementById("test_div").innerText = js[0].id+":"+js[0].result;
    if(js[0].id == 61&&js[0].result == 0){       //购买阿姆特
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 61&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 62&&js[0].result == 0){  //购买混世螳螂
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 62&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 63&&js[0].result == 0){   //购买犀牛王
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 63&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 64&&js[0].result == 0){   //购买傀儡妖人
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 64&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 65&&js[0].result == 0){   //购买金角大王
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 65&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 66&&js[0].result == 0){   //购买双刀战士
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 66&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 67&&js[0].result == 0){   //购买傀儡妖人
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 67&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 68&&js[0].result == 0){    //购买狂血战魔
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 68&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 69&&js[0].result == 0){    //购买鹿角大王
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 69&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 70&&js[0].result == 0){    //购买巨锤战士
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 70&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 71&&js[0].result == 0){     //购买努尔哈赤
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 71&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 72&&js[0].result == 0){     //购买百变火女
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if(js[0].id == 72&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if((js[0].id >= 1&&js[0].id <= 7)&&js[0].result == 0){     //购买人物刑天侠
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "hero.jsp";
        <%}%>
    }else if((js[0].id >= 1&&js[0].id <= 7)&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 2&&js[0].result == 0){      //购买人物金刚侠
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "hero.jsp";
        <%}%>
    }else if(js[0].id == 2&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 1000&&js[0].result == 0){      //购买人物飞影侠
//                document.getElementById("test_div").innerText = "test0";
        window.location.href = "hero.jsp";
    }else if(js[0].id == 1000&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 1001&&js[0].result == 0){      //购买人物刑天侠
//                document.getElementById("test_div").innerText = "test1";
        window.location.href = "hero.jsp";
    }else if(js[0].id == 1001&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 1002&&js[0].result == 0){      //购买人物金刚侠
//                document.getElementById("test_div").innerText = "test2";
        window.location.href = "hero.jsp";
    }else if(js[0].id == 1002&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 81&&js[0].result == 0){      //购买后排1技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 81&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 82&&js[0].result == 0){      //购买后排2技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 82&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 83&&js[0].result == 0){      //购买中排1技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 83&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 84&&js[0].result == 0){      //购买中排2技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 84&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 85&&js[0].result == 0){      //购买前排技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 85&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if((js[0].id >= 181&&js[0].id <= 189)&&js[0].result == 0){      //购买宠物靓靓
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if((js[0].id >= 181&&js[0].id <= 189)&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if((js[0].id == 281||js[0].id == 282||js[0].id == 283||js[0].id == 284||js[0].id == 285||js[0].id == 286||js[0].id == 287)&&js[0].result == 0){      //购买英雄升级
        window.location.href = "armorbasescreen.jsp"+"?task_selectIndex_y="+<%=hero_index%>;
    }else if((js[0].id == 281||js[0].id == 282||js[0].id == 283||js[0].id == 284||js[0].id == 285||js[0].id == 286||js[0].id == 287)&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 2000&&js[0].result == 0){      //购买前排技能
        window.location.href = "ShopRoomScreen.jsp";
    }else if(js[0].id == 2000&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }else if(js[0].id == 3000&&js[0].result == 0){      //购买前排技能
        window.location.href = "sub_jigsawscreen.jsp?selectIndex_sub="+<%=session.getAttribute("selectIndex_sub__")%>;
    }else if(js[0].id == 3000&&js[0].result == 1){
        hasTongsuoOrNot = true;
        starInput = "";
        document.getElementById("div_span_password_id").innerText = starInput;
    }

//    if(hasTongsuoOrNot){
//        document.getElementById("img_dinggouerci").src = "the9Input/7.png";
//    }
}

function transit__(js){
    /**蓝色充值界面【返回】*/
    <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
    window.location.href = "teamscreen.jsp";
    <%}else {%>
    if((consume_item_index>=4061&&consume_item_index<=4072)||(consume_item_index>=4181&&consume_item_index<=4189)){
        window.location.href = "backpackscreen.jsp";
    }else if((consume_item_index>=61&&consume_item_index<=72)||(consume_item_index>=181&&consume_item_index<=189)){
        window.location.href = "backpackscreen.jsp";
    }else if(consume_item_index>=81&&consume_item_index<=85){
        window.location.href = "gamescreen.jsp";
    }else if(consume_item_index>=4281&&consume_item_index<=4287){
        window.location.href = "armorbasescreen.jsp";
    }else if(consume_item_index>=281&&consume_item_index<=287){
        window.location.href = "armorbasescreen.jsp";
    }else if(consume_item_index>=1&&consume_item_index<=2){
        window.location.href = "hero.jsp";
    }else if(consume_item_index>=1000&&consume_item_index<=1002){
        window.location.href = "hero.jsp";
    }else if(consume_item_index==2000){
        window.location.href = "ShopRoomScreen.jsp";
    }else if(consume_item_index==3000){
        window.location.href = "sub_jigsawscreen.jsp?selectIndex_sub="+<%=session.getAttribute("selectIndex_sub__")%>;
    }
    <%}%>
}

function transit(js){
//            document.getElementById("test_div").innerHTML = "js[0].id:"+js[0].id;
    if(js[0].id == 0){
        window.location.href = "hero.jsp?selectIndex=<%=consume_item_index%>";
    }else if(js[0].id == 10){
        window.location.href = "gamescreen.jsp";
    }else if((js[0].id >= 61&&js[0].id <= 72)&&js[0].result == 0){    /**购买人物*/
    <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
    window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if((js[0].id >= 61&&js[0].id <= 72)&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if((js[0].id >= 1&&js[0].id <= 7)&&js[0].result == 0){        //购买人物刑天侠
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "hero.jsp";
        <%}%>
    }else if((js[0].id >= 1&&js[0].id <= 7)&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 2&&js[0].result == 0){        //购买人物金刚侠
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "hero.jsp";
        <%}%>
    }else if(js[0].id == 2&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 1000&&js[0].result == 0){        //强化飞影侠
        window.location.href = "hero.jsp";
    }else if(js[0].id == 1000&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 1001&&js[0].result == 0){        //强化刑天侠
        window.location.href = "hero.jsp";
    }else if(js[0].id == 1001&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 1002&&js[0].result == 0){        //强化金刚侠
        window.location.href = "hero.jsp";
    }else if(js[0].id == 1002&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 81&&js[0].result == 0){      //购买后排1技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 81&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 82&&js[0].result == 0){      //购买后排2技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 82&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 83&&js[0].result == 0){      //购买中排1技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 83&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 84&&js[0].result == 0){      //购买中排2技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 84&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 85&&js[0].result == 0){      //购买前排技能
        window.location.href = "gamescreen.jsp";
    }else if(js[0].id == 85&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if((js[0].id >= 181&&js[0].id <= 189)&&js[0].result == 0){      //购买宠物靓靓
        <%if(preScreen!=null&&preScreen.equals("teamscreen")){%>
        window.location.href = "teamscreen.jsp";
        <%}else {%>
        window.location.href = "backpackscreen.jsp";
        <%}%>
    }else if((js[0].id >= 181&&js[0].id <= 189)&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if((js[0].id == 281||js[0].id == 282||js[0].id == 283||js[0].id == 284||js[0].id == 285||js[0].id == 286||js[0].id == 287)&&js[0].result == 0){      //购买英雄升级
        window.location.href = "armorbasescreen.jsp"+"?task_selectIndex_y="+<%=hero_index%>;
    }else if((js[0].id == 281||js[0].id == 282||js[0].id == 283||js[0].id == 284||js[0].id == 285||js[0].id == 286||js[0].id == 287)&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 2000&&js[0].result == 0){      //购买道具
        window.location.href = "ShopRoomScreen.jsp";
    }else if(js[0].id == 2000&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }else if(js[0].id == 3000&&js[0].result == 0){      //购买道具
        window.location.href = "sub_jigsawscreen.jsp?selectIndex_sub="+<%=session.getAttribute("selectIndex_sub__")%>;
    }else if(js[0].id == 3000&&js[0].result == 1){
        //document.getElementById("div2").style.left = -1000+'px';
        document.getElementById("div_tong_suo_id").style.left = 100+'px';
        hasTongsuoOrNot = true;
    }

    if(hasTongsuoOrNot){      //输入童锁订购密码界面
        document.getElementById("img_dinggouerci").src = "the9Input/7.png";

        document.getElementById("img_changpxiangmu").src = "the9Input/8.png";
        document.getElementById("div_changpxiangmu").style.left = 60+'px';

        document.getElementById("div_price").style.left = -1000+'px';
        document.getElementById("div_value_name").style.left = -1000+'px';
        document.getElementById("div_value_price").style.left = -1000+'px';

        document.getElementById("id22").src = "the9Input/12.png";
    }
}

</script>
</head>
<body onload="on_load()" style="background-Repeat:no-repeat" width="640" height="530">
<div id="div1" style='position: absolute;'>
    <img id="id00" src="the9Input/bg1.png" />
</div>

<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"></div>

<div id="div2" style='position: absolute;z-index:3;left: 90px;top: 120px;'>
    <div id="div_id11" style="position:absolute;left: -38px;top: 182px;">
        <img id="img_id1" src="the9Input/4.png" />
    </div>
    <%--<div id="div_text_id" style='font-size:32px; position: absolute; left: 245px;top: -5px;'>--%>
        <%--<span id="div_span_id" style="font-weight: bold; position: absolute; top: 0; left: 0;"><%=Integer.valueOf(arr11.getString(1))-netInfo.getBalance__()%></span>--%>
    <%--</div>--%>
    <%--<div id="div_text_id1" style='font-size:32px; position: absolute; left: 255px;top: 30px;'>--%>
        <%--<span id="div_span_id1" style="font-weight: bold; position: absolute; top: 0; left: 0;"><%=Integer.valueOf(arr11.getString(1))-netInfo.getBalance__()%></span>--%>
    <%--</div>--%>
</div>

<%--<div id="div4" style='position:absolute;z-index:4;left: 340px;top: 370px;'>--%>
    <%--<a id="id3" href="">--%>
        <%--<img id="id33" src="the9Input/2_2.png" />--%>
    <%--</a>--%>
<%--</div>--%>

<div id="div_dangqian" style='position:absolute;z-index:4;left: 50px;top: 50px;'>
    <%--<a id="id2" href="">--%>
    <img id="img_dangqian" src="the9Input/1.png" />
    <%--</a>--%>
</div>

<div id="div_dinggouerci" style='position:absolute;z-index:4;left: 150px;top: 50px;'>
    <%--<a id="id2" href="">--%>
    <img id="img_dinggouerci" src="the9Input/6.png" />
    <%--</a>--%>
</div>

<div id="div_changpxiangmu" style='position:absolute;z-index:4;left: 150px;top: 150px;'>
    <%--<a id="id2" href="">--%>
    <img id="img_changpxiangmu" src="the9Input/2.png" />
    <%--</a>--%>
</div>

<div id="div_price" style='position:absolute;z-index:4;left: 150px;top: 250px;'>
    <%--<a id="id2" href="">--%>
    <img id="img_price" src="the9Input/price.png" />
    <%--</a>--%>
</div>

<div id="div_value_name" style='font-size:22px; z-index:4; position: absolute; left: 300px;top: 150px;color: #FF0000;width: 400px;'>
    <%--<span id="div_span_id1" style="font-weight: bold;font-size:16px; position: absolute; top: 0; left: 0;color: #ffffff;">--%>
        (<%="新铠甲勇士:"+new String(arr11.getString(2).getBytes("ISO-8859-1"),"gbk")%>)
    <%--<%=Integer.valueOf(arr11.getString(1))-netInfo.getBalance__()%>--%>
    <%--</span>--%>
</div>

<div id="div_value_price" style='font-size:22px; z-index:4; position: absolute; left: 250px;top: 250px;color: #FF0000;width: 250px;'>
    <%--<span id="div_span_id1" style="font-weight: bold;font-size:16px; position: absolute; top: 0; left: 0;color: #ffffff;">--%>
    <%=Integer.valueOf(arr11.getString(1))-netInfo.getBalance__()%>&nbsp;&nbsp;元
        <%--<%=Integer.valueOf(arr11.getString(1))-netInfo.getBalance__()%>--%>
    <%--</span>--%>
</div>


<div id="div3" style='position:absolute;z-index:4;left: 160px;top: 430px;'>
    <%--<a id="id2" href="">--%>
        <img id="id22" src="the9Input/2_1.png" />
    <%--</a>--%>
</div>

<div id="div_tong_suo_id" style="position: absolute; z-index: 5; left: -1000px; top: 120px;">
    <%--<img id="img_tong_suo_ti_si_id" src="the9Input/9.png">--%>
    <%--<div id="div_div_tong_suo_ti_si1_id" style="position: absolute; left: 80px;top: 100px;">--%>
        <%--<img id="img_tong_suo_ti_si1_id" src="the9Input/8.png">--%>
    <%--</div>--%>
    <%--<div id="div_div_tong_suo_ti_si_sr_id" style="position: absolute; left: 80px;top: 140px;">--%>
        <%--<img id="img_tong_suo_ti_si_sr_id" src="the9Input/sr.png">--%>
    <%--</div>--%>
    <div id="div_password_id" style='font-size:32px; position: absolute; left: 135px;top: 110px;'>
        <span id="div_span_password_id" style="font-weight: bold; position: absolute; top: 0; left: 0;"></span>
    </div>
</div>

<jsp:include page="topuphtmls/the9input/topup.jsp"></jsp:include>

</body>
</html>