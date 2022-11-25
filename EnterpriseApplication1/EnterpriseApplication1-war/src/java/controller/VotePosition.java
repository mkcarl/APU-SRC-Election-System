/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MyUser;
import model.Position;
import model.PositionFacade;
import model.Seat;
import model.SeatFacade;
import model.VoteFacade;

/**
 *
 * @author munky
 */
@WebServlet(name = "VotePosition", urlPatterns = {"/student/VotePosition"})
public class VotePosition extends HttpServlet {

    @EJB
    private VoteFacade voteFacade;

    @EJB
    private SeatFacade seatFacade;

    @EJB
    private PositionFacade positionFacade;

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
       
        MyUser login = (MyUser) request.getSession().getAttribute("login");
        long positionID = Long.parseLong(request.getParameter("position"));
        Position pos = positionFacade.find(positionID);
        
        // check if student had voted for this position
        // if voted, just show that they had voted. 
        // else, lead them to the candidate list. 
        
        if (voteFacade.userHasVotedPosition(login, pos)){
            request.getRequestDispatcher("already_voted.jsp").include(request, response);
            return;
        }
        
        
        List<Seat> candidates = seatFacade.seatsWithPosition(pos);
        
        request.setAttribute("candidates", candidates);
        request.setAttribute("position", pos);
        request.getRequestDispatcher("vote_candidates.jsp").include(request, response);
        
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
