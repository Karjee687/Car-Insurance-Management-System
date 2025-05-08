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

@WebServlet("/AddInsurance")
public class AddInsuranceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Retrieve form parameters
        int carId = Integer.parseInt(req.getParameter("car_id"));
        String insuranceCompany = req.getParameter("insurance_company");
        String policyNumber = req.getParameter("policy_number");
        String startDate = req.getParameter("start_date");
        String endDate = req.getParameter("end_date");

        // Database connection and insertion
        try (Connection con = DBConnection.getConnection()) {
            // SQL query for inserting new insurance record
            String sql = "INSERT INTO insurance (car_id, insurance_company, policy_number, start_date, end_date) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            // Set the parameters for the query
            ps.setInt(1, carId);
            ps.setString(2, insuranceCompany);
            ps.setString(3, policyNumber);
            ps.setString(4, startDate);
            ps.setString(5, endDate);

            // Execute the update to insert the record
            ps.executeUpdate();

            // Redirect to the page where insurance records are listed
            res.sendRedirect("view_insurance.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
