<%-- 
    Document   : profile
    Created on : Apr 2, 2014, 3:36:38 PM
    Author     : home
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/profile.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    
    <body>
        
        
        <%@include file="CompanyHeader.jsp" %>
        
        <form action="CompanyImageUpload.jsp" method="post" enctype="multipart/form-data">
        <div class="main_left_division">
            <div class="profile_pic">
                <img src="<%= company_pic %>" height="230px" width="250px" />
            </div>
            
              <input type="file" name="browse" style="float: right; margin-right: 30px; margin-top: 20px;" />
            <input type="submit" value="Upload Profile Pic" class="upload_profile_button"/>
            
            <%
                    String status="not_seen";
                    int no=0;
                    try
                    {
                       Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                       PreparedStatement ps=con.prepareStatement("select count(*) from APPLY_JOBS_COMPANY where COMPANY_EMAIL='"+cemail1+"' and STATUS='"+status+"'");
                       ResultSet rs=ps.executeQuery();
                       while(rs.next())
                       {
                           no=rs.getInt(1);
                       }
                    }
                    catch(Exception e)
                                                       {
                        out.print(e);
                    }

                %>

                <a href="CompanyNotification.jsp" class="company_notifications"> Notifications : <%= no %> </a>
            
        </div>
        </form>
        <div class="main_center_division">
            <div class="menu_bar_placement">
            <ul>
                <li> <a href="companyProfile.jsp"> Profile </a> 
                     <ul>
                        <li> <a href="EditCompanyProfile.jsp"> Edit Profile </a> </li>
                        
                    </ul>
                </li>
             <li> <a href="PostJobs.jsp"> Post Jobs </a></li>
                <li> <a href="ContactUs.jsp"> Contact Us </a></li>
                    <li> <a href="AboutUs.jsp"> About Us </a></li>
            </ul>
        </div>
            
            <div class="user_details">
            
              <form action="UpdateCompanyProfile" method="post">
            <t class="field">
                <h2> Company INFO </h2> <br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <table class="my_info_div"> 
               <tr>
                   <td colspan="2"></td> 
               </tr>
                <tr>
                    <td class="my_info_div_heading"> Name : </td> 
                    <td> <input type="text" name="cname1" value="<%= cname1 %>" class="job_updates_textfiled" /> </td>
                
            </tr>
            
            <tr>
                <td class="my_info_div_heading"> Location : </td>
                <td> <input type="text" name="ccity1" value="<%= ccity1 %>" class="job_updates_textfiled" />  </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading">   </td>
                <td>  <input type="submit" name="editProfile" value="Update Company Profile" />  </td>
            </tr>
            </table>
            </t>
            </form>
        </div>
        </div>
            
            
            
        
        <div class="main_right_division">
             <div class="adds_div">
                 ADDS
                 <marquee direction="left" style="padding:0px; background:none; height:215px;width: 230px; marging:5px;" >
                <span class="text">
        
                 <center><img src="images/Bal-Krishna.jpg"height="215" width="100%"></center></span></marquee>
                 <marquee direction="right" style="padding:0px; background:none; height:215px;width: 230px; marging:0px;" >
                 <span class="text">
                 <center><img src="images/Sad-Shayari-SMS-300x224.jpg"height="215" width="100%"></center></span></marquee>
                 
            </div>
        </div>
        
        
    </body>
</html>
