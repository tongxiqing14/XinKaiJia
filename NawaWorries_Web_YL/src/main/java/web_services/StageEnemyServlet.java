package web_services;

import common.MySessionContext;
import org.json.me.JSONArray;
import org.json.me.JSONException;
import org.json.me.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by tongxiqing on 2015/3/16.
 */
public class StageEnemyServlet extends HttpServlet {


    public String[][] enemyMotionPaths;

    public void init() throws ServletException {

        enemyMotionPaths = new String[][]{
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bat-5-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/clown-3-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/frogfish-2-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/horse-1-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/mouse-8-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/rabbit-4-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/tiger-6-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/tortoise-9-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/rabbit-4-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/tiger-6-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/mouse-8-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/horse-1-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/frogfish-2-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/clown-3-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bat-5-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/clown-3-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/frogfish-2-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/horse-1-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/mouse-8-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/tiger-6-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/rabbit-4-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/frogfish-2-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/clown-3-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/horse-1-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/mouse-8-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/tiger-6-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bat-5-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/frogfish-2-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/clown-3-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bat-5-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/frogfish-2-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/clown-3-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/mouse-8-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/horse-1-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/frogfish-2-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/horse-1-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/mouse-8-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/tiger-6-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/frogfish-2-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"}};

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletOutputStream out_  = resp.getOutputStream();
        String sessionId = req.getParameter("sessionId");
        HttpSession session1 = MySessionContext.getSession(sessionId);

        Integer selected_stage= Integer.valueOf((String) session1.getAttribute("selected_stage"));

        out_.write(saveStageInfo(enemyMotionPaths,selected_stage).getBytes("GBK"));
        out_.println();
        out_.close();

    }

    public String saveStageInfo(String[][] enemyMotionPaths,Integer selected_stage)
    {
        JSONArray jsonArray0 = new JSONArray();

        try {

            for(int h = 1; h < enemyMotionPaths.length; h++){
                if(selected_stage == h){
                    JSONObject jsonStage = new JSONObject();
                    JSONArray jsonArray = new JSONArray();
                    for (int i = 0; i < enemyMotionPaths[h].length; i++) {
                        jsonArray.put(enemyMotionPaths[h][i]);
                    }

                    jsonStage.put("ken", jsonArray);

                    jsonArray0.put(jsonStage);
                }
            }

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return  jsonArray0.toString();

    }

}
