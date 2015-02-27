var warship_img_array_index1 = 0;

var warship_img_array_x1 = 440;
var warship_img_array_y1 = 150;

var warship_right_img_array = new Array("effectsofright/shui2/shuiA.png","effectsofright/shui2/shuiB.png");

var right_falling_fire_img_array = new Array("effect2/lava.serie/falling.fire/falling.fire0.png","effect2/lava.serie/falling.fire/falling.fire1.png","effect2/lava.serie/falling.fire/falling.fire2.png","effect2/lava.serie/falling.fire/falling.fire3.png");
var right_falling_fire_img_array_index = 0;

var right_thorns_img_array = new Array("effect2/left/evocation.big/thorns/thorns1.png","effect2/left/evocation.big/thorns/thorns2.png","effect2/left/evocation.big/thorns/thorns3.png");
var right_thorns_img_array_index = 0;

var right_fire_img_array = new Array("effectsofright/barrage/fire.img/0.png","effectsofright/barrage/fire.img/1.png","effectsofright/barrage/fire.img/2.png");
var right_fire_img_array_index = 0;

var right_barrage_img_array = new Array("effect2/barrage/1.png","effect2/barrage/2.png","effect2/barrage/3.png");
var right_barrage_img_array_index = 0;

var right_electricity_img_array = new Array("effectsofright/electricity/0.png","effectsofright/electricity/1.png","effectsofright/electricity/2.png","effectsofright/electricity/3.png","effectsofright/electricity/4.png","effectsofright/electricity/5.png","effectsofright/electricity/6.png","effectsofright/electricity/7.png");
var right_electricity_img_array_index = 0;

var right_huoqiu_effect_img_array = new Array("effectsofright/huoqiu/huoqiu1.png","effectsofright/huoqiu/huoqiu2.png","effectsofright/huoqiu/huoqiu3.png");
var right_huoqiu_effect_img_array_index = 0;

var right_ice_img_array = new Array("effectsofright/ice/icesmall1.png","effectsofright/ice/icesmall2.png","effectsofright/ice/icesmall3.png","effectsofright/ice/icesmall4.png","effectsofright/ice/icesmall5.png");
var right_ice_img_array_index = 0;

var right_quan2_effect_img_array = new Array("effectsofright/quan(2)/11.png","effectsofright/quan(2)/13.png","effectsofright/quan(2)/14.png");
var right_quan2_effect_img_array_index = 0;

var right_storm_effect_img_array = new Array("effectsofright/quan(2)/11.png","effectsofright/quan(2)/13.png","effectsofright/quan(2)/14.png");
var right_storm_effect_img_array_index = 0;

var right_storm2_effect_img_array = new Array("effectsofright/storm2/dazhao1.png","effectsofright/storm2/dazhao2.png","effectsofright/storm2/dazhao3.png","effectsofright/storm2/dazhao4.png","effectsofright/storm2/dazhao5.png");
var right_storm2_effect_img_array_index = 0;

var right_strokes_effect_img_array = new Array("effectsofright/strokes/1.png","effectsofright/strokes/2.png","effectsofright/strokes/3.png","effectsofright/strokes/4.png","effectsofright/strokes/5.png","effectsofright/strokes/6.png");
var right_strokes_effect_img_array_index = 0;

var right_zhua_effect_img_array = new Array("effectsofright/strokes/1.png","effectsofright/strokes/2.png","effectsofright/strokes/3.png","effectsofright/strokes/4.png","effectsofright/strokes/5.png","effectsofright/strokes/6.png");
var right_zhua_effect_img_array_index = 0;

