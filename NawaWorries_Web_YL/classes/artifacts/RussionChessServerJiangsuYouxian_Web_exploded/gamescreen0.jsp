<%@ page import="com.fancyy.json.util.JSON" %>
<%@ page import="elements.EnemyTeam" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.FighterItemBean" %>
<%@ page import="beans.FighterItemBean" %>
<%@ page import="elements.armorbase.EquipItem" %>
<%@ page import="beans.*" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-7-25
  Time: 下午3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PropertiesOp propertiesOp = new PropertiesOp();
    Properties properties = propertiesOp.load("/role_image_array_names.properties");
    Properties properties1 = propertiesOp.load("/initial/gamebgimgpath.properties");
    Properties properties2 = propertiesOp.load("/titleitemimg.properties");
    Properties properties3 = propertiesOp.load("/map/fightereffectmap.properties");
    Properties properties4 = propertiesOp.load("/initial/effect.properties");
    Properties properties5 = propertiesOp.load("/titleimgpath.properties");

    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

    Integer selected_stage= Integer.valueOf((String) session.getAttribute("selected_stage"));

    /**获取敌方成员*/
    List<EnemyTeam> enemyTeamList = new ArrayList<EnemyTeam>();

    if(session.getAttribute("enemy_team")!=null){
        enemyTeamList = (List<EnemyTeam>) JSON.toObject((String) session.getAttribute("enemy_team"), EnemyTeam.class);
    }

    /**获取 hero list*/
    List<FighterBean> heroList = (List<FighterBean>) session.getAttribute("_FighterData");

    /**筛选已选中 hero list*/
    List<FighterBean> selectHeroList = new ArrayList<FighterBean>();

    for (FighterBean heroItem : heroList){
        if(heroItem.isSelect_flag()) selectHeroList.add(heroItem);
    }

    /**筛选 hero list中的hero list*/
    List<FighterItemBean> monsterList_in_heroList = new ArrayList<FighterItemBean>();
    List<FighterBean> herolist_in_selectHerolist = new ArrayList<FighterBean>();
    for (FighterBean heroItem : selectHeroList){
        if (heroItem.getType() == 0){
            herolist_in_selectHerolist.add(heroItem);
            for(FighterItemBean fighterBean : ((List<FighterItemBean>) session.getAttribute("_HeroData"))){
                if(heroItem.getFighter_id() == fighterBean.getFighter_id()){
                    monsterList_in_heroList.add(fighterBean);
                }
            }
        }
    }

    /**筛选 hero list中的monster list*/
    List<FighterBean> followlist_in_selectHerolist = new ArrayList<FighterBean>();
    for(FighterBean heroItem : selectHeroList){
        if(heroItem.getType() == 1){
            followlist_in_selectHerolist.add(heroItem);
            for(FighterItemBean fighterItemBean : (List<FighterItemBean>) session.getAttribute("_MonsterData")){
                if(heroItem.getFighter_id() == fighterItemBean.getFighter_id()){
                    monsterList_in_heroList.add(fighterItemBean);
                }
            }
        }
    }

    /**筛选 hero list中的pet list*/
    List<FighterBean> petlist_in_selectHerolist = new ArrayList<FighterBean>();
    for(FighterBean heroItem : selectHeroList){
        if(heroItem.getType() == 2){
            petlist_in_selectHerolist.add(heroItem);
            for (FighterItemBean fighterBean : ((List<FighterItemBean>) session.getAttribute("_PetData"))){
                if(heroItem.getFighter_id() == fighterBean.getFighter_id()){
                    monsterList_in_heroList.add(fighterBean);
                }
            }
        }
    }

    /**获取宝石数 宝箱数*/
    Integer jewelScore=0;
    Integer chestNum=0;

    if(session.getAttribute("UserID")!=null){
        if(session.getAttribute("_JewelScore")!=null){
            jewelScore = Integer.valueOf((String)session.getAttribute("_JewelScore")) ;
        }

        if(session.getAttribute("_ChestNum")!=null){
            chestNum = Integer.valueOf((String)session.getAttribute("_ChestNum"));
        }
    }

    int head_size = selectHeroList.size();

    /**调整头像框的初始位置*/
    int start_x = 70;
    int div_mouse_left_x = 120;
    int div_mouse_top_y = 300;
    int div_head_select_pic_x = 70;

    if(head_size==3){
        start_x = 180;
        div_mouse_left_x = 230;
        div_mouse_top_y = 360;
        div_head_select_pic_x = 180;
    }else if(head_size==4){
        start_x = 130;
        div_mouse_left_x = 180;
        div_mouse_top_y = 360;
        div_head_select_pic_x = 130;
    }else if(head_size==5){
        start_x = 70;
        div_mouse_left_x = 120;
        div_mouse_top_y = 360;
        div_head_select_pic_x = 70;
    }

    PropertiesOp propertiesOp$$ = new PropertiesOp();
    Properties properties$$ = propertiesOp$$.load("/initial/equip.properties");

    Integer fighter_id=0;
    String equip_img_path = "";

    if(session.getAttribute("heroScreen_selectIndex")!=null){
        fighter_id = Integer.valueOf((String) session.getAttribute("heroScreen_selectIndex"));
    }

    Integer stage_index = Integer.valueOf((String)session.getAttribute("_StageData"));

    List<EquipItem> equipItemList = (List<EquipItem>) JSON.toObject(properties$$.getProperty("equip1"), EquipItem.class);

    beans.EquipMaxIndexBean equipMaxIndexBean = (EquipMaxIndexBean) session.getAttribute("_EquipMaxIndex");

    if((equipMaxIndexBean.getEquipMaxIndex(fighter_id+1))<equipItemList.size()-1){     //8
        equip_img_path = equipItemList.get(equipMaxIndexBean.getEquipMaxIndex(fighter_id+1)+1).getImg_path();    //ready for equip path after equip num++
    }

