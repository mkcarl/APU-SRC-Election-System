/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MyUser;
import model.MyUserFacade;

/**
 *
 * @author munky
 */
@WebServlet(name = "UpdateStudent", urlPatterns = {"/committee/UpdateStudent"})
public class UpdateStudent extends HttpServlet {

    @EJB
    private MyUserFacade myUserFacade;

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
        long id = Long.parseLong(request.getParameter("id")) ;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("name");
        String email = request.getParameter("email");
        char gender = request.getParameter("gender").charAt(0);
        String major = request.getParameter("major");
        int yob = Integer.parseInt(request.getParameter("yob"));
        
        MyUser edited = myUserFacade.find(id);
        
        edited.setUsername(username);
        edited.setPassword(password);
        edited.setName(fullname);
        edited.setEmail(email);
        edited.setGender(gender);
        edited.setMajor(major);
        edited.setYearOfBirth(yob);
        
        myUserFacade.edit(edited);

        request.getRequestDispatcher("student.jsp").forward(request, response);

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
