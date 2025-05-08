package controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Car;
import util.DBConnection;

@WebServlet("/SearchCar")
public class SearchCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");

        List<Car> carList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM cars WHERE license_plate LIKE ? OR model LIKE ? OR owner_id LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setOwnerId(rs.getInt("owner_id"));
                car.setMake(rs.getString("make"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setLicensePlate(rs.getString("license_plate"));
                carList.add(car);
            }

            req.setAttribute("carList", carList);
            req.getRequestDispatcher("view_cars.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp");
        }
    }
}
