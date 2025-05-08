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

@WebServlet("/DeleteCustomer")
public class DeleteCustomerServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            res.sendRedirect("view_customers.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