%>
<html>
<head>
<title></title>
<link href="Styles/default.css" rel="stylesheet" type="text/css" />
<link href="Styles/gamescreen.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="include/imagedefine.js"></script>
<script type="text/javascript" src="include/gamescreen.js"></script>
<script type="text/javascript" src="include/The9.Web.Key.js"></script>
<script type="text/javascript" src="include/tools/tool.js"></script>
<script type="text/javascript" src="include/gamescreen/tools.js"></script>
<script type="text/javascript" src="include/gamescreen/onKeyPress.js"></script>
<script type="text/javascript" src="include/common.js"></script>
<script type="text/javascript" src="include/gamescreen/hp_num_show_remove.js"></script>
<script type="text/javascript" src="include/gamescreen/decrease_hp.js"></script>
<script type="text/javascript" src="include/gamescreen/decrease_hero_hp.js"></script>
<script type="text/javascript" src="include/gamescreen/gamescreen_effect.js"></script>
<script type="text/javascript" src="include/gamescreen/gamescreen_hero_effect.js"></script>
<script type="text/javascript" src="include/gamescreen/gamescreen_enemy_effect.js"></script>
<script type="text/javascript" src="include/gamescreen/effect_hp_buffer_buttom.js"></script>
<script type="text/javascript" src="include/gamescreen/dead_animation.js"></script>
<script type="text/javascript" src="include/gamescreen/gamescreen_follow_effect.js"></script>
<script type="text/javascript" src="include/gamescreen/enemy_effect_group.js"></script>

<script type="text/javascript">

//触发onkeypress事件
document.onkeypress = onKeyPress;
document.isDeadArray = new Array(false, false, false, false, false);
document.enemyIsDeadArray = new Array(false, false, false, false, false);
document.warship_img_array_x = 0;
document.warship_img_array_y = 100;

document.sum_right_enemy_num = 0;
document.sum_left_hero_num = 0;
document.gameIsOver = false;
document.browserIsEc1308 = true;
document.div_mouse_left_x = <%=div_mouse_left_x%>;
document.div_mouse_top_y = <%=div_mouse_top_y%>;

document.delta_enemy_top_y_frame = 0;

document.equip_img_path = "<%=equip_img_path%>";

var num_a;

var game2game_url = "<%=host%>/HttpService/Game2GameAction.ashx";
var success_flag = false;
document.anger_x = new Array(0,0,0,0,0);
document.enemy_anger_x = new Array(95,75,55,35,15);
var effect_index = 0;
var select_head_pic_Index = 0;
var consume_item_index = 0;
var consume_item_index_array = new Array(81,82,83,84,85);
var balance_support_url = "<%=host%>/HttpService/BalanceSupport.ashx";
var top_consume_url = "<%=host%>/HttpService/hero.ashx?Type=0&GameID=100536&Number=10&consume_item_index=";
var stage_info_update_url = "<%=host%>/HttpService/StageInfoUpdateAction.ashx";
var hp_x_array = new Array(95,95,95,95,95);
var div_right_hero_x = 300;
var div_right_hero_y = 150;
var div_right_follow1_x = 400;
var div_right_follow1_y = 100;
var div_right_follow2_x = 400;
var div_right_follow2_y = 180;
var div_right_pet1_x = 530;
var div_right_pet1_y = 130;
var div_right_pet2_x = 530;
var div_right_pet2_y = 230;
var div_left_hero_x = 200;
var div_left_hero_y = 120;
var div_left_follow1_x = 120;
var div_left_follow1_y = 100;
var div_left_follow2_x = 100;
var div_left_follow2_y = 200;
var div_left_pet1_x = 70;
var div_left_pet1_y = 150;
var div_left_pet2_x = 70;
var div_left_pet2_y = 250;
var select_head_pic_Index = 0;
var index_i =0;
var indexframe_mouse = 0;


