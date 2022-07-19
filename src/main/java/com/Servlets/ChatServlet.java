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
@WebServlet(name = "ChatServlet", urlPatterns = {"/ChatServlet"})
public class ChatServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int chatWithId = Integer.parseInt(request.getParameter("user_id").toString());
        
        UserDao dao = new UserDao(DBConnect.getConn());
        User chatUser = dao.getUserById(chatWithId);
        
        HttpSession session = request.getSession();
        session.setAttribute("chatuser", chatUser);
        
        response.sendRedirect("chat.jsp");
        
    }

}
