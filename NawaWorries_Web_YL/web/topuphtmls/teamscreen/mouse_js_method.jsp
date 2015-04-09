<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 上午8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--function mouse(){--%>
    <%--document.indexframe_mouse ++;--%>
    <%--document.indexframe_mouse  = (document.indexframe_mouse+5)%5;--%>
    <%--document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x-document.indexframe_mouse+'px';--%>
    <%--document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y+document.indexframe_mouse+'px';--%>

    <%--setTimeout("mouse()",150);--%>
<%--}--%>
document.indexframe_mouse = 0;
document.div_mouse_left_x = -1280;
document.div_mouse_top_y = 100;

function mouse(){
    document.indexframe_mouse ++;
    document.indexframe_mouse  = (document.indexframe_mouse+5)%5;
    document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x-document.indexframe_mouse+'px';
    document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y+document.indexframe_mouse+'px';

    setTimeout("mouse()",150);
}
