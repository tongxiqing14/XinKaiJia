<%@ page import="com.fancyy.json.util.JSON" %>
<%@ page import="elements.EnemyTeam" %>
<%@ page import="common.PropertiesOp" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.FighterBean" %>
<%@ page import="beans.FighterItemBean" %>
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

    String servletPath = request.getServletPath();
    StringBuffer requestURL = request.getRequestURL();
    String host = requestURL.substring(0,requestURL.lastIndexOf(servletPath));

//    Integer selected_stage= Integer.valueOf((String) session.getAttribute("selected_stage"));

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
//    List<FighterBean> heroList_in_heroList =  new ArrayList<FighterBean>();
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
//    List<FighterItemBean> monsterList_in_heroList = new ArrayList<FighterItemBean>();
    List<FighterBean> followlist_in_selectHerolist = new ArrayList<FighterBean>();
    for(FighterBean heroItem : selectHeroList){
        if(heroItem.getType() == 1){
            followlist_in_selectHerolist.add(heroItem);
            for(FighterItemBean FighterItemBean : (List<FighterItemBean>) session.getAttribute("_MonsterData")){
                if(heroItem.getFighter_id() == FighterItemBean.getFighter_id()){
                    monsterList_in_heroList.add(FighterItemBean);
                }
            }
        }
    }

    /**筛选 hero list中的pet list*/
//    List<FighterBean> petList_in_heroList = new ArrayList<FighterBean>();
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
        String account = (String) session.getAttribute("UserID");
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
<script type="text/javascript" src="include/gamescreen/effect_hp_buffer_buttom.js"></script>
<script type="text/javascript" src="include/gamescreen/dead_animation.js"></script>
<script type="text/javascript" src="include/gamescreen/gamescreen_follow_effect.js"></script>

<script type="text/javascript">

//触发onkeypress事件
document.onkeypress = onKeyPress;
document.isDeadArray = new Array(false, false, false, false, false);
document.enemyIsDeadArray = new Array(false, false, false, false, false);
document.warship_img_array_x = 0;
document.warship_img_array_y = 100;
document.sum_hero_fight_num = -1;
document.sum_enemy_fight_num = -1;
document.sum_right_enemy_num = 0;
document.sum_left_hero_num = 0;
document.browserIsEc1308 = false;
document.div_mouse_left_x = <%=div_mouse_left_x%>;
document.div_mouse_top_y = <%=div_mouse_top_y%>;

