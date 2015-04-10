var k_soul_img_array = new Array("effect2/k-soul.img/k-soul.img0.png","effect2/k-soul.img/k-soul.img1.png","effect2/k-soul.img/k-soul.img2.png","effect2/k-soul.img/k-soul.img3.png","effect2/k-soul.img/k-soul.img4.png","effect2/k-soul.img/k-soul.img5.png","effect2/k-soul.img/k-soul.img6.png");
var k_soul_img_array_index = 0;
var barrage_img_array = new Array("effect2/barrage/1.png","effect2/barrage/2.png","effect2/barrage/3.png");
var barrage_img_array_index = 0;
var chain_spike_img_array= new Array("effect2/chain_spike/eff_chain_spike.png","effect2/chain_spike/eff_chain_spike2.png","effect2/chain_spike/eff_chain_spike3.png");
var chain_spike_img_array_index = 0;
var dazhao1_img_array = new Array("effect2/dazhao1/dazhao1.png","effect2/dazhao1/dazhao2.png","effect2/dazhao1/dazhao3.png","effect2/dazhao1/dazhao4.png","effect2/dazhao1/dazhao5.png");
var  dazhao1_img_array_index = 0;
var fireball_img_array = new Array("effect2/fireball/fireball-1_01.png","effect2/fireball/fireball-1_04.png","effect2/fireball/fireball-1_05.png");
var fireball_img_array_index = 0;
var ice_img_array = new Array("effect2/ice/icesmall1.png","effect2/ice/icesmall2.png","effect2/ice/icesmall3.png","effect2/ice/icesmall4.png","effect2/ice/icesmall5.png");
var ice_img_array_index = 0;
var thorns_img_array = new Array("effect2/left/evocation.big/thorns/thorns1.png","effect2/left/evocation.big/thorns/thorns2.png","effect2/left/evocation.big/thorns/thorns3.png");
var thorns_img_array_index = 0;
var fire_img_array = new Array("effect2/left/fire.img/0.png","effect2/left/fire.img/1.png","effect2/left/fire.img/2.png");
var fire_img_array_index = 0;
var point_Coco_img_array = new Array("effect2/point_Coco/eff_point_Coco_atk1.png","effect2/point_Coco/eff_point_Coco_atk2.png","effect2/point_Coco/eff_point_Coco_atk3.png","effect2/point_Coco/eff_point_Coco_atk4.png","effect2/point_Coco/eff_point_Coco_atk5.png","effect2/point_Coco/eff_point_Coco_atk5.png","effect2/point_Coco/eff_point_Coco_atk4.png","effect2/point_Coco/eff_point_Coco_atk3.png","effect2/point_Coco/eff_point_Coco_atk2.png","effect2/point_Coco/eff_point_Coco_atk1.png");
var point_Coco_img_array_index = 0;
var storm_img_array = new Array("effect2/storm/storm1.png","effect2/storm/storm2.png","effect2/storm/storm3.png","effect2/storm/storm4.png","effect2/storm/storm5.png","effect2/storm/storm6.png");
var storm_img_array_index = 0;
var falling_fire_img_array = new Array("effect2/lava.serie/falling.fire/falling.fire0.png","effect2/lava.serie/falling.fire/falling.fire1.png","effect2/lava.serie/falling.fire/falling.fire2.png","effect2/lava.serie/falling.fire/falling.fire3.png");
var falling_fire_img_array_index = 0;

function k_soul_effect(image_tab_id,div_tab_id){
    k_soul_effect_imp();
}

