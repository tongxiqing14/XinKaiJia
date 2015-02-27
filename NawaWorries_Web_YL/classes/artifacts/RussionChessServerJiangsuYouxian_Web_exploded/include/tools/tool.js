
//(function Animation(){
////partial class Animation {
//    var _this;
//    var count_i=0;
//    var img_array1;
//    //¹¹Ôìº¯Êı
//    function Animation(img_array) {
//        _this = this;
//        img_array1 = img_array;
//    }
//
//    Animation.prototype.run = function () {
//        document.getElementById("hero_blue").style.left = 200;
//        document.getElementById("hero_blue").style.top = 120;
//        document.getElementById("hero_blue_0").src = img_array1[count_i];
//
//        count_i++;
//        if (count_i>=img_array1.length)
//        {
//            count_i = 0;
//        }
//
//        setTimeout("run()",250);         // control the FPS
//    }
//    window.Animation = Animation;
//})();

//function hero_blue_run(img_array1) {
//    var count_i_0 = 0;
//    document.getElementById("hero_blue").style.left = 200;
//    document.getElementById("hero_blue").style.top = 120;
//    document.getElementById("hero_blue_0").src = img_array1[((count_i_0++)+img_array1.length)%img_array1.length];

//    count_i_0++;
//    if (count_i_0>=img_array1.length)
//    {
//        count_i_0 = (count_i_0+img_array1.length)%img_array1.length;
//    }

//    setTimeout("hero_blue_run(img_array1)",250);         // control the FPS
//}
