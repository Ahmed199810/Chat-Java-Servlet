/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Models.Category;
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
public class CategoryDao {
    
    Connection conn;
    
    
    public CategoryDao(Connection conn){
        this.conn = conn;
    }
    
    public List<Category> getAllCategories(){
        
        List<Category> list = new ArrayList<>();
        Category category = null;
        try {
            String query = "select * from categories";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                category = new Category();
                category.setId(rs.getInt(1));
                category.setName(rs.getString(2));
                category.setImg(rs.getString(3));
                category.setState(rs.getInt(4));
                list.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    
    
    
}
