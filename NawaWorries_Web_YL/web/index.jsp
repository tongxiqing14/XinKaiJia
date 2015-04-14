<%@ page import="service.*" %>
<%@ page import="iptvNet.NetHander" %>
<%@ page import="common.JsonToBean" %>
<%@ page import="com.fancyy.json.util.JSON" %>
<%@ page import="beans.UserTokenBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.EquipMaxIndexBean" %>
<%@ page import="common.MySessionContext" %>
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
    String ServerURL = application.getInitParameter("ServerURL");
    String UserID = request.getParameter("Account");
    String UserPassword = "1";
    String adAccount = request.getParameter("adAccount");
    String NickName = "1";
    String IconAddr = "1";
    String ProductID = request.getParameter("GameID");
    String ReturnURL = request.getParameter("ReturnURL");
    String UserToken = request.getParameter("UserToken");
    String IsAutoTopUp = application.getInitParameter("IsAutoTopUp");
    String ImageURL = application.getInitParameter("ImageURL");

    List<UserTokenBean> userTokenBeanList = (List<UserTokenBean>) application.getAttribute("usertokenbeanlist");

    if(userTokenBeanList==null){
        userTokenBeanList = new ArrayList<UserTokenBean>();
        UserTokenBean userTokenBean = new UserTokenBean(UserID, adAccount, UserToken);
        userTokenBeanList.add(userTokenBean);
        application.setAttribute("usertokenbeanlist",userTokenBeanList);
    }else {
        if(!userTokenBeanList.contains(new UserTokenBean(UserID, adAccount, UserToken))){
            userTokenBeanList.add(new UserTokenBean(UserID, adAccount, UserToken));
            application.setAttribute("usertokenbeanlist",userTokenBeanList);
        }
    }

//    String sessionId = request.getParameter("sessionId");

//    session.setAttribute("_Test", "7");

    System.out.println("===="+session.getId());
//
//    HttpSession session1 = MySessionContext.getSession(session.getId());
//
//    System.out.println("****"+session.getId());



    if(UserID!=null&&application.getAttribute(UserID)==null) {

        NetHander netHander = new NetHander(ServerURL, UserID, ProductID, adAccount, UserToken);

        if(netHander.getGameData(-1)==null||!netHander.getGameData(-1).equals("init201410082111")){

            session.setAttribute("_FighterData", JsonToBean.jsonTobean(HeroDataOp.initialFighterData()));
            session.setAttribute("_HeroData", JsonToBean.jsonTobean1(HeroDataOp.initialHeroData()));
            session.setAttribute("_MonsterData", JsonToBean.jsonTobean2(HeroDataOp.initialMonsterData()));
            session.setAttribute("_PetData", JsonToBean.jsonTobean3(HeroDataOp.initialPetData()));
            session.setAttribute("_StageData", "1");
            session.setAttribute("_JewelScore", "0");
            session.setAttribute("_ChestNum", "0");
            session.setAttribute("_EquipMaxIndex", HeroDataOp.initialEquipMaxIndex());
            session.setAttribute("_jigsawinfo", JigSawInfoOp.initialJigSawInfo());
//            session.setAttribute("stage_map_stage_btn_index", 0);

            netHander.saveGameData("init201410082111", -1);
            netHander.saveGameData(HeroDataOp.initialFighterData(), 1);    //   initialHero1Data   1
            netHander.saveGameData(HeroDataOp.initialHeroData(), 2);
            netHander.saveGameData(HeroDataOp.initialMonsterData(), 3);    //   initialHero1Data   1
            netHander.saveGameData(HeroDataOp.initialPetData(), 4);
            netHander.saveGameData("1", 5);
            netHander.saveGameData("0", 6);
            netHander.saveGameData("0", 7);
            netHander.saveGameData(JSON.toJson(HeroDataOp.initialEquipMaxIndex()), 8);
//            netHander.saveGameData("0", 9);
            netHander.saveGameData(JigSawInfoOp.initialJigSawInfo(), 10);
            netHander.saveScore(10, 0);

            if(application.getAttribute("PlayUser")==null){
                PlayerInfoSave.initialPlayersData(UserID);
            }else {
                application.setAttribute("PlayUser",PlayerInfoSave.updatePlayersData((String) application.getAttribute("PlayUser"),UserID));
            }

        }else {

            session.setAttribute("_FighterData", JsonToBean.jsonTobean(netHander.getGameData(1)));
            session.setAttribute("_HeroData", JsonToBean.jsonTobean1(netHander.getGameData(2)));
            session.setAttribute("_MonsterData", JsonToBean.jsonTobean2(netHander.getGameData(3)));
            session.setAttribute("_PetData", JsonToBean.jsonTobean3(netHander.getGameData(4)));
            session.setAttribute("_StageData", netHander.getGameData(5));
            session.setAttribute("_JewelScore", netHander.getGameData(6));
            session.setAttribute("_ChestNum", netHander.getGameData(7));
            session.setAttribute("_EquipMaxIndex",JSON.toObject(netHander.getGameData(8), EquipMaxIndexBean.class));
//            if(netHander.getGameData(9)!=null&&!netHander.getGameData(9).equals("")){
//                session.setAttribute("stage_map_stage_btn_index",Integer.valueOf(netHander.getGameData(9)));
//            }
            session.setAttribute("_jigsawinfo", netHander.getGameData(10));

            if(application.getAttribute("PlayUser")==null){
                PlayerInfoSave.initialPlayersData(UserID);
            }else {
                application.setAttribute("PlayUser",PlayerInfoSave.updatePlayersData((String) application.getAttribute("PlayUser"),UserID));
            }
        }
    }

    if(UserID==null||UserID.equals("")){
        //response.sendRedirect(ReturnURL);
        UserID = (String)session.getAttribute("UserID");
        UserPassword = (String)session.getAttribute("UserPassword");
        adAccount = (String)session.getAttribute("adAccount");
        NickName = (String)session.getAttribute("NickName");
        IconAddr = (String)session.getAttribute("IconAddr");
        ProductID = (String)session.getAttribute("ProductID");
        ReturnURL = (String)session.getAttribute("ReturnURL");
        UserToken = (String)session.getAttribute("UserToken");
    }else{
        session.setAttribute("UserID",UserID);
        session.setAttribute("UserPassword",UserPassword);
        session.setAttribute("adAccount",adAccount);
        session.setAttribute("NickName",NickName);
        session.setAttribute("IconAddr",IconAddr);
        session.setAttribute("ProductID",ProductID);
        session.setAttribute("ReturnURL",ReturnURL);
        session.setAttribute("UserToken",UserToken);
    }

    MySessionContext.AddSession(session);

    String IsButtonOnOK = application.getInitParameter("IsButtonOnOK");
    Integer button_index;

    if(IsButtonOnOK.equals("true")){
        button_index = 0;
    }else {
        button_index = 1;
    }
