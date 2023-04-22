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
            
              <form action="UpdateJob" method="post">
            <t class="field">
                <h2> Post Job Info </h2> <br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <table class="my_info_div"> 
               <tr>
                   <td colspan="2"></td> 
               </tr>
                <tr>
                    <td class="my_info_div_heading"> Location : </td> 
                    <td> <input type="text" name="location" placeholder="Location...." class="job_updates_textfiled" /> </td>
                </tr>
                <tr>
                    <td class="my_info_div_heading"> Experience : </td>
                    <td> <input type="text" name="experiance" placeholder="Experiance...." class="job_updates_textfiled" /> </td>
                </tr> 
                <tr>
                    <td class="my_info_div_heading"> Keywords/Skills : </td>
                    <td> <input type="text" name="keyword" placeholder="Fresher/experiance - Java...." class="job_updates_textfiled" /> </td>
                </tr> 
                <tr>
                    <td class="my_info_div_heading"> Education : </td>
                    <td> <input type="text" name="education" placeholder="Any Graduate" class="job_updates_textfiled" /> </td>
                </tr> 
                <tr>
                    <td class="my_info_div_heading"> Function : </td>
                    <td> <input type="text" name="function" placeholder="IT, CSE, ECE etc...." class="job_updates_textfiled" /> </td>
                </tr> 
                <tr>
                    <td class="my_info_div_heading"> Role : </td>
                    <td> <input type="text" name="role" placeholder="Software Developer...." class="job_updates_textfiled" /> </td>
                </tr> 
                <tr>
                    <td class="my_info_div_heading"> Industry : </td>
                    <td> <input type="text" name="industry" placeholder="IT/ Computers...." class="job_updates_textfiled" /> </td>
                </tr>
                <tr>
                    <td class="my_info_div_heading">   </td>
                    <td>  <input type="submit" name="editProfile" value="Post Job" /> </td>
                </tr>
            </table>
            </t>
           </form> 
        </div>
            
            <div class="main_status_update_div11">
            
            <%
                    String location11=null; 
                    String experiance11=null;
                    String skills111=null;
                    String education111=null;
                    String function1=null;
                    String role1=null;
                    String industry1=null;
                    String date1=null;
                    String time1=null;
                         try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","sst");
                            PreparedStatement ps=con.prepareStatement("select * from POST_JOBS where COMPANY_NAME='"+cname1+"' order by date1 asc, time1 desc");
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            {
                                location11=rs.getString("LOCATION");
                                experiance11=rs.getString("EXPERIANCE");
                                skills111=rs.getString("SKILLS");
                                education111=rs.getString("EDUCATION");
                                function1=rs.getString("FUNCTION");
                                role1=rs.getString("ROLE");
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
                                <td class="table_td_jobpost"> Location : </td>
                                <td> <%= location11 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Experiance : </td>
                                <td> <%= experiance11 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Keyword/Skills : </td>
                                <td> <%= skills111 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Education : </td>
                                <td> <%= education111 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Function : </td>
                                <td> <%= function1 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Role : </td>
                                <td> <%= role1 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> Industry : </td>
                                <td> <%= industry1 %> </td>
                            </tr>
                            <tr>
                                <td>  </td>
                            <form action="DeleteJobPost" method="post">
                                <input type="hidden" name="datee" value="<%= date1 %>" />
                                <input type="hidden" name="timee" value="<%= time1 %>" />
                                <td> <input type="submit" name="delete" value="Delete Job Post" /> </td>
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
