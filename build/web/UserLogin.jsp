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
        
            
        <%@include file="UserHeader.jsp" %>
            
        
        
        <div class="left_main_division">
            <h2>left</h2>
        </div>
        
        <div class="center_main_division">
         <div class="main">
            
          <div class="body_allign" >
                  <h2>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     USER REGISTRATION
                  </h2>
            <form action="UserRegister" method="post">
                <table style="border: 0px solid black" >  
                    <tr>
                        <td> Name : </td>
                        <td> <input type="text" name="uname" placeholder="enter name....." class="textfield_design" /> </td>
                    </tr>
                    <tr>
                        <td> Email id : </td>
                        <td> <input type="text" name="uemail" placeholder="email_id....." class="textfield_design" /> </td>
                    </tr>
                    <tr>
                        <td> Password : </td>
                        <td> <input type="password" name="upassword" placeholder="********" class="textfield_design"/> </td>
                    </tr>
                    <tr>
                        <td> Confirm Password : </td>
                        <td> <input type="password" name="ucpassword" placeholder="********" class="textfield_design"/> </td>
                    </tr>
                    <tr>
                        <td> Gender : </td>
                        <td> 
                            <input type="radio" name="ugender" value="Male"/>Male
                            <input type="radio" name="ugender" value="Female"/>Female
                        </td>
                    </tr>
                    <tr>
                        <td> City : </td>
                        <td>
                            <select name="ucity" class="textfield_design">
                                <option> City </option>
                                <option> Chandigarh </option>
                                <option> Kangra </option>
                                <option> Hamirpur </option>
                                <option> Ropar </option>
                                <option> Ludhiana </option>
                            </select>
                        </td>
                    </tr>
                     <tr>
                        <td> Date_Of_Birth : </td>
                        <td>
                            <select name="uday" width="0px">
                                <option> Day </option>
                                <option> 1 </option>
                                <option> 2 </option>
                                <option> 3 </option>
                                <option> 4 </option>
                                <option> 5 </option>
                                <option> 6 </option>
                                <option> 7 </option>
                                <option> 8 </option>
                                <option> 9 </option>
                                <option> 10 </option>
                                <option> 11 </option>
                                <option> 12 </option>
                                <option> 13 </option>
                                <option> 14 </option>
                                <option> 15 </option>
                                <option> 16 </option>
                                <option> 17 </option>
                                <option> 18 </option>
                                <option> 19 </option>
                                <option> 20 </option> 
                                <option> 21 </option>
                                <option> 22 </option>
                                <option> 23 </option>
                                <option> 24 </option>
                                <option> 25 </option>
                                <option> 26 </option>
                                <option> 27 </option>
                                <option> 28 </option>
                                <option> 29 </option>
                                <option> 30 </option>
                                <option> 31 </option>
                            </select>
                            <select name="umonth">
                                <option> Month </option>
                                <option> January </option>
                                <option> February </option>
                                <option> March </option>
                                <option> April </option>
                                <option> May </option>
                                <option> June </option>
                                <option> July </option>
                                <option> August </option>
                                <option> September </option>
                                <option> October </option>
                                <option> November </option>
                                <option> December </option>
                            </select>
                                <select name="uyear">
                                    <option> Year </option>
                                    <option> 1985 </option>
                                    <option> 1986 </option>
                                    <option> 1987 </option>
                                    <option> 1988 </option>
                                    <option> 1989 </option>
                                    <option> 1990 </option>
                                    <option> 1991 </option>
                                    <option> 1992 </option> 
                                    <option> 1993 </option>
                                    <option> 1994 </option>
                                    <option> 1995 </option>
                                    <option> 1996 </option>
                                    <option> 1997 </option>
                                    <option> 1998 </option>
                                    <option> 1999 </option>
                                    <option> 2000 </option>
                                    <option> 2001 </option>
                                    <option> 2002 </option>
                                    <option> 2003 </option>
                                    <option> 2004 </option>
                                    <option> 2005 </option>
                                    <option> 2006 </option>
                                    <option> 2007 </option>
                                    <option> 2008 </option>
                                    <option> 2009 </option>
                                    <option> 2010 </option>
                                </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" name="" value="REGISTER" class="button_design" />  <br/> <br/> <br/> <br/>
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
