var Box = {
    "OK": "",    //OK
    "PAGEUP": "",    //��ҳ
    "PAGEDOWN": "",    //��ҳ
    "BACK": "",    //����
    "ZERO": "",    //����0
    "ONE": "",    //����1
    "TWO": "",    //����2
    "THREE": "",    //����3
    "FOUR": "",    //����4
    "FIVE": "",    //����5
    "SIX": "",    //����6
    "SEVEN": "",    //����7
    "EIGHT": "",    //����8
    "NINE": "",   //����9
    "LEFT": "",    //��
    "UP": "",     //��
    "RIGHT": "",   //��
    "DOWN": ""    //��
}
/*
 HW���Ӱ���Javascript�ű�
 */
var HW = {
    "OK": 13, //OK
    "ZERO": 0x0030, //����0
    "ONE": 49, //����1
    "TWO": 50, //����2
    "THREE": 51, //����3
    "FOUR": 52, //����4
    "FIVE": 53, //����5
    "SIX": 54, //����6
    "SEVEN": 55, //����7
    "EIGHT": 56, //����8
    "NINE": 57, //����9
    "PAGEUP": 33, //��ҳ
    "PAGEDOWN": 34, //��ҳ
    "BACK": 0x0008, //����
    "LEFT": 37, //��
    "UP": 38, //��
    "RIGHT": 39, //��
    "DOWN": 40 //��
}

/*
 ZTE���Ӱ���Javascript�ű�
 */
var ZTE = {
    "OK": 13, //OK
    "ZERO": 48, //����0
    "ONE": 49, //����1
    "TWO": 50, //����2
    "THREE": 51, //����3
    "FOUR": 52, //����4
    "FIVE": 53, //����5
    "SIX": 54, //����6
    "SEVEN": 55, //����7
    "EIGHT": 56, //����8
    "NINE": 57, //����9
    "PAGEUP": 301, //��ҳ
    "PAGEDOWN": 302, //��ҳ
    "BACK": 126, //����
    "LEFT": 271, //��
    "UP": 269, //��
    "RIGHT": 272, //��
    "DOWN": 270 //��
}


/*
 UT���Ӱ���Javascript�ű�
 */
var UT = {
    "OK": 13, //OK
    "ZERO": 48, //����0
    "ONE": 49, //����1
    "TWO": 50, //����2
    "THREE": 51, //����3
    "FOUR": 52, //����4
    "FIVE": 53, //����5
    "SIX": 54, //����6
    "SEVEN": 55, //����7
    "EIGHT": 56, //����8
    "NINE": 57, //����9
    "PAGEUP": 86, //��ҳ
    "PAGEDOWN": 85, //��ҳ
    "BACK": 8, //����
    "LEFT": 37, //��
    "UP": 38, //��
    "RIGHT": 39, //��
    "DOWN": 40 //��
}

//Modified by gongjingyi at 2009/6/17
//Ĭ�ϰ�0,back������
Box.ZERO = "../Home/GoBack.aspx";
Box.BACK = "../Home/GoBack.aspx";

//����onkeypress�¼�
document.onkeypress = KeyAction;

//��������α�����ť ȫ�ֱ���
//add by Hyb [2014-5-11]
var IsPrevent = "false";
var MessageType = "Topup";
var IsFight = "false";

//Modified by gongjingyi at 2009/1/6
function getUrl(keyCode)//���ݽ�ֵ��ȡ��Ӧ��url
{
    //�鿴hw��Ӧ��ֵ
    for (var item in HW) {
        if (HW[item] == keyCode) {
            return Box[item];
        }
    }

    //�鿴zte��Ӧ��ֵ
    for (var item in ZTE) {
        if (ZTE[item] == keyCode) {
            return Box[item];
        }
    }

    //�鿴ut��Ӧ��ֵ
    for (var item in UT) {
        if (UT[item] == keyCode) {
            return Box[item];
        }
    }

    //���û�ж�Ӧ��ֵ���򷵻�undefined
    return "undefined";
}

function KeyAction() {
    var evt = window.event;
    var keyCode = evt.which ? evt.which : evt.keyCode;

    //���˼��Ƿ����ε�,�м����640����ά��122
    if (keyCode == 640 || keyCode == 122) {
        evt.preventDefault();
    }

    //    //�˳���,ֱ���˳���Ϸ�����ص�����
    //    if (keyCode == 114) {
    //        window.location.href = "../Home/LogoutHall.aspx";
    //        evt.preventDefault();
    //        return;
    //    }

    //**********add by Hyb 2014-5-10*************
    if (IsPrevent == "true") {//�����������Ҽ�
        if (keyCode == 37 || keyCode == 38) {
            if (MessageType == "Topup") {//�жϵ������ͣ�����ǳ�ֵ�����򽹵���ATopup ���������Ϣ���� �򽹵���AConfirm
                onFocus("ATopup");
            } else {
                onFocus("AConfirm");
            }
            evt.preventDefault();
            return;
        }
        else if (keyCode == 39 || keyCode == 40) {
            if (MessageType == "Topup") {
                onFocus("ACancle");
            } else {
                onFocus("AMsgCancel");
            }

            evt.preventDefault();
            return;
        }
        else {
            IsPrevent = "false";
        }
    }
    //*******************************************

    var _url = getUrl(keyCode);
    if (_url != "undefined" && _url != undefined)
        gotoURL(_url);
}

function gotoURL(URL)//��ת
{
    if (URL.toLowerCase() != "back") {
        if (URL != "") { window.location.href = URL; }
    }
    else {
        history.go(-1);
    }
}


//Ĭ�Ͻ���
//������Ҫ��ΪĬ�Ͻ����Ԫ��ID�� ע�⣺ ֻ�Կɵ���Ķ�����Ч
function onFocus(elementID) {

    var object = document.getElementById(elementID);
    if (object != null) {
        object.focus();
    }

}

//������Ҫ��ΪĬ�Ͻ����Ԫ��ID�������һ��Ԫ�ز�����,����ڶ���Ԫ��ΪĬ�Ͻ���. ע�⣺ ֻ�Կɵ���Ķ�����Ч
function onFocus(elementID, secondeElementID) {

    var object = document.getElementById(elementID);
    if (object != null) {
        object.focus();
    }
    else {
        var object2 = document.getElementById(secondeElementID);
        if (object2 != null) {
            object2.focus();
        }
    }

}

/*
 ��ö���
 */
function $(_param) { return document.getElementById(_param) ? document.getElementById(_param) : document.form1[_param]; }




function MM_preloadImages() { //v3.0
    var d = document; if (d.images) {
        if (!d.MM_p) d.MM_p = new Array();
        var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
            if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
    }
}

function MM_swapImgRestore() { //v3.0
    var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
}

function MM_findObj(n, d) { //v4.01
    var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
        d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
    }
    if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
    for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
    if (!x && d.getElementById) x = d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
    var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
        if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
}

var backFun;    //�ص��������ȫ�ֱ�������Ȼonreadstate...�������ò���
function loadUrl(url, cfunc) {
    backFun = cfunc;
    xmlhttp = MakeHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            backFun(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function MakeHttpRequest() {
    if (window.XMLHttpRequest)
        return new XMLHttpRequest();
    else
        return new ActiveXObject("Microsoft.XMLHTTP");
}
//�������ӣ�this.loadUrl("../AjaxUrl/RandomUserName.ashx?sex=" + Sex + "&r=" + Math.random(),setName);