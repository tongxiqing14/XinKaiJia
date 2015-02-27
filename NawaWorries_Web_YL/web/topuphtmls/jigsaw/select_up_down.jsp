<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 下午2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
if(keyCode == ZTE.UP
    || keyCode == HW.UP
        || keyCode == UT.UP) {
        selectIndex_y--;
        selectIndex_y = (selectIndex_y+4)%4;
    if(selectIndex_y<=1){
        generalbar_selected_flag = false;
    }

}else if(keyCode == ZTE.DOWN
    || keyCode == HW.DOWN
        || keyCode == UT.DOWN){
    selectIndex_y++;
    selectIndex_y = (selectIndex_y+3)%3;
    if(selectIndex_y>1){
        generalbar_selected_flag = true;
    }
}