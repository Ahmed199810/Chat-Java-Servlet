/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlets;

import com.Dao.UserDao;
import com.Db.DBConnect;
import com.Models.User;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ahmed
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userName = request.getParameter("username");
        String userPass = request.getParameter("password");
        
        UserDao userDao = new UserDao(DBConnect.getConn());
        
        User user = userDao.loginUser(userName, userPass);
        
        HttpSession session = request.getSession();
        
        if(user != null){
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        } else{
            session.setAttribute("fail-msg", "Invalid Email or Password");
            response.sendRedirect("login.jsp");
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
        rd.forward(req, resp);
    }
    
    



}
