<%@ page import="beans.FighterBean" %>
<%@ page import="java.util.List" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="java.util.Properties" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-10-23
  Time: 下午7:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer hero_index = 0;

    if(session.getAttribute("heroScreen_selectIndex")!=null){
        hero_index = Integer.valueOf((String) session.getAttribute("heroScreen_selectIndex"));
    }

    if(hero_index==6){
        hero_index = 3;
    }else {
        hero_index = (hero_index+3)%3;
    }

//    if(request.getParameter("hero_index")!=null){
//        hero_index = Integer.valueOf(request.getParameter("hero_index"));
//    }
//
//    /**获取 hero list*/
//    List<FighterBean> heroList = (List<FighterBean>) session.getAttribute("_FighterData");
//
//    if(hero_index==2&&heroList.get(hero_index).isGot_flag()==3){
//        hero_index = 3;
//    }
    PropertiesOp propertiesOp = new PropertiesOp();
    Properties properties1 = propertiesOp.load("/initial/gamebgimgpath.properties");

    Integer selected_stage= Integer.valueOf((String) session.getAttribute("selected_stage"));

    String[] up_half_img_array = new String[]{"xinxuanren/img4/01_01.jpg","xinxuanren/img4/02_01.jpg","xinxuanren/img4/3_01.jpg","xinxuanren/img4/07_01.jpg"};
    String[] down_half_img_array = new String[]{"xinxuanren/img4/01_02.jpg","xinxuanren/img4/02_02.jpg","xinxuanren/img4/3_02.jpg","xinxuanren/img4/07_02.jpg"};


    String followingPage = session.getAttribute("followingPage")!=null ? (String) session.getAttribute("followingPage") : null;

%>
<html>
<head>
    <title></title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        document.div_up_half_img_y = -265;
        document.div_down_half_img_y = 530;
        document.div_down_half_img = 265;

        document.speed_deta = 5;

        document.hero_index = <%=hero_index%>;

        function run(){

            if("<%=(followingPage == null)%>" == "true"){
                /**根据选择变化关卡背景*/

                imgMove();
                increaseSpeed();
            }else{
                /**从jar返回到jsp界面*/

                window.location.href = "<%=followingPage%>";
                <%--<%session.removeAttribute("followingPage");%>--%>
            }

        }

        function increaseSpeed(){
            document.speed_deta += 1;
            setTimeout("increaseSpeed()",100);
        }

        function imgMove(){

            document.div_up_half_img_y += document.speed_deta;
            document.div_down_half_img_y -= document.speed_deta;

            document.getElementById("div_up_half_img").style.top = document.div_up_half_img_y+'px';
            document.getElementById("div_down_half_img").style.top = document.div_down_half_img_y+'px';

            if(document.div_up_half_img_y<0){
                setTimeout("imgMove()",50);
            }else{
//                document.getElementById("id00").src = "main/main(3).jpg";
                <%--document.getElementById("id00").src = <%=properties1.getProperty("imgpath"+(selected_stage+1))%>;--%>
                document.getElementById("div1").style.left = 0+'px';
                setTimeout("time_count()",2000);
            }
        }

        function imgMoveOut(){
            document.div_up_half_img_y -= document.speed_deta;
            document.div_down_half_img_y += document.speed_deta;

            document.getElementById("div_up_half_img").style.top = document.div_up_half_img_y+'px';
            document.getElementById("div_down_half_img").style.top = document.div_down_half_img_y+'px';

            if(document.div_up_half_img_y>-265){
                setTimeout("imgMoveOut()",50);
            }else{
                transit();
            }
        }

        var time_count1 = 4;
        function time_count(){
              if(time_count1 <= 1){
                  document.getElementById("time_count").innerHTML = "";
                  imgMoveOut();
              }else{
                  time_count1 -- ;
                  document.getElementById("time_count").innerHTML = time_count1+"";
                  setTimeout("time_count()",1500);
              }
        }

        function transit(){
            <%--if("<%=(followingPage == null)%>" == "true"){--%>
                window.location.href = "gamescreen1.jsp?selectIndex="+<%=request.getParameter("selectIndex")%>;
//            }else{
                <%--window.location.href = "<%=followingPage%>";--%>
                <%--<%session.removeAttribute("followingPage");%>--%>
//            }

        }

    </script>
</head>
<body onload="run()">

<%--<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 85px; left: 80px;color: #ffffff;">(null == <%=followingPage%>)</div>--%>
<%--<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 105px; left: 80px;color: #ffffff;">("<%=(followingPage == null)%>" == "true")</div>--%>


<%--<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"><%=followingPage%></div>--%>

<%--<div id="test_div" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;">--%>
<%--<%=heroList.get(hero_index).isGot_flag()%> <br>--%>
<%--<%=hero_index%>--%>
<%--</div>--%>
<div id="time_count" style="z-index: 2;font-size:160px;font-weight: bold;position: absolute; top: 140px; left: 280px;color: #fdfdfe;"></div>

<div id="div1" style='position: absolute;'>
    <img id="id00" src="team/bg.jpg" />
</div>

<div id="div_up_half_img" style="position:absolute; left: 0px; top: 0px;">
    <img id="img_up_half_img" src="<%=up_half_img_array[hero_index]%>"/>
</div>

<div id="div_down_half_img" style="position:absolute; left: 0px; top: 265px;">
    <img id="img_down_half_img" src="<%=down_half_img_array[hero_index]%>"/>
</div>

</body>
</html>