function k_soul_effect_imp(){
    document.getElementById("img_k_soul_id1").src = k_soul_img_array[k_soul_img_array_index];
    document.getElementById("div_k_soul_id1").style.left = 350+"px";
    document.getElementById("div_k_soul_id1").style.top = 50+"px";

    document.getElementById("img_k_soul_id2").src = k_soul_img_array[k_soul_img_array_index];
    document.getElementById("div_k_soul_id2").style.left = 450+"px";
    document.getElementById("div_k_soul_id2").style.top = 50+"px";

    document.getElementById("img_k_soul_id3").src = k_soul_img_array[k_soul_img_array_index];
    document.getElementById("div_k_soul_id3").style.left = 550+"px";
    document.getElementById("div_k_soul_id3").style.top = 120+"px";

    document.getElementById("img_k_soul_id4").src = k_soul_img_array[k_soul_img_array_index];
    document.getElementById("div_k_soul_id4").style.left = 350+"px";
    document.getElementById("div_k_soul_id4").style.top = 220+"px";

    document.getElementById("img_k_soul_id5").src = k_soul_img_array[k_soul_img_array_index];
    document.getElementById("div_k_soul_id5").style.left = 450+"px";
    document.getElementById("div_k_soul_id5").style.top = 220+"px";

    k_soul_img_array_index++;
    if (k_soul_img_array_index>=k_soul_img_array.length){
        k_soul_img_array_index = 0;
        document.getElementById("div_k_soul_id1").style.left = -1000+"px";
        document.getElementById("div_k_soul_id2").style.left = -1000+"px";
        document.getElementById("div_k_soul_id3").style.left = -1000+"px";
        document.getElementById("div_k_soul_id4").style.left = -1000+"px";
        document.getElementById("div_k_soul_id5").style.left = -1000+"px";
    }else{
          setTimeout("k_soul_effect_imp()",250);         // control the FPS
    }
}

function falling_fire_effect(image_tab_id,div_tab_id){
    falling_fire_effect_imp();
}

var falling_fire_top_y_inframe = 0;
function falling_fire_effect_imp(){
    document.getElementById("img_falling_fire_id1").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id1").style.left = 350+"px";
    document.getElementById("div_falling_fire_id1").style.top = -50+falling_fire_top_y_inframe+"px";

    document.getElementById("img_falling_fire_id2").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id2").style.left = 450+"px";
    document.getElementById("div_falling_fire_id2").style.top = -50+falling_fire_top_y_inframe+"px";

    document.getElementById("img_falling_fire_id3").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id3").style.left = 550+"px";
    document.getElementById("div_falling_fire_id3").style.top = 20+falling_fire_top_y_inframe+"px";

    document.getElementById("img_falling_fire_id4").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id4").style.left = 350+"px";
    document.getElementById("div_falling_fire_id4").style.top = 120+falling_fire_top_y_inframe+"px";

    document.getElementById("img_falling_fire_id5").src = falling_fire_img_array[falling_fire_img_array_index];
    document.getElementById("div_falling_fire_id5").style.left = 450+"px";
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
          setTimeout("falling_fire_effect_imp()",500);         // control the FPS
    }
}

function barrage_effect(image_tab_id,div_tab_id){
    barrage_effect_imp();
}

function barrage_effect_imp(){
    document.getElementById("img_barrage_effect_id1").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id1").style.left = 350+"px";
    document.getElementById("div_barrage_effect_id1").style.top = 50+"px";

    document.getElementById("img_barrage_effect_id2").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id2").style.left = 450+"px";
    document.getElementById("div_barrage_effect_id2").style.top = 50+"px";

    document.getElementById("img_barrage_effect_id3").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id3").style.left = 550+"px";
    document.getElementById("div_barrage_effect_id3").style.top = 120+"px";

    document.getElementById("img_barrage_effect_id4").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id4").style.left = 350+"px";
    document.getElementById("div_barrage_effect_id4").style.top = 220+"px";

    document.getElementById("img_barrage_effect_id5").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id5").style.left = 450+"px";
    document.getElementById("div_barrage_effect_id5").style.top = 220+"px";

    document.getElementById("img_barrage_effect_id6").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id6").style.left = 400+"px";
    document.getElementById("div_barrage_effect_id6").style.top = 100+"px";

    document.getElementById("img_barrage_effect_id7").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id7").style.left = 500+"px";
    document.getElementById("div_barrage_effect_id7").style.top = 100+"px";

    document.getElementById("img_barrage_effect_id8").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id8").style.left = 500+"px";
    document.getElementById("div_barrage_effect_id8").style.top = 220+"px";

    document.getElementById("img_barrage_effect_id9").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id9").style.left = 400+"px";
    document.getElementById("div_barrage_effect_id9").style.top = 270+"px";

    document.getElementById("img_barrage_effect_id10").src = barrage_img_array[barrage_img_array_index];
    document.getElementById("div_barrage_effect_id10").style.left = 500+"px";
    document.getElementById("div_barrage_effect_id10").style.top = 270+"px";

    barrage_img_array_index++;
    if (barrage_img_array_index>=barrage_img_array.length){
        barrage_img_array_index = 0;
        document.getElementById("div_barrage_effect_id1").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id2").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id3").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id4").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id5").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id6").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id7").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id8").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id9").style.left = -1000+"px";
        document.getElementById("div_barrage_effect_id10").style.left = -1000+"px";
    }else{
          setTimeout("barrage_effect_imp()",250);         // control the FPS
    }
}

