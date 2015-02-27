<%@ page import="service.JigSawInfoOp" %>
<%--
  Created by IntelliJ IDEA.
  User: tongxiqing
  Date: 14-11-5
  Time: 下午4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String[] jisaw_img_path_array1 = new String[]{};

    if(request.getParameter("selectIndex_sub")!=null){
        switch (Integer.valueOf(request.getParameter("selectIndex_sub"))){
            case 0:
                jisaw_img_path_array1 = new String[]{"jigsaw/1/jigsaw1_01.jpg","jigsaw/1/jigsaw1_02.jpg","jigsaw/1/jigsaw1_03.jpg","jigsaw/1/jigsaw1_04.jpg","jigsaw/1/jigsaw1_05.jpg","jigsaw/1/jigsaw1_06.jpg","jigsaw/1/jigsaw1_07.jpg","jigsaw/1/jigsaw1_08.jpg"};
                break;
            case 1:
                jisaw_img_path_array1 = new String[]{"jigsaw/2/jigsaw2_01.jpg","jigsaw/2/jigsaw2_02.jpg","jigsaw/2/jigsaw2_03.jpg","jigsaw/2/jigsaw2_04.jpg","jigsaw/2/jigsaw2_05.jpg","jigsaw/2/jigsaw2_06.jpg","jigsaw/2/jigsaw2_07.jpg","jigsaw/2/jigsaw2_08.jpg"};
                break;
            case 2:
                jisaw_img_path_array1 = new String[]{"jigsaw/3/jigsaw4_01.jpg","jigsaw/3/jigsaw4_02.jpg","jigsaw/3/jigsaw4_03.jpg","jigsaw/3/jigsaw4_04.jpg","jigsaw/3/jigsaw4_05.jpg","jigsaw/3/jigsaw4_06.jpg","jigsaw/3/jigsaw4_07.jpg","jigsaw/3/jigsaw4_08.jpg"};
                break;
            case 3:
                jisaw_img_path_array1 = new String[]{"jigsaw/4/jigsaw4_01.jpg","jigsaw/4/jigsaw4_02.jpg","jigsaw/4/jigsaw4_03.jpg","jigsaw/4/jigsaw4_04.jpg","jigsaw/4/jigsaw4_05.jpg","jigsaw/4/jigsaw4_06.jpg","jigsaw/4/jigsaw4_07.jpg","jigsaw/4/jigsaw4_08.jpg"};
                break;
            case 4:
                jisaw_img_path_array1 = new String[]{"jigsaw/5/jigsaw5_01.jpg","jigsaw/5/jigsaw5_02.jpg","jigsaw/5/jigsaw5_03.jpg","jigsaw/5/jigsaw5_04.jpg","jigsaw/5/jigsaw5_05.jpg","jigsaw/5/jigsaw5_06.jpg","jigsaw/5/jigsaw5_07.jpg","jigsaw/5/jigsaw5_08.jpg"};
                break;
            case 5:
                jisaw_img_path_array1 = new String[]{"jigsaw/6/jigsaw6_01.jpg","jigsaw/6/jigsaw6_02.jpg","jigsaw/6/jigsaw6_03.jpg","jigsaw/6/jigsaw6_04.jpg","jigsaw/6/jigsaw6_05.jpg","jigsaw/6/jigsaw6_06.jpg","jigsaw/6/jigsaw6_07.jpg","jigsaw/6/jigsaw6_08.jpg"};
                break;
            case 6:
                jisaw_img_path_array1 = new String[]{"jigsaw/7/jigsaw7_01.jpg","jigsaw/7/jigsaw7_02.jpg","jigsaw/7/jigsaw7_03.jpg","jigsaw/7/jigsaw7_04.jpg","jigsaw/7/jigsaw7_05.jpg","jigsaw/7/jigsaw7_06.jpg","jigsaw/7/jigsaw7_07.jpg","jigsaw/7/jigsaw7_08.jpg"};
                break;
            case 7:
                jisaw_img_path_array1 = new String[]{"jigsaw/8/jigsaw8_01.jpg","jigsaw/8/jigsaw8_02.jpg","jigsaw/8/jigsaw8_03.jpg","jigsaw/8/jigsaw8_04.jpg","jigsaw/8/jigsaw8_05.jpg","jigsaw/8/jigsaw8_06.jpg","jigsaw/8/jigsaw8_07.jpg","jigsaw/8/jigsaw8_08.jpg"};
                break;
        }
    }


