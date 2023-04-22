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
        
        
        <%@include file="UserHeader.jsp" %>
        
        <form action="ProfilePicUpload.jsp" method="post" enctype="multipart/form-data">
        <div class="main_left_division">
            <div class="profile_pic">
                <img src="<%= profile_pic %>" height="230px" width="250px" />
            </div>
            
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
            
                <div class="main_status_update_div111">
              <%
              
                    String id11=null; 
                    String skills111=null;
                    String function1=null;
                    String industry1=null;
                    String date1=null;
                    String time1=null;
                    String date22=null;
                    String time22=null;
                    
                    try
                    {
                            Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                            PreparedStatement ps=con.prepareStatement("select * from APPLY_JOBS_USER where USER_EMAIL='"+email1+"'");
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            {
                                id11=rs.getString("JOB_ID");
                                date22=rs.getString("DATE1");
                                time22=rs.getString("TIME1");
                            }
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    
                    
                    try
                    {
                       Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                       PreparedStatement ps=con.prepareStatement("select * from POST_JOBS where ID='"+id11+"'");
                       ResultSet rs=ps.executeQuery();
                       while(rs.next())
                       {
                           skills111=rs.getString("SKILLS");
                           function1=rs.getString("FUNCTION");
                           industry1=rs.getString("INDUSTRY");
                           date1=rs.getString("DATE1");
                           time1=rs.getString("TIME1");
                            
                %>
                
                
                    <div class="status_update_name_division11">
                        <table>
                            <tr>
                                <td class="table_td_jobpost"> Posted On : </td>
                                <td> <%= date1 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= time1 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Keyword/Skills : </td>
                                <td> <%= skills111 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Function : </td>
                                <td> <%= function1 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Industry : </td>
                                <td> <%= industry1 %> </td>
                            </tr>
                            <tr>
                            <form action="DeleteMyAppliedJobs" method="post">
                                <input type="hidden" name="datee" value="<%= date22 %>" />
                                <input type="hidden" name="timee" value="<%= time22 %>" />
                                <td> <input type="hidden" name="job_id" value="<%= id11 %>" </td>
                                <td> <input type="submit" name="delete" value="Delete" /> </td>
                            </form>
                            </tr>
                        </table>
                    </div>
              
                
                
                <%
                               }
                            }
                            catch(Exception e)
                            {
                                out.print(e);
                            }
                %>
            </div>
            
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