var chain_spike_effect_image_tab_id;
var chain_spike_effect_div_tab_id;
function chain_spike_effect(image_tab_id,div_tab_id){
    chain_spike_effect_image_tab_id=image_tab_id;
    chain_spike_effect_div_tab_id=div_tab_id;
    document.getElementById(image_tab_id).src = chain_spike_img_array[chain_spike_img_array_index];
    document.getElementById(div_tab_id).style.left = 0+"px";

    chain_spike_img_array_index++;
    if (chain_spike_img_array_index>=chain_spike_img_array.length){
        chain_spike_img_array_index = 0;
        document.getElementById(div_tab_id).style.left = -1000+"px";
    }else{
          setTimeout("chain_spike_effect(chain_spike_effect_image_tab_id,chain_spike_effect_div_tab_id)",250);         // control the FPS
    }
}

function dazhao1_effect(image_tab_id,div_tab_id){
    dazhao1_effect_imp();
}

function dazhao1_effect_imp(){

    document.getElementById("img_dazhao1_id1").src =dazhao1_img_array[dazhao1_img_array_index];
    document.getElementById("div_dazhao1_id1").style.left = 250+"px";
    document.getElementById("div_dazhao1_id1").style.top = -50+"px";

    document.getElementById("img_dazhao1_id2").src =dazhao1_img_array[dazhao1_img_array_index];
    document.getElementById("div_dazhao1_id2").style.left = 350+"px";
    document.getElementById("div_dazhao1_id2").style.top = -50+"px";

    document.getElementById("img_dazhao1_id3").src =dazhao1_img_array[dazhao1_img_array_index];
    document.getElementById("div_dazhao1_id3").style.left = 450+"px";
    document.getElementById("div_dazhao1_id3").style.top = 20+"px";

    document.getElementById("img_dazhao1_id4").src =dazhao1_img_array[dazhao1_img_array_index];
    document.getElementById("div_dazhao1_id4").style.left = 250+"px";
    document.getElementById("div_dazhao1_id4").style.top = 120+"px";

    document.getElementById("img_dazhao1_id5").src =dazhao1_img_array[dazhao1_img_array_index];
    document.getElementById("div_dazhao1_id5").style.left = 350+"px";
    document.getElementById("div_dazhao1_id5").style.top = 120+"px";

    dazhao1_img_array_index++;
    if (dazhao1_img_array_index>=dazhao1_img_array.length){
        dazhao1_img_array_index = 0;
        document.getElementById("div_dazhao1_id1").style.left = -1000+"px";
        document.getElementById("div_dazhao1_id2").style.left = -1000+"px";
        document.getElementById("div_dazhao1_id3").style.left = -1000+"px";
        document.getElementById("div_dazhao1_id4").style.left = -1000+"px";
        document.getElementById("div_dazhao1_id5").style.left = -1000+"px";
    }else{
          setTimeout("dazhao1_effect_imp()",250);         // control the FPS
    }
}

function fireball_effect(image_tab_id,div_tab_id){
    fireball_effect_imp();
}

