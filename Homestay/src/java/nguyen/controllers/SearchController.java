/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyen.models.BookingDAO;
import nguyen.models.RoomDTO;

/**
 *
 * @author Gabriel Nguyen
 */
public class SearchController extends HttpServlet {

    private static final String SUCCESS = "search.jsp";
    private static final String ERROR = "index.jsp";

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
        String url = ERROR;
        try {
            String checkIn = request.getParameter("txtCheckIn");
            String checkOut = request.getParameter("txtCheckOut");
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            if (sdf.parse(checkIn).after(sdf.parse(checkOut))) {
                request.setAttribute("INVALIDDATE", "Check in date cant be after check out date");
            }
            if (sdf.parse(checkIn).equals(sdf.parse(checkOut))) {
                request.setAttribute("INVALIDDATE", "Check in date cant be the same check out date");
            } else {
                int roomQuantity = sdf.parse(checkOut).getDate() - sdf.parse(checkIn).getDate();
                String person = request.getParameter("cboPerson");
                BookingDAO dao = new BookingDAO();
                List<RoomDTO> result = dao.findByPerson(person);
                request.setAttribute("INFO", result);
                request.setAttribute("ROOMQUANTITY", roomQuantity);
                request.setAttribute("CHECKIN", checkIn);
                request.setAttribute("CHECKOUT", checkOut);
                url = SUCCESS;

            }
        } catch (Exception e) {
            log("Exception at SearchController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
