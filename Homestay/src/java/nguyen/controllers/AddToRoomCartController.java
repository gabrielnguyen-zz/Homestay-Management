/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyen.models.Cart;
import nguyen.models.InvoiceDTO;

/**
 *
 * @author Gabriel Nguyen
 */
public class AddToRoomCartController extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            Cart shoppingCart = (Cart) session.getAttribute("CART");
            if(shoppingCart == null){
                shoppingCart = new Cart("", new HashMap<String,InvoiceDTO>());
            }
            int roomID = Integer.parseInt(request.getParameter("txtRoomID"));
            String roomName =request.getParameter("txtRoomName");
            int roomPrice = Integer.parseInt(request.getParameter("txtRoomPrice"));
            int roomQuantity = Integer.parseInt(request.getParameter("roomQuantity"));
            String checkIn =  request.getParameter("checkIn");
            String checkOut =  request.getParameter("checkOut");
            InvoiceDTO dto = new InvoiceDTO(roomPrice, roomQuantity, roomID, roomName);
            shoppingCart.addToRoomCart(dto);
            session.setAttribute("CART", shoppingCart);
            session.setAttribute("ROOMQUANTITY", roomQuantity);
            session.setAttribute("CHECKIN", checkIn);
            session.setAttribute("CHECKOUT", checkOut);
        } catch (Exception e) {
            log("Error at AddToRoomCartCOntroller : " + e.getMessage());
        } finally{
            request.getRequestDispatcher("SearchServiceController").forward(request, response);
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
