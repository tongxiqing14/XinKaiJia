package tools;

import org.json.me.JSONArray;
import org.json.me.JSONException;
import org.json.me.JSONObject;

/**
 * Created by tongxiqing on 2015/3/16.
 */
public class Test8 {

    public static void main(String[] args) {

        String[][] enemyMotionPaths = new String[][]{
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"},
                {"/hero/red/red_h.anu","/follow/left/2/left_atack_2_h.anu","/hero/blue/blue_h.anu","/follow/left/1/renwu_huonv_h.anu","/pets1/left/bird-7-h.anu"}};

        System.out.println(saveStageInfo(enemyMotionPaths, 1));
    }


    public static String saveStageInfo(String[][] enemyMotionPaths, int stage)
    {
        JSONArray jsonArray0 = new JSONArray();

        try {

            for(int h = 1; h < enemyMotionPaths.length; h++){
                if(stage == h){
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
