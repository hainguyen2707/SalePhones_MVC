package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.OrderDAO;
import entity.Customer;
import entity.Cart;
import entity.ProductCart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@WebServlet(name = "CheckOutServlet", urlPatterns = {"/CheckOutServlet"})
public class CheckOutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        // Retrieve grandTotal from the hidden field
        double grandTotal = Double.parseDouble(request.getParameter("grandTotal"));

        // Retrieve cart items and customer information
        Enumeration<String> cartKeys = session.getAttributeNames();
        List<ProductCart> cartItems = new ArrayList<>();

        while (cartKeys.hasMoreElements()) {
            String key = cartKeys.nextElement();
            Object obj = session.getAttribute(key);

            if (obj instanceof ProductCart) {
                ProductCart productCart = (ProductCart) obj;
                cartItems.add(productCart);
            }
        }

        // Retrieve customer information (replace with your logic to get customer info)
        Customer customer = new Customer();
        customer.setId(1); // Replace with your logic to get customer ID

        // Create a new Cart object and add ProductCart items to it
        Cart cart = new Cart();
        for (ProductCart productCart : cartItems) {
            cart.addProductCart(productCart);
        }

        // Call the addOrder method in OrderDAO and pass grandTotal
        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.addOrder(customer, cart, grandTotal);

        // If there's an order ID, update the order total
        if (orderId != -1) {
            orderDAO.updateOrderTotal(orderId, grandTotal);
        }

        // Clear the cart after checkout
        cartKeys = session.getAttributeNames();
        while (cartKeys.hasMoreElements()) {
            String key = cartKeys.nextElement();
            Object obj = session.getAttribute(key);

            if (obj instanceof ProductCart) {
                session.removeAttribute(key);
            }
        }

        // Redirect to confirmation or home page
        response.sendRedirect("home"); // Change to your confirmation page
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
