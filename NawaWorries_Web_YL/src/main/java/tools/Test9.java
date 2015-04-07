package tools;

/**
 * Created by tongxiqing on 2015/4/1.
 */
public class Test9 {
    public static void main(String[] args) {
        String s1 = "ab123" ;
        String s2 = new String( "ab123" ) ;
        System.out.println( s1 == s2 );
        String s3 = s2.intern() ;
        System.out.println( s1 == s3 ) ;
        System.out.println( s2 ) ;
        System.out.println( s3 ) ;
    }
}
