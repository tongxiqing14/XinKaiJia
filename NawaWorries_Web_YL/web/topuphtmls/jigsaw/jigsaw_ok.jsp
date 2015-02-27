<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 下午3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
    window.location.href = "sub_jigsawscreen.jsp?selectIndex_sub="+(selectIndex_x+4*selectIndex_y);
}