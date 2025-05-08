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

@WebServlet("/AddCar")
public class AddCarServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int ownerId = Integer.parseInt(req.getParameter("owner_id"));
        String make = req.getParameter("make");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        String plate = req.getParameter("license_plate");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO cars (owner_id, make, model, year, license_plate) VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, ownerId);
            ps.setString(2, make);
            ps.setString(3, model);
            ps.setInt(4, year);
            ps.setString(5, plate);
            ps.executeUpdate();
            res.sendRedirect("view_cars.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
