package web_services;

import beans.EquipMaxIndexBean;
import beans.FighterBean;
import com.fancyy.json.util.JSON;
import common.MySessionContext;
import iptvNet.IptvNetException;
import iptvNet.NetHander;
import org.json.me.JSONException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tongxiqing on 2015/3/4.
 */
public class StageInfoServlet extends HttpServlet {

    /**取得session属性*/
    HttpSession httpSession;

    NetHander netHander;

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletOutputStream out_  = resp.getOutputStream();

        String sessionId = req.getParameter("sessionId");
        httpSession = MySessionContext.getSession(sessionId);

        /**取得Application对象*/
        ServletContext application=this.getServletContext();

        /**获取 hero list*/
        List<FighterBean> heroList = (List<FighterBean>) httpSession.getAttribute("_FighterData");

        /**筛选已选中 hero list*/
        List<FighterBean> selectHeroList = new ArrayList<FighterBean>();

        for (FighterBean heroItem : heroList){
            if(heroItem.isSelect_flag()) selectHeroList.add(heroItem);
        }

        netHander = new NetHander(application.getInitParameter("ServerURL"), (String) httpSession.getAttribute("UserID"), (String) httpSession.getAttribute("ProductID"), (String) httpSession.getAttribute("adAccount"), (String) httpSession.getAttribute("UserToken"));

        /**更新关卡*/
        Integer selected_stage= Integer.valueOf((String) httpSession.getAttribute("selected_stage"));

        if(httpSession.getAttribute("_StageData")!=null&&Integer.valueOf((String)httpSession.getAttribute("_StageData"))<=40){

            if(selected_stage == (Integer.valueOf((String)httpSession.getAttribute("_StageData")))-1){      /**解锁关卡*/

                httpSession.setAttribute("_StageData", String.valueOf((Integer.valueOf((String)httpSession.getAttribute("_StageData"))) + 1));
                try {
                    netHander.saveGameData(String.valueOf((Integer.valueOf((String)httpSession.getAttribute("_StageData")))), 5);    /**保存关卡*/
                } catch (JSONException e) {
                    e.printStackTrace();
                } catch (IptvNetException e) {
                    e.printStackTrace();
                }
            }


        }
//        }

        /**更新道具*/
        updateEquipMaxIndexBean();

        /**更新积分*/
        try {
            netHander.saveScore(netHander.getMyScore(0)+50, 0);
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IptvNetException e) {
            e.printStackTrace();
        }

        /**更新宝石 宝箱*/
        Integer jewelScore=0;
        Integer chestNum=0;

        if(httpSession.getAttribute("UserID")!=null){
            if(httpSession.getAttribute("_JewelScore")!=null){
                jewelScore = Integer.valueOf((String) httpSession.getAttribute("_JewelScore")) +50;
                httpSession.setAttribute("_JewelScore",jewelScore+"");
                try {
                    netHander.saveGameData(jewelScore+"", 6);
                } catch (JSONException e) {
                    e.printStackTrace();
                } catch (IptvNetException e) {
                    e.printStackTrace();
                }
            }

            if(httpSession.getAttribute("_ChestNum")!=null){
                chestNum = Integer.valueOf((String) httpSession.getAttribute("_ChestNum")) +2;
                httpSession.setAttribute("_ChestNum",chestNum+"");
                try {
                    netHander.saveGameData(chestNum+"", 7);
                } catch (JSONException e) {
                    e.printStackTrace();
                } catch (IptvNetException e) {
                    e.printStackTrace();
                }
            }
        }

        String return__ =  "{id:0,Result:0}";

        out_.write(return__.getBytes("GBK"));
        out_.println();
        out_.close();

    }

    private void  updateEquipMaxIndexBean(){
        Integer heroScreen_selectIndex = 0;

        try {
            if(httpSession.getAttribute("heroScreen_selectIndex")!=null){
                heroScreen_selectIndex = Integer.valueOf((String) httpSession.getAttribute("heroScreen_selectIndex"));
            }
            EquipMaxIndexBean equipMaxIndexBean = (EquipMaxIndexBean) httpSession.getAttribute("_EquipMaxIndex");

            if((equipMaxIndexBean.getEquipMaxIndex(heroScreen_selectIndex+1))<8){     //8
                equipMaxIndexBean.getEquipMaxIndex_plus(heroScreen_selectIndex+1);
                httpSession.setAttribute("_EquipMaxIndex", equipMaxIndexBean);
                netHander.saveGameData(JSON.toJson(equipMaxIndexBean), 8);
            }

        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IptvNetException e) {
            e.printStackTrace();
        }
    }

}