var consume_step = 0;
var mouse_index = 0;

function return_release(keyCode){
    if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
            ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
        window.location.href = "teamscreen.jsp";
    }
}

function effect_release(keyCode){

    if(keyCode==UT.LEFT||keyCode==ZTE.LEFT||keyCode==HW.LEFT){
        if(consume_step == 2){
            mouse_index--;
            mouse_index = (mouse_index+2)%2;   //control show
            if(mouse_index==0){
                document.div_mouse_left_x = 250;
                document.div_mouse_top_y = 280;
            }else if(mouse_index==1){
                document.div_mouse_left_x = 330;
                document.div_mouse_top_y = 280;
            }
        }else{
            select_head_pic_Index--;
        }
    }else if(keyCode==UT.RIGHT||keyCode==ZTE.RIGHT||keyCode==HW.RIGHT){
        if(consume_step == 2){
            mouse_index++;
            mouse_index = (mouse_index+2)%2;            //control show
            if(mouse_index==0){
                document.div_mouse_left_x = 250;
                document.div_mouse_top_y = 280;
            }else if(mouse_index==1){
                document.div_mouse_left_x = 330;
                document.div_mouse_top_y = 280;
            }
        }else{
            select_head_pic_Index++;
        }
    }

    select_head_pic_Index = (select_head_pic_Index+<%=head_size%>)%<%=head_size%>;

    if(consume_step == 0){   /**根据头像数量调整初始mouse x的位置*/
    document.div_mouse_left_x = <%=div_mouse_left_x%> + select_head_pic_Index*100;
    }

    document.getElementById("div_head_select_pic_id").style.left = <%=div_head_select_pic_x%> + select_head_pic_Index*100;

    if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
        if(consume_step==2){
            if(mouse_index==0){                //control action
                window.location.href = "the9InputScreen.jsp?consume_item_index="+consume_item_index;
            }else if(mouse_index==1){
                window.location.href = "gamescreen.jsp";
            }
        }else if(consume_step==3){
            xmlhttp = MakeHttpRequest();
            xmlhttp.open("Post", top_consume_url+consume_item_index, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].result == 0){
                        window.location.href = "gamescreen.jsp";
                    }
                }
            }
        }

    }
}
document.hpNumber = new Array(0,0,0,0,0);
document.enemy_fight_number = new Array(0,0,0,0,0);
document.hero_fight_number = new Array(0,0,0,0,0);

document.hero_hpNumber = new Array(0,0,0,0,0);
document.hero_hpNumber__ = new Array(0,0,0,0,0);

document.sum_enemy_hp_num = 0;
document.sum_hero_hp_num = 0;
document.average_enemy_hp_num = 0;
document.average_hero_hp_num = 0;

document.sum_hero_fight_num = 0;
document.sum_enemy_fight_num = 0;
document.average_hero_fight_num = 0;
document.average_enemy_fight_num = 0;

document.sum_right_enemy_num = <%=enemyTeamList.size()%>;
document.sum_left_hero_num = <%=selectHeroList.size()%>;

