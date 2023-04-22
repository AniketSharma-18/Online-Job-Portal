
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        
<!--         Latest compiled and minified CSS 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

         jQuery library 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

         Latest compiled JavaScript 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->


        <link rel="stylesheet" type="text/css" href="css/assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/assets/css/font-awesome.css">

        <link rel="stylesheet" href="css/assets/css/style.css">


        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <style>
/*            .status_update_name_division11{
                background: url(images/Back.jpg);
                width: 70%;
                height: 530px;
            }*/
        </style>
    </head>
    <body>
        
        <%--<%@include file="UserHeader.jsp" %>--%>
        
<!--         ***** Preloader Start ***** 
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
     ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index.html" class="logo">Job Agency<em> Website</em></a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li><a href="index.html" class="active">Home</a></li>
                            <!--<li><a href="jobs.html">Jobs</a></li>-->
<!--                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
                              
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="about.html">About Us</a>
                                    <a class="dropdown-item" href="team.html">Team</a>
                                    <a class="dropdown-item" href="blog.html">Blog</a>
                                    <a class="dropdown-item" href="testimonials.html">Testimonials</a>
                                    <a class="dropdown-item" href="terms.html">Terms</a>
                                </div>
                            </li>-->
                            <li><a href="contact.jsp">Contact</a></li> 
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
    
    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
        <video autoplay muted loop id="bg-video">
            <source src="images/video.mp4" type="video/mp4" />
            
        </video>
        


        <div class="video-overlay header-text">
            <div class="caption">
                <h6>Why tensed?</h6>
                <h2>Find the perfect <em>Job</em></h2>
                <div class="main-button">
                    <a href="contact.html">Contact Us</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->
        
        <!-- ***** Cars Starts ***** -->
    <section class="section" id="trainers">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading">
                        <h2>Featured <em>Jobs</em></h2>
                        <img src="images/line-dec.png" alt="">
                        <p>“Find out what you like doing best, and get someone to pay you for doing it.” —Katharine Whitehorn</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="trainer-item">
                        <div class="image-thumb">
                            <img src="images/product-1-720x480.jpg" alt="">
                        </div>
                        <div class="down-content">
                            <span> <sup>$</sup>70 000 </span>

                            <h4>A chef searching for jobs? Best place!</h4>

                            <p>Cook jobs also available.</p>

                         
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="trainer-item">
                        <div class="image-thumb">
                            <img src="images/product-4-720x480.jpg" alt="">
                        </div>
                        <div class="down-content">
                            <span> <sup>$</sup>70 000 </span>

                            <h4>A mechanical engineer? You are at the right place!!</h4>

                            <p>Engineering &nbsp;/&nbsp; Hardware</p>

                       
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="trainer-item">
                        <div class="image-thumb">
                            <img src="images/product-3-720x480.jpg" alt="">
                        </div>
                        <div class="down-content">
                            <span> <sup>$</sup>70 000 </span>

                            <h4>A teacher,A mentor? No other place better than here to find a job.</h4>

                            <p>Teaching &nbsp;/&nbsp; Freelancing Jobs</p>

                            
                        </div>
                    </div>
                </div>
                
                <p >“ Start by doing what is necessary, then do what is possible, and suddenly you are doing the impossible.” —Francis of Assisi</p>
            </div>

            <br>

<!--            <div class="main-button text-center">
                <a href="jobs.html">View Jobs</a>
            </div>-->
        </div>
    </section>
    <!-- ***** Cars Ends ***** -->
<!--        <div class="left_main_division">
            <div class="image_design">
                <img src="images/jobs.jpg" height="200px" width="200px" />
            </div>
        </div>
        -->
        <div class="heading3">
            <h1>AVAILABLE JOBS</h1>
            
        </div>
        
        <div  class="col-lg-4  center_main_division showcase">
            
            <div class="main_status_update_div111 col-lg-4 ">
            
            <%
                    String id11=null; 
                    String skills111=null;
                    String function1=null;
                    String industry1=null;
                    String date1=null;
                    String time1=null;
                         try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                            PreparedStatement ps=con.prepareStatement("select * from POST_JOBS order by date1 asc, time1 desc");
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            {
                                id11=rs.getString("ID");
                                skills111=rs.getString("SKILLS");
                                function1=rs.getString("FUNCTION");
                                industry1=rs.getString("INDUSTRY");
                                date1=rs.getString("DATE1");
                                time1=rs.getString("TIME1");
                            
                %>
                
                <form action="SeeJobProfile.jsp" method="post">
                    <div class="status_update_name_division11 col-lg-6">
                        <table class="table table-bordered border #88cc00" id = "UserTable">
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
                                <td> <input type="hidden" name="job_id" value="<%= id11 %>" /> </td>
                                <td> <input type="submit" name="delete" value="See Job Profile" /> </td>
                            </tr>
                        </table>
                    </div>
              </form>
                
                
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
        
<!--        <div class="right_main_division">
            <marquee direction="left" style="padding:0px; background:none; height:215px;width: 450px; marging:5px;" >
                <span class="text">
        
                    <center><img src="images/job11.jpg"height="300px" width="300px"></center></span></marquee>
        </div>-->
                
                <%@include file="footer.jsp" %>
        
    </body>
</html>
