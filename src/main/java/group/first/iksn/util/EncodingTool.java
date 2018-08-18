package group.first.iksn.util;

import java.io.UnsupportedEncodingException;
/**
 *
 * 这是一个解决中文乱码的工具类
 */
public class EncodingTool {
    public static String encodeStr(String str) {
        try {
            return new String(str.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }
}
