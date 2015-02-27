<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-8-14
  Time: 上午9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        #div2
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 70px;
            top: 170px;
        }

        #div3
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 70px;
            top: 200px;
        }

        #div4
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 70px;
            top: 230px;
        }

        #div5
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 70px;
            top: 260px;
        }

        #div6
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 70px;
            top: 290px;
        }

    </style>
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript">

        var font_time = 0;

        function run(){
            draw_fonts();
        }

        function draw_fonts(){

            if(font_time == 0){      //div2
                document.getElementById("id02").src = "limbo/2_01.png";
            }else if(font_time == 1){      //div3
                document.getElementById("id03").src = "limbo/2_02.png";
            }else if(font_time == 2){      //div4
                document.getElementById("id04").src = "limbo/2_03.png";
            }else if(font_time == 3){     //div5
                document.getElementById("id05").src = "limbo/2_04.png";
            }else if(font_time == 4){     //div6
                document.getElementById("id06").src = "limbo/2_05.png";
            }else if(font_time == 6){     //div6
                window.location.href = "hero.jsp";
            }

            font_time ++;

            setTimeout("draw_fonts()",2500);
        }

//        function onKeyPress(e){
//
//            if(e.keyCode==UT.OK||e.keyCode==ZTE.OK||e.keyCode==HW.OK){
//                window.location.href = "hero.jsp";
//            }
//
//        }

        Box.OK = "hero.jsp";

        //按0,back键返回
        Box.ZERO = "index.jsp";
        Box.BACK = "index.jsp";

    </script>
</head>
<body onload="run()" style="background-Repeat:no-repeat" width="640" height="530">
    <div id="div1" style='position: absolute;'>
        <img id="id01" src="limbo/limbo.jpg" />
    </div>

    <div id="div2" style='position: absolute;'>
        <img id="id02" src="" />
    </div>

    <div id="div3" style='position: absolute;'>
        <img id="id03" src="" />
    </div>

    <div id="div4" style='position: absolute;'>
        <img id="id04" src="" />
    </div>

    <div id="div5" style='position: absolute;'>
        <img id="id05" src="" />
    </div>

    <div id="div6" style='position: absolute;'>
        <img id="id06" src="" />
    </div>
</body>
</html>