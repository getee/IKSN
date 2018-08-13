package group.first.iksn.util;

public class TestMain {
    public static void main(String[] args) {

        String rootPath="D:\\AppSCM\\IKSN\\out\\artifacts\\IKSN_war_exploded\\";
        rootPath=rootPath.substring(0,rootPath.lastIndexOf('\\'));
        String filepath=rootPath.substring(0,rootPath.lastIndexOf('\\'))+"/resource/";

        System.out.println("rootPath:" + rootPath);
        System.out.println("path:" + filepath);
    }
}
