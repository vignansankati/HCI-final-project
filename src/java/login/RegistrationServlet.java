/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author S525108
 */
public class RegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
//    @MultipartConfig (location="/tmp", fileSizeThreshold=1024*1024,maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("BookController:doPost Invoked");

        User user = new User();
        System.out.println("IN REGISTER");
        // Reads all contents from request object
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("emailid");
        String password = request.getParameter("password");
        String mob1 = request.getParameter("mob1");
        String mob2 = request.getParameter("mob2");
        String mob3 = request.getParameter("mob3");
        long mobile = Long.parseLong(mob1 + mob2 + mob3);
        String security1 = request.getParameter("security1");
        String securityAnswer1 = request.getParameter("secAnswer1");
        String security2 = request.getParameter("security2");
        String securityAnswer2 = request.getParameter("secAnswer2");
        String studentType = request.getParameter("studentType");
        
//        InputStream inputStream = null;
        Blob filePart = (Blob)request.getAttribute("resume");
//        getBlob("resume");
        if (filePart != null) {
            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();
        }
        
        // Forms bean object with the request object
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setEmailid(email);
        user.setPassword(password);
        user.setPhonenumber(mobile);
        user.setSecurityQuestion1(security1);
        user.setAnswer1(securityAnswer1);
        user.setSecurityQuestion2(security2);
        user.setAnswer2(securityAnswer2);
        user.setStudentType(studentType);
        user.setResume(filePart);

        
        UserService userservice = new UserService();

        try {
            System.out.println("IN TRY");
            boolean flag;
            flag = userservice.verifyusername(user);
            System.out.println("flag in controller : " + flag);
            if (flag == true) {
                System.out.println("in flag true");
                userservice.addUser(user);
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                response.getWriter()
                        .write("<html><body onload=\"alert('Thanks for Registration!')\"></body></html>");
                rd.forward(request, response);
            } else {
                response.getWriter()
                        .write("<html><body onload=\"alert('Your username is already in use.Please choose another username !')\"></body></html>");
                RequestDispatcher rd = request.getRequestDispatcher("Registration.jsp");
                rd.include(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
