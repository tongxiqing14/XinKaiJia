package web_services;

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
import java.util.List;

/**
 * Created by tongxiqing on 2015/3/24.
 */
public class GameInfoIIServlet extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletOutputStream out_  = resp.getOutputStream();
        String sessionId = req.getParameter("sessionId");
        HttpSession session1 = MySessionContext.getSession(sessionId);

        /**获取敌方成员*/
        List<EnemyTeam> enemyTeamList =
                (List<EnemyTeam>) JSON.toObject((String) session1.getAttribute("enemy_team"), EnemyTeam.class);

        String return__ =  JSON.toJson(enemyTeamList);

        System.out.println("*****"+return__+"*****");

        out_.write(return__.getBytes("GBK"));
        out_.println();
        out_.close();
    }

}
