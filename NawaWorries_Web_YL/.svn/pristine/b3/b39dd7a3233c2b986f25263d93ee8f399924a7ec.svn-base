<%@ page import="elements.armorbase.EquipItem" %>
<%@ page import="java.util.List" %>
<%@ page import="common.JsonToBean" %>
<%@ page import="java.util.Properties" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="beans.EquipMaxIndexBean" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-9-23
  Time: 下午8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String heroIndex = (String) session.getAttribute("heroScreen_selectIndex");

    PropertiesOp propertiesOp = new PropertiesOp();
    Properties properties = propertiesOp.load("/initial/equip.properties");
    EquipMaxIndexBean equipMaxIndexBean = (EquipMaxIndexBean) session.getAttribute("_EquipMaxIndex");

    List<EquipItem> equipItemList = JsonToBean.jsonTobean4(properties.getProperty("equip1")).subList(equipMaxIndexBean.getEquipMaxIndex(Integer.valueOf(heroIndex)+1),9);

    /**取出价格的json数据*/
    String propname0 = "/follow_consume/consume_info.properties";
    properties = propertiesOp.load(propname0);
    String buy_prices = properties.getProperty("buy_prices");

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
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript">
        var selectIndex_x = 0;   /**up_down_left_right.jsp的参数*/
        var selectIndex_y = 0;  /**up_down_left_right.jsp的参数*/
        var consume_step = 0;
        var price_json$$ = <%=buy_prices%>;   /**js 解析json数据*/

        //触发onkeypress事件
        document.onkeypress = onKeyPress;

        document.equipItemsize = <%=equipItemList.size()%>;

        document.money_balance = 0;

        document.mouse_index = <%=button_index%>;

        var name1_array = new Array("装备提升等级","装备提升等级","装备提升等级","装备提升等级","装备提升等级","装备提升等级","装备提升等级","装备提升等级","装备提升等级");
//        var name2_array = new Array();

        function onKeyPress(){
            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

                if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                        ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                    window.location.href = "main.jsp";
                }

            if(consume_step==0){
                /**selectIndex_x, selectIndex_y参数已经响应上下左右的按键*/
                <jsp:include page="topuphtmls/shoproom/up_down_left_right.jsp">
                    <jsp:param name="equipItemSize" value="<%=(equipItemList.size())%>"/>
                    <jsp:param name="length_x" value="5"/>
                    <jsp:param name="length_y" value="<%=(equipItemList.size()%5==0?equipItemList.size()/5:(equipItemList.size()/5+1))%>"/>
                    <jsp:param name="last_length_x" value="<%=(equipItemList.size()%5)%>"/>
                </jsp:include>
                document.div_mouse_left_x = 100+selectIndex_x*80;
                document.div_mouse_top_y = 50+selectIndex_y*100;
            }else {
                /**在弹出时selectIndex_x参数已经响应上下左右的按键*/
                <jsp:include page="topuphtmls/shoproom/topup_up_down_left_right.jsp">
                    <jsp:param name="length_x" value="2"/>
                </jsp:include>
                document.div_mouse_left_x = 250+selectIndex_x*80;
            }

            if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
                if(consume_step == 400){

                }else if(consume_step == 2){
                    if(selectIndex_x==0){                //control action
                        window.location.href = "the9InputScreen.jsp?consume_item_index="+2000+"&preScreen=shoproomscreen"; /**传送的是消费id*/
                    }else if(selectIndex_x==1){
//                        window.location.href = "ShopRoomScreen.jsp";
                        <jsp:include page="topuphtmls/shoproom/consume_direct_result2_1.jsp"></jsp:include>
                    }
                }else if(consume_step==3){
                    if(selectIndex_x==0){
                        <jsp:include page="topuphtmls/shoproom/consume_direct.jsp">
                            <jsp:param name="consume_item_index" value="2000"/>
                        </jsp:include>
                    }else if(selectIndex_x==1){
                        <jsp:include page="topuphtmls/shoproom/consume_direct_result2_1.jsp"></jsp:include>
                    }

                }else{
                    if(0==<%=equipItemList.size()%>){
                        document.getElementById("div_div_msg_id").innerHTML = "装备已经卖完";
                        document.getElementById("msgDiv").style.left=120;
                        document.getElementById("msgDiv").style.top=90;
                        setTimeout("transitdd()",500);
                    }else{
                        <jsp:include page="topuphtmls/shoproom/consume_info_topup.jsp"/>/**消费信息弹出*/
                        document.getElementById("div_div_msg_id").innerHTML = name1_array[selectIndex_x+selectIndex_y*5]+",您是否要购买? <br>资费:"+price_json$$.item2000[1]+"代币";
                    }
                }
            }
        }

        <jsp:include page="topuphtmls/teamscreen/mouse_js_method.jsp"></jsp:include>
        <jsp:include page="topuphtmls/shoproom/ajax_show_balance.jsp"/>/**调用mouse_js_method.jsp的方法,实现获取余额功能*/

        function run(){
            document.div_mouse_left_x = 100;
            document.div_mouse_top_y = 50;
            mouse();  /**调用mouse_js_method.jsp的方法*/
        }

        function transitdd(){
            window.location.href = "ShopRoomScreen.jsp";
        }
    </script>
</head>
<body onload="run()">

    <div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 300px;color: #ffffff;">

    </div>

    <div id="test_div_no" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 505px;color: #ffffff;">
        收齐道具装备<br>免费升级等级
    </div>

    <div id="div_bg_id" style="position: absolute;left: 0px;top: 0px;">
        <img src="main/shoproom.jpg"/>
    </div>

    <%--<div id="div_mm_id" style="position: absolute;left: 450px;top: 180px;">--%>
        <%--<img src="main/mm.png"/>--%>
    <%--</div>--%>

    <% for(int i=0; i<equipItemList.size();i++){
            int x = i%5;
            int y = i/5;

            int left = 76+x*80;
            int top = 88+y*85;
    %>
    <div id="div_equip_item_bottom_kuang<%=i+1%>_id" style='position:absolute;left:<%=left%>px;top:<%=top%>px;'>
        <img id="img_equip_item_bottom_kuang<%=i+1%>_id" src="team/kuang.png" />
    </div>

    <div id="div_armorbase_id<%=i+1%>" style='position: absolute;left:<%=left%>px;top:<%=top%>px;'>
        <img id="img_armorbase_id<%=i+1%>" src="<%=equipItemList.get(i).getImg_path()%>" />
    </div>
    <%}%>

    <jsp:include page="topuphtmls/confirm.jsp"></jsp:include>

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