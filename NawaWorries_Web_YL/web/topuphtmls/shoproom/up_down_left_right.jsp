<%@ page import="beans.EquipMaxIndexBean" %>
<%@ page import="elements.armorbase.EquipItem" %>
<%@ page import="java.util.List" %>
<%@ page import="common.JsonToBean" %>
<%@ page import="java.util.Properties" %>
<%@ page import="common.PropertiesOp" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 上午9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   Integer length_x = 0;
    if(request.getParameter("length_x")!=null){
        length_x = Integer.valueOf(request.getParameter("length_x"));
    }

    Integer length_y = 0;
    if(request.getParameter("length_y")!=null){
        length_y = Integer.valueOf(request.getParameter("length_y"));
    }

    Integer last_length_x = 0;
    if(request.getParameter("last_length_x")!=null){
        last_length_x = Integer.valueOf(request.getParameter("last_length_x"));
    }

    Integer equipItemSize = 0;
    if(request.getParameter("equipItemSize")!=null){
        equipItemSize = Integer.valueOf(request.getParameter("equipItemSize"));
    }

//    PropertiesOp propertiesOp = new PropertiesOp();
//    Properties properties = propertiesOp.load("/initial/equip.properties");
//    EquipMaxIndexBean equipMaxIndexBean = (EquipMaxIndexBean) session.getAttribute("_EquipMaxIndex");
//    List<EquipItem> equipItemList = JsonToBean.jsonTobean4(properties.getProperty("equip1")).subList(equipMaxIndexBean.getEquipMaxIndex(Integer.valueOf(heroIndex)+1),9);

%>
if(keyCode == ZTE.LEFT
    || keyCode == HW.LEFT
        || keyCode == UT.LEFT) {
            selectIndex_x--;
} else if(keyCode == ZTE.RIGHT
    || keyCode == HW.RIGHT
        || keyCode == UT.RIGHT){
         if(selectIndex_x+1+selectIndex_y*5<<%=equipItemSize%>){
            selectIndex_x++;
         }
}

if(keyCode == ZTE.UP
    || keyCode == HW.UP
        || keyCode == UT.UP) {
        selectIndex_y--;
} else if(keyCode == ZTE.DOWN
    || keyCode == HW.DOWN
        || keyCode == UT.DOWN){
        if(selectIndex_x+(selectIndex_y+1)*5<<%=equipItemSize%>){
            selectIndex_y++;
        }
}

<%--if(selectIndex_x+selectIndex_y*5<<%=equipItemSize-1%>){--%>
    selectIndex_y = (selectIndex_y+<%=length_y%>)%<%=length_y%>;

    if(selectIndex_y==(length_y-1)){
        if(selectIndex_x<0) selectIndex_x = 0;
        selectIndex_x = (selectIndex_x+<%=last_length_x%>)%<%=last_length_x%>;
    }else{
        if(selectIndex_x<0) selectIndex_x = 0;
         selectIndex_x = (selectIndex_x+<%=length_x%>)%<%=length_x%>;
    }

<%--}--%>

