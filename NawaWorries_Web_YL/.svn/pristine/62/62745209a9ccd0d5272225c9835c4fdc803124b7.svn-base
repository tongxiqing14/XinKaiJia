<%@ page import="service.JigSawInfoOp" %>
<%@ page import="iptvNet.NetHander" %>
<%@ page import="java.util.Properties" %>
<%@ page import="common.PropertiesOp" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-8-20
  Time: 下午4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

    String[] jisaw_img_path_array1 = new String[]{};
    String jigsaw1_img_path = "jigsaw/jigsaw1.jpg";
    String kaijia_name=null;
    String kaijia_detail=null;


    if(request.getParameter("selectIndex_sub")!=null){

        session.setAttribute("selectIndex_sub__",Integer.valueOf(request.getParameter("selectIndex_sub")));

         switch (Integer.valueOf(request.getParameter("selectIndex_sub"))){
             case 0:
                 jigsaw1_img_path = "jigsaw/jigsaw1.jpg";
                 kaijia_name = "拿瓦铠甲";
                 kaijia_detail = "收齐铠甲为您提升攻击力";
                 jisaw_img_path_array1 = new String[]{"jigsaw/1/jigsaw1_01.jpg","jigsaw/1/jigsaw1_02.jpg","jigsaw/1/jigsaw1_03.jpg","jigsaw/1/jigsaw1_04.jpg","jigsaw/1/jigsaw1_05.jpg","jigsaw/1/jigsaw1_06.jpg","jigsaw/1/jigsaw1_07.jpg","jigsaw/1/jigsaw1_08.jpg"};
                 break;
            case 1:
                 jigsaw1_img_path = "jigsaw/jigsaw2.jpg";
                 kaijia_name = "茨纳米铠甲";
                 kaijia_detail = "收齐铠甲为您提升攻击力";
                 jisaw_img_path_array1 = new String[]{"jigsaw/2/jigsaw2_01.jpg","jigsaw/2/jigsaw2_02.jpg","jigsaw/2/jigsaw2_03.jpg","jigsaw/2/jigsaw2_04.jpg","jigsaw/2/jigsaw2_05.jpg","jigsaw/2/jigsaw2_06.jpg","jigsaw/2/jigsaw2_07.jpg","jigsaw/2/jigsaw2_08.jpg"};
                break;
             case 2:
                 jigsaw1_img_path = "jigsaw/jigsaw3.jpg";
                 kaijia_name = "驮拏多铠甲";
                 kaijia_detail = "收齐铠甲为您提升攻击力";
                 jisaw_img_path_array1 = new String[]{"jigsaw/3/jigsaw4_01.jpg","jigsaw/3/jigsaw4_02.jpg","jigsaw/3/jigsaw4_03.jpg","jigsaw/3/jigsaw4_04.jpg","jigsaw/3/jigsaw4_05.jpg","jigsaw/3/jigsaw4_06.jpg","jigsaw/3/jigsaw4_07.jpg","jigsaw/3/jigsaw4_08.jpg"};
                 break;
             case 3:
                 jigsaw1_img_path = "jigsaw/jigsaw4.jpg";
                 kaijia_name = "酷雷伏铠甲";
                 kaijia_detail = "收齐铠甲为您提升攻击力";
                 jisaw_img_path_array1 = new String[]{"jigsaw/4/jigsaw4_01.jpg","jigsaw/4/jigsaw4_02.jpg","jigsaw/4/jigsaw4_03.jpg","jigsaw/4/jigsaw4_04.jpg","jigsaw/4/jigsaw4_05.jpg","jigsaw/4/jigsaw4_06.jpg","jigsaw/4/jigsaw4_07.jpg","jigsaw/4/jigsaw4_08.jpg"};
                 break;
             case 4:
                 jigsaw1_img_path = "jigsaw/jigsaw5.jpg";
                 kaijia_name = "飞影铠甲";
                 kaijia_detail = "收齐铠甲为您提升攻击力";
                 jisaw_img_path_array1 = new String[]{"jigsaw/5/jigsaw5_01.jpg","jigsaw/5/jigsaw5_02.jpg","jigsaw/5/jigsaw5_03.jpg","jigsaw/5/jigsaw5_04.jpg","jigsaw/5/jigsaw5_05.jpg","jigsaw/5/jigsaw5_06.jpg","jigsaw/5/jigsaw5_07.jpg","jigsaw/5/jigsaw5_08.jpg"};
                 break;
             case 5:
                 jigsaw1_img_path = "jigsaw/jigsaw6.jpg";
                 kaijia_name = "修罗铠甲";
                 kaijia_detail = "收齐铠甲为您提升攻击力";
                 jisaw_img_path_array1 = new String[]{"jigsaw/6/jigsaw6_01.jpg","jigsaw/6/jigsaw6_02.jpg","jigsaw/6/jigsaw6_03.jpg","jigsaw/6/jigsaw6_04.jpg","jigsaw/6/jigsaw6_05.jpg","jigsaw/6/jigsaw6_06.jpg","jigsaw/6/jigsaw6_07.jpg","jigsaw/6/jigsaw6_08.jpg"};
                 break;
             case 6:
                 jigsaw1_img_path = "jigsaw/jigsaw7.jpg";
                 kaijia_name = "铠甲群英会";
                 kaijia_detail = "收齐铠甲为您提升攻击力";
                 jisaw_img_path_array1 = new String[]{"jigsaw/7/jigsaw7_01.jpg","jigsaw/7/jigsaw7_02.jpg","jigsaw/7/jigsaw7_03.jpg","jigsaw/7/jigsaw7_04.jpg","jigsaw/7/jigsaw7_05.jpg","jigsaw/7/jigsaw7_06.jpg","jigsaw/7/jigsaw7_07.jpg","jigsaw/7/jigsaw7_08.jpg"};
                 break;
             case 7:
                 jigsaw1_img_path = "jigsaw/jigsaw8.jpg";
                 kaijia_name = "铠甲萝卜会";
                 kaijia_detail = "收齐铠甲为您提升攻击力";
                 jisaw_img_path_array1 = new String[]{"jigsaw/8/jigsaw6_01.jpg","jigsaw/8/jigsaw6_02.jpg","jigsaw/8/jigsaw6_03.jpg","jigsaw/8/jigsaw6_04.jpg","jigsaw/8/jigsaw6_05.jpg","jigsaw/8/jigsaw6_06.jpg","jigsaw/8/jigsaw6_07.jpg","jigsaw/8/jigsaw6_08.jpg"};
                 break;
        }
    }

