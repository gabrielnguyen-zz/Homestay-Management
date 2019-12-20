/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyen.models.BookingDAO;
import nguyen.models.InvoiceDTO;

/**
 *
 * @author Gabriel Nguyen
 */
public class OrderController extends HttpServlet {

    private static final String SUCCESS = "HistoryController";
    private static final String ERROR = "error,jsp";

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
            int serviceID = 1;
            int servicePrice = 0;
            int serviceQuantity = 0;
            HttpSession session = request.getSession();
            String customerName = (String) session.getAttribute("USERNAME");
            int invoicePrice = Integer.parseInt(request.getParameter("txtTotal"));
            int roomID = Integer.parseInt(request.getParameter("txtRoomID"));
            int roomPrice = Integer.parseInt(request.getParameter("txtRoomPrice"));
            int roomQuantity = Integer.parseInt(request.getParameter("txtRoomQuantity"));
            InvoiceDTO dto = new InvoiceDTO();
            if (request.getParameter("txtServiceID") != null) {
                serviceID = Integer.parseInt(request.getParameter("txtServiceID"));
                servicePrice = Integer.parseInt(request.getParameter("txtServicePrice"));
                serviceQuantity = Integer.parseInt(request.getParameter("txtServiceQuantity"));
            }
            BookingDAO dao = new BookingDAO();

            DateFormat userDate = new SimpleDateFormat("MM/dd/yyyy");
            DateFormat dateConvert = new SimpleDateFormat("yyyy-MM-dd");
            String in = (String) session.getAttribute("CHECKIN");
            String out = (String) session.getAttribute("CHECKOUT");
            Date dateIn = userDate.parse(in);
            Date dateOut = userDate.parse(out);
            String checkIn = dateConvert.format(dateIn);
            String checkOut = dateConvert.format(dateOut);

            if (dao.insertInvoiceRoom(roomID, roomPrice, roomQuantity) != false) {
                int invoiceRoomID = dao.getInvoiceRoomID();
                if (dao.insertInvoiceService(invoiceRoomID, serviceID, servicePrice, serviceQuantity) != false) {

                    if (dao.insertInvoice(checkIn, checkOut, invoicePrice, invoiceRoomID, customerName)) {
                        int invoiceID = dao.getInvoiceID();
                        if (dao.insertInvoiceToCustomer(invoiceID,customerName)) {
                            url = SUCCESS;
                        }
                    }

                }
            }
            
        } catch (Exception e) {
            log("error at Order Controller:" + e.getMessage());
        }finally{
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
