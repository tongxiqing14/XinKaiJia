
 var select_index_array = new Array(0,0,0,0,0);

function select_armor(keyCode){
    if(keyCode == ZTE.LEFT
        || keyCode == HW.LEFT
        || keyCode == UT.LEFT) {
        if(select_index_array[hero_index]==0){
            hero_index --;
            hero_index = (hero_index+5)%5;
            xmlhttp = MakeHttpRequest();
            xmlhttp.open("Post", armor2armor_url+"?hero_index="+hero_index, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].id == 0){
                        window.location.href = "armorbasescreen.jsp";
                    }else{

                    }
                }
            }
        }else{
            select_index_array[hero_index]--;
        }
//        selectIndex--;
    }else if(keyCode == ZTE.RIGHT
        || keyCode == HW.RIGHT
        || keyCode == UT.RIGHT){
        if(select_index_array[hero_index]==2){
            hero_index ++;
            hero_index = (hero_index+5)%5;
            xmlhttp = MakeHttpRequest();
            xmlhttp.open("Post", armor2armor_url+"?hero_index="+hero_index, true);
            xmlhttp.send();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    var js = eval(xmlhttp.responseText);
                    if(js[0].id == 0){
                        window.location.href = "armorbasescreen.jsp";
                    }else{

                    }
                }
            }
        }else{
            select_index_array[hero_index]++;
        }
//        selectIndex++;
    }

    select_index_array[hero_index] = (select_index_array[hero_index]+3)%3;

    switch(hero_index){
        case 0:
                if(select_index_array[0]==0){
                    document.getElementById("img_item_select_per_hero_id").src = "armorbase/shengji.png";
                    document.getElementById("div_item_select_per_hero_id").style.left = '200px';
                    document.getElementById("div_item_select_per_hero_id").style.top = '350px';
                }else if(select_index_array[0]==1){
                    document.getElementById("img_item_select_per_hero_id").src = "armorbase/base/backpack_03.jpg";
                    document.getElementById("div_item_select_per_hero_id").style.left = '300px';
                    document.getElementById("div_item_select_per_hero_id").style.top = '150px';
                }else if(select_index_array[0]==2){
                    document.getElementById("img_item_select_per_hero_id").src = "armorbase/base/backpack_04.jpg";
                    document.getElementById("div_item_select_per_hero_id").style.left = '350px';
                    document.getElementById("div_item_select_per_hero_id").style.top = '150px';
                }
            break;
        case 1:
                if(select_index_array[1]==0){
//                    groupDraw(70,-70,120,230,330,-330,-330);
                }else if(select_index_array[1]==1){
//                    groupDraw(-330,70,-330,-330,-330,120,135);
                }else if(select_index_array[1]==2){

                }
            break;
        case 1:
            if(select_index_array[2]==0){
//                groupDraw(70,-70,120,230,330,-330,-330);
            }else if(select_index_array[2]==1){
//                groupDraw(-330,70,-330,-330,-330,120,135);
            }else if(select_index_array[2]==2){

            }
            break;
        case 1:
            if(select_index_array[3]==0){
//                groupDraw(70,-70,120,230,330,-330,-330);
            }else if(select_index_array[3]==1){
//                groupDraw(-330,70,-330,-330,-330,120,135);
            }else if(select_index_array[3]==2){

            }
            break;
        case 1:
            if(select_index_array[4]==0){
//                groupDraw(70,-70,120,230,330,-330,-330);
            }else if(select_index_array[4]==1){
//                groupDraw(-330,-330,-330,-330,-330,120,135);
            }else if(select_index_array[4]==2){

            }
            break;
    }

}