%>
if(keyCode == ZTE.LEFT
    || keyCode == HW.LEFT
        || keyCode == UT.LEFT ) {
        document.selectIndex_item--;
}else if(keyCode == ZTE.RIGHT
    || keyCode == HW.RIGHT
        || keyCode == UT.RIGHT){
        document.selectIndex_item++;
}

if(keyCode == ZTE.UP
    || keyCode == HW.UP
        || keyCode == UT.UP) {
        document.selectIndex_item-=4;
}else if(keyCode == ZTE.DOWN
    || keyCode == HW.DOWN
        || keyCode == UT.DOWN){
        document.selectIndex_item+=4;
}

document.selectIndex_item = (document.selectIndex_item+8)%8;

<%for (int i = 0; i < jisaw_img_path_array1.length; i++){   /**全覆盖作为底色*/
    int x = (i+4)%4;
    int y = i/4;

    int left = 48+x*136;
    int top = 60+y*157;
%>
document.getElementById("div_jisaw_img_id<%=i+1%>").style.left = '<%=left%>px';
<%}%>

switch(document.selectIndex_item){           /**移动掀块*/
    case 0:
        document.div_mouse_left_x = document.getElementById("div_jisaw_img_id1").style.left+10;
        document.div_mouse_top_y =  80;
        document.getElementById("div_jisaw_img_id1").style.left = '-1000px';
    break;
    case 1:
        document.div_mouse_left_x = document.getElementById("div_jisaw_img_id2").style.left+10;
        document.div_mouse_top_y =  80;
        document.getElementById("div_jisaw_img_id2").style.left = '-1000px';
    break;
    case 2:
        document.div_mouse_left_x = document.getElementById("div_jisaw_img_id3").style.left+10;
        document.div_mouse_top_y =  80;
        document.getElementById("div_jisaw_img_id3").style.left = '-1000px';
    break;
    case 3:
        document.div_mouse_left_x = document.getElementById("div_jisaw_img_id4").style.left+10;
        document.div_mouse_top_y =  80;
        document.getElementById("div_jisaw_img_id4").style.left = '-1000px';
    break;
    case 4:
        document.div_mouse_left_x = document.getElementById("div_jisaw_img_id5").style.left+10;
        document.div_mouse_top_y =  230;
        document.getElementById("div_jisaw_img_id5").style.left = '-1000px';
    break;
    case 5:
        document.div_mouse_left_x = document.getElementById("div_jisaw_img_id6").style.left+10;
        document.div_mouse_top_y =  230;
        document.getElementById("div_jisaw_img_id6").style.left = '-1000px';
    break;
    case 6:
        document.div_mouse_left_x = document.getElementById("div_jisaw_img_id7").style.left+10;
        document.div_mouse_top_y =  230;
        document.getElementById("div_jisaw_img_id7").style.left = '-1000px';
    break;
    case 7:
        document.div_mouse_left_x = document.getElementById("div_jisaw_img_id8").style.left+10;
        document.div_mouse_top_y =  230;
        document.getElementById("div_jisaw_img_id8").style.left = '-1000px';
    break;
}

<%
    String jigsawinfo = (String) session.getAttribute("_jigsawinfo");
    int[][] jigsawinfo_array = JigSawInfoOp.getJigSawInfo(jigsawinfo);

    for (int j=0; j<jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))].length; j++){
        if(jigsawinfo_array[Integer.valueOf(request.getParameter("selectIndex_sub"))][j]==1){ %>
        document.getElementById("div_jisaw_img_id<%=(j+1)%>").style.left = '-1000px';
    <% }
    }
%>

