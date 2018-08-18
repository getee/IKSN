
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TestMain {
    public static void main(String[] args) throws ParseException {
//        //D:\AppSCM\IKSN\out\artifacts/resourcefile/2/99cc36d3d539b600385af78be850352ac65cb77c.jpg
//        String filePath="s/resourcefile/2/99cc36d3d539b600385af78be850352ac65cb77c.jpg";
//        int a=filePath.lastIndexOf("resourcefile/");
//        filePath=filePath.substring(a);
//        System.out.println(filePath);
//
//        filePath=filePath.substring(filePath.lastIndexOf("."));//取扩展名
//        System.out.println(filePath);
//        filePath=""+new Date().getTime()+filePath;
//        System.out.println(filePath);
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date  d = df.parse("2011-10-12 00:12:12");

        Calendar cal=Calendar.getInstance();

        cal.setTime(d);

        cal.add(Calendar.HOUR, -1);  //减1天

        System.out.println(df.format(cal.getTime()));

    }
}