function run(){
    mouse();
//    CountDown();
//    timer = setInterval("CountDown()",1000);

    <%for(int h = 0; h < enemyTeamList.size(); h++){%>
        document.sum_enemy_hp_num += <%=enemyTeamList.get(h).getHpNumber()%>;
        document.hpNumber[<%=h%>] = <%=enemyTeamList.get(h).getHpNumber()%>;
    <%}%>
        document.average_enemy_hp_num = document.sum_enemy_hp_num/<%=enemyTeamList.size()%>;

    <%for(int h = 0; h < monsterList_in_heroList.size(); h++){%>
        document.sum_hero_hp_num += <%=monsterList_in_heroList.get(h).getHp_num()%>;
        document.hero_hpNumber[<%=h%>] =  <%=monsterList_in_heroList.get(h).getHp_num()%>;
        document.hero_hpNumber__[<%=h%>] = <%=monsterList_in_heroList.get(h).getHp_num()%>;
    <%}%>
        document.average_hero_hp_num = document.sum_hero_hp_num/<%=monsterList_in_heroList.size()%>;

    <%for(int h = 0; h < enemyTeamList.size(); h++){%>
        document.sum_enemy_fight_num += <%=enemyTeamList.get(h).getFight_number()%>;
    <%}%>
        document.average_enemy_fight_num = document.sum_enemy_fight_num/<%=enemyTeamList.size()%>;

    for(var i=0; i<5; i++){
        document.enemy_fight_number[i] = document.average_enemy_fight_num;
    }

    <%for(int h = 0; h < monsterList_in_heroList.size(); h++){%>
        document.sum_hero_fight_num +=  <%=monsterList_in_heroList.get(h).getFight_num()%>;
    <%}%>
        document.average_hero_fight_num = document.sum_hero_fight_num/<%=monsterList_in_heroList.size()%>;

    for(var i=0; i<5; i++){
        document.hero_fight_number[i] = document.average_hero_fight_num;
    }

    decrease_all_hp();

    /**根据选择变化关卡背景*/
    document.getElementById("id00").src = <%=properties1.getProperty("imgpath"+(selected_stage+1))%>;

    effect_anger_buffer();

    /**根据选择变化关卡决定本关要释放的技能*/
    enemy_effect_group_stage_<%=(selected_stage+1)%>();

    right_pet01(<%=enemyTeamList.get(0).getEnemyName()%>);
    right_pet02(<%=enemyTeamList.get(1).getEnemyName()%>);
    right_follow01(<%=enemyTeamList.get(2).getEnemyName()%>);
    right_follow02(<%=enemyTeamList.get(3).getEnemyName()%>);
    hero_right_action(<%=enemyTeamList.get(4).getEnemyName()%>);

    <%if(petlist_in_selectHerolist!=null){
        if(petlist_in_selectHerolist.size()==1){%>
            pet41(<%=properties.getProperty("titleItem"+petlist_in_selectHerolist.get(0).getFighter_id())%>);
        <%}else if(petlist_in_selectHerolist.size()==2){%>
            pet41(<%=properties.getProperty("titleItem"+petlist_in_selectHerolist.get(0).getFighter_id())%>);
            pet51(<%=properties.getProperty("titleItem"+petlist_in_selectHerolist.get(1).getFighter_id())%>);
        <%}
    }%>

    <%if(followlist_in_selectHerolist!=null){
        if(followlist_in_selectHerolist.size()==1){%>
            follow1_action(<%=properties.getProperty("titleItem"+followlist_in_selectHerolist.get(0).getFighter_id())%>);
        <%}else if(followlist_in_selectHerolist.size()==2){%>
            follow1_action(<%=properties.getProperty("titleItem"+followlist_in_selectHerolist.get(0).getFighter_id())%>);
            follow2_action(<%=properties.getProperty("titleItem"+followlist_in_selectHerolist.get(1).getFighter_id())%>);
        <%}
    }%>

    <%if(herolist_in_selectHerolist !=null&&herolist_in_selectHerolist .size()==1){%>
            hero_blue_action(<%=properties.getProperty("titleItem"+herolist_in_selectHerolist .get(0).getFighter_id())%>);
    <%}%>
}

