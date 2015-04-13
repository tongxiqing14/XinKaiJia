<%@ page import="beans.FighterBean" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-7-21
  Time: 下午6:40
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   String[] heroimg_array_names = new String[]{"hero/main_hero_img/action1_03.png","hero/main_hero_img/action1_06.png","hero/main_hero_img/jingan_action1_03.png","hero/main_hero_img/1.png","hero/main_hero_img/chaoji_xintian1.png","hero/main_hero_img/jingan_1.png","hero/main_hero_img/hero1_03.png"};
   String[] hero_title_img_path_array = new String[]{"titles/hero/1.png","titles/hero/2.png","titles/hero/3.png","titles/hero/4.png","titles/hero/5.png","titles/hero/6.png","titles/hero/7.png"};
   String[] armour_name_array = new String[]{"飞影侠","刑天侠","金刚侠","超级飞影侠","超级刑天侠","超级金刚侠","修罗侠"};
   String heroIndex = (String) session.getAttribute("heroScreen_selectIndex");

   Integer refresh_num = 0;
   if(request.getParameter("refresh_num")!=null){
       refresh_num = Integer.valueOf(request.getParameter("refresh_num"));
   }

    /**获取 hero list*/
    List<FighterBean> heroList = (List<FighterBean>) session.getAttribute("_FighterData");

   Integer jewelScore=0;
   Integer chestNum=0;

    session.setAttribute("preScreen","mainscreen");

   if(session.getAttribute("UserID")!=null){
       if(session.getAttribute("_JewelScore")!=null){
           jewelScore = Integer.valueOf((String) session.getAttribute("_JewelScore")) ;
       }

       if(session.getAttribute("_ChestNum")!=null){
           chestNum = Integer.valueOf((String) session.getAttribute("_ChestNum"));
       }
   }

   Integer select_index_of_mouse = 0;
   if(request.getParameter("select_index_of_mouse")!=null){
       select_index_of_mouse = Integer.valueOf((String) request.getParameter("select_index_of_mouse"));
   }
