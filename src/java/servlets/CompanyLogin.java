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
public class CompanyLogin extends HttpServlet {

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
        
        String email1=request.getParameter("ccemail");
        String password1=request.getParameter("ccpassword");
        
        String email2=null;
        String password2=null;
        String company_image2=null;
        String city2=null;
        String name2=null;
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("select * from COMPANY_REGISTER where EMAIL='"+email1+"'");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                email2=rs.getString("EMAIL");
                password2=rs.getString("PASSWORD");
                city2=rs.getString("CITY");
                name2=rs.getString("NAME");
                company_image2=rs.getString("COMPANY_IMAGE");
            }
            if(email1.equals(email2) && password1.equals(password2))
            {
                session.setAttribute("session_cname", name2);
                session.setAttribute("session_cemail", email1);
                session.setAttribute("session_company_pic", company_image2);
                session.setAttribute("session_ccity", city2);
                
                response.sendRedirect("companyProfile.jsp");
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