function decrease_all_hp(){
    document.sum_enemy_hp_num -= document.sum_hero_fight_num;
    document.sum_hero_hp_num -= document.sum_enemy_fight_num;

//    document.getElementById("test_div3").innerHTML = "sum_enemy_fight_num:"+document.sum_enemy_fight_num+"; sum_hero_fight_num:"+document.sum_hero_fight_num;
//    document.getElementById("test_div4").innerHTML = "sum_enemy_hp_num:"+document.sum_enemy_hp_num+"; sum_hero_hp_num:"+document.sum_hero_hp_num;

    if(document.sum_enemy_hp_num < 0){
        document.gameIsOver = true;
        document.sum_enemy_fight_num =0;
        document.div_mouse_left_x = 290;
        document.div_mouse_top_y = 295;
        document.getElementById("div_success_or_fail_win_id").style.left = '120px';
        document.getElementById("img_success_or_fail_title_id").src = "game/success.png";
        document.getElementById("img_success_or_fail_win_id").src = "game/successfailure.png";
        document.getElementById("img_armorbase_id").src = document.equip_img_path+"";
        xmlhttp = MakeHttpRequest();
        xmlhttp.open("Post", stage_info_update_url, true);
        xmlhttp.send();

        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4) {
                var js = eval(xmlhttp.responseText);
                if(js[0].id == 0){
                    document.getElementById("img_armorbase_id").style.left = -document.getElementById("img_armorbase_id").style.left;

                    document.getElementById("div_div_jewelScore_id").innerHTML = js[0].jewelScore+"";
                    document.getElementById("div_div_chestNum_id").innerHTML = js[0].chestNum+"";
                }else{

                }
            }
        }
    }

    if(document.sum_hero_hp_num < 0){
        document.gameIsOver = true;
        document.sum_hero_fight_num = 0;
        document.div_mouse_left_x = 290;
        document.div_mouse_top_y = 295;
        document.getElementById("div_success_or_fail_win_id").style.left = '120px';
        document.getElementById("img_success_or_fail_title_id").src = "game/failure.png";
        document.getElementById("img_success_or_fail_win_id").src = "game/successfailure.png";
    }
    if(!document.gameIsOver)  setTimeout("decrease_all_hp()",1000);
}

function onKeyPress(){

    var evt = window.event;
    var keyCode = evt.which ? evt.which : evt.keyCode;

    if(document.gameIsOver){
        if(keyCode==UT.OK||keyCode==ZTE.OK||keyCode==HW.OK){
            if(document.sum_hero_fight_num == 0){
                window.location.href = "armorbasescreen.jsp?preScreen=mainscreen";
            }else{
                window.location.href = "stageMapScreen.jsp";
            }
        }
    }else {
        return_release(keyCode);
        effect_release(keyCode);
    }

}

function mouse(){
    indexframe_mouse ++;
    indexframe_mouse  = (indexframe_mouse+5)%5;
    document.getElementById("div_mouse_id").style.left = document.div_mouse_left_x-indexframe_mouse;
    document.getElementById("div_mouse_id").style.top = document.div_mouse_top_y+indexframe_mouse;

    if(document.gameIsOver){
        if(document.sum_hero_fight_num == 0){
            document.getElementById("span_success_or_fail_id").innerHTML = "纳尼？没有过关！快去训练等级吧";
            document.getElementById("span_success_or_fail_id1").innerHTML = "加血量，加攻击力助你轻松过关！";
        }else{
            <%if(equip_img_path.equals("")){
                if(stage_index==41){%>
                    document.getElementById("span_success_or_fail_id").innerHTML = "恭喜您，已经通关了！！！";
               <% }else {%>
                    document.getElementById("span_success_or_fail_id").innerHTML = "恭喜获胜，获得了50个钻石和2个宝箱";
               <%}%>

            <%}else {%>
                document.getElementById("span_success_or_fail_id").innerHTML = "恭喜获胜，获得了50个钻石和2个宝箱";
                document.getElementById("span_success_or_fail_id1").innerHTML = "与以下的装备奖励";
            <%}%>
        }
    }

    setTimeout("mouse()",150);
}


var maxtime =2*60; //一个小时，按秒计算，自己调整!
function CountDown(){
    if(maxtime>=0&&!document.browserIsEc1308){
        minutes = Math.floor(maxtime/60);
        seconds = Math.floor(maxtime%60);
        msg = "倒计时:"+minutes+"分"+seconds+"秒";
        document.all["timer"].innerHTML=msg;
        if(maxtime == 5*60)
            --maxtime;
        --maxtime;
    }else if(document.browserIsEc1308){
        clearInterval(timer);
    }else {
        clearInterval(timer);
        window.location.href="stageMapScreen.jsp";
    }
}

