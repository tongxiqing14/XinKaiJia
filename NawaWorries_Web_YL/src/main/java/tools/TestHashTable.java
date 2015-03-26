package tools;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;

/**
 * Created by tongxiqing on 2015/3/25.
 */
public class TestHashTable {

    public static void main(String[] args){
        Hashtable heroHphashtable = new Hashtable();
        heroHphashtable.put(0,11);
        heroHphashtable.put(1,12);
        heroHphashtable.put(2,13);
        heroHphashtable.put(3,14);

        for(Enumeration it   =   heroHphashtable.keys();   it.hasMoreElements();   )   {
            //从ht中取
            Integer   key   =   (Integer)   it.nextElement();
            Object   value   =   heroHphashtable.get(key);

            System.out.println(key);
            System.out.println(value);
            //放进hm中
//            hm.put(key, value);
        }

//        for(Iterator it   =   heroHphashtable.keySet().iterator();   it.hasNext();   )   {
//            //从ht中取
//            Integer   key   =   (Integer)   it.next();
//            Object   value   =   heroHphashtable.get(key);
//
//            System.out.println(key);
//            System.out.println(value);
//            //放进hm中
////            hm.put(key, value);
//        }
//
//        for(Iterator it   =   heroHphashtable.keySet().iterator();   it.hasNext();   )   {
//            //从ht中取
//            Integer   key   =   (Integer)   it.next();
//            Object   value   =   heroHphashtable.get(key);
//
//            System.out.println(key);
//            System.out.println(value);
//            //放进hm中
////            hm.put(key, value);
//        }

        int count = 0;
//        heroHphashtable.

//        for(int i=0; i<heroHphashtable.size(); i++){
//           heroHphashtable.keySet().iterator().hasNext();
//        }

//        for(int i=0; i<heroHphashtable.size(); i++){
//            Integer keys = (Integer) heroHphashtable.keySet().iterator().next();
//            System.out.println(keys);
//        }

//        while (heroHphashtable.keys().hasMoreElements()){
//            Integer v = (Integer) heroHphashtable.elements().nextElement();
//            Integer keys = (Integer) heroHphashtable.keys().nextElement();
//            System.out.println(v);
//            System.out.println(keys);
//            v = new Integer((v.intValue() - (5/100)*v.intValue()));
////            heroHphashtable.put(heroHphashtable.keys().nextElement(),v);
//            count++;
//
////            System.out.println(v);
//            if(count>=4) break;
//        }
    }
}