var fireball_effect_left_x_inframe = 100;
function fireball_effect_imp(){

    document.getElementById("img_fireball_effect_id1").src =fireball_img_array[fireball_img_array_index];
    document.getElementById("div_fireball_effect_id1").style.left = 0+fireball_effect_left_x_inframe+"px";
    document.getElementById("div_fireball_effect_id1").style.top = 50+"px";

    document.getElementById("img_fireball_effect_id2").src =fireball_img_array[fireball_img_array_index];
    document.getElementById("div_fireball_effect_id2").style.left = 50+fireball_effect_left_x_inframe+"px";
    document.getElementById("div_fireball_effect_id2").style.top = 50+"px";

    document.getElementById("img_fireball_effect_id3").src =fireball_img_array[fireball_img_array_index];
    document.getElementById("div_fireball_effect_id3").style.left = 100+fireball_effect_left_x_inframe+"px";
    document.getElementById("div_fireball_effect_id3").style.top = 120+"px";

    document.getElementById("img_fireball_effect_id4").src =fireball_img_array[fireball_img_array_index];
    document.getElementById("div_fireball_effect_id4").style.left = 0+fireball_effect_left_x_inframe+"px";
    document.getElementById("div_fireball_effect_id4").style.top = 220+"px";

    document.getElementById("img_fireball_effect_id5").src =fireball_img_array[fireball_img_array_index];
    document.getElementById("div_fireball_effect_id5").style.left = 50+fireball_effect_left_x_inframe+"px";
    document.getElementById("div_fireball_effect_id5").style.top = 220+"px";

    fireball_img_array_index++;
    fireball_effect_left_x_inframe += 150;
    if (fireball_img_array_index>=fireball_img_array.length){
        fireball_img_array_index = 0;
        document.getElementById("div_fireball_effect_id1").style.left = -1000+"px";
        document.getElementById("div_fireball_effect_id2").style.left = -1000+"px";
        document.getElementById("div_fireball_effect_id3").style.left = -1000+"px";
        document.getElementById("div_fireball_effect_id4").style.left = -1000+"px";
        document.getElementById("div_fireball_effect_id5").style.left = -1000+"px";
    }else{
          setTimeout("fireball_effect_imp()",250);         // control the FPS
    }
}

function ice_effect(image_tab_id,div_tab_id){
    ice_effect_imp();
}

function ice_effect_imp(){

    document.getElementById("img_ice_effect_id1").src =ice_img_array[ice_img_array_index];
    document.getElementById("div_ice_effect_id1").style.left = 350+"px";
    document.getElementById("div_ice_effect_id1").style.top = 50+"px";

    document.getElementById("img_ice_effect_id2").src =ice_img_array[ice_img_array_index];
    document.getElementById("div_ice_effect_id2").style.left = 450+"px";
    document.getElementById("div_ice_effect_id2").style.top = 80+"px";

    document.getElementById("img_ice_effect_id3").src =ice_img_array[ice_img_array_index];
    document.getElementById("div_ice_effect_id3").style.left = 350+"px";
    document.getElementById("div_ice_effect_id3").style.top = 120+"px";

    ice_img_array_index++;
    if (ice_img_array_index>=ice_img_array.length){
        ice_img_array_index = 0;
        document.getElementById("div_ice_effect_id1").style.left = -1000+"px";
        document.getElementById("div_ice_effect_id2").style.left = -1000+"px";
        document.getElementById("div_ice_effect_id3").style.left = -1000+"px";
    }else{
          setTimeout("ice_effect_imp()",250);         // control the FPS
    }
}

function thorns_effect(){              /**该技能给敌方释放5个地刺*/
    thorns_effect_imp();
}

