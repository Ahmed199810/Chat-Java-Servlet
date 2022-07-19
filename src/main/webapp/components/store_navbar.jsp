<%@page import="com.Models.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.Dao.CategoryDao"%>
<%@page import="com.Models.User"%>

<%
    CategoryDao categoryDao = new CategoryDao(DBConnect.getConn());
    List<Category> list = categoryDao.getAllCategories();
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            
            <%
                for(Category category : list){
                    
                    %>
                    
                    <li>
                        <a class="btn btn-dark" style="color: white;" href="products.jsp?category=<%=category.getId()%>">
                            <img src="<%=category.getImg()%>" width="100" height="100" />
                            <%=category.getName()%>
                        </a>
                    </li>
                    
                    <%
                    
                }
            
            %>
            
        </ul>
    </div>
      
</nav>