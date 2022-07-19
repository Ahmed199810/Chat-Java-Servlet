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

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userName = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String userPass = request.getParameter("password");
        
        HttpSession session = request.getSession();
        
        if(userName.equals("") || fullName.equals("") || email.equals("") || userPass.equals("")) {
            session.setAttribute("fail-msg", "Please Enter All Required Fields");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            //response.sendRedirect("register.jsp");
            return;
        }
        
        UserDao userDao = new UserDao(DBConnect.getConn());
        
        User user = new User();
        user.setUser(userName);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(userPass);
        
        boolean b = userDao.createUser(user);

        if(b) {
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        } else {
            session.setAttribute("fail-msg", "Invalid Email or Password");
            response.sendRedirect("register.jsp");
        }
        
    }
    
}