var watership_right_effect_image_tab_id;
var watership_right_effect_div_tab_id;
function watership_right_effect(image_tab_id,div_tab_id){
    watership_right_effect_image_tab_id=image_tab_id;
    watership_right_effect_div_tab_id=div_tab_id;
    document.getElementById(image_tab_id).src = warship_right_img_array[warship_img_array_index1];
    document.getElementById(div_tab_id).style.left = warship_img_array_x1+"px";
    document.getElementById(div_tab_id).style.top = warship_img_array_y1+"px";
    warship_img_array_index1++;
    warship_img_array_x1 -= 10;
    if (warship_img_array_index1>=warship_right_img_array.length) warship_img_array_index1 = 0;

    if(warship_img_array_x1 >= 10){
        if(!document.gameIsOver)  setTimeout("watership_right_effect(watership_right_effect_image_tab_id,watership_right_effect_div_tab_id)",40);         // control the FPS
    }else{
        warship_img_array_x1 = 440;
        document.getElementById(div_tab_id).style.left = -600+"px";
    }

}

var falling_fire_top_y_inframe = 0;
var falling_fire_img_array = new Array("effect2/lava.serie/falling.fire/falling.fire0.png","effect2/lava.serie/falling.fire/falling.fire1.png","effect2/lava.serie/falling.fire/falling.fire2.png","effect2/lava.serie/falling.fire/falling.fire3.png");
var falling_fire_img_array_index = 0;
function right_falling_fire_effect(){
    document.getElementById("img_falling_fire_id1").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id1").style.left = 100+"px";
    document.getElementById("div_falling_fire_id1").style.top = -50+falling_fire_top_y_inframe+"px";

    document.getElementById("img_falling_fire_id2").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id2").style.left = 150+"px";
    document.getElementById("div_falling_fire_id2").style.top = -50+falling_fire_top_y_inframe+"px";

    document.getElementById("img_falling_fire_id3").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id3").style.left = 200+"px";
    document.getElementById("div_falling_fire_id3").style.top = 20+falling_fire_top_y_inframe+"px";

    document.getElementById("img_falling_fire_id4").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id4").style.left = 150+"px";
    document.getElementById("div_falling_fire_id4").style.top = 120+falling_fire_top_y_inframe+"px";

    document.getElementById("img_falling_fire_id5").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id5").style.left = 200+"px";
    document.getElementById("div_falling_fire_id5").style.top = 120+falling_fire_top_y_inframe+"px";

    falling_fire_top_y_inframe += 50;

    falling_fire_img_array_index++;
    if (falling_fire_img_array_index>=falling_fire_img_array.length){
        falling_fire_img_array_index = 0;
        falling_fire_top_y_inframe = 0;
        document.getElementById("div_falling_fire_id1").style.left = -1000+"px";
        document.getElementById("div_falling_fire_id2").style.left = -1000+"px";
        document.getElementById("div_falling_fire_id3").style.left = -1000+"px";
        document.getElementById("div_falling_fire_id4").style.left = -1000+"px";
        document.getElementById("div_falling_fire_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_falling_fire_effect()",500);         // control the FPS
    }
}

