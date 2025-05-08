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

@WebServlet("/UpdateCar")
public class UpdateCarServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int ownerId = Integer.parseInt(req.getParameter("owner_id"));
        String make = req.getParameter("make");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        String plate = req.getParameter("license_plate");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "UPDATE cars SET owner_id=?, make=?, model=?, year=?, license_plate=? WHERE id=?");
            ps.setInt(1, ownerId);
            ps.setString(2, make);
            ps.setString(3, model);
            ps.setInt(4, year);
            ps.setString(5, plate);
            ps.setInt(6, id);
            ps.executeUpdate();
            res.sendRedirect("view_cars.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