var num_a;
var hpNumber = new Array(0,0,0,0,0);
var enemy_fight_number = new Array(0.0,0.0,0.0,0.0,0.0);
var hero_hpNumber = new Array(0,0,0,0,0);
var hero_fight_number = new Array(0,0,0,0,0);
var game2game_url = "<%=host%>/HttpService/Game2GameAction.ashx";
var success_flag = false;
var anger_x = new Array(0,0,0,0,0);
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
        window.location.href = "main.jsp";
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
    if(consume_step == 0){ document.div_mouse_left_x = 120 + select_head_pic_Index*100; }
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
//                            alert(js[0].id);
                    if(js[0].result == 0){
                        window.location.href = "gamescreen.jsp";
                    }
                }
            }
        }else {
            if(anger_x[select_head_pic_Index] >= 95){

                if(select_head_pic_Index == 0){
                    anger_x[0] = 0;
                    <%if(selectHeroList.size()>=1){%>
                    <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(0).getFighter_id()))%>();
                    <%}%>
                    hp_length_pet01 -= 30;
                    hp_length_pet02 -= 30;
                    hp_length_follow01 -= 30;
                    hp_length_follow02 -= 30;
                    hp_length_hero -= 30;

                    document.getElementById("img_anger0").src = "game/anger_unfull.png";
                } else if(select_head_pic_Index == 1){
                    anger_x[1] = 0;
                    <%if(selectHeroList.size()>=2){%>
                    <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(1).getFighter_id()))%>();
                    <%}%>
                    hp_length_pet01 -= 10;
                    hp_length_pet02 -= 10;
                    hp_length_follow01 -= 10;
                    hp_length_follow02 -= 10;
                    hp_length_hero -= 10;

                    document.getElementById("img_anger1").src = "game/anger_unfull.png";
                }else if(select_head_pic_Index == 2){
                    anger_x[2] = 0;
                    <%if(selectHeroList.size()>=3){%>
                    <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(2).getFighter_id()))%>();
                    <%}%>
                    hp_length_pet01 -= 20;
                    hp_length_pet02 -= 20;
                    hp_length_follow01 -= 20;
                    hp_length_follow02 -= 20;
                    hp_length_hero -= 20;

                    document.getElementById("img_anger2").src = "game/anger_unfull.png";
                }else if(select_head_pic_Index == 3){
                    anger_x[3] = 0;
                    <%if(selectHeroList.size()>=4){%>
                    <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(3).getFighter_id()))%>();
                    <%}%>
                    hp_length_pet01 -= 15;
                    hp_length_pet02 -= 15;
                    hp_length_follow01 -= 15;
                    hp_length_follow02 -= 15;
                    hp_length_hero -= 15;

                    document.getElementById("img_anger3").src = "game/anger_unfull.png";
                }else{
                    anger_x[4] = 0;
                    <%if(selectHeroList.size()>=5){%>
                    <%=properties4.getProperty(properties3.getProperty("fighter"+selectHeroList.get(4).getFighter_id()))%>();
                    <%}%>
                    hp_length_pet01 -= 5;
                    hp_length_pet02 -= 5;
                    hp_length_follow01 -= 5;
                    hp_length_follow02 -= 5;
                    hp_length_hero -= 5;

                    document.getElementById("img_anger4").src = "game/anger_unfull.png";
                }

            }else{
                consume_item_index = consume_item_index_array[select_head_pic_Index];

                document.div_mouse_left_x = 250;
                document.div_mouse_top_y = 280;
                xmlhttp = MakeHttpRequest();
                xmlhttp.open("Post", balance_support_url, true);
                xmlhttp.send();

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4) {
                        var js = eval(xmlhttp.responseText);
                        if(js[0].balance-5 < 0){
                            consume_step = 2;
                            document.getElementById("div_div_consume_info_id1").innerHTML = "<br>余额不足，需充值"+(5-js[0].balance)+"代币";
                            document.getElementById("div_div_consume_info_id2").innerHTML = "<br><br>(1代币=1人民币)";
                        }else{
                            top_consume_url = top_consume_url+consume_item_index;
                            consume_step = 3;
                        }
                    }
                }
                document.getElementById("div_consume_info_id").style.left = '160px';
                document.getElementById("img_consume_info_id").src = "stage/popupbox.png";
                document.getElementById("img_confirm_btm_id").src = "hero/que.png";
            }
        }

    }
}