//var right_falling_fire_top_y_inframe = 0;
//function right_falling_fire_effect(){
//    document.getElementById("img_right_falling_fire_id1").src = right_falling_fire_img_array[right_falling_fire_img_array_index];
//    document.getElementById("div_right_falling_fire_id1").style.left = 100+"px";
//    document.getElementById("div_right_falling_fire_id1").style.top = (-50+right_falling_fire_top_y_inframe)+"px";
//
//    document.getElementById("img_right_falling_fire_id2").src = right_falling_fire_img_array[right_falling_fire_img_array_index];
//    document.getElementById("div_right_falling_fire_id2").style.left = 150+"px";
//    document.getElementById("div_right_falling_fire_id2").style.top = (-50+right_falling_fire_top_y_inframe)+"px";
//
//    document.getElementById("img_right_falling_fire_id3").src = right_falling_fire_img_array[right_falling_fire_img_array_index];
//    document.getElementById("div_right_falling_fire_id3").style.left = 200+"px";
//    document.getElementById("div_right_falling_fire_id3").style.top = (20+right_falling_fire_top_y_inframe)+"px";
//
//    document.getElementById("img_right_falling_fire_id4").src = right_falling_fire_img_array[right_falling_fire_img_array_index];
//    document.getElementById("div_right_falling_fire_id4").style.left = 150+"px";
//    document.getElementById("div_right_falling_fire_id4").style.top = (120+right_falling_fire_top_y_inframe)+"px";
//
//    document.getElementById("img_right_falling_fire_id5").src = right_falling_fire_img_array[right_falling_fire_img_array_index];
//    document.getElementById("div_right_falling_fire_id5").style.left = 200+"px";
//    document.getElementById("div_right_falling_fire_id5").style.top = (120+right_falling_fire_top_y_inframe)+"px";
//
//    right_falling_fire_top_y_inframe += 50;
//
//    right_falling_fire_img_array_index++;
//    if (right_falling_fire_img_array_index>=right_falling_fire_img_array.length){
//        right_falling_fire_img_array_index = 0;
//        right_falling_fire_top_y_inframe = 0;
//        document.getElementById("div_right_falling_fire_id1").style.left = -1000+"px";
//        document.getElementById("div_right_falling_fire_id2").style.left = -1000+"px";
//        document.getElementById("div_right_falling_fire_id3").style.left = -1000+"px";
//        document.getElementById("div_right_falling_fire_id4").style.left = -1000+"px";
//        document.getElementById("div_right_falling_fire_id5").style.left = -1000+"px";
//    }else{
//        setTimeout("right_falling_fire_effect()",1000);         // control the FPS
//    }
//}

function right_thorns_effect(){
    document.getElementById("img_right_thorns_effect_id1").src =right_thorns_img_array[right_thorns_img_array_index];
    document.getElementById("div_right_thorns_effect_id1").style.left = 50+"px";
    document.getElementById("div_right_thorns_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_thorns_effect_id2").src =right_thorns_img_array[right_thorns_img_array_index];
    document.getElementById("div_right_thorns_effect_id2").style.left = 150+"px";
    document.getElementById("div_right_thorns_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_thorns_effect_id3").src =right_thorns_img_array[right_thorns_img_array_index];
    document.getElementById("div_right_thorns_effect_id3").style.left = 250+"px";
    document.getElementById("div_right_thorns_effect_id3").style.top = 120+"px";

    document.getElementById("img_right_thorns_effect_id4").src =right_thorns_img_array[right_thorns_img_array_index];
    document.getElementById("div_right_thorns_effect_id4").style.left = 50+"px";
    document.getElementById("div_right_thorns_effect_id4").style.top = 220+"px";

    document.getElementById("img_right_thorns_effect_id5").src =right_thorns_img_array[right_thorns_img_array_index];
    document.getElementById("div_right_thorns_effect_id5").style.left = 150+"px";
    document.getElementById("div_right_thorns_effect_id5").style.top = 220+"px";

    right_thorns_img_array_index++;
    if (right_thorns_img_array_index>=right_thorns_img_array.length){
        if(right_thorns_img_array_index==right_thorns_img_array.length){
            if(!document.gameIsOver)  setTimeout("right_thorns_effect()",1000);         // control the FPS
        }else{
            right_thorns_img_array_index= 0;
            document.getElementById("div_right_thorns_effect_id1").style.left = -1000+"px";
            document.getElementById("div_right_thorns_effect_id2").style.left = -1000+"px";
            document.getElementById("div_right_thorns_effect_id3").style.left = -1000+"px";
            document.getElementById("div_right_thorns_effect_id4").style.left = -1000+"px";
            document.getElementById("div_right_thorns_effect_id5").style.left = -1000+"px";
        }
    }else{
        if(!document.gameIsOver)  setTimeout("right_thorns_effect()",1000);         // control the FPS
    }
}

