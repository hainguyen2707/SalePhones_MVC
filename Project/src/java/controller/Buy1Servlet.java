/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Product;
import entity.ProductCart;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.ProductDAO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Buy1Servlet", urlPatterns = {"/buy1"})
public class Buy1Servlet extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        ProductDAO dao = new ProductDAO();
        String service = request.getParameter("service");
        if (service.equals("add2cart")) {
            String id = request.getParameter("id");
            //id ~ key
            ProductCart productCart = (ProductCart) session.getAttribute(id);
            if (productCart == null) { // firsttime
                productCart = new ProductCart();
                //get Title by id
                Vector<Product> vector
                        = dao.getAll("select * from products where id='" + id + "'");
                Product product = vector.get(0);
                productCart.setId(product.getId());
                productCart.setName(product.getName());
                productCart.setPrice(product.getPrice());
                productCart.setQuantity(1);
                session.setAttribute(id, productCart);
            } else {
                productCart.setQuantity(productCart.getQuantity() + 1);
                session.setAttribute(id, productCart);
            }
            response.sendRedirect("home");
        }
        if (service.equals("showcart")) {
            RequestDispatcher dis
                    = request.getRequestDispatcher("showcart.jsp");
            //run
            dis.forward(request, response);
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
