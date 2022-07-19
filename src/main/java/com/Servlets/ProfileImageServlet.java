/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Servlets;

import com.Dao.UserDao;
import com.Db.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Ahmed
 */
@WebServlet(name = "ProfileImageServlet", urlPatterns = {"/ProfileImageServlet"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class ProfileImageServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int userId = Integer.parseInt(request.getParameter("user_id").toString());
        
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        UserDao dao = new UserDao(DBConnect.getConn());
        for (Part part : request.getParts()) {
            String path = System.getProperty("user.dir");
            System.out.println("PPPPPPPPPPPPPPPP : " + path);
            String uploadPath = path + "\\fileuploads\\" + "_DT_" + System.currentTimeMillis() + fileName;
            part.write(uploadPath);
            dao.uploadUserImage(userId, uploadPath);
        }
        
        response.sendRedirect("profile.jsp");
    }


}
