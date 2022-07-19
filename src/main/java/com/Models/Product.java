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
public class Product {
    
    private int id;
    private String name;
    private String img;
    private int category;
    private float price;
    private int quantity;
    private int state;

    public Product() {
    }

    public Product(int id, String name, String img, int category, float price, int quantity, int state) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
    
    
    
    
    
}
