
//ÏûÏ¢µ¯¿ò
function ShowMessage(val, flag) {
    switch (flag) {
        case 1:
            var html = "<div id='MessageDiv'><div class='DoubleContext'>" + val + "</div>";
            html += "<div class='btnOk'><a id='btnOk' href='javascript:DoAction()'  onfocus=MM_swapImage('iok','','../Images/Message/ok_r.png',1)   onblur=MM_swapImgRestore()>";
            html += "<img id='iok' src='../Images/Message/ok.png' /></a></div>";
            html += "<div class='btnCancel'><a id='btnCancel' href='javascript:Close()'  onfocus=MM_swapImage('icancel','','../Images/Message/cancel_r.png',1)   onblur=MM_swapImgRestore()>";
            html += "<img id='icancel' src='../Images/Message/cancel.png' /></a></div></div>";
            $('msgDiv').innerHTML = html;
            setTimeout(Focus, 200);

            break;
        case 2:
            var html = "<div id='MessageDiv'><div class='DoubleContext'>" + val + "</div>";
            html += "<div class='Onebtn'><a id='btnOk' href='javascript:Close()'  onfocus=MM_swapImage('iok','','../Images/Message/ok_r.png',1)   onblur=MM_swapImgRestore()>";
            html += "<img id='iok' src='../Images/Message/ok.png' /></a></div>";
            $('msgDiv').innerHTML = html;
            setTimeout(Focus, 200);
            break;
        case 3:
            var html = "<div id='MessageDiv'><div class='DoubleContext'>" + val + "</div></div>";
            $('msgDiv').innerHTML = html;
            setTimeout(Close, 1500);
            break;
        default:
            var html = "<div id='MessageDiv'><div class='DoubleContext'>" + val + "</div></div>";
            $('msgDiv').innerHTML = html;
            setTimeout(CloseAuto, 1500);
            break;
    }
}

function Close() {
    $('msgDiv').innerHTML = "";
    $('ABegin').focus();
}
function Focus() {
    $('btnOk').focus();
}

function CloseAuto() {
    $('msgDiv').innerHTML = "";
}