var right_fire_effect_left_x_inframe = 100;
function right_fire_effect(){
    document.getElementById("img_right_fire_effect_id1").src =right_fire_img_array[right_fire_img_array_index];
    document.getElementById("div_right_fire_effect_id1").style.left = 400-right_fire_effect_left_x_inframe+"px";
    document.getElementById("div_right_fire_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_fire_effect_id2").src =right_fire_img_array[right_fire_img_array_index];
    document.getElementById("div_right_fire_effect_id2").style.left = 300-right_fire_effect_left_x_inframe+"px";
    document.getElementById("div_right_fire_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_fire_effect_id3").src =right_fire_img_array[right_fire_img_array_index];
    document.getElementById("div_right_fire_effect_id3").style.left = 200-right_fire_effect_left_x_inframe+"px";
    document.getElementById("div_right_fire_effect_id3").style.top = 120+"px";

    document.getElementById("img_right_fire_effect_id4").src =right_fire_img_array[right_fire_img_array_index];
    document.getElementById("div_right_fire_effect_id4").style.left = 400-right_fire_effect_left_x_inframe+"px";
    document.getElementById("div_right_fire_effect_id4").style.top = 220+"px";

    document.getElementById("img_right_fire_effect_id5").src =right_fire_img_array[right_fire_img_array_index];
    document.getElementById("div_right_fire_effect_id5").style.left = 300-right_fire_effect_left_x_inframe+"px";
    document.getElementById("div_right_fire_effect_id5").style.top = 220+"px";

    right_fire_img_array_index++;
    right_fire_effect_left_x_inframe += 100;
    if (right_fire_img_array_index>=right_fire_img_array.length){
        right_fire_img_array_index = 0;
        right_fire_effect_left_x_inframe = 100;
        document.getElementById("div_right_fire_effect_id1").style.left = -1000+"px";
        document.getElementById("div_right_fire_effect_id2").style.left = -1000+"px";
        document.getElementById("div_right_fire_effect_id3").style.left = -1000+"px";
        document.getElementById("div_right_fire_effect_id4").style.left = -1000+"px";
        document.getElementById("div_right_fire_effect_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_fire_effect()",500);         // control the FPS
    }
}

function right_barrage_effect(){
    document.getElementById("img_right_barrage_effect_id1").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id1").style.left = 50+"px";
    document.getElementById("div_right_barrage_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_barrage_effect_id2").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id2").style.left = 150+"px";
    document.getElementById("div_right_barrage_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_barrage_effect_id3").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id3").style.left = 250+"px";
    document.getElementById("div_right_barrage_effect_id3").style.top = 120+"px";

    document.getElementById("img_right_barrage_effect_id4").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id4").style.left = 50+"px";
    document.getElementById("div_right_barrage_effect_id4").style.top = 220+"px";

    document.getElementById("img_right_barrage_effect_id5").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id5").style.left = 150+"px";
    document.getElementById("div_right_barrage_effect_id5").style.top = 220+"px";

    document.getElementById("img_right_barrage_effect_id6").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id6").style.left = 250+"px";
    document.getElementById("div_right_barrage_effect_id6").style.top = 100+"px";

    document.getElementById("img_right_barrage_effect_id7").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id7").style.left = 350+"px";
    document.getElementById("div_right_barrage_effect_id7").style.top = 100+"px";

    document.getElementById("img_right_barrage_effect_id8").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id8").style.left = 350+"px";
    document.getElementById("div_right_barrage_effect_id8").style.top = 220+"px";

    document.getElementById("img_right_barrage_effect_id9").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id9").style.left = 250+"px";
    document.getElementById("div_right_barrage_effect_id9").style.top = 270+"px";

    document.getElementById("img_right_barrage_effect_id10").src = right_barrage_img_array[right_barrage_img_array_index];
    document.getElementById("div_right_barrage_effect_id10").style.left = 350+"px";
    document.getElementById("div_right_barrage_effect_id10").style.top = 270+"px";

    right_barrage_img_array_index++;
    if (right_barrage_img_array_index>=right_barrage_img_array.length){
        right_barrage_img_array_index = 0;
        document.getElementById("div_right_barrage_effect_id1").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id2").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id3").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id4").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id5").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id6").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id7").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id8").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id9").style.left = -1000+"px";
        document.getElementById("div_right_barrage_effect_id10").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_barrage_effect()",250);         // control the FPS
    }
}

