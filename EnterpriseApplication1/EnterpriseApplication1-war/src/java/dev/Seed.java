/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dev;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MyUser;
import model.UserFacade;

/**
 *
 * @author carl
 */
@WebServlet(name = "Seed", urlPatterns = {"/Seed"})
public class Seed extends HttpServlet {

    @EJB
    private UserFacade userFacade;

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

        try (PrintWriter out = response.getWriter()) {
            userFacade.findAll().forEach((user) -> {
                userFacade.remove(user);
            });
            System.out.println("Removed all users");

            MyUser admin1 = new MyUser();
            admin1.setId("admin01");
            admin1.setPassword("admin123");
            admin1.setName("APU ADMIN");
            admin1.setRole("admin");

            userFacade.create(admin1);

            MyUser com1 = new MyUser();
            com1.setId("comm1");
            com1.setPassword("qwerty");
            com1.setName("Jenny Tan");
            com1.setRole("committee");

            MyUser com2 = new MyUser();
            com2.setId("comm2");
            com2.setPassword("qwerty123");
            com2.setName("Ben Stone");
            com2.setRole("committee");

            MyUser com3 = new MyUser();
            com3.setId("comm3");
            com3.setPassword("123123");
            com3.setName("Hugh Jass");
            com3.setRole("committee");

            userFacade.create(com1);
            userFacade.create(com2);
            userFacade.create(com3);

            MyUser s1 = new MyUser("john99", "password", "John Lee", "johnlee@gmail.com", "Computer Science", 'M', 1999, "student", null, null);
            MyUser s2 = new MyUser("sam123", "password", "Sam Donald", "samsam123@gmail.com", "Marketing", 'M', 2001, "student", null, null);
            MyUser s3 = new MyUser("jennn", "password", "Jenny Jena", "jenny@gmail.com", "Computer Science", 'F', 2003, "student", null, null);
            MyUser s4 = new MyUser("richtan", "password", "Richard Tan", "richtan@gmail.com", "Business", 'M', 1999, "student", null, null);

            userFacade.create(s1);
            userFacade.create(s2);
            userFacade.create(s3);
            userFacade.create(s4);

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
