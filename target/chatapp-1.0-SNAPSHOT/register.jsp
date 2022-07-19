<%-- 
    Document   : login
    Created on : Feb 13, 2022, 4:43:41 PM
    Author     : Ahmed
--%>

<%@page import="com.Models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    User user = (User) session.getAttribute("user");
    if(user != null){
        response.sendRedirect("/chatapp");
    }
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css" />

    </head>
    <body>
        
        <div class="container">
            
            <div class="row">
                
                <div class="col-sm-4">
                    
                </div>
                
                <div class="col-sm-4 text-center">
                    
                    <div class="login-card">
                        <h1>Register</h1>
                        <br/>
                        <%  

                            String failMsg = (String) session.getAttribute("fail-msg");
                            if(failMsg != null){
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <%=failMsg %>
                                </div>
                                <%
                                session.removeAttribute("fail-msg");
                            }

                        %>
                        <form method="post" action="RegisterServlet">

                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="User Name" name="username"/>
                            </div>
                            <br/>
                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="Full Name" name="fullname"/>
                            </div>
                            <br/>
                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="Email" name="email"/>
                            </div>
                            <br/>
                            <div class="form-group">
                                <input class="form-control" type="password" placeholder="Password" name="password"/>
                            </div>
                            <br/>
                            <input class="btn btn-dark badge-pill btn-block" type="submit" value="Register"/>
                        </form>
                    </div>
                        
                </div>
                
                <div class="col-sm-4">
                    
                </div>
                
            </div>
            
            
        </div>
        
    </body>
</html>