%>


<html>
<head>

    <style type="text/css">

        #div3
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 450px;
            top: 350px;
        }

        #div_menu_shouye_03_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 100px;
            top: 327px;
        }

        #div_menu_shouye_06_id
        {
            position:absolute;
            /*width:200px;*/
            /*height:115px;*/
            z-index:1;
            left: 100px;
            top: 390px;
        }
    </style>

    <link href="Styles/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="include/The9.Web.Key.js"></script>
    <script type="text/javascript">

        var selectIndex = 0;

        //触发onkeypress事件
        document.onkeypress = onKeyPress;
        //        document.indexframe_mouse = 0;
        document.div_font_left_x = 80;
        document.div_font_top_y = 0;

        document.operation_step = 0;

        document.button_index = <%=button_index%>;

        document.indexframe_mouse = 0;
        document.div_mouse_left_x = -100;
        document.div_mouse_top_y = 100;

        function onKeyPress(){

            var evt = window.event;
            var keyCode = evt.which ? evt.which : evt.keyCode;

            if(document.operation_step == 1){
                if(keyCode == ZTE.LEFT
                        || keyCode == HW.LEFT
                        || keyCode == UT.LEFT){
                    document.button_index--;
                }else if(keyCode == ZTE.RIGHT
                        || keyCode == HW.RIGHT
                        || keyCode == UT.RIGHT){
                    document.button_index++;
                }

                document.button_index = (document.button_index+2)%2;
//                div_mouse_left_x = 250+document.button_index*80;
                if(0==document.button_index){
                    document.div_mouse_left_x = 285;
                    document.div_mouse_top_y = 280;
                }else if(1==document.button_index){
                    document.div_mouse_left_x = 340;
                    document.div_mouse_top_y = 280;
                }

                if(keyCode == ZTE.OK || keyCode == UT.OK || keyCode == HW.OK) {
                    if(document.button_index==0){
                        window.location.href = "<%=ReturnURL%>";
                    }else {
                        window.location.href = "index.jsp";
                    }
                }
            }else {
                if(keyCode == ZTE.OK || keyCode == UT.OK || keyCode == HW.OK) {
                    if(selectIndex==0){
                        window.location.href = "limboscreen.jsp";
                    }else if(selectIndex==1){
                        window.location.href = "help.jsp";
                    }
                }

                if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
                        ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
                    document.operation_step = 1;   /**标示0键操作*/
                    <jsp:include page="topuphtmls/indexscreen/confirm_exp.jsp"></jsp:include>
                }

                if(keyCode == ZTE.UP
                        || keyCode == HW.UP
                        || keyCode == UT.UP){
                    selectIndex--;
                }else if(keyCode == ZTE.DOWN
                        || keyCode == HW.DOWN
                        || keyCode == UT.DOWN){
                    selectIndex++;
                }

                selectIndex = (selectIndex+3)%3;

                switch(selectIndex){

                    case 0:
                        document.getElementById("div_menu_shouye_03_id").style.left = '80px';
                        document.getElementById("img_menu_shouye_03_id").src = "menu/start.png";
                        document.getElementById("div_menu_shouye_06_id").style.left = '100px';
                        document.getElementById("img_menu_shouye_06_id").src = "menu/help1.png";
                        document.getElementById("div_menu_shouye_07_id").style.left = '70px';
                        document.getElementById("img_menu_shouye_07_id").src = "menu/qidai1.png";
                        document.div_font_left_x = 80;
                        break;
                    case 1:
                        document.getElementById("div_menu_shouye_03_id").style.left = '100px';
                        document.getElementById("img_menu_shouye_03_id").src = "menu/start1.png";
                        document.getElementById("div_menu_shouye_06_id").style.left = '80px';
                        document.getElementById("img_menu_shouye_06_id").src = "menu/help.png";
                        document.getElementById("div_menu_shouye_07_id").style.left = '70px';
                        document.getElementById("img_menu_shouye_07_id").src = "menu/qidai1.png";
                        document.div_font_left_x = 80;
                        break;
                    case 2:
                        document.getElementById("div_menu_shouye_03_id").style.left = '100px';
                        document.getElementById("img_menu_shouye_03_id").src = "menu/start1.png";
                        document.getElementById("div_menu_shouye_06_id").style.left = '100px';
                        document.getElementById("img_menu_shouye_06_id").src = "menu/help1.png";
                        document.getElementById("div_menu_shouye_07_id").style.left = '50px';
                        document.getElementById("img_menu_shouye_07_id").src = "menu/qidai.png";
                        document.div_font_left_x = 50;
                        break;
                }
            }
        }

        <jsp:include page="topuphtmls/teamscreen/mouse_js_method.jsp"></jsp:include>

        function run(){
//            document.getElementById("test_div").innerHTML = "browser:"+navigator.appName+"version:"+navigator.appVersion;
//            document.getElementById("test_div").innerHTML = raminfo();
            fontAnimation();
            mouse();
        }

        //获取Ram信息
        //        function raminfo(){
        //            var system=new Enumerator (service.ExecQuery("SELECT * FROM Win32_ComputerSystem")).item();
        //
        //            var physicMenCap=Math.ceil(system.TotalPhysicalMemory/1024/1024);
        //            //内存信息
        //            var memory = new Enumerator (service.ExecQuery("SELECT * FROM Win32_PhysicalMemory"));
        //            for (var mem=[],i=0;!memory.atEnd();memory.moveNext()){
        //                mem[i++]={cap:memory.item().Capacity/1024/1024,speed:memory.item().Speed};
        //            }
        //            var info="<table border=1>";
        //            info+="<tr bgcolor='#CDEDED' style='font-weight: bold;' ><td width='450'>内存信息 </td></tr>";
        //            info+="<tr style='color: red'><td >内存总量：" +(mem[0].cap+mem[1].cap) + "M</td></tr>";
        //            info+="<tr style='color: red'><td >可用物理内存：" +physicMenCap + "M</td></tr>";
        //            info+="</table>";
        //            return info;
        //        }

        function fontAnimation(){
            document.indexframe_mouse ++;
            document.indexframe_mouse  = (document.indexframe_mouse+5)%5;

            if(selectIndex==0){
                document.getElementById("div_menu_shouye_03_id").style.left = document.div_font_left_x-document.indexframe_mouse;

            }else if(selectIndex==1){
                document.getElementById("div_menu_shouye_06_id").style.left = document.div_font_left_x-document.indexframe_mouse;

            }else if(selectIndex==2){
                document.getElementById("div_menu_shouye_07_id").style.left = document.div_font_left_x-document.indexframe_mouse;

            }

            setTimeout("fontAnimation()",150);
        }

    </script>

</head>

<body onload="run()" style="background-Repeat:no-repeat" width="640" height="530">

<%--<div id="test_div" style="z-index: 5;font-size:20px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"><%=session.getId()%></div>--%>

<div id="div1" style='position: absolute;left: -2px;'>
    <img id="id00" src="menu/menu.jpg" style="position:absolute; left:0px; top:0px; z-index:1"/>
</div>

<div id="div_menu_shouye_03_id" style='position: absolute;left: 100px;top: 107px;'>
    <img id="img_menu_shouye_03_id" src="menu/start1.png" style="position:absolute; left:0px; top:0px; z-index:1"/>
</div>

<div id="div_menu_shouye_06_id" style='position: absolute;left: 100px;top: 227px;'>
    <img id="img_menu_shouye_06_id" src="menu/help1.png" style="position:absolute; left:0px; top:0px; z-index:1"/>
</div>

<div id="div_menu_shouye_07_id" style='position: absolute;left: 70px;top: 350px;'>
    <img id="img_menu_shouye_07_id" src="menu/qidai1.png" style="position:absolute; left:0px; top:0px; z-index:1"/>
</div>

<jsp:include page="topuphtmls/indexscreen/confirm.jsp"></jsp:include>

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
