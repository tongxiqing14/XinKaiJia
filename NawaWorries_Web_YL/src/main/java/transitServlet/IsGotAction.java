package transitServlet;

import beans.FighterBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: tongxiqing
 * Date: 14-10-28
 * Time: ����9:16
 * To change this template use File | Settings | File Templates.
 */
public class IsGotAction extends HttpServlet {

    private final String[] fighter_name_array = new String[]{"������׷�","���������Ԓ���","������������","�������������","��������������˹","�������������","��������������˹","����ķ��","����������","����Ϭţ��","�����������","�����Ǵ���","����˫��սʿ","�����������","�����Ѫսħ","����¹�Ǵ���","����޴�սʿ","����Ŭ������","����ٱ��Ů"};

    public void init() throws ServletException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if(req.getParameter("preScreen")!=null&&req.getParameter("preScreen").equals("is_got__")){
            String item_index = req.getParameter("item_index");
//            String grouptype = req.getParameter("grouptype");

            HttpSession httpSession = req.getSession();

            /**��ȡ fighter list*/
            List<FighterBean> fighterList = (List<FighterBean>) httpSession.getAttribute("_FighterData");

//            List<FighterBean> fighterList_got = new ArrayList<FighterBean>();
            for (FighterBean fighterBean : fighterList){
                if(fighterBean.getFighter_id()==Integer.valueOf(item_index)){
                    PrintWriter out = resp.getWriter();
//                    if(fighterList_got.get(Integer.valueOf(item_index))==null) {
//                        out.println("[{id:1000,result:10000,fighter_id:"+fighterBean.getFighter_id()+"}]");
//                        out.close();
//                    }else {
                    if(fighterBean.isGot_flag()>0){ /**�Ѿ�����*/
                        out.println("[{id:0,result:0,fighter_id:"+fighterBean.getFighter_id()+"}]");
                        out.close();
                    }else {
                        out.println("[{id:1,result:1,fighter_id:"+fighterBean.getFighter_id()+"}]");
                        out.close();
                    }
//                    }
                }
            }

        } else {
            String item_index = req.getParameter("item_index");
            String grouptype = req.getParameter("grouptype");

            HttpSession httpSession = req.getSession();

            /**��ȡ fighter list*/
            List<FighterBean> fighterList = (List<FighterBean>) httpSession.getAttribute("_FighterData");

            List<FighterBean> fighterList_got = new ArrayList<FighterBean>();
            for (FighterBean fighterBean : fighterList){
                if(!fighterBean.isSelect_flag()&&fighterBean.getType()==Integer.valueOf(grouptype))  fighterList_got.add(fighterBean);
            }

            PrintWriter out = resp.getWriter();
            if(fighterList_got.get(Integer.valueOf(item_index))==null) {
                out.println("[{id:1000,result:10000,fighter_id:"+fighterList_got.get(Integer.valueOf(item_index)).getFighter_id()+"}]");
                out.close();
            }else {
                if(fighterList_got.get(Integer.valueOf(item_index)).isGot_flag()>0){ /**�Ѿ�����*/
                    out.println("[{id:0,result:0,fighter_id:"+fighterList_got.get(Integer.valueOf(item_index)).getFighter_id()+"}]");
                    out.close();
                }else {
                    out.println("[{id:1,result:1,fighter_id:"+fighterList_got.get(Integer.valueOf(item_index)).getFighter_id()+"}]");
                    out.close();
                }
            }
        }

    }

}
