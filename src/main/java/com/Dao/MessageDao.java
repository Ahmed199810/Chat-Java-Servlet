/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Models.Message;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ahmed
 */
public class MessageDao {
    
    Connection conn;

    public MessageDao(Connection conn){
        this.conn = conn;
    }
    
    public List<Message> getUserMessages(int from, int to){
        
        List<Message> list = new ArrayList<>();
        Message message = null;
        try {
            String query = "select * from messages where (from_id=? and to_id =?) or (from_id=? and to_id=?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, from);
            ps.setInt(2, to);
            ps.setInt(3, to);
            ps.setInt(4, from);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                message = new Message();
                message.setId(rs.getInt(1));
                message.setFrom_id(rs.getInt(2));
                message.setTo_id(rs.getInt(3));
                message.setMsg(rs.getString(4));
                message.setDate_time(rs.getString(5));
                message.setSession(rs.getInt(6));
                list.add(message);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean sendMessage(int from, int to, String msg, int session){
        
        try{
            String query = "insert into messages (from_id, to_id, msg, session) values (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, from);
            ps.setInt(2, to);
            ps.setString(3, msg);
            ps.setInt(4, session);
            
            int result = ps.executeUpdate();
            if (result == 1){
                return true;
            }else{
                return false;
            }
            
        }catch(Exception ex){
            return false;
        }
        
    }
    
}
