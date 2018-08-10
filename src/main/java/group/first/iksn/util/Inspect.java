package group.first.iksn.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Inspect {

    /**
     * 计算文件的MD5码
     * @param file
     * @return
     */
    public static String getMD5(File file) {
        FileInputStream fis = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            fis = new FileInputStream(file);
            byte[] buffer = new byte[8192];//一次性读取字节数0.8M
            int length = -1;
            System.out.println("开始算");
            while ((length = fis.read(buffer)) != -1) {
                md.update(buffer, 0, length);
            }
            System.out.println("算完了");
            return bytesToString(md.digest());
        } catch (IOException ex) {
            //Logger.getLogger(MD5Util.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            return null;
        } catch (NoSuchAlgorithmException ex) {
            //Logger.getLogger(MD5Util.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            return null;
        } finally {
            try {
                fis.close();
            } catch (IOException ex) {
                //Logger.getLogger(MD5Util.class.getName()).log(Level.SEVERE, null, ex);
                ex.printStackTrace();
            }
        }
    }

    /**
     * 得到文件的SHA码,用于校验
     * @param file
     * @return
     */
    public static String getSHA(File file) {
        FileInputStream fis = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA");
            fis = new FileInputStream(file);
            byte[] buffer = new byte[8192];
            int length = -1;
            System.out.println("开始算");
            while ((length = fis.read(buffer)) != -1) {
                md.update(buffer, 0, length);
            }
            System.out.println("算完了");
            return bytesToString(md.digest());
        } catch (IOException ex) {
            //Logger.getLogger(MD5Util.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            return null;
        } catch (NoSuchAlgorithmException ex) {
            //Logger.getLogger(MD5Util.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            return null;
        } finally {
            try {
                fis.close();
            } catch (IOException ex) {
                //Logger.getLogger(MD5Util.class.getName()).log(Level.SEVERE, null, ex);
                ex.printStackTrace();
            }
        }
    }
    public static String bytesToString(byte[] b) {
        StringBuffer result = new StringBuffer("");
        int length = b.length;
        for (int i=0; i<length; i++) {
            result.append(String.valueOf(b[i]));
        }
        return result.toString();
    }
}
