<%@ page import="beans.FighterBean" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 下午7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /**获取 hero list*/
    List<FighterBean> heroList = (List<FighterBean>) session.getAttribute("_FighterData");

%>
if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
    switch(selectIndex_y){
        case 0:
             <%if(heroList.get(0).isGot_flag()>0){%>
                    window.location.href = "armorbasescreen.jsp?task_selectIndex_y=0";
             <%}else {%>
                    document.getElementById("div_div_msg_id").innerHTML = "该铠甲未被购买";
                    document.getElementById("msgDiv").style.left=120;
                    document.getElementById("msgDiv").style.top=90;
                    setTimeout("transitdd()",1000);
             <%}%>
            break;
        case 1:
            <%if(heroList.get(1).isGot_flag()>0){%>
                window.location.href = "armorbasescreen.jsp?task_selectIndex_y=1";
            <%}else {%>
                document.getElementById("div_div_msg_id").innerHTML = "该铠甲未被购买";
                document.getElementById("msgDiv").style.left=120;
                document.getElementById("msgDiv").style.top=90;
                setTimeout("transitdd()",500);
            <%}%>
            break;
        case 2:
            <%if(heroList.get(2).isGot_flag()>0){%>
                 window.location.href = "armorbasescreen.jsp?task_selectIndex_y=2";
            <%}else {%>
                document.getElementById("div_div_msg_id").innerHTML = "该铠甲未被购买";
                document.getElementById("msgDiv").style.left=120;
                document.getElementById("msgDiv").style.top=90;
                setTimeout("transitdd()",500);
            <%}%>
            break;
        case 3:
            <%if(heroList.get(3).isGot_flag()>0){%>
                window.location.href = "armorbasescreen.jsp?task_selectIndex_y=3";
            <%}else {%>
                document.getElementById("div_div_msg_id").innerHTML = "该铠甲未被购买";
                document.getElementById("msgDiv").style.left=120;
                document.getElementById("msgDiv").style.top=90;
                setTimeout("transitdd()",500);
            <%}%>
            break;
        case 4:
            <%if(heroList.get(4).isGot_flag()>0){%>
                window.location.href = "armorbasescreen.jsp?task_selectIndex_y=4";
            <%}else {%>
                document.getElementById("div_div_msg_id").innerHTML = "该铠甲未被购买";
                document.getElementById("msgDiv").style.left=120;
                document.getElementById("msgDiv").style.top=90;
                setTimeout("transitdd()",500);
            <%}%>
            break;
        case 5:
            <%if(heroList.get(5).isGot_flag()>0){%>
                window.location.href = "armorbasescreen.jsp?task_selectIndex_y=5";
            <%}else {%>
                document.getElementById("div_div_msg_id").innerHTML = "该铠甲未被购买";
                document.getElementById("msgDiv").style.left=120;
                document.getElementById("msgDiv").style.top=90;
                setTimeout("transitdd()",500);
            <%}%>
            break;
    }
}

