var blue_wind_img_array = new Array("effect2/blue.wind/blue.wind1.png","effect2/blue.wind/blue.wind2.png","effect2/blue.wind/blue.wind3.png","effect2/blue.wind/blue.wind4.png");
var blue_wind_img_array_index = 0;
var gripper_img_array = new Array("effect2/gripper/gripper1.png","effect2/gripper/gripper2.png","effect2/gripper/gripper3.png");
var gripper_img_array_index = 0;
var dazhao2_img_array = new Array("effect2/dazhao2/dazhao1.png","effect2/dazhao2/dazhao2.png","effect2/dazhao2/dazhao3.png","effect2/dazhao2/dazhao4.png","effect2/dazhao2/dazhao5.png","effect2/dazhao2/dazhao6.png","effect2/dazhao2/dazhao7.png");
var  dazhao2_img_array_index = 0;

//function gripper_effect(image_tab_id,div_tab_id){
//    gripper_effect_imp();
//}
//
//function gripper_effect_imp(){
//    document.getElementById("img_gripper_effect_id1").src = gripper_img_array[gripper_img_array_index];
//    document.getElementById("div_gripper_effect_id1").style.left = 350+"px";
//    document.getElementById("div_gripper_effect_id1").style.top = 50+"px";
//
//    document.getElementById("img_gripper_effect_id2").src = gripper_img_array[gripper_img_array_index];
//    document.getElementById("div_gripper_effect_id2").style.left = 450+"px";
//    document.getElementById("div_gripper_effect_id2").style.top = 50+"px";
//
//    document.getElementById("img_gripper_effect_id3").src = gripper_img_array[gripper_img_array_index];
//    document.getElementById("div_gripper_effect_id3").style.left = 550+"px";
//    document.getElementById("div_gripper_effect_id3").style.top = 120+"px";
//
//    document.getElementById("img_gripper_effect_id4").src = gripper_img_array[gripper_img_array_index];
//    document.getElementById("div_gripper_effect_id4").style.left = 350+"px";
//    document.getElementById("div_gripper_effect_id4").style.top = 220+"px";
//
//    document.getElementById("img_gripper_effect_id5").src = gripper_img_array[gripper_img_array_index];
//    document.getElementById("div_gripper_effect_id5").style.left = 450+"px";
//    document.getElementById("div_gripper_effect_id5").style.top = 220+"px";
//
//    gripper_img_array_index++;
//    if (gripper_img_array_index>=gripper_img_array.length){
//        gripper_img_array_index = 0;
//        document.getElementById("div_gripper_effect_id1").style.left = -1000+"px";
//        document.getElementById("div_gripper_effect_id2").style.left = -1000+"px";
//        document.getElementById("div_gripper_effect_id3").style.left = -1000+"px";
//        document.getElementById("div_gripper_effect_id4").style.left = -1000+"px";
//        document.getElementById("div_gripper_effect_id5").style.left = -1000+"px";
//    }else{
//        setTimeout("gripper_effect_imp()",250);         // control the FPS
//    }
//}

function dazhao2_effect(image_tab_id,div_tab_id){
    dazhao2_effect_imp();
}

function dazhao2_effect_imp(){
    document.getElementById("img_dazhao2_id1").src = dazhao2_img_array[dazhao2_img_array_index];
    document.getElementById("div_dazhao2_id1").style.left = 350+"px";
    document.getElementById("div_dazhao2_id1").style.top = 50+"px";

    document.getElementById("img_dazhao2_id2").src = dazhao2_img_array[dazhao2_img_array_index];
    document.getElementById("div_dazhao2_id2").style.left = 450+"px";
    document.getElementById("div_dazhao2_id2").style.top = 50+"px";

    document.getElementById("img_dazhao2_id3").src = dazhao2_img_array[dazhao2_img_array_index];
    document.getElementById("div_dazhao2_id3").style.left = 550+"px";
    document.getElementById("div_dazhao2_id3").style.top = 120+"px";

    document.getElementById("img_dazhao2_id4").src = dazhao2_img_array[dazhao2_img_array_index];
    document.getElementById("div_dazhao2_id4").style.left = 350+"px";
    document.getElementById("div_dazhao2_id4").style.top = 220+"px";

    document.getElementById("img_dazhao2_id5").src = dazhao2_img_array[dazhao2_img_array_index];
    document.getElementById("div_dazhao2_id5").style.left = 450+"px";
    document.getElementById("div_dazhao2_id5").style.top = 220+"px";

    dazhao2_img_array_index++;
    if (dazhao2_img_array_index>=dazhao2_img_array.length){
        dazhao2_img_array_index = 0;
        document.getElementById("div_dazhao2_id1").style.left = -1000+"px";
        document.getElementById("div_dazhao2_id2").style.left = -1000+"px";
        document.getElementById("div_dazhao2_id3").style.left = -1000+"px";
        document.getElementById("div_dazhao2_id4").style.left = -1000+"px";
        document.getElementById("div_dazhao2_id5").style.left = -1000+"px";
    }else{
        setTimeout("dazhao2_effect_imp()",250);         // control the FPS
    }
}