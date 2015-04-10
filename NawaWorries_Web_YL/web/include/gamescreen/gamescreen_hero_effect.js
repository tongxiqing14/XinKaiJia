var warship_img_array = new Array("effect2/watership/watership1.png","effect2/watership/watership2.png");
var warship_img_array_index = 0;
var lighting_img_array = new Array("effect2/left/evocation.big/lightning/lightning1.png","effect2/left/evocation.big/lightning/lightning2.png","effect2/left/evocation.big/lightning/lightning3.png","effect2/left/evocation.big/lightning/lightning4.png","effect2/left/evocation.big/lightning/lightning5.png","effect2/left/evocation.big/lightning/lightning6.png")
var lighting_img_array_index = 0;
var atomic_elect_img_array = new Array("effect2/atomic.elect/atomic.elect0.png","effect2/atomic.elect/atomic.elect1.png","effect2/atomic.elect/atomic.elect2.png","effect2/atomic.elect/atomic.elect3.png","effect2/atomic.elect/atomic.elect4.png","effect2/atomic.elect/atomic.elect5.png","effect2/atomic.elect/atomic.elect6.png","effect2/atomic.elect/atomic.elect7.png")
var atomic_elect_img_array_index = 0;
var blue_wind_img_array = new Array("effect2/blue.wind/blue.wind1.png","effect2/blue.wind/blue.wind2.png","effect2/blue.wind/blue.wind3.png","effect2/blue.wind/blue.wind4.png");
var blue_wind_img_array_index = 0;
var gripper_img_array = new Array("effect2/gripper/gripper1.png","effect2/gripper/gripper2.png","effect2/gripper/gripper3.png","effect2/gripper/gripper1.png","effect2/gripper/gripper2.png","effect2/gripper/gripper3.png");
var gripper_img_array_index = 0;

var watership_effect_image_tab_id;
var watership_effect_div_tab_id;
function watership_effect(image_tab_id,div_tab_id){
    watership_effect_image_tab_id=image_tab_id;
    watership_effect_div_tab_id=div_tab_id;
    document.getElementById(image_tab_id).src = warship_img_array[warship_img_array_index];
    document.getElementById(div_tab_id).style.left = document.warship_img_array_x+"px";
    document.getElementById(div_tab_id).style.top = document.warship_img_array_y+"px";

    warship_img_array_index++;
    document.warship_img_array_x += 10;
    if (warship_img_array_index>=warship_img_array.length) warship_img_array_index = 0;

    if(document.warship_img_array_x <= 400){
          setTimeout("watership_effect(watership_effect_image_tab_id,watership_effect_div_tab_id)",40);         // control the FPS
    }else{
        document.warship_img_array_x = 10;
        document.getElementById(div_tab_id).style.left = -600+"px";
    }
}

var lighting_effect_image_tab_id;
var lighting_effect_div_tab_id;
function lighting_effect(image_tab_id,div_tab_id){
    lighting_effect_image_tab_id=image_tab_id;
    lighting_effect_div_tab_id=div_tab_id;
    document.getElementById(image_tab_id).src = lighting_img_array[lighting_img_array_index];
    document.getElementById(div_tab_id).style.left = 240+"px";
    document.getElementById(div_tab_id).style.top = 200+"px";

    lighting_img_array_index++;
    if (lighting_img_array_index>=lighting_img_array.length){
        lighting_img_array_index = 0;
        document.getElementById(div_tab_id).style.left = -1240+"px";
    }else{
        setTimeout("lighting_effect(lighting_effect_image_tab_id,lighting_effect_image_tab_id)",250);         // control the FPS
    }

}

var atomic_elect_effect_image_tab_id;
var atomic_elect_effect_div_tab_id;
function atomic_elect_effect(image_tab_id,div_tab_id){
    atomic_elect_effect_image_tab_id=image_tab_id;
    atomic_elect_effect_div_tab_id=div_tab_id;
    document.getElementById(image_tab_id).src = atomic_elect_img_array[atomic_elect_img_array_index];
    document.getElementById(div_tab_id).style.left = 240+"px";
    document.getElementById(div_tab_id).style.top = 200+"px";

    atomic_elect_img_array_index++;
    if (atomic_elect_img_array_index>=atomic_elect_img_array.length){
        atomic_elect_img_array_index = 0;
        document.getElementById(div_tab_id).style.left = -1000+"px";
    }else{
          setTimeout("atomic_elect_effect(atomic_elect_effect_image_tab_id,atomic_elect_effect_div_tab_id)",250);         // control the FPS
    }
}

var blue_wind_effect_image_tab_id;
var blue_wind_effect_div_tab_id;
function blue_wind_effect(image_tab_id,div_tab_id){
    blue_wind_effect_image_tab_id=image_tab_id;
    blue_wind_effect_div_tab_id=div_tab_id;
    document.getElementById(image_tab_id).src = blue_wind_img_array[blue_wind_img_array_index];
    document.getElementById(div_tab_id).style.left = 240+"px";
    document.getElementById(div_tab_id).style.top = 100+"px";

    blue_wind_img_array_index++;
    if (blue_wind_img_array_index>=blue_wind_img_array.length){
        blue_wind_img_array_index = 0;
        document.getElementById(div_tab_id).style.left = -1000+"px";
    }else{
          setTimeout("blue_wind_effect(blue_wind_effect_image_tab_id,blue_wind_effect_div_tab_id)",250);         // control the FPS
    }
}

function gripper_effect(image_tab_id,div_tab_id){
    gripper_effect_imp();
}

function gripper_effect_imp(){
    document.getElementById("img_gripper_effect_id1").src = gripper_img_array[gripper_img_array_index];
    document.getElementById("div_gripper_effect_id1").style.left = 350+"px";
    document.getElementById("div_gripper_effect_id1").style.top = 50+"px";

    document.getElementById("img_gripper_effect_id2").src = gripper_img_array[gripper_img_array_index];
    document.getElementById("div_gripper_effect_id2").style.left = 450+"px";
    document.getElementById("div_gripper_effect_id2").style.top = 50+"px";

    document.getElementById("img_gripper_effect_id3").src = gripper_img_array[gripper_img_array_index];
    document.getElementById("div_gripper_effect_id3").style.left = 550+"px";
    document.getElementById("div_gripper_effect_id3").style.top = 120+"px";

    document.getElementById("img_gripper_effect_id4").src = gripper_img_array[gripper_img_array_index];
    document.getElementById("div_gripper_effect_id4").style.left = 350+"px";
    document.getElementById("div_gripper_effect_id4").style.top = 220+"px";

    document.getElementById("img_gripper_effect_id5").src = gripper_img_array[gripper_img_array_index];
    document.getElementById("div_gripper_effect_id5").style.left = 450+"px";
    document.getElementById("div_gripper_effect_id5").style.top = 220+"px";

    gripper_img_array_index++;
    if (gripper_img_array_index>=gripper_img_array.length){
        gripper_img_array_index = 0;
        document.getElementById("div_gripper_effect_id1").style.left = -1000+"px";
        document.getElementById("div_gripper_effect_id2").style.left = -1000+"px";
        document.getElementById("div_gripper_effect_id3").style.left = -1000+"px";
        document.getElementById("div_gripper_effect_id4").style.left = -1000+"px";
        document.getElementById("div_gripper_effect_id5").style.left = -1000+"px";
    }else{
          setTimeout("gripper_effect_imp()",250);         // control the FPS
    }
}