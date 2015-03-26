package web_services;

import beans.*;
import com.fancyy.json.util.JSON;
import common.MySessionContext;
import elements.EnemyTeam;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tongxiqing on 2015/3/25.
 */
public class FighterHpDownServlet extends HttpServlet {


    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletOutputStream out_  = resp.getOutputStream();
        String sessionId = req.getParameter("sessionId");
        HttpSession session1 = MySessionContext.getSession(sessionId);

        System.out.println("************1");

        /**获取 hero list*/
        List<FighterBean> heroList = (List<FighterBean>) session1.getAttribute("_FighterData");

        /**筛选已选中 hero list*/
        List<FighterBean> selectHeroList = new ArrayList<FighterBean>();

        for (FighterBean heroItem : heroList){
            if(heroItem.isSelect_flag()) selectHeroList.add(heroItem);
        }
        System.out.println("************2");
        /**筛选 hero list中的hero list*/
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
        System.out.println("************3");
        /**筛选 hero list中的monster list*/
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
        System.out.println("************4");
        /**筛选 hero list中的pet list*/
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
        System.out.println("************5");
//        double sum_enemy_hp_num = 0;
        double sum_enemy_fight_num = 0;
        double avr_enemytoher_fight_num = 0;

        /**获取敌方成员*/
        List<EnemyTeam> enemyTeamList =
                (List<EnemyTeam>) JSON.toObject((String) session1.getAttribute("enemy_team"), EnemyTeam.class);

        for(int h = 0; h < enemyTeamList.size(); h++){
//            sum_enemy_hp_num += enemyTeamList.get(h).getHpNumber();
            sum_enemy_fight_num += enemyTeamList.get(h).getFight_number();
        }

        avr_enemytoher_fight_num = sum_enemy_fight_num / fighterHpDowns.size();

        List<HpDownStepValue> hpDownStepValues = new ArrayList<HpDownStepValue>();
        Map hpDownStepValueMap = new HashMap();
        List<FighterHpDownII> fighterHpDownIIs = new ArrayList<FighterHpDownII>();
        System.out.println("************6");
        for(FighterHpDown fighterHpDown : fighterHpDowns){
            FighterHpDownII fighterHpDownII = new FighterHpDownII(fighterHpDown.getFighterId(),95);
            fighterHpDownIIs.add(fighterHpDownII);

            HpDownStepValue hpDownStepValue = new HpDownStepValue(fighterHpDown.getFighterId(),(avr_enemytoher_fight_num/fighterHpDown.getFighterHp())*95);
            hpDownStepValues.add(hpDownStepValue);

            hpDownStepValueMap.put(fighterHpDown.getFighterId(),(avr_enemytoher_fight_num/fighterHpDown.getFighterHp())*95);
        }

        session1.setAttribute("fighterHpDowns", fighterHpDowns);
        session1.setAttribute("fighterHpDownIIs", fighterHpDownIIs);
        session1.setAttribute("hpDownStepValues", hpDownStepValues);
        session1.setAttribute("hpDownStepValueMap", hpDownStepValueMap);
        System.out.println("************7");
        String return__ =  JSON.toJson(fighterHpDownIIs);

        System.out.println("*****"+return__+"*****");

        out_.write(return__.getBytes("GBK"));
        out_.println();
        out_.close();
    }

}