function right_electricity_effect(){
    document.getElementById("img_right_electricity_id1").src = right_electricity_img_array[right_electricity_img_array_index];
    document.getElementById("div_right_electricity_id1").style.left = 50+"px";
    document.getElementById("div_right_electricity_id1").style.top = 50+"px";

    document.getElementById("img_right_electricity_id2").src = right_electricity_img_array[right_electricity_img_array_index];
    document.getElementById("div_right_electricity_id2").style.left = 150+"px";
    document.getElementById("div_right_electricity_id2").style.top = 50+"px";

    document.getElementById("img_right_electricity_id3").src = right_electricity_img_array[right_electricity_img_array_index];
    document.getElementById("div_right_electricity_id3").style.left = 250+"px";
    document.getElementById("div_right_electricity_id3").style.top = 50+"px";

    document.getElementById("img_right_electricity_id4").src = right_electricity_img_array[right_electricity_img_array_index];
    document.getElementById("div_right_electricity_id4").style.left = 150+"px";
    document.getElementById("div_right_electricity_id4").style.top = 100+"px";

    document.getElementById("img_right_electricity_id5").src = right_electricity_img_array[right_electricity_img_array_index];
    document.getElementById("div_right_electricity_id5").style.left = 250+"px";
    document.getElementById("div_right_electricity_id5").style.top = 100+"px";

    right_electricity_img_array_index++;
    if (right_electricity_img_array_index>=right_electricity_img_array.length){
        right_electricity_img_array_index = 0;
        document.getElementById("div_right_electricity_id1").style.left = -1000+"px";
        document.getElementById("div_right_electricity_id2").style.left = -1000+"px";
        document.getElementById("div_right_electricity_id3").style.left = -1000+"px";
        document.getElementById("div_right_electricity_id4").style.left = -1000+"px";
        document.getElementById("div_right_electricity_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_electricity_effect()",250);         // control the FPS
    }
}

var right_huoqiu_effect_left_x_inframe = 100;
function right_huoqiu_effect(){
    document.getElementById("img_right_huoqiu_effect_id1").src =right_huoqiu_effect_img_array[right_huoqiu_effect_img_array_index];
    document.getElementById("div_right_huoqiu_effect_id1").style.left = 400-right_huoqiu_effect_left_x_inframe+"px";
    document.getElementById("div_right_huoqiu_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_huoqiu_effect_id2").src =right_huoqiu_effect_img_array[right_huoqiu_effect_img_array_index];
    document.getElementById("div_right_huoqiu_effect_id2").style.left = 300-right_huoqiu_effect_left_x_inframe+"px";
    document.getElementById("div_right_huoqiu_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_huoqiu_effect_id3").src =right_huoqiu_effect_img_array[right_huoqiu_effect_img_array_index];
    document.getElementById("div_right_huoqiu_effect_id3").style.left = 200-right_huoqiu_effect_left_x_inframe+"px";
    document.getElementById("div_right_huoqiu_effect_id3").style.top = 120+"px";

    document.getElementById("img_right_huoqiu_effect_id4").src =right_huoqiu_effect_img_array[right_huoqiu_effect_img_array_index];
    document.getElementById("div_right_huoqiu_effect_id4").style.left = 400-right_huoqiu_effect_left_x_inframe+"px";
    document.getElementById("div_right_huoqiu_effect_id4").style.top = 220+"px";

    document.getElementById("img_right_huoqiu_effect_id5").src =right_huoqiu_effect_img_array[right_huoqiu_effect_img_array_index];
    document.getElementById("div_right_huoqiu_effect_id5").style.left = 300-right_huoqiu_effect_left_x_inframe+"px";
    document.getElementById("div_right_huoqiu_effect_id5").style.top = 220+"px";

    right_huoqiu_effect_img_array_index++;
    right_huoqiu_effect_left_x_inframe += 100;
    if (right_huoqiu_effect_img_array_index>=right_huoqiu_effect_img_array.length){
        right_huoqiu_effect_img_array_index = 0;
        right_huoqiu_effect_left_x_inframe = 100;
        document.getElementById("div_right_huoqiu_effect_id1").style.left = -1000+"px";
        document.getElementById("div_right_huoqiu_effect_id2").style.left = -1000+"px";
        document.getElementById("div_right_huoqiu_effect_id3").style.left = -1000+"px";
        document.getElementById("div_right_huoqiu_effect_id4").style.left = -1000+"px";
        document.getElementById("div_right_huoqiu_effect_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_huoqiu_effect()",500);         // control the FPS
    }
}