var hp_x = new Array(95,95,95,95,95);
function effect_anger_buffer(){
    for(var i = 0 ; i < <%=selectHeroList.size()%>; i++){     /**按选定决定头像个数*/
        if(document.anger_x[i] < 95){
            switch (i){
                case 0:
                    if(document.hero_hpNumber[0] > 0){
                        document.anger_x[i] ++;      // freeze time
                        document.getElementById("img_anger_line0").style.width = document.anger_x[i] + "px";
                        document.getElementById("img_anger_line0").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$0").style.width = (95*(document.hero_hpNumber[i]/document.hero_hpNumber__[i])) + "px";
                        document.getElementById("img_anger_line$$0").style.height = 13 + "px";
                    }else if(document.hero_hpNumber[0] == 0){
                        document.getElementById("img_anger_line0").style.width = 0 + "px";
                        document.getElementById("img_anger_line0").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$0").style.width = 0 + "px";
                        document.getElementById("img_anger_line$$0").style.height = 13 + "px";
                        <%if(selectHeroList.size()>=1){%>
                        document.getElementById("img_role_head_id0").src = <%=properties5.getProperty("titlepath"+selectHeroList.get(0).getFighter_id()) %>;
                        <%}%>
                    }

                    break;
                case 1:
                    if(document.hero_hpNumber[1] > 0){
                        document.anger_x[i] +=2;      // freeze time
                        document.getElementById("img_anger_line1").style.width = document.anger_x[i] + "px";
                        document.getElementById("img_anger_line1").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$1").style.width = (95*(document.hero_hpNumber[i]/document.hero_hpNumber__[i])) + "px";
                        document.getElementById("img_anger_line$$1").style.height = 13 + "px";
                    }else if(document.hero_hpNumber[1] == 0){
                        document.getElementById("img_anger_line1").style.width = 0 + "px";
                        document.getElementById("img_anger_line1").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$1").style.width = 0 + "px";
                        document.getElementById("img_anger_line$$1").style.height = 13 + "px";
                        <%if(selectHeroList.size()>=2){%>
                        document.getElementById("img_role_head_id1").src = <%=properties5.getProperty("titlepath"+selectHeroList.get(1).getFighter_id()) %>;
                        <%}%>
                    }

                    break;
                case 2:
                    if(document.hero_hpNumber[2] > 0){
                        document.anger_x[i] +=2;      // freeze time
                        document.getElementById("img_anger_line2").style.width = document.anger_x[i] + "px";
                        document.getElementById("img_anger_line2").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$2").style.width = (95*(document.hero_hpNumber[i]/document.hero_hpNumber__[i])) + "px";
                        document.getElementById("img_anger_line$$2").style.height = 13 + "px";
                    }else if(document.hero_hpNumber[2] == 0){
                        document.getElementById("img_anger_line2").style.width = 0 + "px";
                        document.getElementById("img_anger_line2").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$2").style.width = 0 + "px";
                        document.getElementById("img_anger_line$$2").style.height = 13 + "px";
                        <%if(selectHeroList.size()>=3){%>
                        document.getElementById("img_role_head_id2").src = <%=properties5.getProperty("titlepath"+selectHeroList.get(2).getFighter_id()) %>;
                        <%}%>
                    }

                    break;
                case 3:
                    if(document.hero_hpNumber[3] > 0){
                        document.anger_x[i] +=4;      // freeze time
                        document.getElementById("img_anger_line3").style.width = document.anger_x[i] + "px";
                        document.getElementById("img_anger_line3").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$3").style.width = (95*(document.hero_hpNumber[i]/document.hero_hpNumber__[i])) + "px";
                        document.getElementById("img_anger_line$$3").style.height = 13 + "px";
                    }else if(document.hero_hpNumber[3] == 0){
                        document.getElementById("img_anger_line3").style.width = 0 + "px";
                        document.getElementById("img_anger_line3").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$3").style.width = 0 + "px";
                        document.getElementById("img_anger_line$$3").style.height = 13 + "px";
                        <%if(selectHeroList.size()>=4){%>
                            document.getElementById("img_role_head_id3").src = <%=properties5.getProperty("titlepath"+selectHeroList.get(3).getFighter_id()) %>;
                        <%}%>
                    }

                    break;
                case 4:
                    if(document.hero_hpNumber[4] > 0){
                        document.anger_x[i] +=4;      // freeze time
                        document.getElementById("img_anger_line4").style.width = document.anger_x[i] + "px";
                        document.getElementById("img_anger_line4").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$4").style.width = (95*(document.hero_hpNumber[i]/document.hero_hpNumber__[i])) + "px";
                        document.getElementById("img_anger_line$$4").style.height = 13 + "px";
                    }else if(document.hero_hpNumber[4] == 0){
                        document.getElementById("img_anger_line4").style.width = 0 + "px";
                        document.getElementById("img_anger_line4").style.height = 13 + "px";
                        document.getElementById("img_anger_line$$4").style.width = 0 + "px";
                        document.getElementById("img_anger_line$$4").style.height = 13 + "px";
                        <%if(selectHeroList.size()>=5){%>
                            document.getElementById("img_role_head_id4").src = <%=properties5.getProperty("titlepath"+selectHeroList.get(4).getFighter_id()) %>;
                        <%}%>
                    }

                    break;
            }
        }else{
            switch (i){
                case 0:
                    document.getElementById("img_anger_line0").style.width = 95 + "px";
                    document.getElementById("img_anger0").src = "game/anger_full.png";
                    document.anger_x[0] = 0;
                <%if(selectHeroList.size()>=1){%>
                    if(!document.isDeadArray[0]){
                        document.getElementById("div_right_hero_dazhao_id1").style.left = 240+"px";
                        <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(0).getFighter_id()))%>("img_right_hero_dazhao_id1","div_right_hero_dazhao_id1");
                    }
                <%}%>
                    document.getElementById("img_anger0").src = "game/anger_unfull.png";
                    break;
                case 1:
                    document.getElementById("img_anger_line1").style.width = 95 + "px";
                    document.getElementById("img_anger1").src = "game/anger_full.png";
                    document.anger_x[1] = 0;
                <%if(selectHeroList.size()>=2){%>
                    if(!document.isDeadArray[1]){
                        document.getElementById("div_right_hero_dazhao_id2").style.left = 240+"px";
                        <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(1).getFighter_id()))%>("img_right_hero_dazhao_id2","div_right_hero_dazhao_id2");
                    }
                <%}%>
                    document.getElementById("img_anger1").src = "game/anger_unfull.png";
                    break;
                case 2:
                    document.getElementById("img_anger_line2").style.width = 95 + "px";
                    document.getElementById("img_anger2").src = "game/anger_full.png";
                    document.anger_x[2] = 0;
                <%if(selectHeroList.size()>=3){%>
                    if(!document.isDeadArray[2]){
                        document.getElementById("div_right_hero_dazhao_id3").style.left = 240+"px";
                        <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(2).getFighter_id()))%>("img_right_hero_dazhao_id3","div_right_hero_dazhao_id3");
                    }
                <%}%>
                    document.getElementById("img_anger2").src = "game/anger_unfull.png";
                    break;
                case 3:
                    document.getElementById("img_anger_line3").style.width = 95 + "px";
                    document.getElementById("img_anger3").src = "game/anger_full.png";
                    document.anger_x[3] = 0;
                <%if(selectHeroList.size()>=4){%>
                    if(!document.isDeadArray[3]){
                        document.getElementById("div_right_hero_dazhao_id4").style.left = 240+"px";
                        <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(3).getFighter_id()))%>("img_right_hero_dazhao_id4","div_right_hero_dazhao_id4");
                    }
                <%}%>
                    document.getElementById("img_anger3").src = "game/anger_unfull.png";
                    break;
                case 4:
                    document.getElementById("img_anger_line4").style.width = 95 + "px";
                    document.getElementById("img_anger4").src = "game/anger_full.png";
                    document.anger_x[4] = 0;
                <%if(selectHeroList.size()>=5){%>
                    if(!document.isDeadArray[4]){
                        document.getElementById("div_right_hero_dazhao_id5").style.left = 240+"px";
                        <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(4).getFighter_id()))%>("img_right_hero_dazhao_id5","div_right_hero_dazhao_id5");
                    }
                <%}%>
                    document.getElementById("img_anger4").src = "game/anger_unfull.png";
                    break;
            }

        }
    }
    if(!document.browserIsEc1308)  setTimeout("effect_anger_buffer()",300);         // control the FPS
}

