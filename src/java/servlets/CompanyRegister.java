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
public class CompanyRegister extends HttpServlet {

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
            PreparedStatement ps=con.prepareStatement("select * from COMPANY_REGISTER");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                id=rs.getInt("ID");
            }
        }
        catch(Exception e)
        {
            out.print("......"+e);
        }
        
        id++;
        
        
        String cname1=request.getParameter("cname");
        String cemail1=request.getParameter("cemail");
        String cpassword1=request.getParameter("cpassword");
        String ccity1=request.getParameter("ccity");
        String company_pic="uploads/company.png";
        
        try
        {
         Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                PreparedStatement ps=con.prepareStatement("insert into COMPANY_REGISTER values(?,?,?,?,?,?)");
                 
                ps.setInt(1, id);
                ps.setString(2, cname1);
                ps.setString(3, cemail1);
                ps.setString(4, cpassword1);
                ps.setString(5, ccity1);
                ps.setString(6, company_pic);
                ps.executeUpdate();
                
                HttpSession session=request.getSession();
                session.setAttribute("session_cname", cname1);
                session.setAttribute("session_cemail", cemail1);
                session.setAttribute("session_ccity", ccity1);
                session.setAttribute("session_company_pic", company_pic);
                
                response.sendRedirect("companyProfile.jsp");
                
        }
        catch(Exception e)
        {
            out.print("-------"+e);
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
