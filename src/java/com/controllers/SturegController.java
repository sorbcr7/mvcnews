package com.controllers;
import com.daos.SturegDao;
import com.beans.Stureg;
import com.utility.FileUploader;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.io.File;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringEscapeUtils;




 
public class SturegController extends HttpServlet {

       
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
        {
        PrintWriter out = response.getWriter();
         response.setContentType("text/html");
        String op = request.getParameter("op");
        
       if(op!=null && op.equalsIgnoreCase("delete"))
            {
               int id = Integer.parseInt(request.getParameter("id"));
               SturegDao sd = new SturegDao();
                     if(sd.removeById(id)) 
                           response.sendRedirect("Sturegshow.jsp");
                        
            }
       if(op!=null && op.equalsIgnoreCase("check_userid"))
       {
           String userid= request.getParameter("userid");
           SturegDao sd=new SturegDao();
           if(userid==null || userid.equals(""))
           {
               out.println("<font size='4'> Please provide userid </font>");
           }
          else if(sd.isUseridExist(userid))
               out.println("<font color='red' size='4'> Sorry this user id already exists </font>");
           else 
               out.println("<font color='blue size='4'> Congrats! this user id available </font>");
       }
    
    
        }

        
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
          
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String op = request.getParameter("op");

        if (op != null && op.equalsIgnoreCase("add")) {
            System.out.println("Request Found......");
            /*
            try {
                //check the enctype of the incomming request -
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                String encodedPassword = "";
                String photo = "", imagePath = "";
                if (isMultipart) {
                    System.out.println("Multipart data found.......");
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List items = null;
                    items = upload.parseRequest(request);

                    Iterator itr = items.iterator();
                    while (itr.hasNext()) {
                        FileItem item = (FileItem) itr.next();
                        if (!item.isFormField()) {
                            photo = item.getName();
                            imagePath = "Media/Stureg/" + photo;
                            File savedFile = new File(getServletContext().getRealPath("/") + imagePath);
                            item.write(savedFile);

                        }

                    }
//JDBC Code 
                    SturegDao pd = new SturegDao();
                    HttpSession session = request.getSession();
                    Stureg person = (Stureg) session.getAttribute("stureg");
                    person.setImage(imagePath);

                    encodedPassword = Base64.getEncoder().encodeToString(person.getPassword().getBytes("UTF-8"));
                    person.setPassword(encodedPassword);

                    if (pd.add(person)) {
                        session.removeAttribute("stureg");
                        response.sendRedirect("Sturegshow.jsp");
                    }

                }   
            }
            */
            
            
             try {
                //check the enctype of the incomming request -
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                String encodedPassword = "";
                String photo = "", imagePath = "";
                if (isMultipart)  
                    imagePath = FileUploader.getUploadedPath(getServletContext(), "Media/Stureg", request);
//JDBC Code 
                    SturegDao pd = new SturegDao();
                    HttpSession session = request.getSession();
                    Stureg stureg = (Stureg) session.getAttribute("stureg");
                    stureg.setImage(imagePath);

                    encodedPassword = Base64.getEncoder().encodeToString(stureg.getPassword().getBytes("UTF-8"));
                    stureg.setPassword(encodedPassword);

                    if (pd.add(stureg)) {
                        session.removeAttribute("stureg");
                        response.sendRedirect("Sturegshow.jsp");
                    }

           
            
             }
            
            
            catch (Exception e) {
                System.out.println("Error : " + e.getMessage());
            }

        }

    }
        
    
    
        @Override
    public String getServletInfo() {
        return "Short description";
}

}