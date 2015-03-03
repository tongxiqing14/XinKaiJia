package web_services;

import beans.FighterBean;
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
 * Created by tongxiqing on 2015/3/3.
 */
public class FighterBeanServlet extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        ServletOutputStream out_  = resp.getOutputStream();
//        String sessionId = req.getParameter("sessionId");
//        HttpSession session1 = MySessionContext.getSession(sessionId);
//
//        /**获取 hero list*/
//        List<FighterBean> getHeroList = (List<FighterBean>) session1.getAttribute("getHeroList");
//
//        /**筛选已选中 hero list*/
//        List<FighterBean> selectHeroList = new ArrayList<FighterBean>();
//
//        for (FighterBean heroItem : getHeroList){
//            if(heroItem.isSelect_flag())
//                selectHeroList.add(heroItem);
//        }
//
//        String return__ =  JSON.toJson(selectHeroList);
//
//        out_.write(return__.getBytes("GBK"));
//        out_.println();
//        out_.close();
    }

}
