/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dev;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 *
 * @author carl
 */
@WebServlet(name = "Seed", urlPatterns = {"/Seed"})
public class Seed extends HttpServlet {

    @EJB
    private SeatFacade seatFacade;

    @EJB
    private VoteFacade voteFacade;

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
            
            voteFacade.findAll().forEach((vote) -> {
                voteFacade.remove(vote);
            });
            out.println("removed all votes");
            
            seatFacade.findAll().forEach((s) -> {
                seatFacade.remove(s);
            });
            out.println("removed all seats");
            
            positionFacade.findAll().forEach((pos) -> {
                positionFacade.remove(pos);
            });
            out.println("removed all positions");
            
            userFacade.findAll().forEach((user) -> {
                userFacade.remove(user);
            });
            out.println("removed all users");
            
            
            MyUser admin1 = new MyUser();
            admin1.setUsername("admin01");
            admin1.setPassword("admin123");
            admin1.setName("Albert Toh");
            admin1.setRole("committee");

            userFacade.create(admin1);

            MyUser admin2 = new MyUser();
            admin2.setUsername("admin02");
            admin2.setPassword("admin123");
            admin2.setName("Jenny Tan");
            admin2.setRole("committee");

            userFacade.create(admin2);
            out.println("created 2 admin");

            // construct more contestants here
            MyUser c1 = new MyUser("jay", "password", "Jay Hey", "Jay@gmail.com", "Social Science", 'F', 2001, "contestant", "I will ensure all APU classroom to be equipped with smart whiteboard. ", "Leadership, Communication");
            MyUser c2 = new MyUser("paultan", "password", "Paul Tan", "paultan@gmail.com", "Medicine", 'M', 1999, "contestant", "I will work hard with my team to upgrade APU wifi. ", "Innovation, Leadership");
            MyUser c3 = new MyUser("james", "password", "James Lee", "james@mail.com", "Communications", 'F', 2000, "contestant", "I will ensure all APU classroom to be equipped with air cond. ", "Communication, Personality");
            MyUser c4 = new MyUser("jessica", "password", "Jessica Tan", "default@mail.com", "Computer Science", 'F', 2000, "contestant", "default manifesto", "default skills");
            MyUser c5 = new MyUser("bob", "password", "Bob Lee", "default@mail.com", "Computer Science", 'M', 2000, "contestant", "default manifesto", "default skills");
            MyUser c6 = new MyUser("cain", "password", "Cain Abel", "default@mail.com", "Computer Science", 'M', 2000, "contestant", "default manifesto", "default skills");
            MyUser c7 = new MyUser("jacob", "password", "Jacob sonof James", "default@mail.com", "Computer Science", 'M', 2000, "contestant", "default manifesto", "default skills");
            MyUser c8 = new MyUser("dickson", "password", "Dickson Ong", "default@mail.com", "Computer Science", 'M', 2000, "contestant", "default manifesto", "default skills");
            MyUser c9 = new MyUser("ezekiel", "password", "Ezekiel Emanuel", "default@mail.com", "Computer Science", 'M', 2000, "contestant", "default manifesto", "default skills");
            MyUser c10 = new MyUser("fanny", "password", "Fanny Fan", "default@mail.com", "Computer Science", 'F', 2000, "contestant", "default manifesto", "default skills");
            MyUser c11 = new MyUser("gabriel", "password", "Gabriel Gaby", "default@mail.com", "Computer Science", 'M', 2000, "contestant", "default manifesto", "default skills");

            userFacade.create(c1);
            userFacade.create(c2);
            userFacade.create(c3);
            userFacade.create(c4);
            userFacade.create(c5);
            userFacade.create(c6);
            userFacade.create(c7);
            userFacade.create(c8);
            userFacade.create(c9);
            userFacade.create(c10);
            userFacade.create(c11);
            out.println("created 11 contestant");