function right_ice_effect(){
    document.getElementById("img_right_ice_effect_id1").src = right_ice_img_array[right_ice_img_array_index];
    document.getElementById("div_right_ice_effect_id1").style.left = 50+"px";
    document.getElementById("div_right_ice_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_ice_effect_id2").src = right_ice_img_array[right_ice_img_array_index];
    document.getElementById("div_right_ice_effect_id2").style.left = 150+"px";
    document.getElementById("div_right_ice_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_ice_effect_id3").src = right_ice_img_array[right_ice_img_array_index];
    document.getElementById("div_right_ice_effect_id3").style.left = 250+"px";
    document.getElementById("div_right_ice_effect_id3").style.top = 50+"px";

    document.getElementById("img_right_ice_effect_id4").src = right_ice_img_array[right_ice_img_array_index];
    document.getElementById("div_right_ice_effect_id4").style.left = 50+"px";
    document.getElementById("div_right_ice_effect_id4").style.top = 100+"px";

    document.getElementById("img_right_ice_effect_id5").src = right_ice_img_array[right_ice_img_array_index];
    document.getElementById("div_right_ice_effect_id5").style.left = 200+"px";
    document.getElementById("div_right_ice_effect_id5").style.top = 100+"px";

    right_ice_img_array_index++;
    if (right_ice_img_array_index>=right_ice_img_array.length){
        right_ice_img_array_index = 0;
        document.getElementById("div_right_ice_effect_id1").style.left = -1000+"px";
        document.getElementById("div_right_ice_effect_id2").style.left = -1000+"px";
        document.getElementById("div_right_ice_effect_id3").style.left = -1000+"px";
        document.getElementById("div_right_ice_effect_id4").style.left = -1000+"px";
        document.getElementById("div_right_ice_effect_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_ice_effect()",500);         // control the FPS
    }
}

function right_quan2_effect(){
    document.getElementById("img_right_quan2_effect_id1").src = right_quan2_effect_img_array[right_quan2_effect_img_array_index];
    document.getElementById("div_right_quan2_effect_id1").style.left = 50+"px";
    document.getElementById("div_right_quan2_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_quan2_effect_id2").src = right_quan2_effect_img_array[right_quan2_effect_img_array_index];
    document.getElementById("div_right_quan2_effect_id2").style.left = 150+"px";
    document.getElementById("div_right_quan2_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_quan2_effect_id3").src = right_quan2_effect_img_array[right_quan2_effect_img_array_index];
    document.getElementById("div_right_quan2_effect_id3").style.left = 250+"px";
    document.getElementById("div_right_quan2_effect_id3").style.top = 50+"px";

    document.getElementById("img_right_quan2_effect_id4").src = right_quan2_effect_img_array[right_quan2_effect_img_array_index];
    document.getElementById("div_right_quan2_effect_id4").style.left = 150+"px";
    document.getElementById("div_right_quan2_effect_id4").style.top = 100+"px";

    document.getElementById("img_right_quan2_effect_id5").src = right_quan2_effect_img_array[right_quan2_effect_img_array_index];
    document.getElementById("div_right_quan2_effect_id5").style.left = 250+"px";
    document.getElementById("div_right_quan2_effect_id5").style.top = 100+"px";

    right_quan2_effect_img_array_index++;
    if (right_quan2_effect_img_array_index>=right_quan2_effect_img_array.length){
        right_quan2_effect_img_array_index = 0;
        document.getElementById("div_right_quan2_effect_id1").style.left = -1000+"px";
        document.getElementById("div_right_quan2_effect_id2").style.left = -1000+"px";
        document.getElementById("div_right_quan2_effect_id3").style.left = -1000+"px";
        document.getElementById("div_right_quan2_effect_id4").style.left = -1000+"px";
        document.getElementById("div_right_quan2_effect_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_quan2_effect()",500);         // control the FPS
    }
}

