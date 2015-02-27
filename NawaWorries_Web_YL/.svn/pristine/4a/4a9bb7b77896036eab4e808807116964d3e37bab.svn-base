<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 下午7:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer length_y=0;
    if(request.getParameter("length_y")!=null){
        length_y = Integer.valueOf(request.getParameter("length_y"));
    }
%>
if(keyCode == ZTE.UP
    || keyCode == HW.UP
        || keyCode == UT.UP) {
        selectIndex_y--;
} else if(keyCode == ZTE.DOWN
    || keyCode == HW.DOWN
        || keyCode == UT.DOWN){
        selectIndex_y++;
}

selectIndex_y = (selectIndex_y+<%=length_y%>)%<%=length_y%>;

