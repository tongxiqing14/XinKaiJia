<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 下午2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
    if(selectIndex_x == 0){
        window.location.href = "armorbasescreen.jsp";
    }else if(selectIndex_x == 1){
        window.location.href = "backpackscreen.jsp";
    }else if(selectIndex_x == 2){
        window.location.href = "taskscreen.jsp";
    }else if(selectIndex_x == 3){
        window.location.href = "jigsawscreen.jsp";
    }
}