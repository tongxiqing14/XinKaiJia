<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-7
  Time: 上午10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
function ajax_show_balance(){
    document.consume_step = 3;
    <%--document.div_mouse_left_x = 300;--%>
    <%--document.div_mouse_top_y = 280;--%>
    xmlhttp = MakeHttpRequest();
    xmlhttp.open("Post", balance_support_url, true);
    xmlhttp.send();
    xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4) {
        var js = eval(xmlhttp.responseText);
        if(js[0].balance-price_ < 0){
            document.consume_step = 2;
            document.getElementById("div_div_consume_info_id1").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币"+"<br>余额不足，需充值"+(price_-js[0].balance)+"代币";
            document.getElementById("div_div_consume_info_id2").innerHTML = "<br><br><br>(1代币=1人民币)";
        }else{
            document.getElementById("div_div_consume_info_id1").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币";
            top_consume_url = top_consume_url+consume_item_index;
        }
    }
}
}