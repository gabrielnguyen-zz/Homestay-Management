 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gabriel Nguyen
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "LoginController";
    private static final String LOGINWEB = "login.jsp";
    private static final String ERROR = "error.jsp";
    private static final String REGISTER = "RegisterController";
    private static final String SEARCH = "SearchController";
    private static final String SEARCHSTAFF = "SearchStaffController";
    private static final String UPDATE = "UpdateStaffController";
    private static final String DELETE = "DeleteStaffController";
    private static final String SEARCHINVOICE = "SearchInvoiceController";
    private static final String EDITINVOICE ="EditInvoiceController";
    private static final String COMPLETEEDIT ="CompleteEditController";
    private static final String ADDTOROOMCART ="AddToRoomCartController";
    private static final String ADDTOSERVICECART ="AddToServiceController";
    private static final String SEARCHUSER ="SearchUserController";
    private static final String DELETEUSER ="DeleteUserController";
    private static final String CHECKOUT="CheckOutController";
    private static final String CHECKIN="CheckInController";
    private static final String DELETECART ="DeleteOrderController";
    private static final String ORDER ="OrderController";
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
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = LOGIN;
            }
            if(action.equals("Book")){
                url = LOGINWEB;
            }
            if (action.equals("Register")) {
                url = REGISTER;
            }
            if (action.equals("Book Now")) {
                url = SEARCH;
            }
            if (action.equals("Search Staff")) {
                url = SEARCHSTAFF;
            }
            if (action.equals("Update")) {
                url = UPDATE;
            }
            if (action.equals("Delete")) {
                url = DELETE;
            }
            if (action.equals("Search Invoice")) {
                url = SEARCHINVOICE;
            }
            if(action.equals("Edit")){
                url = EDITINVOICE;
            }
            if(action.equals("Complete Edit")){
                url = COMPLETEEDIT;
            }
            if(action.equals("Click to continue")){
                url = ADDTOROOMCART;
            }
            if(action.equals("Add to Cart")){
                url = ADDTOSERVICECART;
            }
            if(action.equals("Search User")){
                url = SEARCHUSER;
            }
            if(action.equals("Delete User")){
                url=DELETEUSER;
            }
            if(action.equals("Checkout")){
                url = CHECKOUT;
            }
            if(action.equals("Checkin")){
                url = CHECKIN;
            }
            if(action.equals("Delete Order")){
                url = DELETECART;
            }
            if(action.equals("Order")){
                url = ORDER;
            }
        } catch (Exception e) {
            log("Exception at MainCotroller : " + e.getMessage());
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