%>
<html>
<head>
    <title>main</title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #div_item_id
        {
            position:absolute;
            z-index:1;
            left: 20px;
            top: 295px;
        }

        #div_hero_animation_id
        {
            position:absolute;
            z-index:1;
            left: 20px;
            top: 295px;
        }
    </style>
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript" src="include/common.js"></script>
    <script type="text/javascript" src="include/main/main.js"></script>
    <script type="text/javascript">

        document.isLocked = false;

        var selectIndex = <%=select_index_of_mouse%>;

        var index_i =0;

        var indexframe_mouse = 0;
        var div_mouse_left_x = 75;
        var div_mouse_top_y = 335;

        <%--var refresh_num = <%=refresh_num%>;--%>

        function run(){

//            if(refresh_num==0){
//                window.location.href = "main.jsp?refresh_num=1";
//            }

            document.getElementById("img_hero_animation_id").src = "<%=heroimg_array_names[Integer.valueOf(heroIndex)]%>";
            document.getElementById("div_hero_animation_id").style.left = 460+'px';
            document.getElementById("div_hero_animation_id").style.top = 230+'px';
            mouse();

            document.getElementById("img_item_id").src = "main/item-3h.png";
            document.getElementById("img_item_id").src = "main/item-3f.png";
            document.getElementById("img_item_id").src = "main/item-3e.png";
            document.getElementById("img_item_id").src = "main/item-3d.png";
            document.getElementById("img_item_id").src = "main/item-3a.png";
            document.getElementById("img_item_id").src = "main/item-3b.png";
            document.getElementById("img_item_id").src = "main/item-3c.png";
            document.getElementById("img_item_id").src = "main/item-3g.png";

            if(selectIndex==0){
                document.getElementById("div_item_id").style.left = '20px';
                document.getElementById("div_item_id").style.top = '295px';
                document.getElementById("img_item_id").src = "main/item-3g.png";

                div_mouse_left_x = 75;
                div_mouse_top_y = 335;
            }else if(selectIndex == 1){
                document.getElementById("div_item_id").style.left = '25px';
                document.getElementById("div_item_id").style.top = '225px';
                document.getElementById("img_item_id").src = "main/item-3h.png";

                div_mouse_left_x = 60;
                div_mouse_top_y = 240;
            }else if(selectIndex == 2){
                document.getElementById("div_item_id").style.left = '120px';
                document.getElementById("div_item_id").style.top = '165px';
                document.getElementById("img_item_id").src = "main/item-3f.png";

                div_mouse_left_x =220;
                div_mouse_top_y = 185;
            }else if(selectIndex == 3){
                document.getElementById("div_item_id").style.left = '220px';
                document.getElementById("div_item_id").style.top = '320px';
                document.getElementById("img_item_id").src = "main/item-3e.png";

                div_mouse_left_x = 355;
                div_mouse_top_y = 325;
            }else if(selectIndex == 4){
                document.getElementById("div_item_id").style.left = '325px';
                document.getElementById("div_item_id").style.top = '165px';
                document.getElementById("img_item_id").src = "main/item-3d.png";

                div_mouse_left_x = 380;
                div_mouse_top_y =205;
            }else if(selectIndex == 5){
                document.getElementById("div_item_id").style.left = '455px';
                document.getElementById("div_item_id").style.top = '90px';
                document.getElementById("img_item_id").src = "main/item-3a.png";

                div_mouse_left_x = 533;
                div_mouse_top_y = 100;
            }else if(selectIndex == 6){
                document.getElementById("div_item_id").style.left = '485px';
                document.getElementById("div_item_id").style.top = '230px';
                document.getElementById("img_item_id").src = "main/item-3b.png";

                div_mouse_left_x = 560;
                div_mouse_top_y = 210;
            }else if(selectIndex == 7){
                document.getElementById("div_item_id").style.left = '465px';
                document.getElementById("div_item_id").style.top = '330px';
                document.getElementById("img_item_id").src = "main/item-3c.png";

                div_mouse_left_x = 545;
                div_mouse_top_y = 290;
            }
        }

        function mouse(){
            indexframe_mouse ++;
            indexframe_mouse  = (indexframe_mouse+5)%5;
            document.getElementById("div_mouse_id").style.left = div_mouse_left_x-indexframe_mouse+'px';
            document.getElementById("div_mouse_id").style.top = div_mouse_top_y+indexframe_mouse+'px';

            setTimeout("mouse()",150);
        }

        //触发onkeypress事件
        document.onkeypress = onKeyPress;

        function onKeyPress(){
            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            if(!document.isLocked){
                if(selectIndex == 0){
                    /**不同方向键的匹配*/
                    if(keyCode == ZTE.UP
                            || keyCode == HW.UP
                            || keyCode == UT.UP) {
                        selectIndex++;
                    }else if(keyCode == ZTE.RIGHT
                            || keyCode == HW.RIGHT
                            || keyCode == UT.RIGHT){
                        selectIndex+=3;
                    }
                }else if(selectIndex == 1){
                    if(keyCode == ZTE.RIGHT
                            || keyCode == HW.RIGHT
                            || keyCode == UT.RIGHT){
                        selectIndex++;
                    }else if(keyCode == ZTE.DOWN
                            || keyCode == HW.DOWN
                            || keyCode == UT.DOWN) {
                        selectIndex--;
                    }
                }else if(selectIndex == 2){
                    if(keyCode == ZTE.LEFT
                            || keyCode == HW.LEFT
                            || keyCode == UT.LEFT) {
                        selectIndex--;
                    }else if(keyCode == ZTE.RIGHT
                            || keyCode == HW.RIGHT
                            || keyCode == UT.RIGHT){
                        selectIndex+=2;
                    }else if(keyCode == ZTE.DOWN
                            || keyCode == HW.DOWN
                            || keyCode == UT.DOWN) {
                        selectIndex++;
                    }
                }else if(selectIndex == 3){
                    /**不同方向键的匹配*/
                    if(keyCode == ZTE.UP
                            || keyCode == HW.UP
                            || keyCode == UT.UP) {
                        selectIndex++;
                    }else if(keyCode == ZTE.LEFT
                            || keyCode == HW.LEFT
                            || keyCode == UT.LEFT) {
                        selectIndex-=3;
                    }else if(keyCode == ZTE.RIGHT
                            || keyCode == HW.RIGHT
                            || keyCode == UT.RIGHT){
                        selectIndex+=4;
                    }
                }else if(selectIndex == 4){
                    /**不同方向键的匹配*/
                    if(keyCode == ZTE.UP
                            || keyCode == HW.UP
                            || keyCode == UT.UP) {
                        selectIndex++;
                    }else if(keyCode == ZTE.LEFT
                            || keyCode == HW.LEFT
                            || keyCode == UT.LEFT) {
                        selectIndex-=2;
                    }else if(keyCode == ZTE.RIGHT
                            || keyCode == HW.RIGHT
                            || keyCode == UT.RIGHT){
                        selectIndex+=2;
                    }else if(keyCode == ZTE.DOWN
                            || keyCode == HW.DOWN
                            || keyCode == UT.DOWN) {
                        selectIndex--;
                    }
                }else if(selectIndex == 5){
                    if(keyCode == ZTE.DOWN
                            || keyCode == HW.DOWN
                            || keyCode == UT.DOWN) {
                        selectIndex++;
                    }else if(keyCode == ZTE.LEFT
                            || keyCode == HW.LEFT
                            || keyCode == UT.LEFT) {
                        selectIndex--;
                    }
                }else if(selectIndex == 6){
                    /**不同方向键的匹配*/
                    if(keyCode == ZTE.UP
                            || keyCode == HW.UP
                            || keyCode == UT.UP) {
                        selectIndex--;
                    }else if(keyCode == ZTE.DOWN
                            || keyCode == HW.DOWN
                            || keyCode == UT.DOWN) {
                        selectIndex++;
                    }else if(keyCode == ZTE.LEFT
                            || keyCode == HW.LEFT
                            || keyCode == UT.LEFT) {
                        selectIndex-=2;
                    }
                }else{
                    if(keyCode == ZTE.LEFT
                            || keyCode == HW.LEFT
                            || keyCode == UT.LEFT) {
                        selectIndex-=4;
                    }else if(keyCode == ZTE.RIGHT
                            || keyCode == HW.RIGHT
                            || keyCode == UT.RIGHT||keyCode==UT.TWO){
                        selectIndex++;
                    }else if(keyCode == ZTE.UP
                            || keyCode == HW.UP
                            || keyCode == UT.UP) {
                        selectIndex--;
                    }
                }

                selectIndex = (selectIndex+8)%8;

                if(selectIndex==0){
                    document.getElementById("div_item_id").style.left = '20px';
                    document.getElementById("div_item_id").style.top = '295px';
                    document.getElementById("img_item_id").src = "main/item-3g.png";

                    div_mouse_left_x = 75;
                    div_mouse_top_y = 335;
                }else if(selectIndex == 1){
                    document.getElementById("div_item_id").style.left = '25px';
                    document.getElementById("div_item_id").style.top = '225px';
                    document.getElementById("img_item_id").src = "main/item-3h.png";

                    div_mouse_left_x = 60;
                    div_mouse_top_y = 240;
                }else if(selectIndex == 2){
                    document.getElementById("div_item_id").style.left = '120px';
                    document.getElementById("div_item_id").style.top = '165px';
                    document.getElementById("img_item_id").src = "main/item-3f.png";

                    div_mouse_left_x =220;
                    div_mouse_top_y = 185;
                }else if(selectIndex == 3){
                    document.getElementById("div_item_id").style.left = '220px';
                    document.getElementById("div_item_id").style.top = '320px';
                    document.getElementById("img_item_id").src = "main/item-3e.png";

                    div_mouse_left_x = 355;
                    div_mouse_top_y = 325;
                }else if(selectIndex == 4){
                    document.getElementById("div_item_id").style.left = '325px';
                    document.getElementById("div_item_id").style.top = '165px';
                    document.getElementById("img_item_id").src = "main/item-3d.png";

                    div_mouse_left_x = 380;
                    div_mouse_top_y =205;
                }else if(selectIndex == 5){
                    document.getElementById("div_item_id").style.left = '455px';
                    document.getElementById("div_item_id").style.top = '90px';
                    document.getElementById("img_item_id").src = "main/item-3a.png";

                    div_mouse_left_x = 533;
                    div_mouse_top_y = 100;
                }else if(selectIndex == 6){
                    document.getElementById("div_item_id").style.left = '485px';
                    document.getElementById("div_item_id").style.top = '230px';
                    document.getElementById("img_item_id").src = "main/item-3b.png";

                    div_mouse_left_x = 560;
                    div_mouse_top_y = 210;
                }else if(selectIndex == 7){
                    document.getElementById("div_item_id").style.left = '465px';
                    document.getElementById("div_item_id").style.top = '330px';
                    document.getElementById("img_item_id").src = "main/item-3c.png";

                    div_mouse_left_x = 545;
                    div_mouse_top_y = 290;
                }
            }

            if(keyCode == ZTE.OK || keyCode == UT.OK || keyCode == HW.OK) {
                if(document.isLocked){
                    window.location.href = "main.jsp?select_index_of_mouse="+selectIndex;
                }else{
                    if(selectIndex==0){
                        window.location.href = "backpackscreen.jsp?preScreen=mainscreen";
                    }else if(selectIndex==1){
                        window.location.href = "RankScreen.jsp";
                    }else if(selectIndex==2){
                        window.location.href = "armorbasescreen.jsp?preScreen=mainscreen";
                    }else if(selectIndex==3){
                        window.location.href = "ShopRoomScreen.jsp";     //
//                        div_mouse_left_x = 250;
//                        div_mouse_top_y = 280;
//                        document.getElementById("div_div_msg_id").innerHTML = "未解锁";
//                        document.getElementById("msgDiv").style.left=120+'px';
//                        document.getElementById("msgDiv").style.top=90+'px';
//                        document.getElementById("div_confirm_id").style.left=250+'px';
//                        document.getElementById("div_confirm_id").style.top=300+'px';
//                        document.getElementById("div_mouse_id").style.left=230+'px';
//                        document.getElementById("div_mouse_id").style.top=300+'px';
//                        document.isLocked = true;
                    }else if(selectIndex==4){
//                        window.location.href = "battleheart.jsp";       //
                        div_mouse_left_x = 250;
                        div_mouse_top_y = 280;
                        document.getElementById("div_div_msg_id").innerHTML = "未解锁,敬请期待";
                        document.getElementById("msgDiv").style.left=120+'px';
                        document.getElementById("msgDiv").style.top=90+'px';
                        document.getElementById("div_confirm_id").style.left=250+'px';
                        document.getElementById("div_confirm_id").style.top=300+'px';
                        document.getElementById("div_mouse_id").style.left=230+'px';
                        document.getElementById("div_mouse_id").style.top=300+'px';
                        document.isLocked = true;
                    }else if(selectIndex==5){
                        window.location.href = "jigsawscreen.jsp";     //
//                        div_mouse_left_x = 250;
//                        div_mouse_top_y = 280;
//                        document.getElementById("div_div_msg_id").innerHTML = "未解锁";
//                        document.getElementById("msgDiv").style.left=120+'px';
//                        document.getElementById("msgDiv").style.top=90+'px';
//                        document.getElementById("div_confirm_id").style.left=250+'px';
//                        document.getElementById("div_confirm_id").style.top=300+'px';
//                        document.getElementById("div_mouse_id").style.left=230+'px';
//                        document.getElementById("div_mouse_id").style.top=300+'px';
//                        document.isLocked = true;
                    }else if(selectIndex==6){
                        window.location.href = "taskscreen.jsp?preScreen=mainscreen";
                    }else if(selectIndex==7){
                        window.location.href = "stageMapScreen.jsp";
                    }
                }
            }

            if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                    ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                window.location.href = "hero.jsp";
            }

        }

    </script>
