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
        <div class="main_left_division">
            <div class="profile_pic">
                <img src="<%= profile_pic %>" height="230px" width="250px" />
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
            
        </div>
        </form>
        <div class="main_center_division">
            <div class="menu_bar_placement">
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
            
            <div class="user_details">
            
             
                 <form action="UpdateProfile" method="post">
            <t class="field">
                <h2> My INFO </h2> <br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <table class="my_info_div"> 
               <tr>
                   <td colspan="2"></td> 
               </tr>
                <tr>
                    <td class="my_info_div_heading"> Name : </td> 
                    <td> <input type="text" name="uname1" value="<%= name1 %>"  class="job_updates_textfiled" /> </td>
                
            </tr>
            <tr>
                <td class="my_info_div_heading"> Gender : </td>
                <td> 
                    <input type="text" name="ugender1" value="<%= gender1 %>" class="job_updates_textfiled" />
                </td>
            </tr>
            <tr>
                <td class="my_info_div_heading"> City : </td>
                <td> <input type="text" name="ucity1" value="<%= city1 %>" class="job_updates_textfiled" />  </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> Date_Of_Birth : </td>
                <td> <input type="text" name="udob1" value="<%= dob1 %>" class="job_updates_textfiled" /> </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> 10th Percentage : </td>
                <td> <input type="text" name="utenth1" value="<%= tenth_percentage1 %>" class="job_updates_textfiled" />  </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> 12th Percentage : </td>
                <td> <input type="text" name="utwelth1" value="<%= twelth_percentage1 %>" class="job_updates_textfiled" /> </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> Degree Percentage :  </td>
                <td> <input type="text" name="udegree1" value="<%= degree_percentage1 %>" class="job_updates_textfiled" /> </td>
            </tr> 
            <tr>
                <td class="my_info_div_heading"> Branch :  </td>
                <td> <input type="text" name="ubranch1" value="<%= branch1 %>" class="job_updates_textfiled" /> </td>
            </tr>
            <tr>
                <td class="my_info_div_heading"> About My Self :  </td>
                <td> <input type="text" name="uaboutmy1" value="<%= about_myself1 %>" class="job_updates_textfiled" /> </td>
            </tr>
            <tr>
                <td class="my_info_div_heading">   </td>
                <td> <input type="submit" name="UpdateProfile" value="Update Profile" class="job_updates_textfiled" /> </td>
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
        
                 <center><img src="images/adds.jpg"height="215" width="100%"></center></span></marquee>
                 <marquee direction="right" style="padding:0px; background:none; height:215px;width: 230px; marging:0px;" >
                 <span class="text">
                 <center><img src="images/adds2.jpg"height="215" width="100%"></center></span></marquee>
                 
            </div>
        </div>
        
        
    </body>
</html>
