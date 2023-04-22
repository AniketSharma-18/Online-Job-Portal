
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>


<%@page import="org.apache.commons.fileupload.servlet.ServletRequestContext"%><%--
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
--%><%@page import="java.sql.Statement"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page  import="java.sql.*" %>

<%!
String ft,ft1,ft2;
    
%>
<%
//
   File file;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");
   out.print(filePath);
   // Verify the content type
   String contentType =request.getContentType();
   System.out.println(contentType);
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      
                DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("C:\temp"));

      // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);
   
      // maximum file size to be uploaded.
                upload.setSizeMax( maxFileSize );
                try{ 
         // Parse the request to get file items.

               List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
                Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            //out.print(fileName);
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            //System.out.println(fileName.lastIndexOf("\\"));
            if( fileName.lastIndexOf("\\") >= 0 )
            {
                file = new File( filePath + 
                fileName.substring( fileName.lastIndexOf("\\"))) ;
            }
            else
            {
                //System.out.println(filePath+fileName.substring(fileName.lastIndexOf("\\")+1));
                file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            //out.println("Uploaded Filename: " + filePath + fileName + "<br>");
            ft=fileName;
            out.print(ft);
            ft1=filePath;
            }
         }
         out.println("</body></html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }
   else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
     ft2=ft1+ft;
%>
 <%    
            String filepathNew="uploads"+ft;
            out.print(filepathNew);
               String cemail=(String) session.getAttribute("session_cemail");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql:///interview","root","kanika");
                PreparedStatement ps=con.prepareStatement("update COMPANY_REGISTER set COMPANY_IMAGE='"+filepathNew+"' where EMAIL='"+cemail+"'");
                ps.executeUpdate();
                
                ///System.out.println(ft2);
                //File f=new File(ft2);
                ///File f=new File("C:/Users/Admin/Documents/NetBeansProjects/WebApplication3/build/web/abc.txt");
                //FileInputStream is=new FileInputStream(f);
                ///FileReader is=new FileReader(f);
                //ps.setBinaryStream(1, is, (int)f.length());
                ///ps.setCharacterStream(1,is,(int)f.length());
                //ps.setString(2,new Integer(10).toString());
                //ps.executeUpdate();
                con.close();
            }catch(Exception e){
                out.print(e);
            }
          %>
         
<% 
String profile_pic="uploads/"+ft;
//System.out.println("hiiiiiiiiiiiiiii");
session.setAttribute("session_company_pic",profile_pic);
//String sfn=(String)session.getAttribute("session_profile_pic");

  // response.sendRedirect("EditCompanyProfile.jsp");
    //out.println("<html><body>Uploding Complete!!!<a href='index.jsp'>next</a></body></html>");
%>