</head>
<body onload="run()" style="background-Repeat:no-repeat">

    <div id="div1" style='position: absolute;'>
        <img id="id00" src="main/main(3).jpg" />
    </div>

    <div id="div_item_id" style='position: absolute;'>
        <img id="img_item_id" src="main/item-3g.png" />
    </div>

    <div id="div_title_id" style="position: absolute;z-index: 1;left: 25px;top: 23px;width: 100px;">
         <img id="img_title_id" src="<%=hero_title_img_path_array[Integer.valueOf(heroIndex)]%>" />
    </div>
    <span id="span_title_id" style="font-size:16px;font-weight: bold;z-index: 1;position: absolute; top: 60px; left: 120px;color: #ffffff;"><%=armour_name_array[Integer.valueOf(heroIndex)]%></span>

    <%--<object height="100" width="100" data="just K.O.mp3"></object>--%>

    <div id="div_hero_animation_id" style='position: absolute;'>
        <img id="img_hero_animation_id" src="" />
    </div>

    <div id="title-2_13_1" style='position: absolute;left: 415px;top: 20px;'>
        <img id="img_title-2_13_1" src="game/title-2_13.png" />
        <div id="jewelry-2_05" style='position: absolute; left: 50px;top: 10px;'>
            <img id="img_jewelry-2_05" src="game/jewelry-2_05.png" />
        </div>
        <div id="div_jewelry_num_id" style='font-size:16px; position: absolute; left: 25px;top: 15px;'>
            <span id="div_span_jewelry_num_id" style="font-size:16px;font-weight: bold;z-index: 1;position: absolute; color: #ffffff;"><%=jewelScore%></span>
        </div>
    </div>

    <div id="title-2_13_2" style='position: absolute;left: 530px;top: 20px;'>
        <img id="img_title-2_13_2" src="game/title-2_13.png" />
        <div id="chest-2_07" style='position: absolute;left: 50px;top: 10px;'>
            <img id="img_chest-2_07" src="game/chest-2_07.png" />
        </div>
        <div id="div_chest_num_id" style='font-size:16px; position: absolute; left: 15px;top: 15px;'>
            <span id="div_span_chest_num_id" style="font-size:16px;font-weight: bold;z-index: 1;position: absolute; color: #ffffff;"><%=chestNum%></span>
        </div>
    </div>

    <div id="div_mouse_id" style="position: absolute;z-index: 5;left: 75px;top: 335px;">
        <img id="img_mouse_id" src="stage/mouse.png">
    </div>

    <div id="msgDiv" style='position: absolute;z-index: 3;left: -800px; top: 60px;'>
        <img id="img_popupbox_id" src="stage/popupbox.png" />
        <div id="div_div_msg_id" style="font-size:16px;font-weight: bold;position: absolute; z-index: 2; left: 80px; top: 60px;"></div>
        <div id="div_div_msg1_id" style="font-size:16px;font-weight: bold;position: absolute; z-index: 2; left: 80px; top: 80px;"></div>
        <div id="div_div_msg2_id" style="font-size:16px;font-weight: bold;position: absolute; left: 80px; top: 100px; color: red;"></div>
    </div>

    <div id="div_confirm_id" style='position: absolute;z-index: 4;left: -230px;top: 300px;'>
        <img id="img_confirm_id" src="hero/que.png" />
    </div>

    <div id="div_cancel_id" style='position: absolute;z-index: 4;left: -310px;top: 300px;'>
        <img id="img_cancel_id" src="hero/back.png" />
    </div>

    <a>
        <img id="NewStory1" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory2" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory3" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory4" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory5" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory6" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory7" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory8" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory9" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory10" src="touming.png" width="194" height="65" />
    </a>

    <a>
        <img id="NewStory11" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory12" src="touming.png" width="10" height="65" />
    </a>

    <a>
        <img id="NewStory13" src="touming.png" width="194" height="65" />
    </a>
</body>
</html>