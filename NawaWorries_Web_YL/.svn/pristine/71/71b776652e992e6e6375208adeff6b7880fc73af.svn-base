<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-15
  Time: 下午6:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
xmlhttp = MakeHttpRequest();
xmlhttp.open("Post", top_consume_url, true);
xmlhttp.send();
document.consume_step=400;
xmlhttp.onreadystatechange = function () {
if (xmlhttp.readyState == 4) {
var js = eval(xmlhttp.responseText);
if(js[0].result == 0){
document.getElementById("div_div_consume_info_id").innerHTML = "消费成功";
document.getElementById("div_div_consume_info_id1").innerHTML = "";
document.getElementById("div_div_consume_info_id2").innerHTML = "";
setTimeout("transitdd()",500);
//                                    window.location.href = "armorbasescreen.jsp?preScreen=self&armorbase_hero_index="+hero_index;
}else{
document.getElementById("div_div_consume_info_id").innerHTML = "请去大厅充值";
document.getElementById("div_div_consume_info_id1").innerHTML = "";
document.getElementById("div_div_consume_info_id2").innerHTML = "";
setTimeout("transitdd()",500);
}
}
}