</script>
</head>
<body onload="run()" style="background-Repeat:no-repeat;overflow:hidden;overflow-x:hidden;width:600px;height:530px" onLoad="javascript:document.yourFormName.reset()">

<%--<div id="test_div0" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 25px; left: 80px;color: #ffffff;"></div>--%>
<%--<div id="test_div1" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 85px; left: 80px;color: #ffffff;"></div>--%>
<%--<div id="test_div2" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 105px; left: 80px;color: #ffffff;"></div>--%>
<div id="test_div3" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 125px; left: 80px;color: #ffffff;"></div>
<div id="test_div4" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 145px; left: 80px;color: #ffffff;"></div>

<%--<div id="test_div7" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 165px; left: 80px;color: #ffffff;"></div>--%>
<%--<div id="test_div8" style="z-index: 5;font-size:16px;font-weight: bold;position: absolute; top: 185px; left: 80px;color: #ffffff;"></div>--%>

<div id="div1" style='position: absolute;'>
    <img id="id00" src="" />
</div>

<div id="div_right_id" style='position: absolute;top: 100px; left: 600px;'>
</div>

<jsp:include page="topuphtmls/gamescreen_heros.jsp"></jsp:include>
<jsp:include page="topuphtmls/gamescreen_enemys.jsp"></jsp:include>
<jsp:include page="topuphtmls/gamescreen_enemys_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/gamescreen_hero_effect.jsp"></jsp:include>

