<%@ page import="service.JigSawInfoOp" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-6
  Time: 下午4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String jigsawinfo = (String) session.getAttribute("_jigsawinfo");
    int[][] jigsawinfo_array = JigSawInfoOp.getJigSawInfo(jigsawinfo);

    for (int j=0; j<jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))].length; j++){
        if(jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))][j]==1){ %>
            document.getElementById("div_jisaw_img_id<%=(j+1)%>").style.left = '-1000px';
    <% }
    }
%>