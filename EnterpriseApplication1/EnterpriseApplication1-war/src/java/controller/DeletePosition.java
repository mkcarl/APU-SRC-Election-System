/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Position;
import model.PositionFacade;

/**
 *
 * @author munky
 */
@WebServlet(name = "DeletePosition", urlPatterns = {"/committee/DeletePosition"})
public class DeletePosition extends HttpServlet {

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
        HttpSession session = request.getSession();
        try{
            long id = Long.parseLong(request.getParameter("id"));
            Position found = positionFacade.find(id);

            if (found == null) {
                session.setAttribute("message", String.format("Position with ID \"%d\" not found ", id));

            } else {
                positionFacade.remove(found);

            }
            request.getRequestDispatcher("position.jsp").include(request, response);
            
        } catch (NumberFormatException e){
            request.setAttribute("error", "Please a valid position ID");
            request.getRequestDispatcher("position.jsp").include(request, response);
        } catch (NullPointerException e){
            request.setAttribute("error", String.format("Position with ID \"%s\" not found ", request.getParameter("id")));
            request.getRequestDispatcher("position.jsp").include(request, response);
        } catch(EJBException e){
            request.setAttribute("error", String.format("Position with ID \"%s\" has already been registered by contestants, cannot delete!", request.getParameter("id")));
            request.getRequestDispatcher("position.jsp").include(request, response);
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
