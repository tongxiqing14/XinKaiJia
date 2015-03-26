package web_services;

import beans.FighterBean;
import beans.FighterHpDown;
import beans.FighterHpDownII;
import beans.FighterItemBean;
import com.fancyy.json.util.JSON;
import common.MySessionContext;

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
 * Created by tongxiqing on 2015/3/25.
 */
public class FighterHpDownServlet extends HttpServlet {


    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        ServletOutputStream out_  = resp.getOutputStream();
        String sessionId = req.getParameter("sessionId");
        HttpSession session1 = MySessionContext.getSession(sessionId);

        /**��ȡ hero list*/
        List<FighterBean> heroList = (List<FighterBean>) session1.getAttribute("_FighterData");

        /**ɸѡ��ѡ�� hero list*/
        List<FighterBean> selectHeroList = new ArrayList<FighterBean>();

        for (FighterBean heroItem : heroList){
            if(heroItem.isSelect_flag()) selectHeroList.add(heroItem);
        }

        /**ɸѡ hero list�е�hero list*/
//        List<FighterItemBean> monsterList_in_heroList = new ArrayList<FighterItemBean>();
        List<FighterHpDown> fighterHpDowns = new ArrayList<FighterHpDown>();
        List<FighterBean> herolist_in_selectHerolist = new ArrayList<FighterBean>();
        for (FighterBean heroItem : selectHeroList){
            if (heroItem.getType() == 0){
                herolist_in_selectHerolist.add(heroItem);
                for(FighterItemBean fighterBean : ((List<FighterItemBean>) session1.getAttribute("_HeroData"))){
                    if(heroItem.getFighter_id() == fighterBean.getFighter_id()){
//                        monsterList_in_heroList.add(fighterBean);
                        FighterHpDown fighterHpDown = new FighterHpDown(fighterBean.getFighter_id(), fighterBean.getHp_num());
                        fighterHpDowns.add(fighterHpDown);
                    }
                }
            }
        }

        /**ɸѡ hero list�е�monster list*/
        List<FighterBean> followlist_in_selectHerolist = new ArrayList<FighterBean>();
        for(FighterBean heroItem : selectHeroList){
            if(heroItem.getType() == 1){
                followlist_in_selectHerolist.add(heroItem);
                for(FighterItemBean fighterItemBean : (List<FighterItemBean>) session1.getAttribute("_MonsterData")){
                    if(heroItem.getFighter_id() == fighterItemBean.getFighter_id()){
//                        monsterList_in_heroList.add(fighterItemBean);
                        FighterHpDown fighterHpDown = new FighterHpDown(fighterItemBean.getFighter_id(), fighterItemBean.getHp_num());
                        fighterHpDowns.add(fighterHpDown);
                    }
                }
            }
        }

        /**ɸѡ hero list�е�pet list*/
        List<FighterBean> petlist_in_selectHerolist = new ArrayList<FighterBean>();
        for(FighterBean heroItem : selectHeroList){
            if(heroItem.getType() == 2){
                petlist_in_selectHerolist.add(heroItem);
                for (FighterItemBean fighterBean : ((List<FighterItemBean>) session1.getAttribute("_PetData"))){
                    if(heroItem.getFighter_id() == fighterBean.getFighter_id()){
//                        monsterList_in_heroList.add(fighterBean);
                        FighterHpDown fighterHpDown = new FighterHpDown(fighterBean.getFighter_id(), fighterBean.getHp_num());
                        fighterHpDowns.add(fighterHpDown);
                    }
                }
            }
        }

        List<FighterHpDownII> fighterHpDownIIs = new ArrayList<FighterHpDownII>();

        for(FighterHpDown fighterHpDown : fighterHpDowns){
            FighterHpDownII fighterHpDownII = new FighterHpDownII(fighterHpDown.getFighterId(),95);
            fighterHpDownIIs.add(fighterHpDownII);
        }

        session1.setAttribute("fighterHpDowns", fighterHpDowns);
        session1.setAttribute("fighterHpDownIIs", fighterHpDownIIs);

//        String return__ =  JSON.toJson(fighterHpDowns);

//        out_.write(return__.getBytes("GBK"));
//        out_.println();
//        out_.close();
    }

}