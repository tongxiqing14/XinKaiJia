var dead_left_num = 0;

var hero_hp_select_index$;
function decrease_pet_id01_hp(hero_hp_select_index){
    hero_hp_select_index$ = hero_hp_select_index;
    document.hero_hpNumber[hero_hp_select_index] = document.hero_hpNumber[hero_hp_select_index]-document.sum_enemy_fight_num/(document.sum_left_hero_num-dead_left_num);
    if(document.hero_hpNumber[hero_hp_select_index] < 0){
        document.isDeadArray[0] = true;
        document.enemy_fight_number[0] = 0;
        document.hero_hpNumber[hero_hp_select_index] = 0;
        dead_left_num++;
        if(dead_left_num == document.sum_left_hero_num){
            document.gameIsOver = true;
            document.sum_hero_fight_num = 0;
            document.div_mouse_left_x = 290;
            document.div_mouse_top_y = 295;
            document.getElementById("div_success_or_fail_win_id").style.left = '120px';
            document.getElementById("img_success_or_fail_title_id").src = "game/failure.png";
            document.getElementById("img_success_or_fail_win_id").src = "game/successfailure.png";
        }
    }

}

var hero_hp_select_index$$;
function decrease_pet_id02_hp(hero_hp_select_index){
    hero_hp_select_index$$ = hero_hp_select_index;
    document.hero_hpNumber[hero_hp_select_index] = document.hero_hpNumber[hero_hp_select_index]-document.sum_enemy_fight_num/(document.sum_left_hero_num-dead_left_num);
    if(document.hero_hpNumber[hero_hp_select_index] < 0){

        document.isDeadArray[1] = true;
        document.enemy_fight_number[1] = 0;
        document.hero_hpNumber[hero_hp_select_index] = 0;
        dead_left_num++;
        if(dead_left_num == document.sum_left_hero_num){
            document.gameIsOver = true;
            document.sum_hero_fight_num = 0;
            document.div_mouse_left_x = 290;
            document.div_mouse_top_y = 295;
            document.getElementById("div_success_or_fail_win_id").style.left = '120px';
            document.getElementById("img_success_or_fail_title_id").src = "game/failure.png";
            document.getElementById("img_success_or_fail_win_id").src = "game/successfailure.png";
        }
    }
}

var hero_hp_select_index$$$;
function decrease_follow01_left_hp(hero_hp_select_index){
    hero_hp_select_index$$$ = hero_hp_select_index;
    document.hero_hpNumber[hero_hp_select_index] = document.hero_hpNumber[hero_hp_select_index]-document.sum_enemy_fight_num/(document.sum_left_hero_num-dead_left_num);
    if(document.hero_hpNumber[hero_hp_select_index] < 0){

        document.isDeadArray[2] = true;
        document.enemy_fight_number[2] = 0;
        document.hero_hpNumber[hero_hp_select_index] = 0;
        dead_left_num++;
        if(dead_left_num == document.sum_left_hero_num){
            document.gameIsOver = true;
            document.sum_hero_fight_num = 0;
            document.div_mouse_left_x = 290;
            document.div_mouse_top_y = 295;
            document.getElementById("div_success_or_fail_win_id").style.left = '120px';
            document.getElementById("img_success_or_fail_title_id").src = "game/failure.png";
            document.getElementById("img_success_or_fail_win_id").src = "game/successfailure.png";
        }
    }

}

var hero_hp_select_index$$$$;
function decrease_follow02_left_hp(hero_hp_select_index){
    hero_hp_select_index$$$$ = hero_hp_select_index;
    document.hero_hpNumber[hero_hp_select_index] = document.hero_hpNumber[hero_hp_select_index]-document.sum_enemy_fight_num/(document.sum_left_hero_num-dead_left_num);
    if(document.hero_hpNumber[hero_hp_select_index] < 0){

        document.isDeadArray[3] = true;
        document.enemy_fight_number[3] = 0;
        document.hero_hpNumber[hero_hp_select_index] = 0;
        dead_left_num++;
        if(dead_left_num == document.sum_left_hero_num){
            document.gameIsOver = true;
            document.sum_hero_fight_num = 0;
            document.div_mouse_left_x = 290;
            document.div_mouse_top_y = 295;
            document.getElementById("div_success_or_fail_win_id").style.left = '120px';
            document.getElementById("img_success_or_fail_title_id").src = "game/failure.png";
            document.getElementById("img_success_or_fail_win_id").src = "game/successfailure.png";
        }
    }

}

var hero_hp_select_index$$$$$;
function decrease_hero_left_hp(hero_hp_select_index){
    hero_hp_select_index$$$$$ = hero_hp_select_index;
    document.hero_hpNumber[hero_hp_select_index] = document.hero_hpNumber[hero_hp_select_index]-document.sum_enemy_fight_num/(document.sum_left_hero_num-dead_left_num);
    if(document.hero_hpNumber[hero_hp_select_index] < 0){

        document.isDeadArray[4] = true;
        document.enemy_fight_number[4] = 0;
        document.hero_hpNumber[hero_hp_select_index] = 0;
        dead_left_num++;
        if(dead_left_num == document.sum_left_hero_num){
            document.gameIsOver = true;
            document.sum_hero_fight_num = 0;
            document.div_mouse_left_x = 290;
            document.div_mouse_top_y = 295;
            document.getElementById("div_success_or_fail_win_id").style.left = '120px';
            document.getElementById("img_success_or_fail_title_id").src = "game/failure.png";
            document.getElementById("img_success_or_fail_win_id").src = "game/successfailure.png";
        }
    }

}