function thorns_effect_imp(){
    document.getElementById("img_thorns_effect_id1").src =thorns_img_array[thorns_img_array_index];
    document.getElementById("div_thorns_effect_id1").style.left = 350+"px";
    document.getElementById("div_thorns_effect_id1").style.top = 50+"px";

    document.getElementById("img_thorns_effect_id2").src =thorns_img_array[thorns_img_array_index];
    document.getElementById("div_thorns_effect_id2").style.left = 450+"px";
    document.getElementById("div_thorns_effect_id2").style.top = 50+"px";

    document.getElementById("img_thorns_effect_id3").src =thorns_img_array[thorns_img_array_index];
    document.getElementById("div_thorns_effect_id3").style.left = 550+"px";
    document.getElementById("div_thorns_effect_id3").style.top = 120+"px";

    document.getElementById("img_thorns_effect_id4").src =thorns_img_array[thorns_img_array_index];
    document.getElementById("div_thorns_effect_id4").style.left = 350+"px";
    document.getElementById("div_thorns_effect_id4").style.top = 220+"px";

    document.getElementById("img_thorns_effect_id5").src =thorns_img_array[thorns_img_array_index];
    document.getElementById("div_thorns_effect_id5").style.left = 450+"px";
    document.getElementById("div_thorns_effect_id5").style.top = 220+"px";

    thorns_img_array_index++;
    if (thorns_img_array_index>=thorns_img_array.length){
        if(thorns_img_array_index==thorns_img_array.length){
              setTimeout("thorns_effect_imp()",1000);         // control the FPS
        }else{
            thorns_img_array_index= 0;
            document.getElementById("div_thorns_effect_id1").style.left = -1000+"px";
            document.getElementById("div_thorns_effect_id2").style.left = -1000+"px";
            document.getElementById("div_thorns_effect_id3").style.left = -1000+"px";
            document.getElementById("div_thorns_effect_id4").style.left = -1000+"px";
            document.getElementById("div_thorns_effect_id5").style.left = -1000+"px";
        }
    }else{
          setTimeout("thorns_effect_imp()",1000);         // control the FPS
    }
}

function fire_effect(image_tab_id,div_tab_id){
    fire_effect_imp();
}

var fire_effect_left_x_inframe = 100;
function fire_effect_imp(){
    document.getElementById("img_fire_effect_id1").src =fire_img_array[fire_img_array_index];
    document.getElementById("div_fire_effect_id1").style.left = 0+fire_effect_left_x_inframe+"px";
    document.getElementById("div_fire_effect_id1").style.top = 50+"px";

    document.getElementById("img_fire_effect_id2").src =fire_img_array[fire_img_array_index];
    document.getElementById("div_fire_effect_id2").style.left = 100+fire_effect_left_x_inframe+"px";
    document.getElementById("div_fire_effect_id2").style.top = 50+"px";

    document.getElementById("img_fire_effect_id3").src =fire_img_array[fire_img_array_index];
    document.getElementById("div_fire_effect_id3").style.left = 200+fire_effect_left_x_inframe+"px";
    document.getElementById("div_fire_effect_id3").style.top = 120+"px";

    document.getElementById("img_fire_effect_id4").src =fire_img_array[fire_img_array_index];
    document.getElementById("div_fire_effect_id4").style.left = 0+fire_effect_left_x_inframe+"px";
    document.getElementById("div_fire_effect_id4").style.top = 220+"px";

    document.getElementById("img_fire_effect_id5").src =fire_img_array[fire_img_array_index];
    document.getElementById("div_fire_effect_id5").style.left = 100+fire_effect_left_x_inframe+"px";
    document.getElementById("div_fire_effect_id5").style.top = 220+"px";

    fire_img_array_index++;
    fire_effect_left_x_inframe += 100;
    if (fire_img_array_index>=fire_img_array.length){
        fire_img_array_index = 0;
        fire_effect_left_x_inframe = 100;
        document.getElementById("div_fire_effect_id1").style.left = -1000+"px";
        document.getElementById("div_fire_effect_id2").style.left = -1000+"px";
        document.getElementById("div_fire_effect_id3").style.left = -1000+"px";
        document.getElementById("div_fire_effect_id4").style.left = -1000+"px";
        document.getElementById("div_fire_effect_id5").style.left = -1000+"px";
    }else{
          setTimeout("fire_effect_imp()",500);         // control the FPS
    }
}

function point_Coco(image_tab_id,div_tab_id){
    point_Coco_imp();
}

