<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-15
  Time: 下午7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
xmlhttp = MakeHttpRequest();
xmlhttp.open("Post", top_consume_url+(1000+selectIndex), true);
xmlhttp.send();
consume_step = 400;
xmlhttp.onreadystatechange = function () {
if (xmlhttp.readyState == 4) {
var js = eval(xmlhttp.responseText);
if(js[0].result == 0){
consume_step = 0;
document.getElementById("div_div_msg_id").innerHTML = "消费成功";
document.getElementById("div_div_msg1_id").innerHTML = "";
document.getElementById("div_div_msg2_id").innerHTML = "";
setTimeout("transitdd()",500);
//                                window.location.href = "hero.jsp?selectIndex="+selectIndex;
}else{
document.getElementById("div_div_msg_id").innerHTML = "请去大厅充值";
document.getElementById("div_div_msg1_id").innerHTML = "";
document.getElementById("div_div_msg2_id").innerHTML = "";
setTimeout("transitdd()",500);
}
}
}