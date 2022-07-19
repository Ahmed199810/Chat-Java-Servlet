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
public class ChatSession {
    
    int id;
    int from_id;
    int to_id;
    int session;

    public ChatSession() {
    }

    public ChatSession(int id, int from_id, int to_id, int session) {
        this.id = id;
        this.from_id = from_id;
        this.to_id = to_id;
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

    public int getSession() {
        return session;
    }

    public void setSession(int session) {
        this.session = session;
    }
    
}
