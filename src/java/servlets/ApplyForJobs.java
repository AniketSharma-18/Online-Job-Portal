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
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author home
 */
public class ApplyForJobs extends HttpServlet {

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
        String uemail=(String)session.getAttribute("session_user_email");
        String user_resume=(String)session.getAttribute("session_user_resume");
        
        String id=request.getParameter("job_id");
        String cemail=request.getParameter("cemail111");
        String status="not_seen";
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd:MM:yyyy");
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        
        
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("insert into APPLY_JOBS_USER values(?,?,?,?,?,?,?)");

            ps.setString(1, id);
            ps.setString(2, cemail);
            ps.setString(3, uemail);
            ps.setString(4, status);
            ps.setString(5, sdf1.format(d));
            ps.setString(6, sdf2.format(d));
            ps.setString(7, user_resume);
            ps.executeQuery();
            
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
        
        try
        { Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("insert into APPLY_JOBS_COMPANY values(?,?,?,?,?,?,?)");

            ps.setString(1, id);
            ps.setString(2, cemail);
            ps.setString(3, uemail);
            ps.setString(4, status);
            ps.setString(5, sdf1.format(d));
            ps.setString(6, sdf2.format(d));
            ps.setString(7, user_resume);
            //ps.executeQuery();
            ps.executeUpdate();
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
        response.sendRedirect("index.jsp");
        
        
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