function right_storm_effect(){
    document.getElementById("img_right_storm_effect_id1").src = right_storm_effect_img_array[right_storm_effect_img_array_index];
    document.getElementById("div_right_storm_effect_id1").style.left = 50+"px";
    document.getElementById("div_right_storm_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_storm_effect_id2").src = right_storm_effect_img_array[right_storm_effect_img_array_index];
    document.getElementById("div_right_storm_effect_id2").style.left = 150+"px";
    document.getElementById("div_right_storm_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_storm_effect_id3").src = right_storm_effect_img_array[right_storm_effect_img_array_index];
    document.getElementById("div_right_storm_effect_id3").style.left = 250+"px";
    document.getElementById("div_right_storm_effect_id3").style.top = 50+"px";

    document.getElementById("img_right_storm_effect_id4").src = right_storm_effect_img_array[right_storm_effect_img_array_index];
    document.getElementById("div_right_storm_effect_id4").style.left = 150+"px";
    document.getElementById("div_right_storm_effect_id4").style.top = 100+"px";

    document.getElementById("img_right_storm_effect_id5").src = right_storm_effect_img_array[right_storm_effect_img_array_index];
    document.getElementById("div_right_storm_effect_id5").style.left = 250+"px";
    document.getElementById("div_right_storm_effect_id5").style.top = 100+"px";

    right_storm_effect_img_array_index++;
    if (right_storm_effect_img_array_index>=right_storm_effect_img_array.length){
        right_storm_effect_img_array_index = 0;
        document.getElementById("div_right_storm_effect_id1").style.left = -1000+"px";
        document.getElementById("div_right_storm_effect_id2").style.left = -1000+"px";
        document.getElementById("div_right_storm_effect_id3").style.left = -1000+"px";
        document.getElementById("div_right_storm_effect_id4").style.left = -1000+"px";
        document.getElementById("div_right_storm_effect_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_storm_effect()",500);         // control the FPS
    }
}

function right_storm2_effect(){
    document.getElementById("img_right_storm2_effect_id1").src = right_storm2_effect_img_array[right_storm2_effect_img_array_index];
    document.getElementById("div_right_storm2_effect_id1").style.left = 50+"px";
    document.getElementById("div_right_storm2_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_storm2_effect_id2").src = right_storm2_effect_img_array[right_storm2_effect_img_array_index];
    document.getElementById("div_right_storm2_effect_id2").style.left = 150+"px";
    document.getElementById("div_right_storm2_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_storm2_effect_id3").src = right_storm2_effect_img_array[right_storm2_effect_img_array_index];
    document.getElementById("div_right_storm2_effect_id3").style.left = 250+"px";
    document.getElementById("div_right_storm2_effect_id3").style.top = 50+"px";

    document.getElementById("img_right_storm2_effect_id4").src = right_storm2_effect_img_array[right_storm2_effect_img_array_index];
    document.getElementById("div_right_storm2_effect_id4").style.left = 150+"px";
    document.getElementById("div_right_storm2_effect_id4").style.top = 100+"px";

    document.getElementById("img_right_storm2_effect_id5").src = right_storm2_effect_img_array[right_storm2_effect_img_array_index];
    document.getElementById("div_right_storm2_effect_id5").style.left = 250+"px";
    document.getElementById("div_right_storm2_effect_id5").style.top = 100+"px";

    right_storm2_effect_img_array_index++;
    if (right_storm2_effect_img_array_index>=right_storm2_effect_img_array.length){
        right_storm2_effect_img_array_index = 0;
        document.getElementById("div_right_storm2_effect_id1").style.left = -1000+"px";
        document.getElementById("div_right_storm2_effect_id2").style.left = -1000+"px";
        document.getElementById("div_right_storm2_effect_id3").style.left = -1000+"px";
        document.getElementById("div_right_storm2_effect_id4").style.left = -1000+"px";
        document.getElementById("div_right_storm2_effect_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_storm2_effect()",500);         // control the FPS
    }
}

