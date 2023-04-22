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
                    <li> <a href="ContactUs.jsp"> Contact Us </a></li>
            </ul>
        </div>
            
            <div class="user_details">
            
              
                <%
                    String status11="not_seen";
                    String company_email11=null;
                    String message11=null;
                    String date11=null;
                    String time11=null;
                    String job_id11=null;
                         try
                        {
                             Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","sst");
                            PreparedStatement ps=con.prepareStatement("select * from SEND_SELECTION_CONFIRMATION where STATUS='"+status11+"' and USER_EMAIL='"+email1+"'");
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            {
                                company_email11=rs.getString("COMPANY_EMAIL");
                                date11=rs.getString("DATE1");
                                time11=rs.getString("TIME1");
                                job_id11=rs.getString("JOB_ID");
                            
                %>
                
                
                    <div class="status_update_name_division11">
                        <table>
                            <tr>
                                <td class="table_td_jobpost"> Applied On : </td>
                                <td> <%= date11 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= time11 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Company Email : </td>
                                <td> <%= company_email11 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> &nbsp; </td>
                                <td> &nbsp; </td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <form action="SeeFullDetails" method="post">
                                        <input type="hidden" name="job_id" value="<%= job_id11 %>"/>
                                        <input type="hidden" name="datee" value="<%= date11 %>"/>
                                        <input type="hidden" name="timee" value="<%= time11 %>"/>
                                        <input type="submit" name="reject" value="See Full Details" /> 
                                    </form>
                                </td>
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