//    String jigsawinfo = (String) session.getAttribute("_jigsawinfo");
//    int[][] jigsawinfo_array = JigSawInfoOp.getJigSawInfo(jigsawinfo);
//    JigSawInfoOp.updateJigSawInfo(jigsawinfo_array);
//    session.setAttribute("_jigsawinfo", JigSawInfoOp.updateJigSawInfo(jigsawinfo_array));
//    NetHander netHander = new NetHander(application.getInitParameter("ServerURL"), (String) session.getAttribute("UserID"), (String) session.getAttribute("ProductID"), (String) session.getAttribute("adAccount"), (String) session.getAttribute("UserToken"));
//    netHander.saveGameData(JigSawInfoOp.updateJigSawInfo(jigsawinfo_array), 10);

//    String jigsawinfo = (String) session.getAttribute("_jigsawinfo");
//    int[][] jigsawinfo_array = JigSawInfoOp.getJigSawInfo(jigsawinfo);
//
//    for (int j=0; j<jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))].length; j++){
//        if(jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))][j]==1){
//        }
//    }

    /**取出价格的json数据*/
    String propname0 = "/follow_consume/consume_info.properties";
    PropertiesOp propertiesOp = new PropertiesOp();
    Properties properties = propertiesOp.load(propname0);
    String buy_prices = properties.getProperty("buy_prices");

    String jigsawinfo = (String) session.getAttribute("_jigsawinfo");
    int[][] jigsawinfo_array = JigSawInfoOp.getJigSawInfo(jigsawinfo);

    int sum_num = 0;
    for (int j=0; j<jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))].length; j++){
        if(jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))][j]==1){
            sum_num ++;
        }
    }

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
    <style type="text/css">
        #div_jigsaw_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 0px;
            top: 0px;
        }

        #div_jigsaw1_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 48px;
            top: 60px;
        }
    </style>

    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript">
        var price_json___ = <%=buy_prices%>;   /**js 解析json数据*/
        var consume_item_index = 0;
        var balance_support_url = "<%=host%>/HttpService/BalanceSupport.ashx";
        var top_consume_url = "<%=host%>/HttpService/hero.ashx?Type=0&GameID=100536&Number=10&consume_item_index=";
        var consume_step = 0;
        var selectIndex_x = 0;   /**up_down_left_right.jsp的参数*/
        var indexframe_mouse = 0;
        document.div_mouse_left_x = 250;
        document.div_mouse_top_y = 280;

        //触发onkeypress事件
        document.onkeypress = onKeyPress;
        document.consume_step = 0;
        document.selectIndex_item = 0;

        document.money_balance = 0;

        document.mouse_index = <%=button_index%>;

        var jigsawinfo_array=new Array();

    function onKeyPress(){
        var evt = window.event;
        var keyCode = evt.which ? evt.which : evt.keyCode;

        if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
            window.location.href = "jigsawscreen.jsp";
        }

        if(consume_step==0){
            <jsp:include page="topuphtmls/jigsaw/sub_jigsaw/up_down_left_right.jsp"></jsp:include>
        }else {
            /**在弹出时selectIndex_x参数已经响应上下左右的按键*/
            <jsp:include page="topuphtmls/shoproom/topup_up_down_left_right.jsp">
            <jsp:param name="length_x" value="2"/>
            </jsp:include>
            document.div_mouse_left_x = 250+selectIndex_x*80;
            document.div_mouse_top_y = 280;
        }

        if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
            if(consume_step == 400){

            }else if(consume_step == 2){
                if(selectIndex_x==0){                //control action
                    window.location.href = "the9InputScreen.jsp?consume_item_index="+3000+"&preScreen=shoproomscreen&selectIndex_item="+document.selectIndex_item; /**传送的是消费id*/
                }else if(selectIndex_x==1){
//                        window.location.href = "sub_jigsawscreen.jsp";
                    <jsp:include page="topuphtmls/jigsaw/consume_direct_result2_1.jsp"></jsp:include>
                    <%--window.location.href = "sub_jigsawscreen.jsp?selectIndex_sub="+<%=session.getAttribute("selectIndex_sub__")%>;--%>
                    }
                }else if(consume_step==3){
                    if(selectIndex_x==0){
                        <jsp:include page="topuphtmls/jigsaw/sub_jigsaw/consume_direct.jsp">
                            <jsp:param name="consume_item_index" value="3000"/>
                        </jsp:include>
                    }else if(selectIndex_x==1){
                        <jsp:include page="topuphtmls/jigsaw/consume_direct_result2_1.jsp"></jsp:include>
                    }

                }else{
                    if(jigsawinfo_array[document.selectIndex_item]==1){
                        document.getElementById("div_div_msg_id").innerHTML = "该拼图已被购买";
                        document.getElementById("msgDiv").style.left=120;
                        document.getElementById("msgDiv").style.top=90;
                        setTimeout("transitdd()",500);
                    }else {
                        <jsp:include page="topuphtmls/shoproom/consume_info_topup.jsp"/>/**消费信息弹出*/
                        document.getElementById("div_div_msg_id").innerHTML = "您是否要购买拼图? <br>资费:"+price_json___.item3000[1]+"代币";
                    }
                }
            }
        }

        <jsp:include page="topuphtmls/jigsaw/sub_jigsaw/ajax_show_balance.jsp"/>/**调用mouse_js_method.jsp的方法,实现获取余额功能*/

        function run(){

            <%--<%for(int i=0;i<jigsawinfo_array.length;i++){%>--%>
            <%--jigsawinfo_array[<%=i%>]=new Array();--%>
            <%for(int j=0;j<jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))].length;j++){ %>
                jigsawinfo_array[<%=j%>]=<%=jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))][j]%>;
            <%}%>
            <%--<%}%>--%>

            switch(document.selectIndex_item){           /**移动掀块*/
                case 0:
                    document.div_mouse_left_x = document.getElementById("div_jisaw_img_id1").style.left+10;
                    document.div_mouse_top_y =  80;
                    document.getElementById("div_jisaw_img_id1").style.left = '-1000px';
                    break;
                case 1:
                    document.div_mouse_left_x = document.getElementById("div_jisaw_img_id2").style.left+10;
                    document.div_mouse_top_y =  80;
                    document.getElementById("div_jisaw_img_id2").style.left = '-1000px';
                    break;
                case 2:
                    document.div_mouse_left_x = document.getElementById("div_jisaw_img_id3").style.left+10;
                    document.div_mouse_top_y =  80;
                    document.getElementById("div_jisaw_img_id3").style.left = '-1000px';
                    break;
                case 3:
                    document.div_mouse_left_x = document.getElementById("div_jisaw_img_id4").style.left+10;
                    document.div_mouse_top_y =  80;
                    document.getElementById("div_jisaw_img_id4").style.left = '-1000px';
                    break;
                case 4:
                    document.div_mouse_left_x = document.getElementById("div_jisaw_img_id5").style.left+10;
                    document.div_mouse_top_y =  230;
                    document.getElementById("div_jisaw_img_id5").style.left = '-1000px';
                    break;
                case 5:
                    document.div_mouse_left_x = document.getElementById("div_jisaw_img_id6").style.left+10;
                    document.div_mouse_top_y =  230;
                    document.getElementById("div_jisaw_img_id6").style.left = '-1000px';
                    break;
                case 6:
                    document.div_mouse_left_x = document.getElementById("div_jisaw_img_id7").style.left+10;
                    document.div_mouse_top_y =  230;
                    document.getElementById("div_jisaw_img_id7").style.left = '-1000px';
                    break;
                case 7:
                    document.div_mouse_left_x = document.getElementById("div_jisaw_img_id8").style.left+10;
                    document.div_mouse_top_y =  230;
                    document.getElementById("div_jisaw_img_id8").style.left = '-1000px';
                    break;
            }
            <jsp:include page="topuphtmls/shoproom/jisaw_img_show.jsp"/> /**根据购买情况，初始显示图片*/
            mouse();
        }

        function transitdd(){
            window.location.href = "sub_jigsawscreen.jsp?selectIndex_sub="+<%=session.getAttribute("selectIndex_sub__")%>;
        }

        function mouse(){
            indexframe_mouse ++;
            indexframe_mouse  = (indexframe_mouse+5)%5;
            document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x-indexframe_mouse;
            document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y+indexframe_mouse;

            setTimeout("mouse()",150);
        }
    </script>
