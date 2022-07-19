/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Models.Product;
import com.Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author Ahmed
 */
public class ProductDao {
    
    Connection conn;

    public ProductDao(Connection conn){
        this.conn = conn;
    }
    
    public List<Product> getProductsByCategory(int id){
        
        List<Product> list = new ArrayList<>();
        Product product = null;
        try {
            String query = "select * from products where category=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setImg(rs.getString(3));
                product.setCategory(rs.getInt(4));
                product.setPrice(rs.getFloat(5));
                product.setQuantity(rs.getInt(6));
                product.setState(rs.getInt(7));
                list.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    
    public List<Product> getAllProducts(){
        
        List<Product> list = new ArrayList<>();
        Product product = null;
        try {
            String query = "select * from products";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setImg(rs.getString(3));
                product.setCategory(rs.getInt(4));
                product.setPrice(rs.getFloat(5));
                product.setQuantity(rs.getInt(6));
                product.setState(rs.getInt(7));
                list.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    
    
    public boolean createManyProo(){
    
        try{
            String query = "insert into products (name, img, category, price, quantity) values (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            Random random = new Random();
            for (int i = 0; i < 10; i++){
                int cat = random.nextInt(4);
                ps.setString(1, "Product " + random.nextInt(100));
                ps.setString(2, "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_450,h_450/global/387769/02/sv01/fnd/IND/fmt/png");
                ps.setInt(3, cat == 0 ? 1 : cat);
                ps.setFloat(4, (52.5f + cat * i));
                ps.setInt(5, 1);
                int result = ps.executeUpdate();

            }
            
            return true;
            
        }catch(Exception ex){
            return false;
        }
    }
    
    
    
    
}
