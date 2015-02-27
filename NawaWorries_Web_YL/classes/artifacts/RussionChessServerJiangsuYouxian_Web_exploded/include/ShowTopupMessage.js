var topupName;
var topupPrice;
var topupFlag;
var topupReturnUrl;

var userArr = "";

loadUrl("../Ashx/GetUserInfo.ashx?r=" + Math.random(), function (backResult) {
    userArr = backResult;
});


//name ��������
//price ���߼۸�
//flag ���ұ�־��DaiBi��ʾ���� /  ZhanBi��ʾ�ڲ����ң�
//url ���ѷ��ص�ַ

function ShowTopupMessage(name, price, flag, url) {
    var daibi;
    var zhanbi;
    topupName = name;
    topupPrice = price;
    topupFlag = flag;
    topupReturnUrl = url;

    price = parseInt(price);

    if (userArr == "") {
        setTimeout(ShowTopupMessage(name, flag, url), 500);
        return;
    }
    var arr = userArr.split('|');
    daibi = parseInt(arr[0]);
    zhanbi = parseInt(arr[1]);

    var msg = "<br/>��ȷ��Ҫ������";
    msg += "<br/>�������ƣ�" + name;
    if (flag == "DaiBi") {
        msg += "<br/>���߼۸�" + price + "����";
        msg += "<br/>���ĵ�ǰ������" + daibi + "����";
    }
    else {
        msg += "<br/>���߼۸�"+ price + "ս��";
        msg += "<br/>���ĵ�ǰս����" + zhanbi + "ս��";
    }
    if (flag == "DaiBi") {
        msg += "<br/><font color='red'>ע�� 1 ���� = 1 Ԫ</font>";
    }
    else {
        msg += "<br/><font color='red'>ע: ս�Ҳ��㣬���۳�" + price / 10000 + "����</font>";
    }
    // topupbtnOk, topupbtnCancel
    var html = "<div id='TopupMessageDiv'><div class='Context'>" + msg + "</div>";
    html += "<div class='btnCancel'><a id='btnCancel' href='javascript:TopupClose()'  onfocus=MM_swapImage('icancel','','../Images/Message/cancel_r.png',1)           onblur=MM_swapImgRestore()>";
    html += "<img id='icancel' src='../Images/Message/cancel.png' /></a></div>";
    html += "<div class='btnOk'><a id='btnOk' href='javascript:DoTopupAction()'  onfocus=MM_swapImage('iok','','../Images/Message/ok_r.png',1)   onblur=MM_swapImgRestore()>";
    html += "<img id='iok' src='../Images/Message/ok.png' /></a></div></div>";

    $('topupmsgDiv').innerHTML = html;
    setTimeout(TopupFocus, 200);
}

var isClick = "true";
function DoTopupAction() {
    if (isClick == "true") {
        isClick = "false";
        var gotoUrl = "../Service/LocalTopup.aspx";
        window.location.href = gotoUrl + "?category=" + topupFlag + "&money=" + topupPrice + "&wareName=" + topupName + "&returnUrl=" + topupReturnUrl;
    }
}

function TopupClose() {
    $('topupmsgDiv').innerHTML = "";
    $('ABegin').focus();
}

function TopupFocus() {
    $('btnCancel').focus();
}


//js �������ѳɹ���ʧ�ܵ���ʾ��Ϣ
function IsPromptMessage() {
    var url = location.search; //��ȡurl��"?"������ִ�
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        if (str.indexOf("&") != -1) {
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
        } else {
            theRequest[str.split("=")[0]] = unescape(str.split("=")[1]);
        }
    }
    if (theRequest["IsFree"] != undefined) {
        if (theRequest["IsFree"] == "True") {
            ShowMessage("<br/><br/><br/>����ʧ��<br/><br/>��ȥ��Ϸ������ֵ��");
        }
        else {
            ShowMessage("<br/><br/><br/>����ʧ��<br/><br/>&nbsp;��ȥ��Ϸ������ֵ��");
        }
    } else {
        if (theRequest["topupResult"] != undefined) {
            if (theRequest["topupResult"] == "Success") {
                ShowMessage("<br/><br/><br/><br/>���ѳɹ�");
            }
            else {
                ShowMessage("<br/><br/><br/>����ʧ��<br/><br/>��ȥ��Ϸ������ֵ��");
            }
        }
    }
}