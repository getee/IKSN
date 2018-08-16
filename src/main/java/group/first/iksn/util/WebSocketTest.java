package group.first.iksn.util;

import group.first.iksn.model.bean.WebChat;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint("/websocket/{fromid}")
public class WebSocketTest {
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static CopyOnWriteArraySet<WebSocketTest> webSocketSet = new CopyOnWriteArraySet<WebSocketTest>();
    private  static ConcurrentHashMap<String,WebSocketTest> wesocketMap=new ConcurrentHashMap<>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    private String fromid;
    private WebChat webChat;

    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("fromid") String fromid){
        this.session = session;
        this.fromid=fromid;
        webSocketSet.add(this);//加入set中
        wesocketMap.put(fromid,this);
        addOnlineCount();           //在线数加1
        System.out.println("from:"+fromid);
        System.out.println("有新连接"+fromid+"加入！当前在线人数为" + getOnlineCount());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);  //从set中删除
        wesocketMap.remove(fromid);
        subOnlineCount();           //在线数减1
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     * @param mysession 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session mysession) {
        ObjectMapper objectMapper=new ObjectMapper();
        try {
             webChat=objectMapper.readValue(message,WebChat.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("来自客户端"+fromid+"的消息:" + message);
        //群发消息
       /* for(WebSocketTest item: webSocketSet){
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
        }*/
            try {
                if(wesocketMap.containsKey(webChat.getToid())){
                    JSONObject jsonObject=new JSONObject();
                    Date d = new Date();
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    jsonObject.put("fromid",fromid);
                    jsonObject.put("toid",webChat.getToid());
                    jsonObject.put("content",webChat.getContent());
                    jsonObject.put("time",df.format(d));
                    wesocketMap.get(webChat.getToid()).session.getBasicRemote().sendText(jsonObject.toString());
                    System.out.println("服务器转发给"+webChat.getToid());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

    }

    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     * @param message
     * @throws IOException
     */
    public void sendAllMessage(String message) throws IOException{
        this.session.getBasicRemote().sendText(message);
        //this.session.getAsyncRemote().sendText(message);
    }
    //定向发送信息
    public void sendMessage(Session mySession,String message) throws IOException {
        synchronized (this) {
            try {
                if (mySession.isOpen()) {//该session如果已被删除，则不执行发送请求，防止报错
                    //this.session.getBasicRemote().sendText(message);
                    mySession.getBasicRemote().sendText(message);
                }
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }

    }


        public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketTest.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketTest.onlineCount--;
    }
}
