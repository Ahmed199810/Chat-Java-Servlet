<%-- 
    Document   : users
    Created on : Feb 14, 2022, 4:06:11 PM
    Author     : Ahmed
--%>

<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.Dao.UserDao"%>
<%@page import="com.Models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    User user = (User) session.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available Users</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        
        <link rel="stylesheet" 
              href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body>
        
        <%@include file="components/navbar.jsp"%>

        <div class="container text-center text-white">
            
            <div>
                <h1>Select a User to Chat With</h1>
            </div>
            
            <div>
                    <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Photo</th>
                        <th scope="col">Full Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Chat</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                            if(user != null){
                                UserDao dao = new UserDao(DBConnect.getConn());
                                List<User> users = dao.getAllUsers();

                                for (User u : users){
                                    if(u.getId() == user.getId()){
                                        continue;
                                    }
                                    %>
                                    <tr>
                                        <th scope="row"><%= u.getId()%></th>
                                        <td>
                                            <img src="<%=u.getImg()%>" width="100" height="100" alt="alt"/>
                                        </td>
                                        <td><%= u.getFullName()%></td>
                                        <td><%= u.getEmail()%></td>
                                        <td>
                                            <div>
                                                <form action="ChatServlet" method="get">
                                                    <input type="hidden" name="user_id" value="<%=u.getId()%>" />
                                                    <input class="btn btn-dark btn-block" type="submit" value="Chat"/>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                }

                            }

                        %>
                    </tbody>
                </table>
                    
            </div>
            
        </div>
    </body>
</html>
