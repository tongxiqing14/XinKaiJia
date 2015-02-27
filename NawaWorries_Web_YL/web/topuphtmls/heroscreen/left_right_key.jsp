<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-9
  Time: 下午5:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
if(keyCode == ZTE.LEFT
    || keyCode == HW.LEFT
        || keyCode == UT.LEFT ) {
        if(consume_step==6){
            div_mouse_left_x = 300;
            div_mouse_top_y = 280;
        }else  if(consume_step!=0){      /**处于消费充值状态*/
                mouse_index--;
                mouse_index = (mouse_index+2)%2;
                if(mouse_index==0){
                    div_mouse_left_x = 250;
                    div_mouse_top_y = 280;
                }else if(mouse_index==1){
                    div_mouse_left_x = 330;
                    div_mouse_top_y = 280;
                 }
        }else{
            selectIndex--;
        }

    }else if(keyCode == ZTE.RIGHT
        || keyCode == HW.RIGHT
            || keyCode == UT.RIGHT){
        if(consume_step==6){
            div_mouse_left_x = 300;
            div_mouse_top_y = 280;
        }else if(consume_step!=0){       /**处于消费充值状态*/
            mouse_index++;
            mouse_index = (mouse_index+2)%2;            //control show
            if(mouse_index==0){
                div_mouse_left_x = 250;
                div_mouse_top_y = 280;
            }else if(mouse_index==1){
                div_mouse_left_x = 330;
                div_mouse_top_y = 280;
            }
        }else {
            selectIndex++;
        }

}

selectIndex = (selectIndex+3)%3;