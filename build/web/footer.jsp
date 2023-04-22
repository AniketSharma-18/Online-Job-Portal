<%-- 
    Document   : footer
    Created on : May 10, 2014, 9:50:32 AM
    Author     : home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/UserLogin.css"/>
    </head>
    <body>
        
        <%
            String email111=(String)session.getAttribute("session_user_email");
            String name111=(String)session.getAttribute("session_user_name");
            String profile_pic111=(String)session.getAttribute("session_user_profile_pic");
        %>
        
        <div class="footer_division">
            
            <%
            if(email111==null)
            {
            %>
            
              <a href="UserLogin.jsp" class="footer_link1"> User Login </a>
              
              <a href="CompanyLogin.jsp" class="footer_link2" > Company Login </a>
            
            <%
            }
            else
            {
            %>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="userProfile.jsp" style=" text-decoration: none;" > 
                <img src="<%= profile_pic111 %>" height="30px" width="30px"/>
                <aaa style="color: white; font-size: 30px; font-weight: bold;"><%= name111 %></aaa>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <a href="Logout" style="color: red; text-decoration: none; float: right; margin-right: 200px;"> LOGOUT </a>
                
            
            
            <%
            }
            %>
            
            
            
            
        </div>
    </body>
</html>
