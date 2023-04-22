<%-- 
    Document   : index
    Created on : May 9, 2014, 4:33:12 PM
    Author     : home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/UserLogin.css"/>
    </head>
    <body>
        
            
        <%@include file="CompanyHeader.jsp" %>
            
        
        
        <div class="left_main_division">
            <h2>left</h2>
        </div>
        
        <div class="center_main_division">
         <div class="main">
            
          <div class="body_allign" >
                  <h2>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                         COMPANY REGISTRATION
                  </h2>
            <form action="CompanyRegister" method="post">
                <table style="border: 0px solid black" >  
                    <tr>
                        <td> Company Name : </td>
                        <td> <input type="text" name="cname" placeholder="enter name....." class="textfield_design" /> </td>
                    </tr>
                    <tr>
                        <td> Company Email id : </td>
                        <td> <input type="text" name="cemail" placeholder="email_id....." class="textfield_design" /> </td>
                    </tr>
                    <tr>
                        <td> Company Password : </td>
                        <td> <input type="password" name="cpassword" placeholder="********" class="textfield_design"/> </td>
                    </tr>
                    <tr>
                        <td> Confirm Password : </td>
                        <td> <input type="password" name="ccpassword" placeholder="********" class="textfield_design"/> </td>
                    </tr>
                    <tr>
                        <td> Company Location : </td>
                        <td>
                            <select name="ccity" class="textfield_design">
                                <option> City </option>
                                <option> Chandigarh </option>
                                <option> Delhi </option>
                                <option> Gurgaon </option>
                                <option> Banglore </option>
                                <option> Pune </option>
                            </select>
                        </td>
                    </tr>
                     
                    <tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" name="" value="REGISTER" class="button_design" /> <br/> <br/> <br/> <br/>
                        </td>
                    </tr>
                </table>
            </form>
           </div>
           
        </div>
        </div>
        
        <div class="right_main_division">
            <h2>
                right
            </h2>
        </div>
            
        
        <%@include file="footer.jsp" %>
            
    </body>
</html>
