<%-- 
    Document   : UserHeader
    Created on : May 10, 2014, 9:49:28 AM
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
            String email1=(String)session.getAttribute("session_user_email");
            String name1=(String)session.getAttribute("session_user_name");
            String profile_pic=(String)session.getAttribute("session_user_profile_pic");
            String gender1=(String)session.getAttribute("session_user_gender");
            String city1=(String)session.getAttribute("session_user_city");
            String dob1=(String)session.getAttribute("session_user_dob");
            String tenth_percentage1=(String)session.getAttribute("session_user_tenth_percentage");
            String twelth_percentage1=(String)session.getAttribute("session_user_twelth_percentage");
            String degree_percentage1=(String)session.getAttribute("session_user_degree_percentage");
            String branch1=(String)session.getAttribute("session_user_branch");
            String about_myself1=(String)session.getAttribute("session_user_about_myself");
        %>
        
        <div class="header1">
            <div class="header_logo">
               Interview Scan
            </div>  
            <br/>
            
            <%
            if(email1==null)
            {
            %>
            
              <form action="UserLogin" method="post">
                <div class="header_login">
                    <input type="text" name="uuemail" placeholder="Enter Username...." class="textfield_design" />
                    <input type="password" name="uupassword" placeholder="Enter Password...." class="textfield_design" />
                    <input type="submit" value="LOGIN" class="button_design" />
                </div>   
              </form>
            
            <%
            }
            else
            {
            %>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="userProfile.jsp" style=" text-decoration: none;" > 
                <img src="<%= profile_pic %>" height="50px" width="50px"/>
                <aaa style="color: white; font-size: 30px; font-weight: bold;"><%= name1 %></aaa>
                
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
