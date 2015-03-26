package web_services;

import beans.FighterBean;
import beans.FighterHpDown;
import beans.FighterHpDownII;
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

        List<FighterHpDownII> fighterHpDownIIs = (List<FighterHpDownII>) session1.getAttribute("fighterHpDowns");

        String return__ =  JSON.toJson("");

        out_.write(return__.getBytes("GBK"));
        out_.println();
        out_.close();
    }

}
