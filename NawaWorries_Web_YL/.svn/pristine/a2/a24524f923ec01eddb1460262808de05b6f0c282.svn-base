<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-9
  Time: 下午5:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
function ajax_show_balance(price){
    consume_step = 3;
    xmlhttp = MakeHttpRequest();
    xmlhttp.open("Post", balance_support_url, true);
    xmlhttp.send();
    xmlhttp.onreadystatechange = function () {
        <%--document.getElementById("test_div").innerHTML = "price:"+price;--%>
        if (xmlhttp.readyState == 4) {
            var js = eval(xmlhttp.responseText);
            if(js[0].balance-price < 0){
                consume_step = 2;
                document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币"+"<br>余额不足，需充值"+(price-js[0].balance)+"代币";
                document.getElementById("div_div_msg2_id").innerHTML = "<br><br>(1代币=1人民币)";
            }else{
                document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币";
            }
        }
    }
}

function ajax_show_balance1(price){
    consume_step = 5;
    xmlhttp = MakeHttpRequest();
    xmlhttp.open("Post", balance_support_url, true);
    xmlhttp.send();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {
            var js = eval(xmlhttp.responseText);
            if(js[0].balance-price < 0){
                consume_step = 4;
                document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币"+"<br>余额不足，需充值"+(price-js[0].balance)+"代币";
                document.getElementById("div_div_msg2_id").innerHTML = "<br><br>(1代币=1人民币)";
            }else{
                document.getElementById("div_div_msg1_id").innerHTML = "<br>您的当前代币余额:"+js[0].balance+"代币";
            }
        }
    }
}