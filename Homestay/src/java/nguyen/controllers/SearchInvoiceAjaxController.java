/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.controllers;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyen.models.BookingDAO;
import nguyen.models.InvoiceDTO;
import nguyen.models.StaffDTO;

/**
 *
 * @author Gabriel Nguyen
 */
@WebServlet("/SearchInvoice")
public class SearchInvoiceAjaxController extends HttpServlet {

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
        if(!request.getParameter("txtSearchInvoiceID").matches("[0-9]")){
            request.setAttribute("ERROR", "Please input digit number");
        }
        int id = Integer.parseInt(request.getParameter("txtSearchInvoiceID"));
        BookingDAO dao = new BookingDAO();
        List<InvoiceDTO> result;
        try {
            result = dao.findInvoiceByID(id);

            if (!result.isEmpty()) {
                PrintWriter out = response.getWriter();
                response.setCharacterEncoding("UTF8");
                response.setContentType("application/json");
                Gson gson = new Gson();
                String objectReturn = gson.toJson(result);//convert lit -> json
                out.write(objectReturn);//dua json tra ve ajax
                out.flush();
//                url = SUCCESS;
            } else {
                PrintWriter out = response.getWriter();
                response.setCharacterEncoding("UTF8");
                response.setContentType("application/json");
                out.write("{\"check\":\"fail\"}");
                out.flush();
            }
        } catch (Exception ex) {
            log("Errot at Search Invoice ajax : " + ex.getMessage());
        }
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