function right_strokes_effect(){
    document.getElementById("img_right_strokes_effect_id1").src = right_strokes_effect_img_array[right_strokes_effect_img_array_index];
    document.getElementById("div_right_strokes_effect_id1").style.left = 0+"px";
    document.getElementById("div_right_strokes_effect_id1").style.top = 100+"px";

    right_strokes_effect_img_array_index++;
    if (right_strokes_effect_img_array_index>=right_strokes_effect_img_array.length){
        right_strokes_effect_img_array_index = 0;
        document.getElementById("div_right_strokes_effect_id1").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_strokes_effect()",500);         // control the FPS
    }
}

function right_zhua_effect(){
    document.getElementById("img_right_zhua_effect_id1").src = right_zhua_effect_img_array[right_zhua_effect_img_array_index];
    document.getElementById("div_right_zhua_effect_id1").style.left = 50+"px";
    document.getElementById("div_right_zhua_effect_id1").style.top = 50+"px";

    document.getElementById("img_right_zhua_effect_id2").src = right_zhua_effect_img_array[right_zhua_effect_img_array_index];
    document.getElementById("div_right_zhua_effect_id2").style.left = 150+"px";
    document.getElementById("div_right_zhua_effect_id2").style.top = 50+"px";

    document.getElementById("img_right_zhua_effect_id3").src = right_zhua_effect_img_array[right_zhua_effect_img_array_index];
    document.getElementById("div_right_zhua_effect_id3").style.left = 250+"px";
    document.getElementById("div_right_zhua_effect_id3").style.top = 50+"px";

    document.getElementById("img_right_zhua_effect_id4").src = right_zhua_effect_img_array[right_zhua_effect_img_array_index];
    document.getElementById("div_right_zhua_effect_id4").style.left = 150+"px";
    document.getElementById("div_right_zhua_effect_id4").style.top = 100+"px";

    document.getElementById("img_right_zhua_effect_id5").src = right_zhua_effect_img_array[right_zhua_effect_img_array_index];
    document.getElementById("div_right_zhua_effect_id5").style.left = 250+"px";
    document.getElementById("div_right_zhua_effect_id5").style.top = 100+"px";

    right_zhua_effect_img_array_index++;
    if (right_zhua_effect_img_array_index>=right_zhua_effect_img_array.length){
        right_zhua_effect_img_array_index = 0;
        document.getElementById("div_right_zhua_effect_id1").style.left = -1000+"px";
        document.getElementById("div_right_zhua_effect_id2").style.left = -1000+"px";
        document.getElementById("div_right_zhua_effect_id3").style.left = -1000+"px";
        document.getElementById("div_right_zhua_effect_id4").style.left = -1000+"px";
        document.getElementById("div_right_zhua_effect_id5").style.left = -1000+"px";
    }else{
        if(!document.gameIsOver)  setTimeout("right_zhua_effect()",500);         // control the FPS
    }
}