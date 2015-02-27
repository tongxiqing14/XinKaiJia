<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 上午10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));
%>
var balance_support_url = "<%=host%>/HttpService/BalanceSupport.ashx";

/**获取账户余额信息*/
function ajax_show_balance(){
    consume_step = 3;
    xmlhttp = MakeHttpRequest();
    xmlhttp.open("Post", balance_support_url, true);
    xmlhttp.send();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {
            var js = eval(xmlhttp.responseText);
            if(js[0].balance-price_json___.item3000[1] < 0){
                consume_step = 2;
                document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币"+"<br>余额不足，需充值"+(price_json___.item3000[1]-js[0].balance)+"代币";
                document.getElementById("div_div_msg2_id").innerHTML = "<br><br>(1代币=1人民币)";
            }else{
                document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币";
            }
        }
    }
}