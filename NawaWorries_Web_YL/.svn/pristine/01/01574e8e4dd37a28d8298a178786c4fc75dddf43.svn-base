package web_services;

import common.MySessionContext;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by tongxiqing on 2015/2/4.
 */
public class ScreenToPageAction extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletOutputStream out_  = resp.getOutputStream();
//
        String sessionId = req.getParameter("sessionId");
//
        HttpSession session1 = MySessionContext.getSession(sessionId);

        session1.setAttribute("followingPage",req.getParameter("followingPage"));
//
        String return__ =  "{id:0,Result:0}";

        out_.write(return__.getBytes("GBK"));
        out_.println();
        out_.close();
    }


}
