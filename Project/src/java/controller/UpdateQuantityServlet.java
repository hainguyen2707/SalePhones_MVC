/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.ProductCart;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ProductDAO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateQuantityServlet", urlPatterns = {"/UpdateQuantityServlet"})
public class UpdateQuantityServlet extends HttpServlet {

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
        String productId = request.getParameter("productId");
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        // Kiểm tra và cập nhật số lượng trong giỏ hàng
        HttpSession session = request.getSession();
        Object obj = session.getAttribute(productId);

        if (obj instanceof ProductCart) {
            ProductCart productCart = (ProductCart) obj;
            productCart.setQuantity(newQuantity);
            session.setAttribute(productId, productCart);
        }

        // Cập nhật số lượng sản phẩm trong cơ sở dữ liệu
        ProductDAO dao = new ProductDAO();
        dao.updateProductQuantity(productId, newQuantity);
//        boolean isQuantityValid = dao.checkAndUpdateQuantity(productId, newQuantity); // Kiểm tra và cập nhật số lượng
//
//        if (!isQuantityValid) {
//            // Thiết lập thông báo lỗi
//            request.setAttribute("errorMessage", "Quantity exceeds available stock!");
//            // Chuyển hướng trở lại showcart.jsp để hiển thị thông báo lỗi
//            request.getRequestDispatcher("showcart.jsp").forward(request, response);
//            return; // Dừng xử lý tiếp theo để tránh chuyển hướng đến trang showcart.jsp
//        }

        // Chuyển hướng về trang hiển thị giỏ hàng
        response.sendRedirect("showcart.jsp");
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
