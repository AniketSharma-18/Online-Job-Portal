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
        
    </head>
    
    <body>
                
        <%@include file="UserHeader.jsp" %>
        
        <form action="ProfilePicUpload.jsp" method="post" enctype="multipart/form-data">
        <div class="my_div col-lg-4" >
            
             <div class="profile_pic">
                <img src="images/contact-1-720x480.jpg" height="230px" width="250px" />
            </div>
            
            <!--
            
              <%
                    String status="not_seen";
                    int no=0;
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                       PreparedStatement ps=con.prepareStatement("select count(*) from SEND_SELECTION_CONFIRMATION where USER_EMAIL='"+email1+"' and STATUS='"+status+"'");
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

                <a href="UserNotification.jsp" class="company_notifications"> Notifications : <%= no %> </a>
            
        </div>-->
        </form>
        <div class=" col-lg-4 ">
           
            <div >
            <div class="menu_bar_placement col-lg-2">
            <ul>
                <li> <a href="index.jsp"> 
                        <img src="images/images (1).jpg" height="50px" width="50px" /> </a> </li>
                <li> <a href="userProfile.jsp"> Profile </a> 
                     <ul>
                        <li> <a href="EditUserProfile.jsp"> Edit Profile </a> </li>
                        
                    </ul>
                </li>
             <li> <a href="MyAppliedJobs.jsp"> My Applied Jobs </a></li>
                <li> <a href="UploadResume.jsp"> Upload Resume </a></li>
                   
            </ul>
            </div>
            
            <div class="user_details ">
            
              
            <t class="field">
                <h2> My INFO </h2> <br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <table class="my_info_div"> 
               <tr>
                   <td colspan="2"></td> 
               </tr>
                <tr>
                    <td class="my_info_div_heading"> Name : </td> 
                <td> <%= name1 %> </td>
                
            </tr>
            <tr>
                <td class="my_info_div_heading"> Gender : </td>
                <td> 
                    <%= gender1 %>
                </td>
            </tr>
            <tr>
                <td class="my_info_div_heading"> City : </td>
                <td> <%= city1 %> </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> Date_Of_Birth : </td>
                <td> <%= dob1 %> </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> 10th Percentage : </td>
                <td> <%= tenth_percentage1 %> </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> 12th Percentage : </td>
                <td> <%= twelth_percentage1 %> </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> Degree Percentage :  </td>
                <td> <%= degree_percentage1 %> </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> Branch :  </td>
                <td> <%= branch1 %> </td>
            </tr>
            <tr>
                <td class="my_info_div_heading"> About My Self :  </td>
                <td> <%= about_myself1 %> </td>
            </tr>
            <tr>
                <td class="my_info_div_heading">   </td>
                <td> <form action="EditUserProfile.jsp" method="post"> <input type="submit" name="editProfile" value="Edit Profile" /> </form> </td>
            </tr>
            </table>
            </t>
        </div>
        </div>
        </div>
            
            
            
        
<!--        <div class=" col-lg-4">
             <div class="adds_div">
                 ADDS
                 <marquee direction="left" style="padding:0px; background:none; height:215px;width: 230px; marging:5px;" >
                <span class="text">
        
                 <center><img src="images/adds.jpg"height="215" width="100%"></center></span></marquee>
                 <marquee direction="right" style="padding:0px; background:none; height:215px;width: 230px; marging:0px;" >
                 <span class="text">
                 <center><img src="images/adds2.jpg"height="215" width="100%"></center></span></marquee>
                 
            </div>
        </div>
        -->
        
    </body>
</html>