function point_Coco_imp(){          /**该技能给敌方释放5个水柱*/
    document.getElementById("img_point_coco_id1").src =point_Coco_img_array[point_Coco_img_array_index];
    document.getElementById("div_point_coco_id1").style.left = 350+"px";
    document.getElementById("div_point_coco_id1").style.top = 50+"px";

    document.getElementById("img_point_coco_id2").src =point_Coco_img_array[point_Coco_img_array_index];
    document.getElementById("div_point_coco_id2").style.left = 450+"px";
    document.getElementById("div_point_coco_id2").style.top = 50+"px";

    document.getElementById("img_point_coco_id3").src =point_Coco_img_array[point_Coco_img_array_index];
    document.getElementById("div_point_coco_id3").style.left = 550+"px";
    document.getElementById("div_point_coco_id3").style.top = 120+"px";

    document.getElementById("img_point_coco_id4").src =point_Coco_img_array[point_Coco_img_array_index];
    document.getElementById("div_point_coco_id4").style.left = 350+"px";
    document.getElementById("div_point_coco_id4").style.top = 220+"px";

    document.getElementById("img_point_coco_id5").src =point_Coco_img_array[point_Coco_img_array_index];
    document.getElementById("div_point_coco_id5").style.left = 450+"px";
    document.getElementById("div_point_coco_id5").style.top = 220+"px";

    point_Coco_img_array_index++;
    switch (point_Coco_img_array_index){
        case 0:
            document.delta_enemy_top_y_frame=10;
            break;
        case 1:
            document.delta_enemy_top_y_frame=25;
            break;
        case 2:
            document.delta_enemy_top_y_frame=50;
            break;
        case 3:
            document.delta_enemy_top_y_frame=50;
            break;
        case 4:
            document.delta_enemy_top_y_frame=50;
            break;
        case 5:
            document.delta_enemy_top_y_frame=50;
            break;
        case 6:
            document.delta_enemy_top_y_frame=50;
            break;
        case 7:
            document.delta_enemy_top_y_frame=50;
            break;
        case 8:
            document.delta_enemy_top_y_frame=25;
            break;
        case 9:
            document.delta_enemy_top_y_frame=0;
            break;
    }

    if (point_Coco_img_array_index>=point_Coco_img_array.length){
        if(point_Coco_img_array_index==point_Coco_img_array.length){
              setTimeout("point_Coco_imp()",1000);         // control the FPS
        }else{
            point_Coco_img_array_index = 0;
            document.getElementById("div_point_coco_id1").style.left = -1000+"px";
            document.getElementById("div_point_coco_id2").style.left = -1000+"px";
            document.getElementById("div_point_coco_id3").style.left = -1000+"px";
            document.getElementById("div_point_coco_id4").style.left = -1000+"px";
            document.getElementById("div_point_coco_id5").style.left = -1000+"px";
        }
    }else{
          setTimeout("point_Coco_imp()",500);         // control the FPS
    }
}

function storm(image_tab_id,div_tab_id){
    storm_imp();
}

function storm_imp(){
    document.getElementById("img_storm_id1").src =storm_img_array[storm_img_array_index];
    document.getElementById("div_storm_id1").style.left = 350+"px";
    document.getElementById("div_storm_id1").style.top = 50+"px";

    document.getElementById("img_storm_id2").src =storm_img_array[storm_img_array_index];
    document.getElementById("div_storm_id2").style.left = 450+"px";
    document.getElementById("div_storm_id2").style.top = 50+"px";

    document.getElementById("img_storm_id3").src =storm_img_array[storm_img_array_index];
    document.getElementById("div_storm_id3").style.left = 550+"px";
    document.getElementById("div_storm_id3").style.top = 120+"px";

    document.getElementById("img_storm_id4").src =storm_img_array[storm_img_array_index];
    document.getElementById("div_storm_id4").style.left = 350+"px";
    document.getElementById("div_storm_id4").style.top = 220+"px";

    document.getElementById("img_storm_id5").src =storm_img_array[storm_img_array_index];
    document.getElementById("div_storm_id5").style.left = 450+"px";
    document.getElementById("div_storm_id5").style.top = 220+"px";

    storm_img_array_index++;
    if (storm_img_array_index>=storm_img_array.length){
        storm_img_array_index = 0;
        document.getElementById("div_storm_id1").style.left = -1000+"px";
        document.getElementById("div_storm_id2").style.left = -1000+"px";
        document.getElementById("div_storm_id3").style.left = -1000+"px";
        document.getElementById("div_storm_id4").style.left = -1000+"px";
        document.getElementById("div_storm_id5").style.left = -1000+"px";
    }else{
          setTimeout("storm_imp()",250);         // control the FPS
    }
}

