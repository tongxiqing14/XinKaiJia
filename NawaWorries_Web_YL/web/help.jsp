<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-10-29
  Time: 下午6:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript">
        //触发onkeypress事件
        document.onkeypress = onKeyPress;

        function onKeyPress(){
            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                    ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                window.location.href = "index0.jsp";
            }
        }
    </script>
</head>
<body>
    <div id="div_bg_id" style="position: absolute;left: 0px;top: 0px;">
        <img src="help/help.png"/>
    </div>
</body>
</html>