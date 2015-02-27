<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-15
  Time: 下午6:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
if(js[0].result == 0){
<%--window.location.href = "ShopRoomScreen.jsp";--%>
    document.getElementById("div_div_msg_id").innerHTML = "消费成功";
    document.getElementById("div_div_msg1_id").innerHTML = "";
    document.getElementById("div_div_msg2_id").innerHTML = "";
    setTimeout("transitdd()",500);
}else{
    document.getElementById("div_div_msg_id").innerHTML = "请去大厅充值";
    document.getElementById("div_div_msg1_id").innerHTML = "";
    document.getElementById("div_div_msg2_id").innerHTML = "";
    setTimeout("transitdd()",500);
}