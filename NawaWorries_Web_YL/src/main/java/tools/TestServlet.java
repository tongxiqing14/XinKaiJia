package tools;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by tongxiqing on 2015/4/1.
 */
public class TestServlet extends HttpServlet {

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getParameter("sessionId");
        ServletOutputStream out_  = resp.getOutputStream();

        System.out.println(req.getParameter("testStr")+"***");

        out_.write("[{id:0,name:''}]".getBytes("GBK"));
        out_.println();
        out_.close();
    }


}
