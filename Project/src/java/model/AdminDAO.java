/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class AdminDAO extends DBConnect {

    public Admin getAdminByUsername(String username) {
    String sql = "select * from Admin where Username like ?";
    try {
        PreparedStatement st = connection.prepareCall(sql);
        st.setString(1, username); // Sử dụng tham số của câu truy vấn
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            Admin a = new Admin(rs.getString("Username"), rs.getString("Password"), rs.getInt("role"));
            return a;
        }

    } catch (SQLException e) {
        System.err.println(e.getMessage());
        // Xử lý ngoại lệ nếu cần
    }
    return null;
}


    public void insert(Admin a) {
        String sql = "INSERT INTO [dbo].[Admin]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[role])\n"
                + "     VALUES (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setInt(3, a.getRole());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

        public void signUp(Admin a) {
        String sql = "INSERT INTO [dbo].[Admin]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[role])\n"
                + "     VALUES (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setInt(3, 0);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Admin check(String username, String password) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Admin]\n"
                + "  where Username=? and Password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(rs.getString("Username"), rs.getString("Password"), rs.getInt("role"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public Admin checkAccount(String username) {
        String sql = "SELECT [Username]\n"
                + "      ,[Password]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Admin]\n"
                + "  where Username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(rs.getString("Username"), rs.getString("Password"), rs.getInt("role"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AdminDAO a = new AdminDAO();
        Admin anew = a.getAdminByUsername("sa");
        System.out.println(anew);
    }
}