function run(){

    mouse();

    document.sum_right_enemy_num = <%=enemyTeamList.size()%>;
    <%for(int h = 0; h < enemyTeamList.size(); h++){%>
    hpNumber[<%=h%>] = <%=enemyTeamList.get(h).getHpNumber()%>
            hero_hpNumber[<%=h%>] = <%=1.5%>
                    <%}%>

                    document.sum_left_hero_num = <%=selectHeroList.size()%>;
    <%for(int h = 0; h < monsterList_in_heroList.size(); h++){%>
    hero_hpNumber[<%=h%>] = <%=monsterList_in_heroList.get(h).getHp_num()%>
            <%}%>

            <%for(int h = 0; h < enemyTeamList.size(); h++){%>
            enemy_fight_number[<%=h%>] = <%=enemyTeamList.get(h).getFight_number()%>
                    document.sum_enemy_fight_num += enemy_fight_number[<%=h%>];
    <%}%>

    <%for(int h = 0; h < monsterList_in_heroList.size(); h++){%>
    hero_fight_number[<%=h%>] = <%=monsterList_in_heroList.get(h).getFight_num()%>
            document.sum_hero_fight_num +=  hero_fight_number[<%=h%>];
    <%}%>

    if(true==<%=(selectHeroList!=null&&selectHeroList.size()!=0)?selectHeroList.get(0).isSelect_flag():false%>){
        decrease_pet_id01_hp();
        hp_num_show_pet01_left_remove();
    }

    if(true==<%=(selectHeroList!=null&&selectHeroList.size()==2)?selectHeroList.get(1).isSelect_flag():false%>){
        decrease_pet_id02_hp();
        hp_num_show_pet02_left_remove();
    }


    if(true==<%=(selectHeroList!=null&&selectHeroList.size()!=0)?selectHeroList.get(0).isSelect_flag():false%>){
        decrease_follow01_left_hp();
        hp_num_show_follow01_left_remove();
    }

    if(true==<%=(selectHeroList!=null&&selectHeroList.size()==2)?selectHeroList.get(1).isSelect_flag():false%>){
        decrease_follow02_left_hp();
        hp_num_show_follow02_left_remove();
    }

    if(true==<%=(selectHeroList!=null&&selectHeroList.size()!=0)?selectHeroList.get(0).isSelect_flag():false%>){
        decrease_hero_left_hp();
        hp_num_show_hero_left_remove();
    }

    <%for(int i=0; i<selectHeroList.size();i++){%>
    effect_hp_buffer<%=i%>();
    <%}%>

    document.getElementById("id00").src = "battlecenter/bbg_arena.jpg";

    effect_anger_buffer();

    <%if(petlist_in_selectHerolist!=null){
        if(petlist_in_selectHerolist.size()==1){%>
    pet41(<%=properties.getProperty("titleItem"+petlist_in_selectHerolist.get(0).getFighter_id())%>);
    <%}else if(petlist_in_selectHerolist.size()==2){%>
    pet41(<%=properties.getProperty("titleItem"+petlist_in_selectHerolist.get(0).getFighter_id())%>);
    pet51(<%=properties.getProperty("titleItem"+petlist_in_selectHerolist.get(1).getFighter_id())%>);
    <%}
    }%>

    <%if(followlist_in_selectHerolist!=null){
        if(followlist_in_selectHerolist.size()==1){
        %>
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

function onKeyPress(){

    var evt = window.event;
    var keyCode = evt.which ? evt.which : evt.keyCode;

    if(document.browserIsEc1308){
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

    if(document.sum_hero_fight_num == 0){
        document.getElementById("span_success_or_fail_id").innerHTML = "纳尼？没有过关！快去训练等级吧";
        document.getElementById("span_success_or_fail_id1").innerHTML = "加血量，加攻击力助你轻松过关！";
    }else if(document.sum_right_enemy_num == 0){
        document.getElementById("span_success_or_fail_id").innerHTML = "恭喜获胜，获得了50个钻石奖励";
        document.getElementById("span_success_or_fail_id1").innerHTML = "以及以下的装备奖励";
    }

    setTimeout("mouse()",150);
}

</script>
</head>
<body onload="run()" style="background-Repeat:no-repeat;overflow:hidden;overflow-x:hidden;width:600px;height:530px">

<div id="div1" style='position: absolute;'>
    <img id="id00" src="" />
</div>

<div id="div_right_id" style='position: absolute;top: 100px; left: 600px;'>
</div>

<div id="div_pet_id01" style='position: absolute;top: 70px; left: 70px;'>
    <div id="div_left_pet_id01_div_hp_red_small_id01" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_left_pet_id01_img_hp_red_small_id01" src="" />
    </div>
    <img id="img_pet_id01" src="" />
    <div id="div_div_pet_id01" style="position: absolute; z-index: 2; left: 10; top: 10; color: #00A600;">
    </div>
</div>

<div id="div_pet_id02" style='position: absolute;top: 170px; left: 70px;'>
    <div id="div_left_pet_id02_div_hp_red_small_id02" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_left_pet_id02_img_hp_red_small_id02" src="" />
    </div>
    <img id="img_pet_id02" src="" />
    <div id="div_div_pet_id02" style="position: absolute; z-index: 2; left: 10; top: 10; color: #00A600;">
    </div>
</div>

<div id="div_follow_id01" style='position: absolute;top: 150px; left: 120px;'>
    <div id="div_left_follow_id01_div_hp_red_small_id01" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_left_follow_id01_img_hp_red_small_id01" src="" />
    </div>
    <img id="img_follow_id01" src="" />
    <div id="div_div_follow_id01" style="position: absolute; z-index: 2; left: 10; top: 10; color: #00A600;">
    </div>
</div>

<div id="div_follow_id02" style='position: absolute;top: 150px; left: 120px;'>
    <div id="div_left_follow_id02_div_hp_red_small_id02" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_left_follow_id02_img_hp_red_small_id02" src="" />
    </div>
    <img id="img_follow_id02" src="" />
    <div id="div_div_follow_id02" style="position: absolute; z-index: 2; left: 10; top: 10; color: #00A600;">
    </div>
</div>

<div id="div_hero_id" style='position: absolute;top: 50px; left: 248px;'>
    <div id="div_left_hero_id_div_hp_red_small_id" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_left_hero_id_img_hp_red_small_id" src="" />
    </div>
    <img id="img_hero_id" src="" />
    <div id="div_div_hero_id" style="position: absolute; z-index: 2; left: 10; top: 10; color: #00A600;">
    </div>
</div>

<div id="div_right_pet_id01" style='position: absolute;top: 100px; left: 600px;'>
    <div id="div_right_pet_id01_div_hp_red_small_id01" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_right_pet_id01_img_hp_red_small_id01" src="" />
    </div>
    <img id="img_right_pet_id01" src="" />
    <div id="div_div_right_pet_id01" style="position: absolute; z-index: 2; left: 10; top: 10; color: #00A600;">
    </div>
</div>

<div id="div_right_pet_id02" style='position: absolute;top: 200px; left: 600px;'>
    <div id="div_right_pet_id02_div_hp_red_small_id02" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_right_pet_id02_img_hp_red_small_id02" src="" />
    </div>

    <img id="img_right_pet_id02" src="" />

    <div id="div_div_right_pet_id02" style="position: absolute; z-index: 2; left: 10; top: 0; color: #00A600;">
    </div>

</div>

<div id="div_right_follow_id01" style='position: absolute;top: 100px; left: 500px;'>
    <div id="div_right_follow_id01_div_hp_red_small_id01" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_right_follow_id01_img_hp_red_small_id01" src="" />
    </div>

    <img id="img_right_follow_id01" src="" />
    <div id="div_div_right_follow_id01" style="position: absolute; z-index: 2; left: 10; top: 10; color: #00A600;">
    </div>
</div>

<div id="div_right_follow_id02" style='position: absolute;top: 200px; left: 500px;'>
    <div id="div_right_follow_id02_div_hp_red_small_id" style='position: absolute; z-index: 2; left: 10; top: 20;'>
        <img id="div_right_follow_id02_img_hp_red_small_id01" src="" />
    </div>

    <img id="img_right_follow_id02" src="" />
    <div id="div_div_right_follow_id02" style="position: absolute; z-index: 2; left: 10; top: 10; color: #00A600;">
    </div>
</div>

<div id="div_right_hero_id" style='position: absolute;top: 200px; left: 500px;'>
    <div id="div_right_hero_id_div_hp_red_small_id" style='position: absolute; z-index: 2; left: 100; top: 30;'>
        <img id="div_right_hero_id_img_hp_red_small_id01" src="" />
    </div>
    <img id="img_right_hero_id" src="" />
    <div id="div_div_right_hero_id" style="position: absolute; z-index: 2; left: 100px; top: 20px; color: #00A600;">
    </div>
</div>

<div id="div_right_hero_dazhao_id" style="position: absolute; z-index: 2;top: 100px; left: 500px;">
    <img id="img_right_hero_dazhao_id" src=""/>
</div>

<div id="fireball_Img">
    <img id="img_fireball" src="" />
</div>

<div id="spineImg0">
    <img id="img_spine0" src="" />
</div>

<div id="chain_spikeImg0">
    <img id="img_chain_spike0" src="" />
</div>

<%for(int i=0; i<selectHeroList.size();i++){

    int left_x = start_x + 100*i;
%>
<div id="anger<%=i%>" style="position: absolute;left: <%=left_x%>px;top: 370px;">
    <img id="img_anger<%=i%>" src="game/anger_unfull.png" />
</div>

<div id="anger_line<%=i%>" style='position: absolute;left: <%=left_x%>px;top: 460px;z-index:2;'>
    <img id="img_anger_line<%=i%>" src="game/anger.png" />
</div>

<div id="hp_line<%=i%>" style='position: absolute;left: <%=left_x%>px;top: 472px;'>
    <img id="img_hp_line<%=i%>" src="game/hp.png" />
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

<div id="div_head_select_pic_id" style="position: absolute;left: <%=div_head_select_pic_x%>px;top: 370px;z-index: 2;">
    <img id="img_head_select_pic_id" src="team/select1.png">
</div>

<div id="div_consume_info_id" style="position: absolute;left: -360;top: 90;z-index: 2;">
    <img id="img_consume_info_id" src="">
    <div id="div_confirm_btn_id" style="position: absolute;left: 100px;top: 200px;z-index: 2;">
        <img id="img_confirm_btm_id" src="">
    </div>
    <div id="div_cancel_id" style='position: absolute;z-index: 2;left: 210px;top: 200px;'>
        <img id="img_cancel_id" src="hero/back.png" />
    </div>
    <div id="div_div_consume_info_id" style="font-size:16px;font-weight: bold;position: absolute; top: 60px; left: 80px;">购买大招释放<br>将消费5代币</div>
    <div id="div_div_consume_info_id1" style="font-size:16px;font-weight: bold;position: absolute; top: 80px; left: 80px;"></div>
    <div id="div_div_consume_info_id2" style="font-size:16px;font-weight: bold;position: absolute; top: 80px; left: 80px; color: red;"></div>
</div>

<div id="div_success_or_fail_win_id" style="position: absolute;left: -360px;top: 100px;z-index: 2;">
    <img id="img_success_or_fail_win_id" src="">
    <div id="div_success_or_fail_title_id" style="position: absolute;left: 90px;top: -60px;" >
        <img id="img_success_or_fail_title_id" src="">
    </div>
    <div id="span_success_or_fail_id" style="font-size:16px;font-weight: bold;position: absolute; top: 65px; left: 80px;color: #ffffff;"></div>
    <div id="span_success_or_fail_id1" style="font-size:16px;font-weight: bold;position: absolute; top: 85px; left: 80px;color: #ffffff;"></div>
    <div id="div_confirm_id" style='position: absolute;z-index: 3;left: 150px;top: 230px;'>
        <img id="img_confirm_id" src="hero/que.png" />
    </div>
</div>

<div id="div_equip_item_bottom_kuang_id" style='position:absolute;z-index: 2;left:-200px;top:250px;'>
    <img id="img_equip_item_bottom_kuang_id" src="team/kuang.png" />
</div>

<div id="div_armorbase_id" style='position: absolute;z-index: 2;left:200px;top:250px;'>
    <img id="img_armorbase_id" src="" />
</div>

<div id="div_mouse_id" style="position: absolute;z-index: 2;left: 120px;top: 345px;">
    <img id="img_mouse_id" src="stage/mouse.png">
</div>

</body>
</html>