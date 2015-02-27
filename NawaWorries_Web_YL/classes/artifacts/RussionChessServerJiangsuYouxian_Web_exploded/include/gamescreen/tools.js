function merge_numbers_no_remove(num){
    var i = 0;
    num_a = new Array();

    if(num > 0){

        while(num*num >= 1){
            num_a[i] = num%10;
            num = (num-num%10)/10;
            i++;
        }

        num_a.reverse();

        for(var j = 1; j < num_a.length; j++){
            switch(num_a[j]){
                case 1:
                    document.getElementById("hero_purple_id_1").src = "font/green/1.png";
                    break;
                case 2:
                    document.getElementById("hero_purple_id_2").src = "font/green/2.png";
                    break;
                case 3:
                    document.getElementById("hero_purple_id_3").src = "font/green/3.png";
                    break;
                case 4:
                    document.getElementById("hero_purple_id_4").src = "font/green/4.png";
                    break;
            }
        }
    }

//    setTimeout("remove()",500);         // control the wait time
}

function merge_numbers(num){
    var i = 0;
    num_a = new Array();

    if(num > 0){
        document.getElementById("hero_purple_symbol_id").src = "font/green/+.png";
        document.getElementById("img_hero_blue_symbol_num_id").src = "font/green/+.png";
        document.getElementById("img_hero_green_symbol_num_id").src = "font/green/+.png";

        while(num*num >= 1){
            num_a[i] = num%10;
            num = (num-num%10)/10;
            i++;
        }

        num_a.reverse();

        for(var j = 1; j < num_a.length; j++){
            switch(num_a[j]){
                case 1:
                    document.getElementById("hero_purple_id_1").src = "font/green/1.png";
                    document.getElementById("img_hero_blue1_num_id").src = "font/green/1.png";
                    document.getElementById("img_hero_green1_num_id").src = "font/green/1.png";
                    break;
                case 2:
                    document.getElementById("hero_purple_id_2").src = "font/green/2.png";
                    document.getElementById("img_hero_blue2_num_id").src = "font/green/2.png";
                    document.getElementById("img_hero_green2_num_id").src = "font/green/2.png";
                    break;
                case 3:
                    document.getElementById("hero_purple_id_3").src = "font/green/3.png";
                    document.getElementById("img_hero_blue3_num_id").src = "font/green/3.png";
                    document.getElementById("img_hero_green3_num_id").src = "font/green/3.png";
                    break;
                case 4:
                    document.getElementById("hero_purple_id_4").src = "font/green/4.png";
                    document.getElementById("img_hero_blue4_num_id").src = "font/green/4.png";
                    document.getElementById("img_hero_green4_num_id").src = "font/green/4.png";
                    break;
            }
        }
    }

    setTimeout("remove()",500);         // control the wait time
}

function remove(){
    document.getElementById("hero_purple_symbol").style.top = -500;
    document.getElementById("hero_purple1").style.top = -500;
    document.getElementById("hero_purple2").style.top = -500;
    document.getElementById("hero_purple3").style.top = -500;
    document.getElementById("hero_purple4").style.top = -500;

    document.getElementById("div_hero_blue_symbol_num_id").style.top = -500;
    document.getElementById("div_hero_blue1_num_id").style.top = -500;
    document.getElementById("div_hero_blue2_num_id").style.top = -500;
    document.getElementById("div_hero_blue3_num_id").style.top = -500;
    document.getElementById("div_hero_blue4_num_id").style.top = -500;

    document.getElementById("div_hero_green_symbol_num_id").style.top = -500;
    document.getElementById("div_hero_green1_num_id").style.top = -500;
    document.getElementById("div_hero_green2_num_id").style.top = -500;
    document.getElementById("div_hero_green3_num_id").style.top = -500;
    document.getElementById("div_hero_green4_num_id").style.top = -500;
}