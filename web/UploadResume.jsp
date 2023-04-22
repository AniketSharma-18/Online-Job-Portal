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

<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
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
            
                <h2> Upload Your Resume </h2>
                <form action="UploadResume" method="post" enctype="multipart/form-data">
                    <input type="file" name="browse" />
                    <input type="submit" name="upload_resume1" value="Upload" />
                </form>
            </div>
            
            <%
                    String resume=null; 
                    try
                    {
                         Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                        PreparedStatement ps=con.prepareStatement("select * from USER_REGISTER where EMAIL_ID='"+email1+"'");
                        ResultSet rs=ps.executeQuery();
                        while(rs.next())
                        {
                            resume=rs.getString("UPLOAD_RESUME");
                                                       }
                                               }catch(Exception e)
                                                                                                             {
                                                   out.print(e);
                                               }
                            
                %>
                
                <div class="resume_division">
                    <a href="ResumeDownload?ID=<%= resume %>"> <%= resume %> </a>
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
