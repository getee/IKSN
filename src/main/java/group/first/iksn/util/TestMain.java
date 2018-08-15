package group.first.iksn.util;

import java.io.File;
import java.util.Date;

public class TestMain {
    public static void main(String[] args) {
        //D:\AppSCM\IKSN\out\artifacts/resourcefile/2/99cc36d3d539b600385af78be850352ac65cb77c.jpg
        String filePath="s/resourcefile/2/99cc36d3d539b600385af78be850352ac65cb77c.jpg";
        int a=filePath.lastIndexOf("resourcefile/");
        System.out.println(a);
        filePath=filePath.substring(a);
        System.out.println(filePath);
    }
}
