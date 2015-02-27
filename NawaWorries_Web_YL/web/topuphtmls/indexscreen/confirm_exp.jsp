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
    document.button_index = <%=button_index%>;       /**初始指向的按钮*/
    document.getElementById("div_div_msg_id").innerHTML = "你是否要退出游戏？";
    document.getElementById("msgDiv").style.left=120;
    document.getElementById("msgDiv").style.top=90;
    document.getElementById("div_confirm_id").style.left=230+'px';
    document.getElementById("div_confirm_id").style.top=300+'px';
    document.getElementById("div_cancel_id").style.left=310+'px';
    document.getElementById("div_cancel_id").style.top=300+'px';
    if(0==<%=button_index%>){
        document.div_mouse_left_x = 285;
        document.div_mouse_top_y = 280;
    }else if(1==<%=button_index%>){
        document.div_mouse_left_x = 340;
        document.div_mouse_top_y = 280;
    }

