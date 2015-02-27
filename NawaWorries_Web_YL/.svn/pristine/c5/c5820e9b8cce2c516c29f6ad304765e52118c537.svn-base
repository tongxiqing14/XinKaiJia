package transitServlet;

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
 * Date: 14-9-16
 * Time: ÏÂÎç7:26
 * To change this template use File | Settings | File Templates.
 */
public class Backpack2BackpackAction extends HttpServlet {
    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String selectIndex_x = req.getParameter("selectIndex_x");
        String selectIndex_y = req.getParameter("selectIndex_y");

        HttpSession httpSession = req.getSession();
        httpSession.setAttribute("backpack_selectIndex_x",selectIndex_x);
        httpSession.setAttribute("backpack_selectIndex_y",selectIndex_y);

        PrintWriter out = resp.getWriter();

        out.println("[{id:0,name:''}]");
        out.close();
    }
}
