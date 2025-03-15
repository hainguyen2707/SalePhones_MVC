/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.ProductDAO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ProductManagerServlet", urlPatterns = {"/ProductManagerServlet"})
public class ProductManagerServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductManagerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Product> productList = dao.getAll();

        // Gửi danh sách sản phẩm đến trang JSP
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        // Lấy thông tin số lượng và ID sản phẩm từ request
//        String productId = request.getParameter("productId");
//        int newQuantity = Integer.parseInt(request.getParameter("quantity"));
//
//        // Cập nhật số lượng sản phẩm trong cơ sở dữ liệu
//        ProductDAO dao = new ProductDAO();
//        dao.updateProductQuantity(productId, newQuantity);
//
//        // Sau khi cập nhật, chuyển hướng đến doGet để hiển thị lại danh sách sản phẩm
//        response.sendRedirect(request.getContextPath() + "/ProductManagerServlet");
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
