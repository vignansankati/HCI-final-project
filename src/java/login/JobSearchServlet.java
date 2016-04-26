/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author S525108
 */
public class JobSearchServlet extends HttpServlet {
    private Object session;

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
        response.setContentType("text/html;charset=UTF-8");
        
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("IN searchroom ");

        JobService jobService = new JobService();
        String category = request.getParameter("category");
        if (category.equals("select")) {
            category = null;
        }
        String type = request.getParameter("type");
        if (type.equals("select")) {
            type = null;
        }
        String location = request.getParameter("location");
        if (location.equals("select")) {
            location = null;
        }
        HttpSession session = request.getSession();
        int count = 0;
        System.out.println("Category in servlet"+category);
        try {
            String studentType = (String)session.getAttribute("studentType");
            ArrayList<Job> jobList = jobService.searchJob(type, category, location, (String)session.getAttribute("email"),studentType);
//            System.out.println("Job list is "+jobList.get(0).jobCategory);
            RequestDispatcher rd = request.getRequestDispatcher("jobResults.jsp");
            if(jobList.size()>0) {
                count = jobList.size();
            } else {
                count = 0;
            }  
            session.setAttribute("jobCount", count);
            session.setAttribute("jobList", jobList);
            rd.forward(request, response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
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
