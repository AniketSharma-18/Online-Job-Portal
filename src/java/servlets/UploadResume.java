/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;




/**
 *
 * @author My Pc
 */
@WebServlet(name = "UploadResume", urlPatterns = {"/UploadResume"})
public class UploadResume extends HttpServlet {

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
        
        String oldName = null;
        
        
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request))
        {
            try
            {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts)
                {
                    if(!item.isFormField())
                    {
                        oldName = new File(item.getName()).getName();
                        String UPLOAD_DIRECTORY = "C:\\Users\\Kanika Mahajan\\Downloads\\interview_scan\\interview_scan\\InterviewScan1\\web\\resume_uploads";
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + oldName));
                    }
                }
               //File uploaded successfully
               //request.setAttribute("message", "File Uploaded Successfully");
               //request.setAttribute("message1", "File Name With Path :- "+oldName);
            }
            catch (Exception ex)
            {
                out.print("File Upload Failed due to " + ex);
               
            }          
         
        }
        else
        {
            out.print("Sorry this Servlet only handles file upload request");
            
        }
        
        String newName="resume_uploads/"+oldName;
        
        HttpSession session=request.getSession();
        String email=(String) session.getAttribute("session_user_email");
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd:MM:yyyy");
        SimpleDateFormat sdf2=new SimpleDateFormat("hh:mm:ss");
        
        String Area=request.getParameter("area");
        //String Area="aa";
        
        out.print(email);
        
        try {
            
           Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
            PreparedStatement ps=con.prepareStatement("update USER_REGISTER set UPLOAD_RESUME='"+oldName+"' where EMAIL_ID='"+email+"'");
            ps.executeUpdate();
            
            session.setAttribute("session_user_resume", oldName);
            
            response.sendRedirect("UploadResume.jsp");
                
                       
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
