package web_services;

import beans.FighterBean;
import beans.FighterHpDown;
import beans.FighterHpDownII;
import beans.HpDownStepValue;
import com.fancyy.json.util.JSON;
import common.MySessionContext;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by tongxiqing on 2015/3/25.
 */
public class FighterHpDownIIServlet extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletOutputStream out_  = resp.getOutputStream();
        String sessionId = req.getParameter("sessionId");
        HttpSession session1 = MySessionContext.getSession(sessionId);

//        session1.getAttribute("fighterHpDownIIs");

//        List<FighterHpDown> fighterHpDowns = (List<FighterHpDown>) session1.getAttribute("fighterHpDowns");

//        List<HpDownStepValue> hpDownStepValues = (List<HpDownStepValue>) session1.getAttribute("hpDownStepValues");
        Map hpDownStepValueMap = (Map) session1.getAttribute("hpDownStepValueMap");

        List<FighterHpDownII> fighterHpDownIIs = (List<FighterHpDownII>) session1.getAttribute("fighterHpDownIIs");

        for(FighterHpDownII fighterHpDownII : fighterHpDownIIs){

            fighterHpDownII.setHpImgWidth((int) (fighterHpDownII.getHpImgWidth() - (Double)hpDownStepValueMap.get(fighterHpDownII.getFighterId())));
        }

        String return__ =  JSON.toJson(fighterHpDownIIs);

        out_.write(return__.getBytes("GBK"));
        out_.println();
        out_.close();
    }

}
