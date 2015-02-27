package tools;

import java.util.ArrayList;
import java.util.List;

import com.fancyy.json.pojo.User;
import com.fancyy.json.util.JSON;
import org.json.me.JSONArray;
import org.json.me.JSONException;

public class Test5 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<User> users = new ArrayList<User>();
		for (int i = 0; i < 3; i++) {
			User user = new User();
			user.setId(i);
			user.setName("Fancyy_" + i);
			user.setPwd("FancyyPwd_" + i);
			users.add(user);
		}
		String json = JSON.toJson(users);
		System.out.println(JSON.format(json));

        try {
            JSONArray jsonArray = new JSONArray(json);
            System.out.println(jsonArray.getJSONObject(0).get("name"));

            for(int i=0; i<jsonArray.length(); i++){
               if(jsonArray.getJSONObject(i).get("name").equals("Fancyy_1")){
                      System.out.println(jsonArray.getJSONObject(i).get("pwd"));
               }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

}
