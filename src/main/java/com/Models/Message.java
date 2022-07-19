/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Models;

/**
 *
 * @author Ahmed
 */
public class Message {
    
    private int id;
    private int from_id;
    private int to_id;
    private String msg;
    private String date_time;
    private int session;

    
    public Message(){
        
    }

    public Message(int id, int from_id, int to_id, String msg, String date_time, int session) {
        this.id = id;
        this.from_id = from_id;
        this.to_id = to_id;
        this.msg = msg;
        this.date_time = date_time;
        this.session = session;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFrom_id() {
        return from_id;
    }

    public void setFrom_id(int from_id) {
        this.from_id = from_id;
    }

    public int getTo_id() {
        return to_id;
    }

    public void setTo_id(int to_id) {
        this.to_id = to_id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getDate_time() {
        return date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }

    public int getSession() {
        return session;
    }

    public void setSession(int session) {
        this.session = session;
    }
    
    

    @Override
    public String toString() {
        return "{" + "\"id\":" + id + ", \"from_id\":" + from_id + ", \"to_id\":" + to_id + ", \"msg\":" + "\"" + msg + "\""+ ", \"date_time\":" +"\""+ date_time +"\"" + ", \"session\":" + session + "}";
    }
    
}
