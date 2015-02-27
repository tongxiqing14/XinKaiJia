function select_generalbar_element_initial(){
    document.getElementById("div_generalbar_01_id").style.top = 460;
    document.getElementById("div_generalbar_03_id").style.top = 460;
    document.getElementById("div_generalbar_05_id").style.top = 460;
    document.getElementById("div_generalbar_07_id").style.top = 460;
    document.getElementById("img_generalbar_01_id").src = "generalbar/generalbar_grey_01.png";
    document.getElementById("img_generalbar_03_id").src = "generalbar/generalbar_grey_03.png";
    document.getElementById("img_generalbar_05_id").src = "generalbar/generalbar_grey_05.png";
    document.getElementById("img_generalbar_07_id").src = "generalbar/generalbar_grey_07.png";
}

function select_generalbar_element(keyCode){

    if(keyCode == ZTE.LEFT
        || keyCode == HW.LEFT
        || keyCode == UT.LEFT ) {
        generalbar_selected_index--;
    }else if(keyCode == ZTE.RIGHT
        || keyCode == HW.RIGHT
        || keyCode == UT.RIGHT){
        generalbar_selected_index++;
    }

    generalbar_selected_index = (generalbar_selected_index+4)%4;

    switch(generalbar_selected_index){
        case 0:
            document.getElementById("div_generalbar_01_id").style.top = 450;
            document.getElementById("div_generalbar_03_id").style.top = 460;
            document.getElementById("div_generalbar_07_id").style.top = 460;
            document.getElementById("img_generalbar_01_id").src = "generalbar/generalbar_01a.png";
            document.getElementById("img_generalbar_03_id").src = "generalbar/generalbar_grey_03.png";
            document.getElementById("img_generalbar_07_id").src = "generalbar/generalbar_grey_07.png";
            document.div_mouse_left_x = 100;
            document.div_mouse_top_y = 460;
            break;
        case 1:
            document.getElementById("div_generalbar_01_id").style.top = 460;
            document.getElementById("div_generalbar_03_id").style.top = 450;
            document.getElementById("div_generalbar_05_id").style.top = 460;
            document.getElementById("img_generalbar_01_id").src = "generalbar/generalbar_grey_01.png";
            document.getElementById("img_generalbar_03_id").src = "generalbar/generalbar_03a.png";
            document.getElementById("img_generalbar_05_id").src = "generalbar/generalbar_grey_05.png";
            document.div_mouse_left_x = 168;
            document.div_mouse_top_y = 460;
            break;
        case 2:
            document.getElementById("div_generalbar_03_id").style.top = 460;
            document.getElementById("div_generalbar_05_id").style.top = 450;
            document.getElementById("div_generalbar_07_id").style.top = 460;
            document.getElementById("img_generalbar_03_id").src = "generalbar/generalbar_grey_03.png";
            document.getElementById("img_generalbar_05_id").src = "generalbar/generalbar_05a.png";
            document.getElementById("img_generalbar_07_id").src = "generalbar/generalbar_grey_07.png";
            document.div_mouse_left_x = 468;
            document.div_mouse_top_y = 460;
            break;
        case 3:
            document.getElementById("div_generalbar_01_id").style.top = 460;
            document.getElementById("div_generalbar_05_id").style.top = 460;
            document.getElementById("div_generalbar_07_id").style.top = 450;
            document.getElementById("img_generalbar_01_id").src = "generalbar/generalbar_grey_01.png";
            document.getElementById("img_generalbar_05_id").src = "generalbar/generalbar_grey_05.png";
            document.getElementById("img_generalbar_07_id").src = "generalbar/generalbar_07a.png";
            document.div_mouse_left_x = 555;
            document.div_mouse_top_y = 460;
            break;
    }
}

