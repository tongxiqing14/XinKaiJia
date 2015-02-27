package transitServlet;

import iptvNet.NetHander;
import service.InfoTransition;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created with IntelliJ IDEA.
 * User: tongxiqing
 * Date: 14-9-2
 * Time: ����9:49
 * To change this template use File | Settings | File Templates.
 */
public class TeamToGameServlet extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession httpSession = req.getSession();

        Integer selected_stage= Integer.valueOf((String) httpSession.getAttribute("selected_stage"));

        req.getSession().setAttribute("enemy_team", InfoTransition.setEnemyTeam(selected_stage));

        PrintWriter out = resp.getWriter();

        out.println("[{id:0,name:''}]");
        out.close();
    }
}

