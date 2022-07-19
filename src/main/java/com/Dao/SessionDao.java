/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Models.ChatSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

/**
 *
 * @author Ahmed
 */
public class SessionDao {
    
    Connection conn;

    public SessionDao(Connection conn){
        this.conn = conn;
    }
    
    public ChatSession getSession(int from_id, int to_id){
        ChatSession session = null;
        
        try {
            String query = "select * from sessions where (from_id=? and to_id=?) or (from_id=? and to_id=?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, from_id);
            ps.setInt(2, to_id);
            ps.setInt(3, to_id);
            ps.setInt(4, from_id);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                session = new ChatSession(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                );
            } else {
                Random rand = new Random();
                int s = rand.nextInt(1000000);
                // create new session
                String queryCreate = "insert into sessions (from_id, to_id, session) values (?, ?, ?)";
                ps = conn.prepareStatement(queryCreate);
                ps.setInt(1, from_id);
                ps.setInt(2, to_id);
                ps.setInt(3, s);
                
                int result = ps.executeUpdate();
                if (result == 1){
                    session = new ChatSession();
                    session.setFrom_id(from_id);
                    session.setTo_id(to_id);
                    session.setSession(s);
                }else{
                    
                }
            }
            
        } catch (SQLException ex) {
            return session;
        }
        
        return session;
    }
    
}
