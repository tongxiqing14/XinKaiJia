var topupName;
var topupPrice;
var topupFlag;
var topupReturnUrl;

var userArr = "";

loadUrl("../Ashx/GetUserInfo.ashx?r=" + Math.random(), function (backResult) {
    userArr = backResult;
});


//name 道具名称
//price 道具价格
//flag 货币标志（DaiBi表示代币 /  ZhanBi表示内部货币）
//url 消费返回地址

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

    var msg = "<br/>您确定要购买吗？";
    msg += "<br/>道具名称：" + name;
    if (flag == "DaiBi") {
        msg += "<br/>道具价格：" + price + "代币";
        msg += "<br/>您的当前代币余额：" + daibi + "代币";
    }
    else {
        msg += "<br/>道具价格："+ price + "战币";
        msg += "<br/>您的当前战币余额：" + zhanbi + "战币";
    }
    if (flag == "DaiBi") {
        msg += "<br/><font color='red'>注： 1 代币 = 1 元</font>";
    }
    else {
        msg += "<br/><font color='red'>注: 战币不足，将扣除" + price / 10000 + "代币</font>";
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


//js 处理消费成功、失败的提示信息
function IsPromptMessage() {
    var url = location.search; //获取url中"?"符后的字串
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
            ShowMessage("<br/><br/><br/>消费失败<br/><br/>请去游戏大厅充值！");
        }
        else {
            ShowMessage("<br/><br/><br/>消费失败<br/><br/>&nbsp;请去游戏大厅充值！");
        }
    } else {
        if (theRequest["topupResult"] != undefined) {
            if (theRequest["topupResult"] == "Success") {
                ShowMessage("<br/><br/><br/><br/>消费成功");
            }
            else {
                ShowMessage("<br/><br/><br/>消费失败<br/><br/>请去游戏大厅充值！");
            }
        }
    }
}