<%--hero的单个多发技能--%>
<jsp:include page="topuphtmls/thorns_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/point_Coco.jsp"></jsp:include>
<jsp:include page="topuphtmls/falling_fire.jsp"></jsp:include>
<jsp:include page="topuphtmls/barrage_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/k-soul.img.jsp"></jsp:include>
<jsp:include page="topuphtmls/ice_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/dazhao1.jsp"></jsp:include>
<jsp:include page="topuphtmls/dazhao2.jsp"></jsp:include>
<jsp:include page="topuphtmls/storm.jsp"></jsp:include>
<jsp:include page="topuphtmls/fire_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/gripper.jsp"></jsp:include>
<jsp:include page="topuphtmls/fireball.jsp"></jsp:include>

<%--enemy的单个多发技能--%>
<jsp:include page="topuphtmls/enemy/thorns_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/falling_fire.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/fire_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/barrage_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/electricity.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/huoqiu_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/ice_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/quan2_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/storm_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/storm2_effect.jsp"></jsp:include>
<jsp:include page="topuphtmls/enemy/strokes_effect.jsp"></jsp:include>

<%for(int i=0; i<selectHeroList.size();i++){

    int left_x = start_x + 100*i;
%>
<div id="anger<%=i%>" style="position: absolute;left: <%=left_x%>px;top: 370px;">
    <img id="img_anger<%=i%>" src="game/anger_unfull.png" />
</div>

<%--<div id="hp_line$$<%=i%>" style='position: absolute;left: <%=left_x%>px;top: 460px;'>--%>
<%--<img id="img_hp_line$$<%=i%>" src="game/hp.png" />--%>
<%--&lt;%&ndash;hp:<%=monsterList_in_heroList.get(i).getHp_num()%>&ndash;%&gt;--%>
<%--</div>--%>
<div id="anger_line$$<%=i%>" style='position: absolute;left: <%=left_x%>px;top: 460px;z-index:2;height: 13px;'>
    <img id="img_anger_line$$<%=i%>" src="game/hp.png" />
</div>

<div id="anger_line<%=i%>" style='position: absolute;left: <%=left_x%>px;top: 472px;z-index:2;height: 13px;'>
    <img id="img_anger_line<%=i%>" src="game/anger.png" />
</div>

<div id="div_role_head_id<%=i%>" style="position: absolute; left: <%=left_x+8%>px; top: 380px;z-index:2;">
    <img id="img_role_head_id<%=i%>" src=<%=properties2.getProperty("titleItem"+selectHeroList.get(i).getFighter_id()) %>/>
</div>
<%}%>

<div id="bottom_02" style='position: absolute;'>
    <img id="img_bottom_02" src="game/bottom_02.png" />
</div>

<div id="title-2_13_1" style='position: absolute;'>
    <img id="img_title-2_13_1" src="game/title-2_13.png" />
    <div id="div_div_jewelScore_id" style="position: absolute; z-index: 2; left: 10; top: 10; color: #ffffff;">
        <%=jewelScore%>
    </div>
</div>

<div id="title-2_13_2" style='position: absolute;'>
    <img id="img_title-2_13_2" src="game/title-2_13.png" />
    <div id="div_div_chestNum_id" style="position: absolute; z-index: 2; left: 10; top: 10; color: #ffffff;">
        <%=chestNum%>
    </div>
</div>

<div id="jewelry-2_05" style='position: absolute;'>
    <img id="img_jewelry-2_05" src="game/jewelry-2_05.png" />

</div>

<div id="chest-2_07" style='position: absolute;'>
    <img id="img_chest-2_07" src="game/chest-2_07.png" />
</div>

<div id="div_autocombat_on_id">
    <img id="img_autocombat_on_id" src="game/hourglass.png" />
</div>
<%--<div id="timer" style="color:#fdfdfe;font-size: 16px"></div>--%>

<div id="div_head_select_pic_id" style="position: absolute;left: <%=div_head_select_pic_x%>px;top: 370px;z-index: 2;">
    <img id="img_head_select_pic_id" src="team/select1.png">
</div>

<jsp:include page="topuphtmls/gamescreen_topup.jsp"></jsp:include>

</body>
</html>