<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 下午2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
switch(selectIndex_x){
    case 0:
        document.getElementById("div_generalbar_01_id").style.top = 450;
        document.getElementById("div_generalbar_03_id").style.top = 460;
        document.getElementById("div_generalbar_07_id").style.top = 460;
        document.getElementById("img_generalbar_01_id").src = "generalbar/generalbar_01a.png";
        document.getElementById("img_generalbar_03_id").src = "generalbar/generalbar_grey_03.png";
        document.getElementById("img_generalbar_07_id").src = "generalbar/generalbar_grey_07.png";
        document.div_mouse_left_x = 88;
        document.div_mouse_top_y = 460;
        break;
    case 1:
        document.getElementById("div_generalbar_01_id").style.top = 460;
        document.getElementById("div_generalbar_03_id").style.top = 450;
        document.getElementById("div_generalbar_05_id").style.top = 460;
        document.getElementById("img_generalbar_01_id").src = "generalbar/generalbar_grey_01.png";
        document.getElementById("img_generalbar_03_id").src = "generalbar/generalbar_03a.png";
        document.getElementById("img_generalbar_05_id").src = "generalbar/generalbar_grey_05.png";
        document.div_mouse_left_x = 148;
        document.div_mouse_top_y = 460;
        break;
    case 2:
        document.getElementById("div_generalbar_03_id").style.top = 460;
        document.getElementById("div_generalbar_05_id").style.top = 450;
        document.getElementById("div_generalbar_07_id").style.top = 460;
        document.getElementById("img_generalbar_03_id").src = "generalbar/generalbar_grey_03.png";
        document.getElementById("img_generalbar_05_id").src = "generalbar/generalbar_05a.png";
        document.getElementById("img_generalbar_07_id").src = "generalbar/generalbar_grey_07.png";
        document.div_mouse_left_x = 448;
        document.div_mouse_top_y = 460;
        break;
    case 3:
        document.getElementById("div_generalbar_01_id").style.top = 460;
        document.getElementById("div_generalbar_05_id").style.top = 460;
        document.getElementById("div_generalbar_07_id").style.top = 450;
        document.getElementById("img_generalbar_01_id").src = "generalbar/generalbar_grey_01.png";
        document.getElementById("img_generalbar_05_id").src = "generalbar/generalbar_grey_05.png";
        document.getElementById("img_generalbar_07_id").src = "generalbar/generalbar_07a.png";
        document.div_mouse_left_x = 508;
        document.div_mouse_top_y = 460;
        break;
}