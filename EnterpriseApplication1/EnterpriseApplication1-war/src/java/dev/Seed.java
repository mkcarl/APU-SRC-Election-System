/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dev;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Admin;
import model.AdminFacade;
import model.Committee;
import model.CommitteeFacade;
import model.Student;
import model.StudentFacade;

/**
 *
 * @author carl
 */
@WebServlet(name = "Seed", urlPatterns = {"/Seed"})
public class Seed extends HttpServlet {

    @EJB
    private StudentFacade studentFacade;

    @EJB
    private CommitteeFacade committeeFacade;

    @EJB
    private AdminFacade adminFacade;

    
    
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
            adminFacade.findAll().forEach((admin) -> {
                adminFacade.remove(admin);  
            });
            System.out.println("Removed all admins");

            Admin a1 = new Admin("admin01", "admin123", "APU Admin");
            adminFacade.create(a1);
            System.out.println("Added admin");
            
            committeeFacade.findAll().forEach((committee)->{
                committeeFacade.remove(committee);
            });
            
            Committee c1 = new Committee("comm1", "qwerty", "Jenny Tan");
            Committee c2 = new Committee("comm2", "qwerty123", "Ben Stone");
            System.out.println("Removed all committee");
            committeeFacade.create(c1);
            committeeFacade.create(c2);

            System.out.println("Added committee");
            
            studentFacade.findAll().forEach((student)->{
                studentFacade.remove(student);
            });
            System.out.println("Removed all students");
            
            Student s1 = new Student("john99", "password", "John Lee", "johnlee@gmail.com", "Computer Science", 'M', 1999);
            Student s2 = new Student("sam123", "password", "Sam Donald", "samsam123@gmail.com", "Marketing", 'M', 2001);
            Student s3 = new Student("jennn", "password", "Jenny Jena", "jenny@gmail.com", "Computer Science", 'F', 2003);
            Student s4 = new Student("richtan", "password", "Richard Tan", "richtan@gmail.com", "Business", 'M', 1999);
            
            studentFacade.create(s1);
            studentFacade.create(s2);
            studentFacade.create(s3);
            studentFacade.create(s4);
            System.out.println("Added student");
            
            
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
