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
import model.Position;
import model.PositionFacade;
import model.Seat;
import model.SeatFacade;

/**
 *
 * @author munky
 */
@WebServlet(name = "RegisterPosition", urlPatterns = {"/contestant/RegisterPosition"})
public class RegisterPosition extends HttpServlet {

    @EJB
    private PositionFacade positionFacade;

    @EJB
    private SeatFacade seatFacade;

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
        HttpSession session = request.getSession();
        MyUser login = (MyUser) session.getAttribute("login");
        long id = Long.parseLong(request.getParameter("register"));
        Position targetPosition = positionFacade.find(id);
        
        
        if (login.getRole().equals("contestant")){
            if (seatFacade.userAlreadyRegistered(login)) {
                System.out.println("User already registered!");
                request.setAttribute("error", "You have already registered!");
                request.getRequestDispatcher("register_seat.jsp").include(request, response);
                return;
            }
            
            if (seatFacade.seatsWithPosition(targetPosition).size() >= targetPosition.getNumberOfAvailableSeats()){
                System.out.println("No more seats available for this position");
                request.setAttribute("error", "No more seats available for this position");
                request.getRequestDispatcher("register_seat.jsp").include(request, response);
                return;
            }
            
            
            System.out.println(String.format("%s registered for seat %d", login.getName(), id));
            
            Seat newSeat = new Seat();
            newSeat.setContested_by(login);
            newSeat.setSeat_for(targetPosition);
            
            seatFacade.create(newSeat);
            
            request.getRequestDispatcher("register_seat.jsp").include(request, response);
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
