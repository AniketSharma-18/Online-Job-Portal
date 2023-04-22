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

        <form action="ProfilePicUpload.jsp" method="post" enctype="multipart/form-data">
        <div class="main_left_division">
            <div class="profile_pic">
                <img src="<%= company_pic %>" height="230px" width="250px" />
            </div>

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
                
                <div class="main_status_update_div111">
            
            <%
                    String status11="not_seen";
                    String user_email11=null;
                    String user_resume11=null;
                    String date11=null;
                    String time11=null;
                    String job_id11=null;
                         try
                        {
                           Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","sst");
                            PreparedStatement ps=con.prepareStatement("select * from APPLY_JOBS_COMPANY where STATUS='"+status11+"' and COMPANY_EMAIL='"+cemail1+"'");
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            {
                                user_email11=rs.getString("USER_EMAIL");
                                user_resume11=rs.getString("USER_RESUME");
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
                                <td class="table_td_jobpost"> User Email : </td>
                                <td> <%= user_email11 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> User Resume : </td>
                                <td> <a href="ResumeDownload?ID=<%= user_resume11 %>"> <%= user_resume11 %> </a> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> &nbsp; </td>
                                <td> &nbsp; </td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <form action="SelectUserForInterview" method="post">
                                        <input type="hidden" name="user_email" value="<%= user_email11 %>"/>
                                        <input type="hidden" name="job_id" value="<%= job_id11 %>"/>
                                        <input type="submit" name="select" value="Select For Interview" />
                                    </form>
                                </td>
                                <td>
                                    <form action="RejectUserForInterview" method="post">
                                        <input type="hidden" name="user_email" value="<%= user_email11 %>"/>
                                        <input type="hidden" name="job_id" value="<%= job_id11 %>"/>
                                        <input type="submit" name="reject" value="Reject For Interview" /> 
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
