/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Cart;
import entity.Customer;
import entity.Item;
import java.time.LocalDate;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBConnect {

    public int addOrder(Customer c, Cart cart, double grandTotal) {
        LocalDate cuDate = LocalDate.now();
        String date = cuDate.toString();
        try {
            // Add order
            String sql = "INSERT INTO [dbo].[Order] ([date], [cid], [totalmoney]) VALUES (?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setString(1, date);
            st.setInt(2, c.getId());
            st.setDouble(3, grandTotal);
            st.executeUpdate();

            // Retrieve the generated order ID
            ResultSet generatedKeys = st.getGeneratedKeys();
            int orderId = -1;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            }

            // If there's an order ID, add orderline and update product quantities
            if (orderId != -1) {
                for (Item item : cart.getItems()) {
                    // Add orderline
                    String sql2 = "INSERT INTO [OrderLine] VALUES (?, ?, ?, ?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, orderId);
                    st2.setString(2, item.getProduct().getId());
                    st2.setInt(3, item.getQuantity());
                    st2.setDouble(4, item.getPrice());
                    st2.executeUpdate();

                    // Update product quantities
                    String sql3 = "UPDATE products SET quantity = quantity - ? WHERE id = ?";
                    PreparedStatement st3 = connection.prepareStatement(sql3);
                    st3.setInt(1, item.getQuantity());
                    st3.setString(2, item.getProduct().getId());
                    st3.executeUpdate();
                }
            }

            return orderId;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    // Trong OrderDAO, thêm hàm sau
    public void updateOrderTotal(int orderId, double totalMoney) {
        try {
            String sql = "UPDATE [dbo].[Order] SET totalmoney=? WHERE id=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, totalMoney);
            st.setInt(2, orderId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addOrderLine(int orderId, int productId, int quantity, double price) {
        try {
            String sql = "INSERT INTO OrderLine (oid, pid, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.setInt(2, productId);
            st.setInt(3, quantity);
            st.setDouble(4, price);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
