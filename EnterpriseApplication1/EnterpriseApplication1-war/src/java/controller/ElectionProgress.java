/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Config;
import model.MyUserFacade;
import model.PositionFacade;
import model.Vote;
import model.VoteFacade;

/**
 *
 * @author munky
 */
@WebServlet(name = "ElectionProgress", urlPatterns = {"/committee/ElectionProgress"})
public class ElectionProgress extends HttpServlet {

    @EJB
    private VoteFacade voteFacade;

    @EJB
    private PositionFacade positionFacade;

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
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy HH:mm:ss");
        String eStart = sdf.format(new Date(Config.getStartTimestamp() * 1000L));
        String eEnd = sdf.format(new Date((Config.getStartTimestamp() + Config.getDuration()) * 1000L));
        String eDuration = String.format("%d hours %d minutes", Config.getDuration() / 3600, (Config.getDuration() % 3600)/60);
        String registeredStudents = String.format("%d", myUserFacade.findByRole("student").size());
        String registeredContestants = String.format("%d", myUserFacade.findByRole("contestant").size());
        String nPosition = String.format("%d", positionFacade.count());
        String percentVoted = String.format("%.2f%%", (float)voteFacade.numberOfUniqueVoters()/(float)myUserFacade.findByRole("student").size()*100);
        List<Long> voteTimestamps = new ArrayList<>();

        voteFacade.findAll().forEach((v) -> {
            voteTimestamps.add(v.getTime_voted());
        });
        
        request.setAttribute("eStart", eStart);
        request.setAttribute("eEnd", eEnd);
        request.setAttribute("eDuration", eDuration);
        request.setAttribute("registeredStudents", registeredStudents);
        request.setAttribute("registeredContestants", registeredContestants);
        request.setAttribute("nPosition", nPosition);
        request.setAttribute("percentageVoted", percentVoted);
        request.setAttribute("voteTimestamps", voteTimestamps);
        
        request.getRequestDispatcher("election_progress.jsp").include(request, response);
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
