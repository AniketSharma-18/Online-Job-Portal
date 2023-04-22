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
            String cemail1=(String)session.getAttribute("session_cemail");
            String cname1=(String)session.getAttribute("session_cname");
            String company_pic=(String)session.getAttribute("session_company_pic");
            String ccity1=(String)session.getAttribute("session_ccity");
        %>
        
        <div class="header1">
            <div class="header_logo">
               Interview Scan
            </div>  <br/>
            
            <%
            if(cemail1==null)
            {
            %>
            
              <form action="CompanyLogin" method="post">
                <div class="header_login">
                    <input type="text" name="ccemail" placeholder="Enter Username...." class="textfield_design" />
                    <input type="password" name="ccpassword" placeholder="Enter Password...." class="textfield_design" />
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
            <a href="companyProfile.jsp" style=" text-decoration: none;" > 
                <img src="<%= company_pic %>" height="50px" width="50px"/>
                <aaa style="color: white; font-size: 30px; font-weight: bold;"><%= cname1 %></aaa>
            </a> 
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
