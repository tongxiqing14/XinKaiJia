<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 上午10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String IsButtonOnOK = application.getInitParameter("IsButtonOnOK");
    Integer button_index;

    if(IsButtonOnOK.equals("true")){
        button_index = 0;
    }else {
        button_index = 1;
    }
%>
    //未购买，则先购买
    consume_step = 2;         /**默认更新为充值状态*/
    selectIndex_x = <%=button_index%>;       /**初始指向的按钮*/
    ajax_show_balance();
    document.getElementById("div_div_msg_id").innerHTML = "购买战士 <br>将消费15代币";
    document.getElementById("msgDiv").style.left=120;
    document.getElementById("msgDiv").style.top=90;
    document.getElementById("div_confirm_id").style.left=230+'px';
    document.getElementById("div_confirm_id").style.top=300+'px';
    document.getElementById("div_cancel_id").style.left=310+'px';
    document.getElementById("div_cancel_id").style.top=300+'px';
    <%--document.getElementById("div_mouse_id").style.left=230+'px';--%>
    <%--document.getElementById("div_mouse_id").style.top=300+'px';--%>
    <%--document.div_mouse_left_x = 250;--%>
    <%--document.div_mouse_top_y = 280;--%>
    if(document.mouse_index==0){
        document.div_mouse_left_x = 250;
        document.div_mouse_top_y = 280;
    }else if(document.mouse_index==1){
        document.div_mouse_left_x = 320;
        document.div_mouse_top_y = 280;
    }
