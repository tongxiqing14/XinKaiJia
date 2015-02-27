<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 下午2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String preScreen = "";

    if(session.getAttribute("preScreen")!=null){
        preScreen = (String) session.getAttribute("preScreen");
    }
%>
    if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
            ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
    <%if(preScreen.equals("mainscreen")){%>
            window.location.href = "main.jsp";
    <%}else { %>
            window.location.href = "stageMapScreen.jsp";
    <%}%>

    }