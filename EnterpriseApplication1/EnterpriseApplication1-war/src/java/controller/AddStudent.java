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
import javax.servlet.http.HttpSession;
import model.MyUser;
import model.MyUserFacade;

/**
 *
 * @author munky
 */
@WebServlet(name = "AddStudent", urlPatterns = {"/committee/AddStudent"})
public class AddStudent extends HttpServlet {
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
        try{
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("name");
            String email = request.getParameter("email");
            char gender = request.getParameter("gender").charAt(0);
            String major = request.getParameter("major");
            int yob = Integer.parseInt(request.getParameter("yob"));

            gender = Character.toUpperCase(gender);

            if (Character.compare(gender, 'M') != 0 && Character.compare(gender, 'F') != 0) throw new Exception();
            
            HttpSession session = request.getSession();

            if (myUserFacade.findUsername(username) != null){
                // username taken
                request.setAttribute("error", String.format("Username \"%s\" already exist, please try again with another username", username));
                request.getRequestDispatcher("add_student.jsp").include(request, response);

            } else{
                MyUser newUser = new MyUser(username, password, fullname, email, major, gender, yob, "student", null, null);

                myUserFacade.create(newUser);  

                request.getRequestDispatcher("student.jsp").forward(request, response);

            }
            
        } catch(Exception e){
            request.setAttribute("error", "Invalid input. Please try again.");
            request.getRequestDispatcher("add_student.jsp").include(request, response);
        }
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
