var Box = {
    "OK": "",    //OK
    "PAGEUP": "",    //上页
    "PAGEDOWN": "",    //下页
    "BACK": "",    //返回
    "ZERO": "",    //数字0
    "ONE": "",    //数字1
    "TWO": "",    //数字2
    "THREE": "",    //数字3
    "FOUR": "",    //数字4
    "FIVE": "",    //数字5
    "SIX": "",    //数字6
    "SEVEN": "",    //数字7
    "EIGHT": "",    //数字8
    "NINE": "",   //数字9
    "LEFT": "",    //左
    "UP": "",     //上
    "RIGHT": "",   //右
    "DOWN": ""    //下
}
/*
 HW盒子按键Javascript脚本
 */
var HW = {
    "OK": 13, //OK
    "ZERO": 0x0030, //数字0
    "ONE": 49, //数字1
    "TWO": 50, //数字2
    "THREE": 51, //数字3
    "FOUR": 52, //数字4
    "FIVE": 53, //数字5
    "SIX": 54, //数字6
    "SEVEN": 55, //数字7
    "EIGHT": 56, //数字8
    "NINE": 57, //数字9
    "PAGEUP": 33, //上页
    "PAGEDOWN": 34, //下页
    "BACK": 0x0008, //返回
    "LEFT": 37, //左
    "UP": 38, //上
    "RIGHT": 39, //右
    "DOWN": 40 //下
}

/*
 ZTE盒子按键Javascript脚本
 */
var ZTE = {
    "OK": 13, //OK
    "ZERO": 48, //数字0
    "ONE": 49, //数字1
    "TWO": 50, //数字2
    "THREE": 51, //数字3
    "FOUR": 52, //数字4
    "FIVE": 53, //数字5
    "SIX": 54, //数字6
    "SEVEN": 55, //数字7
    "EIGHT": 56, //数字8
    "NINE": 57, //数字9
    "PAGEUP": 301, //上页
    "PAGEDOWN": 302, //下页
    "BACK": 126, //返回
    "LEFT": 271, //左
    "UP": 269, //上
    "RIGHT": 272, //右
    "DOWN": 270 //下
}


/*
 UT盒子按键Javascript脚本
 */
var UT = {
    "OK": 13, //OK
    "ZERO": 48, //数字0
    "ONE": 49, //数字1
    "TWO": 50, //数字2
    "THREE": 51, //数字3
    "FOUR": 52, //数字4
    "FIVE": 53, //数字5
    "SIX": 54, //数字6
    "SEVEN": 55, //数字7
    "EIGHT": 56, //数字8
    "NINE": 57, //数字9
    "PAGEUP": 86, //上页
    "PAGEDOWN": 85, //下页
    "BACK": 8, //返回
    "LEFT": 37, //左
    "UP": 38, //上
    "RIGHT": 39, //右
    "DOWN": 40 //下
}

//Modified by gongjingyi at 2009/6/17
//默认按0,back键返回
Box.ZERO = "../Home/GoBack.aspx";
Box.BACK = "../Home/GoBack.aspx";

//触发onkeypress事件
document.onkeypress = KeyAction;

//弹框后屏蔽背景按钮 全局变量
//add by Hyb [2014-5-11]
var IsPrevent = "false";
var MessageType = "Topup";
var IsFight = "false";

//Modified by gongjingyi at 2009/1/6
function getUrl(keyCode)//根据健值获取对应的url
{
    //查看hw对应键值
    for (var item in HW) {
        if (HW[item] == keyCode) {
            return Box[item];
        }
    }

    //查看zte对应键值
    for (var item in ZTE) {
        if (ZTE[item] == keyCode) {
            return Box[item];
        }
    }

    //查看ut对应键值
    for (var item in UT) {
        if (UT[item] == keyCode) {
            return Box[item];
        }
    }

    //如果没有对应键值，则返回undefined
    return "undefined";
}

function KeyAction() {
    var evt = window.event;
    var keyCode = evt.which ? evt.which : evt.keyCode;

    //后退键是否屏蔽掉,中间件是640，创维是122
    if (keyCode == 640 || keyCode == 122) {
        evt.preventDefault();
    }

    //    //退出键,直接退出游戏，返回到大厅
    //    if (keyCode == 114) {
    //        window.location.href = "../Home/LogoutHall.aspx";
    //        evt.preventDefault();
    //        return;
    //    }

    //**********add by Hyb 2014-5-10*************
    if (IsPrevent == "true") {//屏蔽上下左右键
        if (keyCode == 37 || keyCode == 38) {
            if (MessageType == "Topup") {//判断弹框类型，如果是充值弹框则焦点在ATopup ，如果是信息弹框 则焦点在AConfirm
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

function gotoURL(URL)//跳转
{
    if (URL.toLowerCase() != "back") {
        if (URL != "") { window.location.href = URL; }
    }
    else {
        history.go(-1);
    }
}


//默认焦点
//传入需要设为默认焦点的元素ID。 注意： 只对可点击的对象有效
function onFocus(elementID) {

    var object = document.getElementById(elementID);
    if (object != null) {
        object.focus();
    }

}

//传入需要设为默认焦点的元素ID。如果第一个元素不存在,则设第二个元素为默认焦点. 注意： 只对可点击的对象有效
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
 获得对象
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

var backFun;    //回调方法变成全局变量，不然onreadstate...方法引用不到
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
//调用例子：this.loadUrl("../AjaxUrl/RandomUserName.ashx?sex=" + Sex + "&r=" + Math.random(),setName);