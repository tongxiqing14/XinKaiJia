
function create_Animation(divname,imgname,imgarray,index,top_x,top_y){
    document.getElementById(imgname).src = imgarray[index];
    document.getElementById(divname).style.left = top_x+'px';
    document.getElementById(divname).style.top = top_y+'px';
}

function ajax_send(url,src){
    xmlhttp = MakeHttpRequest();
    xmlhttp.open("Post", url, true);
    xmlhttp.send();

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {
            var js = eval(xmlhttp.responseText);
            if(js[0].id == 0){
                window.location.href = src;
            }else{

            }
        }
    }
}