</head>
<body onload="run()">

<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"></div>


    <div id="div_jigsaw_id" style='position: absolute;'>
        <img id="img_jigsaw_id" src="jigsaw/jigsaw.jpg" />
    </div>

    <div id="div_jigsaw1_id" style='position: absolute;'>
        <img id="img_jigsaw1_id" src="<%=jigsaw1_img_path%>" />
    </div>

    <%for (int i = 0; i < jisaw_img_path_array1.length; i++){
        int x = (i+4)%4;
        int y = i/4;

        int left = 48+x*136;
        int top = 60+y*157;
    %>
        <div id="div_jisaw_img_id<%=i+1%>" style='position: absolute; z-index:1; left:<%=left%>px;top:<%=top%>px;'>
            <img id="img_jisaw_img_id<%=i+1%>" src="<%=jisaw_img_path_array1[i]%>" />
        </div>
    <%}%>

    <jsp:include page="topuphtmls/confirm.jsp"></jsp:include>

    <div id="kaijia_name" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 400px; left: 160px;color: #ffffff;"><%=kaijia_name%></div>

    <div id="kaijia_detail" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 440px; left: 160px;color: #ffffff;"><%=kaijia_detail%></div>

    <div id="kaijia_name1" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 400px; left: 460px;color: #ffffff;"><%=sum_num%>/8</div>

    <div id="kaijia_detail1" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 440px; left: 460px;color: #ffffff;">攻击力增加5%</div>

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