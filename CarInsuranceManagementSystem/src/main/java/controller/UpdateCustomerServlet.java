package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBConnection;

@WebServlet("/UpdateCustomer")
public class UpdateCustomerServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE customers SET name=?, email=?, phone=?, address=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, address);
            ps.setInt(5, id);
            ps.executeUpdate();
            res.sendRedirect("view_customers.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