function select_stage(keyCode){
    if(keyCode==UT.ZERO||keyCode==ZTE.ZERO||keyCode==HW.ZERO
        ||keyCode==UT.BACK||keyCode==ZTE.BACK||keyCode==HW.BACK){
        window.location.href = "main.jsp";
    }

    if(keyCode == ZTE.LEFT
        || keyCode == HW.LEFT
        || keyCode == UT.LEFT) {
        selectIndex--;
        if(selectIndex >= selectIndex_max) selectIndex = selectIndex_max;
        if(selectIndex < 0) selectIndex = 0;
        if(selectIndex == 5 || selectIndex == 11 || selectIndex == 18 || selectIndex == 26 || selectIndex == 33){
//            xmlhttp = MakeHttpRequest();
//            xmlhttp.open("Post", stage2stage_url+"?stage_btn_index="+selectIndex, true);
//            xmlhttp.send();

//            xmlhttp.onreadystatechange = function () {
//                if (xmlhttp.readyState == 4) {
//                    var js = eval(xmlhttp.responseText);
//                    if(js[0].id == 0){
                        window.location.href = "stageMapScreen.jsp?stage_btn_index="+selectIndex;
//                    }else{

//                    }
//                }
//            }
        }
    }else if(keyCode == ZTE.RIGHT
        || keyCode == HW.RIGHT
        || keyCode == UT.RIGHT){
        selectIndex++;
        if(selectIndex >= selectIndex_max) selectIndex = selectIndex_max;
        if(selectIndex < 0) selectIndex = 0;
        if(selectIndex == 6 || selectIndex == 12 || selectIndex == 19 || selectIndex == 27 || selectIndex == 34){
//            xmlhttp = MakeHttpRequest();
//            xmlhttp.open("Post", stage2stage_url+"?stage_btn_index="+selectIndex, true);
//            xmlhttp.send();

//            xmlhttp.onreadystatechange = function () {
//                if (xmlhttp.readyState == 4) {
//                    var js = eval(xmlhttp.responseText);
//                    if(js[0].id == 0){
                        window.location.href = "stageMapScreen.jsp?stage_btn_index="+selectIndex;
//                    }else{

//                    }
//                }
//            }
        }
    }

//    if(selectIndex >= selectIndex_max) selectIndex = selectIndex_max;
//    if(selectIndex < 0) selectIndex = 0;

    if(selectIndex == 0){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 100;
        document.getElementById("div_mouse_id").style.top = 295;
        document.div_mouse_left_x = 110;
        document.div_mouse_top_y = 285;
    }else if(selectIndex == 1){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 100;
        document.getElementById("div_mouse_id").style.top = 157;
        document.div_mouse_left_x = 110;
        document.div_mouse_top_y = 147;
    }else if(selectIndex == 2){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 202;
        document.getElementById("div_mouse_id").style.top = 230;
        document.div_mouse_left_x = 212;
        document.div_mouse_top_y = 220;
    }else if(selectIndex == 3){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 308;
        document.getElementById("div_mouse_id").style.top = 175;
        document.div_mouse_left_x = 318;
        document.div_mouse_top_y = 165;
    }else if(selectIndex == 4){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 402;
        document.getElementById("div_mouse_id").style.top = 285;
        document.div_mouse_left_x = 412;
        document.div_mouse_top_y = 275;
    }else if(selectIndex == 5){
        document.getElementById("id11").src = "stage/map1/map-1_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/1(2).png";
        document.getElementById("div_mouse_id").style.left = 452;
        document.getElementById("div_mouse_id").style.top = 182;
        document.div_mouse_left_x = 462;
        document.div_mouse_top_y = 172;
    }

    if(selectIndex == 6){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 144;
        document.getElementById("div_mouse_id").style.top = 161;
        document.div_mouse_left_x = 154;
        document.div_mouse_top_y = 151;
    }else if(selectIndex == 7){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 145;
        document.getElementById("div_mouse_id").style.top = 285;
        document.div_mouse_left_x = 155;
        document.div_mouse_top_y = 275;
    }else if(selectIndex == 8){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 274;
        document.getElementById("div_mouse_id").style.top = 200;
        document.div_mouse_left_x = 284;
        document.div_mouse_top_y = 190;
    }else if(selectIndex == 9){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 397;
        document.getElementById("div_mouse_id").style.top = 133;
        document.div_mouse_left_x = 407;
        document.div_mouse_top_y = 123;
    }else if(selectIndex == 10){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 365;
        document.getElementById("div_mouse_id").style.top = 280;
        document.div_mouse_left_x = 375;
        document.div_mouse_top_y = 290;
    }else if(selectIndex == 11){
        document.getElementById("id11").src = "stage/map2/map-2_03.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/2(2).png";
        document.getElementById("div_mouse_id").style.left = 474;
        document.getElementById("div_mouse_id").style.top = 230;
        document.div_mouse_left_x = 484;
        document.div_mouse_top_y = 220;
    }

    if(selectIndex == 12){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 100;
        document.getElementById("div_mouse_id").style.top = 263;
        document.div_mouse_left_x = 110;
        document.div_mouse_top_y = 253;
    }else if(selectIndex == 13){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 210;
        document.getElementById("div_mouse_id").style.top = 285;
        document.div_mouse_left_x = 220;
        document.div_mouse_top_y = 275;
    }else if(selectIndex == 14){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 127;
        document.getElementById("div_mouse_id").style.top = 123;
        document.div_mouse_left_x = 137;
        document.div_mouse_top_y = 113;
    }else if(selectIndex == 15){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 285;
        document.getElementById("div_mouse_id").style.top = 135;
        document.div_mouse_left_x = 295;
        document.div_mouse_top_y = 125;
    }else if(selectIndex == 16){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 350;
        document.getElementById("div_mouse_id").style.top = 235;
        document.div_mouse_left_x = 360;
        document.div_mouse_top_y = 225;
    }else if(selectIndex == 17){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 435;
        document.getElementById("div_mouse_id").style.top = 295;
        document.div_mouse_left_x = 445;
        document.div_mouse_top_y = 285;
    }else if(selectIndex == 18){
        document.getElementById("id11").src = "stage/map3/map-3.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/3(1).png";
        document.getElementById("div_mouse_id").style.left = 472;
        document.getElementById("div_mouse_id").style.top = 127;
        document.div_mouse_left_x = 482;
        document.div_mouse_top_y = 117;
    }

    if(selectIndex == 19){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 82;
        document.getElementById("div_mouse_id").style.top = 128;
        document.div_mouse_left_x = 92;
        document.div_mouse_top_y = 118;
    }else if(selectIndex == 20){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 87;
        document.getElementById("div_mouse_id").style.top = 242;
        document.div_mouse_left_x = 97;
        document.div_mouse_top_y = 232;
    }else if(selectIndex == 21){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 179;
        document.getElementById("div_mouse_id").style.top = 287;
        document.div_mouse_left_x = 189;
        document.div_mouse_top_y = 277;
    }else if(selectIndex == 22){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 290;
        document.getElementById("div_mouse_id").style.top = 242;
        document.div_mouse_left_x = 300;
        document.div_mouse_top_y = 232;
    }else if(selectIndex == 23){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 258;
        document.getElementById("div_mouse_id").style.top = 103;
        document.div_mouse_left_x = 268;
        document.div_mouse_top_y = 93;
    }else if(selectIndex == 24){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 405;
        document.getElementById("div_mouse_id").style.top = 125;
        document.div_mouse_left_x = 415;
        document.div_mouse_top_y = 115;
    }else if(selectIndex == 25){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 492;
        document.getElementById("div_mouse_id").style.top = 205;
        document.div_mouse_left_x = 502;
        document.div_mouse_top_y = 195;
    }else if(selectIndex == 26){
        document.getElementById("id11").src = "stage/map4/map4.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/4(1).png";
        document.getElementById("div_mouse_id").style.left = 414;
        document.getElementById("div_mouse_id").style.top = 302;
        document.div_mouse_left_x = 424;
        document.div_mouse_top_y = 292;
    }

    if(selectIndex == 27){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 87;
//        document.getElementById("div2").style.top = 222;
        document.div_mouse_left_x = 97;
        document.div_mouse_top_y = 212;
    }else if(selectIndex == 28){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 172;
//        document.getElementById("div2").style.top = 107;
        document.div_mouse_left_x = 182;
        document.div_mouse_top_y = 97;
    }else if(selectIndex == 29){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 330;
//        document.getElementById("div2").style.top = 126;
        document.div_mouse_left_x = 340;
        document.div_mouse_top_y = 116;
    }else if(selectIndex == 30){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 427;
//        document.getElementById("div2").style.top = 171;
        document.div_mouse_left_x = 437;
        document.div_mouse_top_y = 161;
    }else if(selectIndex == 31){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 230;
//        document.getElementById("div2").style.top = 242;
        document.div_mouse_left_x = 240;
        document.div_mouse_top_y = 232;
    }else if(selectIndex == 32){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 325;
//        document.getElementById("div2").style.top = 275;
        document.div_mouse_left_x = 335;
        document.div_mouse_top_y = 265;
    }else if(selectIndex == 33){
        document.getElementById("id11").src = "stage/map5/map-5.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/5(1).png";
//        document.getElementById("div2").style.left = 470;
//        document.getElementById("div2").style.top = 265;
        document.div_mouse_left_x = 480;
        document.div_mouse_top_y = 255;
    }

    if(selectIndex == 34){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 165;
//        document.getElementById("div2").style.top = 115;
        document.div_mouse_left_x = 175;
        document.div_mouse_top_y = 105;
    }else if(selectIndex == 35){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 80;
//        document.getElementById("div2").style.top = 210;
        document.div_mouse_left_x = 90;
        document.div_mouse_top_y = 200;
    }else if(selectIndex == 36){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 168;
//        document.getElementById("div2").style.top = 305;
        document.div_mouse_left_x = 158;
        document.div_mouse_top_y = 295;
    }else if(selectIndex == 37){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 272;
//        document.getElementById("div2").style.top = 195;
        document.div_mouse_left_x = 282;
        document.div_mouse_top_y = 185;
    }else if(selectIndex == 38){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 402;
//        document.getElementById("div2").style.top = 141;
        document.div_mouse_left_x = 412;
        document.div_mouse_top_y = 131;
    }else if(selectIndex == 39){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 430;
//        document.getElementById("div2").style.top = 280;
        document.div_mouse_left_x = 440;
        document.div_mouse_top_y = 270;
    }else if(selectIndex == 40){
        document.getElementById("id11").src = "stage/map6/map-6.jpg";
        document.getElementById("div2_img_stage_name_id").src = "stage/6(1).png";
//        document.getElementById("div2").style.left = 495;
//        document.getElementById("div2").style.top = 195;
        document.div_mouse_left_x = 505;
        document.div_mouse_top_y = 185;
    }

}