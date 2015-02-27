<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 上午11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer length_x=0;
    if(request.getParameter("length_x")!=null){
        length_x = Integer.valueOf(request.getParameter("length_x"));
    }
%>
if(keyCode == ZTE.LEFT
    || keyCode == HW.LEFT
        || keyCode == UT.LEFT) {
        selectIndex_x--;
} else if(keyCode == ZTE.RIGHT
    || keyCode == HW.RIGHT
        || keyCode == UT.RIGHT){
        selectIndex_x++;
}

selectIndex_x = (selectIndex_x+<%=length_x%>)%<%=length_x%>;