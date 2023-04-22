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
public class UpdateProfile extends HttpServlet {

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
        
        String name1=request.getParameter("uname1");
        String gender1=request.getParameter("ugender1");
        String city1=request.getParameter("ucity1");
        String dob1=request.getParameter("udob1");
        String tenth_percentage1=request.getParameter("utenth1");
        String twelth_percentage1=request.getParameter("utwelth1");
        String degree_percentage1=request.getParameter("udegree1");
        String branch1=request.getParameter("ubranch1");

        String about_myself1=request.getParameter("uaboutmy1");
         
         HttpSession session=request.getSession();
         String email=(String) session.getAttribute("session_user_email");
       
         try
        {
            Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("UPDATE USER_REGISTER set NAME='"+name1+"', GENDER='"+gender1+"', CITY='"+city1+"', DATE_OF_BIRTH='"+dob1+"',TENTH_PERCENTAGE='"+tenth_percentage1+"',TWELTH_PERCENTAGE='"+twelth_percentage1+"',DEGREE_PERCENTAGE='"+degree_percentage1+"',BRANCH='"+branch1+"',ABOUT_MYSELF='"+about_myself1+"' where EMAIL_ID='"+email+"'");            
            ps.executeUpdate();
            
            session.setAttribute("session_user_name", name1);
            session.setAttribute("session_user_gender", gender1);
            session.setAttribute("session_user_city", city1);
            session.setAttribute("session_user_dob", dob1);
            session.setAttribute("session_user_tenth_percentage", tenth_percentage1);
            session.setAttribute("session_user_twelth_percentage", twelth_percentage1);
            session.setAttribute("session_user_degree_percentage", degree_percentage1);
            session.setAttribute("session_user_branch", branch1);
            session.setAttribute("session_user_about_myself", about_myself1);
            
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
