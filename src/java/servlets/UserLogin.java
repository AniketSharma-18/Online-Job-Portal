/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author home
 */
public class UserLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session=request.getSession();
        
        String email1=request.getParameter("uuemail");
        String password1=request.getParameter("uupassword");
        
        String email2=null;
        String password2=null;
        String gender2=null;
        String city2=null;
        String name2=null;
        String dob2=null;
        String profile_pic=null;
        String tenth_percentage=null;
        String twelth_percentage=null;
        String degree_percentage=null;
        String branch=null;
        String about_myself=null;
        String user_resume=null;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("select * from USER_REGISTER where EMAIL_ID='"+email1+"'");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                email2=rs.getString("EMAIL_ID");
                password2=rs.getString("PASSWORD");
                gender2=rs.getString("GENDER");
                city2=rs.getString("CITY");
                name2=rs.getString("NAME");
                dob2=rs.getString("Date_Of_Birth");
                profile_pic=rs.getString("PROFILE_PIC");
                tenth_percentage=rs.getString("TENTH_PERCENTAGE");
                twelth_percentage=rs.getString("TWELTH_PERCENTAGE");
                degree_percentage=rs.getString("DEGREE_PERCENTAGE");
                branch=rs.getString("BRANCH");
                about_myself=rs.getString("ABOUT_MYSELF");
                user_resume=rs.getString("UPLOAD_RESUME");
            }
            if(email1.equals(email2) && password1.equals(password2))
            {
                session.setAttribute("session_user_name", name2);
                session.setAttribute("session_user_email", email1);
                session.setAttribute("session_user_gender", gender2);
                session.setAttribute("session_user_city", city2);
                session.setAttribute("session_user_dob", dob2);
                session.setAttribute("session_user_profile_pic", profile_pic);
                session.setAttribute("session_user_tenth_percentage", tenth_percentage);
                session.setAttribute("session_user_twelth_percentage", twelth_percentage);
                session.setAttribute("session_user_degree_percentage", degree_percentage);
                session.setAttribute("session_user_branch", branch);
                session.setAttribute("session_user_about_myself", about_myself);
                session.setAttribute("session_user_resume", user_resume);
                
                response.sendRedirect("userProfile.jsp");
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
