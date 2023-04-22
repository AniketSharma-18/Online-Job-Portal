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
        
        <%
        String job_id=request.getParameter("job_id");
        
        
        String id11=null; 
        String skills111=null;
        String function1=null;
        String industry1=null;
        String date1=null;
        String time1=null;
        String location11=null;
        String experiance11=null;
        String education11=null;
        String role11=null;
        String cname11=null;
        String cemail11=null;
        String cimage11=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("select * from POST_JOBS where ID='"+job_id+"'");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                id11=rs.getString("ID");
                location11=rs.getString("LOCATION");
                experiance11=rs.getString("EXPERIANCE");
                skills111=rs.getString("SKILLS");
                education11=rs.getString("EDUCATION");
                function1=rs.getString("FUNCTION");
                role11=rs.getString("ROLE");
                industry1=rs.getString("INDUSTRY");
                cemail11=rs.getString("COMPANY_EMAIL");
                cname11=rs.getString("COMPANY_NAME");
                cimage11=rs.getString("COMPANY_IMAGE");
                date1=rs.getString("DATE1");
                time1=rs.getString("TIME1");
            }
        }
        catch(Exception e)
        {
            out.print(e);
        }
        %>
        
        <form action="ProfilePicUpload.jsp" method="post" enctype="multipart/form-data">
        <div class="main_left_division">
            <div class="profile_pic">
                <img src="<%= cimage11 %>" height="230px" width="250px" />
            </div>
            
              
            
        </div>
        </form>
        <div class="main_center_division">
            
            
            <div class="user_details">
            
              
            <t class="field">
                <h2> Company INFO </h2> <br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <table class="my_info_div"> 
               <tr>
                   <td colspan="2"></td> 
               </tr>
                <tr>
                    <td class="my_info_div_heading"> Name : </td> 
                <td> <%= cname11 %> </td>
                
            </tr>
            <tr>
                <td class="my_info_div_heading"> Email : </td>
                <td> <%= cemail11 %> </td>
            </tr> 
            </table>
            </t>
        </div>
            
            
            <div class="main_status_update_div222">
            <form action="ApplyForJobs" method="post">
                    <div class="status_update_name_division11">
                        <table>
                            <tr>
                                <td class="table_td_jobpost"> Posted On : </td>
                                <td> <%= date1 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= time1 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> KEYWORDS/SKILLS : </td>
                                <td> <%= skills111 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> FUNCTION : </td>
                                <td> <%= function1 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> INDUSTRY : </td>
                                <td> <%= industry1 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> LOCATION : </td>
                                <td> <%= location11 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> EXPERIANCE : </td>
                                <td> <%= experiance11 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> EDUCATION : </td>
                                <td> <%= education11 %> </td>
                            </tr>
                            <tr>
                                <td class="table_td_jobpost"> ROLE : </td>
                                <td> <%= role11 %> </td>
                            </tr>
                            <tr>
                                
                                <%
                                String email1=(String)session.getAttribute("session_user_email");
                                if(email1==null)
                                {
                                %>
                                
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td> <b> You are not logged in..... </b>  </td>
                                    <td> <b> <a href="UserLogin.jsp"> Login </a> to Apply for this job.... </b> </td>
                                </tr>
                                
                                <%
                                }
                                else
                                {
                                %>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" name="job_id" value="<%= id11 %>" /> 
                                    <input type="hidden" name="cemail111" value="<%= cemail11 %>" />
                                    
                                </td>
                                <td> <input type="submit" name="delete" value="Apply For Job" /> </td>
                                </tr>
                                <%
                                }
                                %>
                            </tr>
                        </table>
                    </div>
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
