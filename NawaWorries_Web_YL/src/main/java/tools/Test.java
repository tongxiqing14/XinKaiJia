package tools;

import java.util.Random;

/**
 * Created by tongxiqing on 2015/3/5.
 */
public class Test {

    public static void main(String[] args) {

        System.out.println((char)('a'+1));

        System.out.println("titles/shadow_monster/"+((char)('a'+1))+".png");

        Random r = new Random();
        int n2 = r.nextInt(2);
        System.out.println(n2);
    }

}
