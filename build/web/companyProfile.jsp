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


            <t class="field">
                <h2> Company INFO </h2> <br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <table class="my_info_div">
               <tr>
                   <td colspan="2"></td>
               </tr>
                <tr>
                    <td class="my_info_div_heading"> Name : </td>
                <td> <%= cname1 %> </td>

            </tr>
           
            <tr>
                <td class="my_info_div_heading"> Location : </td>
                <td> <%= ccity1 %> </td>
            </tr>
            <tr>
                <td class="my_info_div_heading">   </td>
                <td> <form action="EditCompanyProfile.jsp" method="post"> <input type="submit" name="editProfile" value="Edit Profile" /> </form> </td>
            </tr>
            </table>
            </t>
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
