<%@page import="com.Models.User"%>
<%
    
    User userNav = (User) session.getAttribute("user");
    
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
    <a class="navbar-brand" href="../chatapp"><i class="fa fa-comments" aria-hidden="true"></i>  Black Zone</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" style="color: white;" class="nav-link" href="../chatapp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"style="color: white;" class="nav-link" href="users.jsp">Available Users</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"style="color: white;" class="nav-link" href="profile.jsp">My Profile</a>
            </li>
            <%
                if(userNav != null){
                    if(userNav.getId() == 1){
                        %>
                            <li class="nav-item">
                                <a class="nav-link" style="color: white;" class="nav-link" href="admin.jsp">Personal Management</a>
                            </li>
                        <%
                    }
                    
                    %>
                    <li class="nav-item">
                        <a class="nav-link" style="color: white;" class="nav-link"href="LogoutServlet">Logout</a>
                    </li>
                    <%
                    
                }
            %>
        </ul>
    </div>
      
</nav>