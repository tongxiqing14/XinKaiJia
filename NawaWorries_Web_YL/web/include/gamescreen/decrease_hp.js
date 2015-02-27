var dead_right_num = 0;

var hp_select_index_$;
function decrease_hp(hp_select_index){
    hp_select_index_$ = hp_select_index;
    document.hpNumber[hp_select_index]-=(document.sum_hero_fight_num/(document.sum_right_enemy_num-dead_right_num));

    if(document.hpNumber[hp_select_index] < 0){
        document.enemyIsDeadArray[0] = true;
        document.hero_fight_number[0]=0;
        dead_right_num++;
        if(dead_right_num == document.sum_right_enemy_num){
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
    }
}

var hp_select_index_$$;
function decrease_pet01_hp(hp_select_index){
    hp_select_index_$$ = hp_select_index;
    document.hpNumber[hp_select_index]-=(document.sum_hero_fight_num/(document.sum_right_enemy_num-dead_right_num));

    if(document.hpNumber[hp_select_index] < 0){
        document.enemyIsDeadArray[1] = true;
        document.hero_fight_number[1]=0;
        dead_right_num++;
        if(dead_right_num == document.sum_right_enemy_num){
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
    }

}

var hp_select_index_$$$;
function decrease_follow01_hp(hp_select_index){
    hp_select_index_$$$ =  hp_select_index;
    document.hpNumber[hp_select_index]-=(document.sum_hero_fight_num/(document.sum_right_enemy_num-dead_right_num));

    if(document.hpNumber[hp_select_index] < 0){
        document.enemyIsDeadArray[2] = true;
        document.hero_fight_number[2]=0;
        dead_right_num++;
        if(dead_right_num == document.sum_right_enemy_num){
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
    }

}

var hp_select_index_$$$$;
function decrease_follow02_hp(hp_select_index){
    hp_select_index_$$$$ =  hp_select_index;
    document.hpNumber[hp_select_index]-=(document.sum_hero_fight_num/(document.sum_right_enemy_num-dead_right_num));

    if(document.hpNumber[hp_select_index] < 0){
        document.enemyIsDeadArray[3] = true;
        document.hero_fight_number[3]=0;
        dead_right_num++;
        if(dead_right_num == document.sum_right_enemy_num){
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
    }
}

var hp_select_index_$$$$$;
function decrease_hero_hp(hp_select_index){
    hp_select_index_$$$$$ = hp_select_index;
    document.hpNumber[hp_select_index]-=(document.sum_hero_fight_num/(document.sum_right_enemy_num-dead_right_num));

    if(document.hpNumber[hp_select_index] < 0){
        document.enemyIsDeadArray[4] = true;
        document.hero_fight_number[4]=0;
        dead_right_num++;
        if(dead_right_num == document.sum_right_enemy_num){
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
    }

}