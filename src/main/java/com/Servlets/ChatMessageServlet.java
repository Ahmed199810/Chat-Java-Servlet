/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlets;

import com.Dao.MessageDao;
import com.Db.DBConnect;
import com.Models.Message;
import com.google.gson.Gson;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author Ahmed
 */

@ServerEndpoint("/messages/{sessionId}")
public class ChatMessageServlet  {
    
    
    private static Set<Session> userSessions = Collections.newSetFromMap(new ConcurrentHashMap<Session, Boolean>());
    
    @OnOpen
    public void onOpen(@PathParam("sessionId") final int sessinId, Session curSession)
    {
        System.out.println("SES ID : " + sessinId);
        curSession.getUserProperties().put("session", sessinId);
        userSessions.add(curSession);
    }
            
    @OnClose
    public void onClose(Session curSession)
    {
        userSessions.remove(curSession);
    }
    
    @OnMessage
    public void onMessage(String message, Session userSession)
    {
        boolean isSent = false;
        for(Session ses : userSessions)
        {
            Gson g = new Gson();
            Message msg = g.fromJson(message, Message.class);
            System.out.println("SES ID 222 : " + msg.getSession() + "   TTTTTT : " + ses.getUserProperties().get("session"));

            if(!(ses.getUserProperties().get("session").equals(msg.getSession()))){
                System.out.println("NOOOOOOOOOOOOOOOOOO M");
                continue;
            }
            
            java.util.Date today = new java.util.Date();
            Timestamp ts = new java.sql.Timestamp(today.getTime());
            msg.setDate_time(ts.toString());
            
            ses.getAsyncRemote().sendText(msg.toString());
            if(!isSent){
                isSent = true;
                MessageDao dao = new MessageDao(DBConnect.getConn());
                boolean sent = dao.sendMessage(msg.getFrom_id(), msg.getTo_id(), msg.getMsg(), msg.getSession());
            }
            
        }
    }
    
}
