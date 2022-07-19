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
public class Category {
    
    private int id;
    private String name;
    private String img;
    private int state;

    public Category() {
    }

    public Category(int id, String name, String img, int state) {
        this.id = id;
        this.name = name;
        this.img = img;
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    
    
    
    
}