            MyUser s1 = new MyUser("john99", "password", "John Lee", "johnlee@gmail.com", "Computer Science", 'M', 1999, "student", null, null);
            MyUser s2 = new MyUser("sam123", "password", "Sam Donald", "samsam123@gmail.com", "Marketing", 'M', 2001, "student", null, null);
            MyUser s3 = new MyUser("jennn", "password", "Jenny Jena", "jenny@gmail.com", "Computer Science", 'F', 2003, "student", null, null);
            MyUser s4 = new MyUser("richtan", "password", "Richard Tan", "richtan@gmail.com", "Business", 'M', 1999, "student", null, null);
            MyUser s5 = new MyUser("han", "password", "Han Solo", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s6 = new MyUser("isaac", "password", "Isaac Stone", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s7 = new MyUser("karl", "password", "Karl Marx", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s8 = new MyUser("luke", "password", "Luke Johnson", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s9 = new MyUser("manny", "password", "Manny Fanny", "default@mail.com", "Computer Science", 'F', 2000, "student", null, null);
            MyUser s10 = new MyUser("noel", "password", "Noel Boel", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s11 = new MyUser("oriellia", "password", "Oriellia Maddison", "default@mail.com", "Computer Science", 'F', 2000, "student", null, null);
            MyUser s12 = new MyUser("paul", "password", "Paul Saul", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s13 = new MyUser("qazi", "password", "Qazi bin Hadi", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s14 = new MyUser("sam", "password", "Samuel Lim", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s15 = new MyUser("tee", "password", "Tim Tam", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s16 = new MyUser("vino", "password", "Vinothini Ganesh", "default@mail.com", "Computer Science", 'F', 2000, "student", null, null);
            MyUser s17 = new MyUser("wee", "password", "Wee Ka Siong", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s18 = new MyUser("xav", "password", "xavier", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s19 = new MyUser("yvonne", "password", "Yvonne Tan", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);
            MyUser s20 = new MyUser("zack", "password", "Zack Lee", "default@mail.com", "Computer Science", 'M', 2000, "student", null, null);

            userFacade.create(s1);
            userFacade.create(s2);
            userFacade.create(s3);
            userFacade.create(s4);
            userFacade.create(s5);
            userFacade.create(s6);
            userFacade.create(s7);
            userFacade.create(s8);
            userFacade.create(s9);
            userFacade.create(s10);
            userFacade.create(s11);
            userFacade.create(s12);
            userFacade.create(s13);
            userFacade.create(s14);
            userFacade.create(s15);
            userFacade.create(s16);
            userFacade.create(s17);
            userFacade.create(s18);
            userFacade.create(s19);
            userFacade.create(s20);
            out.println("created 20 students");

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
//
//            Position pos4 = new Position();
//            pos4.setName("Logistics");
//            pos4.setDescription("Manage all logistics aspects of all events.");
//            pos4.setNumberOfAvailableSeats(4);
//
//            Position pos5 = new Position();
//            pos5.setName("Marketing");
//            pos5.setDescription("Manage social media of APUSRC. In charge of all promotional event. ");
//            pos5.setNumberOfAvailableSeats(3);

            positionFacade.create(pos1);
            positionFacade.create(pos2);
            positionFacade.create(pos3);
//            positionFacade.create(pos4);
//            positionFacade.create(pos5);
            out.println("created 3 positions");


            Seat seat1 = new Seat();
            seat1.setSeat_for(pos1);
            seat1.setContested_by(c1);

            Seat seat2 = new Seat();
            seat2.setSeat_for(pos1);
            seat2.setContested_by(c2);

            Seat seat3 = new Seat();
            seat3.setSeat_for(pos1);
            seat3.setContested_by(c3);

            Seat seat4 = new Seat();
            seat4.setSeat_for(pos2);
            seat4.setContested_by(c4);

            Seat seat5 = new Seat();
            seat5.setSeat_for(pos2);
            seat5.setContested_by(c5);


            Seat seat6 = new Seat();
            seat6.setSeat_for(pos3);
            seat6.setContested_by(c6);
            
            seatFacade.create(seat1);
            seatFacade.create(seat2);
            seatFacade.create(seat3);
            seatFacade.create(seat4);
            seatFacade.create(seat5);
            seatFacade.create(seat6);

            out.println("created 6 seats");

            
            Random r = new Random(123);
            long now = new Date().getTime();
            System.out.println(now);
            System.out.println(Config.getStartTimestamp() * 1000L);

            Vote v1 = new Vote();
            v1.setVoted_by(s20);
            v1.setVoted_for(seat1);
            v1.setTime_voted(now - 1 * 1000 * 60 * 30);

            Vote v2 = new Vote();
            v2.setVoted_by(s19);
            v2.setVoted_for(seat3);
            v2.setTime_voted(now - 2 * 1000 * 60 * 31);

            Vote v3 = new Vote();
            v3.setVoted_by(s18);
            v3.setVoted_for(seat2);
            v3.setTime_voted(now - 3 * 1000 * 59 * 30);

            Vote v4 = new Vote();
            v4.setVoted_by(s17);
            v4.setVoted_for(seat1);
            v4.setTime_voted(now - 3 * 1000 * 60 * 30);

            Vote v5 = new Vote();
            v5.setVoted_by(s16);
            v5.setVoted_for(seat1);
            v5.setTime_voted(now - 4 * 1000 * 60 * 30);

            voteFacade.create(v1);
            voteFacade.create(v2);
            voteFacade.create(v3);
            voteFacade.create(v4);
            voteFacade.create(v5);
            out.println("created 5 votes");


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
