/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyen.models.BookingDAO;
import nguyen.models.RegistrationErrorObject;

/**
 *
 * @author Gabriel Nguyen
 */
public class RegisterController extends HttpServlet {

    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "index.jsp";

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
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            String fullName = request.getParameter("txtFullname");
            String phone = request.getParameter("txtPhone");
            RegistrationErrorObject error = new RegistrationErrorObject();
            boolean valid = true;
            
            if (username.length() < 4 || username.length() > 50) {
                error.setUsernameError("Username cant be less than 4 characters or more than 50 chars");
                valid = false;
            }
            
            if (password.length() < 4|| password.length() >50) {
                error.setPasswordError("Password cant be less than 4 characters or more than 50 chars");
                valid = false;
            }
            if (fullName.length() <4 || fullName.length() >50){
                error.setFullNameError("Fullname cant be less than 4 characters and more than 50 chars");
                valid = false;
            } 
            if(!confirm.equals(password)){
                error.setConfirmError("Confirm not match with password");
                valid = false;
            }
            String phoneRegex = "[0-9]{6}";
            if(!phone.matches(phoneRegex)){
                error.setPhoneError("Phone contains 6 digit number");
                valid = false;
            }
            if(valid){
                BookingDAO dao = new BookingDAO();
                boolean check = dao.createAccount(username, password, phone, fullName);
                dao.createCustomer(username, phone);
                if(check!=false){
                    url = SUCCESS;
                }else{
                    request.setAttribute("ERROR", error);
                }
            } else{
                request.setAttribute("INVALID", error);
                url=ERROR;
            }
            
        } catch (Exception e) {
            log("Error at RegisterController : " + e.getMessage());
            if(e.getMessage().contains("duplicate")){
                RegistrationErrorObject error = new RegistrationErrorObject();
                error.setUsernameError("Username is duplicate");
                url = ERROR;
                request.setAttribute("INVALID", error);
            }
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
