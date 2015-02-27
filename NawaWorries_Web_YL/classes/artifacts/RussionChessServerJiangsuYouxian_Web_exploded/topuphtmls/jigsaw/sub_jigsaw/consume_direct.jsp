<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 上午11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer consume_item_index = 0;
    if(request.getParameter("consume_item_index")!=null){
        consume_item_index = Integer.valueOf(request.getParameter("consume_item_index"));
    }

    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));
%>

var top_consume_url = "<%=host%>/HttpService/hero.ashx?Type=0&GameID=100536&Number=10&consume_item_index=";

xmlhttp = MakeHttpRequest();
xmlhttp.open("Post", top_consume_url+<%=consume_item_index%>+"&selectIndex_item="+document.selectIndex_item, true);
xmlhttp.send();

consume_step=400;
<%--document.getElementById("test_div").innerHTML = "test00";--%>
xmlhttp.onreadystatechange = function () {
<%--document.getElementById("test_div").innerHTML = "test0";--%>
    if (xmlhttp.readyState == 4) {
        var js = eval(xmlhttp.responseText);
<%--document.getElementById("test_div").innerHTML = xmlhttp.responseText;--%>
        <%--document.getElementById("test_div").innerHTML = "js[0].result="+js[0].result;--%>
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
    }
}