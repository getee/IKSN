package group.first.iksn.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class Responser {
    public  static  void   responseToJson(HttpServletResponse response, HttpServletRequest request, String jsonText) throws Exception {
        response.setContentType("text/json;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.write(jsonText);
        out.flush();
        out.close();
    }
}
