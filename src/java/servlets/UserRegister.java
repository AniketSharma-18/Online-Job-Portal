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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author home
 */
public class UserRegister extends HttpServlet {

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
        
        
        String name1=request.getParameter("uname");
        String email1=request.getParameter("uemail");
        String password1=request.getParameter("upassword");
        String cpassword1=request.getParameter("ucpassword");
        String gender1=request.getParameter("ugender");
        String city1=request.getParameter("ucity");
        String day1=request.getParameter("uday");
        String month1=request.getParameter("umonth");
        String year1=request.getParameter("uyear");
        String tenth_percentage=null;
        String twelth_percentage=null;
        String degree_percentage=null;
        String branch=null;
        String about_myself=null;
        String upload_resume=null;
        
        String profile_pic = null;
        if(gender1.equals("Female"))
        {
            profile_pic="uploads/female.jpg";
        }
        else
        {
            profile_pic = "uploads/male.png";
        }
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                PreparedStatement ps=con.prepareStatement("insert into USER_REGISTER values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                
                ps.setString(1, name1);
                ps.setString(2, email1);
                ps.setString(3, password1);
                ps.setString(4, gender1);
                ps.setString(5, city1);
                ps.setString(6, day1+"-"+month1+"-"+year1);
                ps.setString(7, profile_pic);
                ps.setString(8, tenth_percentage);
                ps.setString(9, twelth_percentage);
                ps.setString(10, degree_percentage);
                ps.setString(11, branch);
                ps.setString(12, about_myself);
                ps.setString(13, upload_resume);
                    //int executeUpdate = ps.executeUpdate();
                ps.executeUpdate();
                
                HttpSession session=request.getSession();
                session.setAttribute("session_user_name", name1);
                session.setAttribute("session_user_email", email1);
                session.setAttribute("session_user_gender", gender1);
                session.setAttribute("session_user_city", city1);
                session.setAttribute("session_user_dob", day1+"-"+month1+"-"+year1);
                session.setAttribute("session_user_profile_pic", profile_pic);
                session.setAttribute("session_user_tenth_percentage", tenth_percentage);
                session.setAttribute("session_user_twelth_percentage", twelth_percentage);
                session.setAttribute("session_user_degree_percentage", degree_percentage);
                session.setAttribute("session_user_branch", branch);
                session.setAttribute("session_user_about_myself", about_myself);
                
                response.sendRedirect("userProfile.jsp");
                
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
