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
public class UpdateJob extends HttpServlet {

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
        
        
        
        int id=0;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("select * from POST_JOBS");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                id=rs.getInt("ID");
            }
            
            id++;
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
        
        HttpSession session=request.getSession();
        String company_email=(String)session.getAttribute("session_cemail");
        String company_name=(String)session.getAttribute("session_cname");
        String company_pic=(String)session.getAttribute("session_company_pic");
        
        String location=request.getParameter("location");
        String experiance=request.getParameter("experiance");
        String keyword=request.getParameter("keyword");
        String education=request.getParameter("education");
        String function=request.getParameter("function");
        String role=request.getParameter("role");
        String industry=request.getParameter("industry");
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd:MM:yyyy");
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("insert into POST_JOBS values(?,?,?,?,?,?,?,?,?,?,?,?,?)");

            ps.setInt(1, id);
            ps.setString(2, location);
            ps.setString(3, experiance);
            ps.setString(4, keyword);
            ps.setString(5, education);
            ps.setString(6, function);
            ps.setString(7, role);
            ps.setString(8, industry);
            ps.setString(9, company_email);
            ps.setString(10, sdf1.format(d));
            ps.setString(11, sdf2.format(d));
            ps.setString(12, company_pic);
            ps.setString(13, company_name);
            ps.executeUpdate();
            
            response.sendRedirect("PostJobs.jsp");
            
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
