<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-14
  Time: 上午1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<script>--%>
    /**判断是否已购买*/
//    xmlhttp = MakeHttpRequest();
    if (js[0].fighter_id == 7) {
//        xmlhttp.open("Post", is_got_url + "?item_index=" + (js[0].fighter_id - 1) + "&grouptype=" + selectIndex + "&preScreen=is_got__", true);
//        /**item id per page*/
//        xmlhttp.send();
//        xmlhttp.onreadystatechange = function () {
//            if (xmlhttp.readyState == 4) {
//                var js__$$$$ = eval(xmlhttp.responseText);
//                if (js__$$$$[0].result == 0) {
//                    consume_step = 2;
//                    /**默认更新为充值状态*/
//                    ajax_show_balance();
//                    if (selectIndex == 0) {
////                                                consume_item_index = (select_title_vertical_Index*5+select_title_horizontal_Index);
//                        document.getElementById("div_div_msg_id").innerHTML = "您是否要" + fighter_name_array1[fighter_id_temp - 1] + "? <br>资费:" + price_json.item2[1] + "代币";
//                    }
//
//                    document.getElementById("msgDiv").style.left = 120;
//                    document.getElementById("msgDiv").style.top = 90;
//                    document.getElementById("div_confirm_id").style.left = 230 + 'px';
//                    document.getElementById("div_confirm_id").style.top = 300 + 'px';
//                    document.getElementById("div_cancel_id").style.left = 310 + 'px';
//                    document.getElementById("div_cancel_id").style.top = 300 + 'px';
//                    document.getElementById("div_mouse_id").style.left = 230 + 'px';
//                    document.getElementById("div_mouse_id").style.top = 300 + 'px';
//                    if (mouse_index == 0) {
//                        document.div_mouse_left_x = 250;
//                        document.div_mouse_top_y = 280;
//                    } else if (mouse_index == 1) {
//                        document.div_mouse_left_x = 330;
//                        document.div_mouse_top_y = 280;
//                    }
//                } else if (js__$$$$[0].result == 1) {
                    document.getElementById("div_div_msg_id").innerHTML = "请先" + fighter_name_array1[(js[0].fighter_id - 2)];
                    document.getElementById("msgDiv").style.left = 120;
                    document.getElementById("msgDiv").style.top = 90;
                    setTimeout("transitdd()", 500);
//                }
//            }
//        }
    } else {
//        xmlhttp.open("Post", is_got_url + "?item_index=" + (js[0].fighter_id - 3) + "&grouptype=" + selectIndex + "&preScreen=is_got__", true);
//        /**item id per page*/
//        xmlhttp.send();
//        xmlhttp.onreadystatechange = function () {
//            if (xmlhttp.readyState == 4) {
//                var js__$$$$ = eval(xmlhttp.responseText);
//                if (js__$$$$[0].result == 0) {
//                    consume_step = 2;
//                    /**默认更新为充值状态*/
//                    ajax_show_balance();
//                    if (selectIndex == 0) {
////                                                consume_item_index = (select_title_vertical_Index*5+select_title_horizontal_Index);
//                        document.getElementById("div_div_msg_id").innerHTML = "您是否要" + fighter_name_array1[fighter_id_temp - 1] + "? <br>资费:" + price_json.item2[1] + "代币";
//                    }
//
//                    document.getElementById("msgDiv").style.left = 120;
//                    document.getElementById("msgDiv").style.top = 90;
//                    document.getElementById("div_confirm_id").style.left = 230 + 'px';
//                    document.getElementById("div_confirm_id").style.top = 300 + 'px';
//                    document.getElementById("div_cancel_id").style.left = 310 + 'px';
//                    document.getElementById("div_cancel_id").style.top = 300 + 'px';
//                    document.getElementById("div_mouse_id").style.left = 230 + 'px';
//                    document.getElementById("div_mouse_id").style.top = 300 + 'px';
//                    if (mouse_index == 0) {
//                        document.div_mouse_left_x = 250;
//                        document.div_mouse_top_y = 280;
//                    } else if (mouse_index == 1) {
//                        document.div_mouse_left_x = 330;
//                        document.div_mouse_top_y = 280;
//                    }
//                } else if (js__$$$$[0].result == 1) {
                    document.getElementById("div_div_msg_id").innerHTML = "请先" + fighter_name_array1[(js[0].fighter_id - 4)];
                    document.getElementById("msgDiv").style.left = 120;
                    document.getElementById("msgDiv").style.top = 90;
                    setTimeout("transitdd()", 500);
//                }
//            }
//        }
    }
<%--</script>--%>
