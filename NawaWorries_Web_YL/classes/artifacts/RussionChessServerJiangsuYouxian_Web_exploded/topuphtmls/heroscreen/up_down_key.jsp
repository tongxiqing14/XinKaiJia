<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-9
  Time: 下午5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
if(keyCode == ZTE.UP
    || keyCode == HW.UP
        || keyCode == UT.UP ) {
    if(consume_step==6){
        div_mouse_left_x = 300;
        div_mouse_top_y = 280;
    }else {
        document.button_up_and_down --;
        document.button_up_and_down = (document.button_up_and_down+2)%2;
    }
}else if(keyCode == ZTE.DOWN
    || keyCode == HW.DOWN
        || keyCode == UT.DOWN ) {
    if(consume_step==6){
        div_mouse_left_x = 300;
        div_mouse_top_y = 280;
    }else {
        document.button_up_and_down ++;
        document.button_up_and_down = (document.button_up_and_down+2)%2;
    }
}

