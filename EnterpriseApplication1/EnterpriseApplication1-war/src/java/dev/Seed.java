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
import model.MyUserFacade;
import model.Position;
import model.PositionFacade;

/**
 *
 * @author carl
 */
@WebServlet(name = "Seed", urlPatterns = {"/Seed"})
public class Seed extends HttpServlet {

    @EJB
    private PositionFacade positionFacade;

    @EJB
    private MyUserFacade userFacade;

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
            admin1.setUsername("admin01");
            admin1.setPassword("admin123");
            admin1.setName("HEAD COMMITTEE");
            admin1.setRole("committee");

            userFacade.create(admin1);

            MyUser com1 = new MyUser();
            com1.setUsername("comm1");
            com1.setPassword("qwerty");
            com1.setName("Jenny Tan");
            com1.setRole("committee");

            MyUser com2 = new MyUser();
            com2.setUsername("comm2");
            com2.setPassword("qwerty123");
            com2.setName("Ben Stone");
            com2.setRole("committee");

            MyUser com3 = new MyUser();
            com3.setUsername("comm3");
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

            MyUser c1 = new MyUser("jay", "password", "Jay Hey", "Jay@gmail.com", "Social Science", 'F', 2001, "contestant", "I will ensure all APU classroom to be equipped with smart whiteboard. ", "Leadership, Communication");
            MyUser c2 = new MyUser("paultan", "password", "Paul Tan", "paultan@gmail.com", "Medicine", 'M', 1999, "contestant", "I will work hard with my team to upgrade APU wifi. ", "Innovation, Leadership");

            userFacade.create(c1);
            userFacade.create(c2);

            positionFacade.findAll().forEach((pos) -> {
                positionFacade.remove(pos);
            });

            Position pos1 = new Position();
            pos1.setName("President");
            pos1.setDescription("Overlook the whole APUSRC. Monthly meeting with APU board.");
            pos1.setNumberOfAvailableSeats(3);

            Position pos2 = new Position();
            pos2.setName("Tresurer");
            pos2.setDescription("Manage finances for APUSRC. Prepare finanical report for every quarter.");
            pos2.setNumberOfAvailableSeats(3);

            Position pos3 = new Position();
            pos3.setName("Secretary");
            pos3.setDescription("Manage all meeting logs. Prepare report for each event. ");
            pos3.setNumberOfAvailableSeats(5);

            Position pos4 = new Position();
            pos4.setName("Logistics");
            pos4.setDescription("Manage all logistics aspects of all events.");
            pos4.setNumberOfAvailableSeats(4);

            Position pos5 = new Position();
            pos5.setName("Marketing");
            pos5.setDescription("Manage social media of APUSRC. In charge of all promotional event. ");
            pos5.setNumberOfAvailableSeats(3);

            positionFacade.create(pos1);
            positionFacade.create(pos2);
            positionFacade.create(pos3);
            positionFacade.create(pos4);
            positionFacade.create(pos5);

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
