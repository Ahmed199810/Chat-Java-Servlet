<%-- 
    Document   : products
    Created on : Feb 17, 2022, 12:12:21 AM
    Author     : Ahmed
--%>

<%@page import="com.Models.Product"%>
<%@page import="com.Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ProductDao proDao = new ProductDao(DBConnect.getConn());
    Integer categoryId = Integer.parseInt(request.getParameter("category"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        
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
        <%@include file="components/store_navbar.jsp"%>

        <div class="container text-center">
            
            <div class="row">
                
                <%
                    List<Product> products = proDao.getProductsByCategory(categoryId);
                    for(Product product : products){
                        %>
                            <div class="col text-center">
                                <div class="card" style="width: 20rem; height: 30rem; margin: 0px auto 20px auto;">
                                    <img class="card-img-top" src="<%=product.getImg()%>">
                                    <div class="card-body">
                                        <h5 class="card-title"><%=product.getName()%></h5>
                                        <p class="card-text"><%=product.getPrice()%> USD</p>
                                        <a href="#" class="btn btn-primary">Preview</a>
                                    </div>
                                </div>
                            </div>
                        <%
                    }
                %>
            
            </div>
            
            
        </div>
        
    </body>
</html>
