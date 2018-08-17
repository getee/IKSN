package group.first.iksn.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 获取本地时间
 */
public class LocalTime {
    public static String getNowTime(){
        Date d = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=df.format(d);
        return time;
    }
}
