package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.DBConnection;

@WebServlet("/UpdateInsurance")
public class UpdateInsuranceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int insuranceId = Integer.parseInt(req.getParameter("insurance_id"));
        int carId = Integer.parseInt(req.getParameter("car_id"));
        String company = req.getParameter("insurance_company");
        String policy = req.getParameter("policy_number");
        String start = req.getParameter("start_date");
        String end = req.getParameter("end_date");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "UPDATE insurance SET car_id=?, insurance_company=?, policy_number=?, start_date=?, end_date=? WHERE insurance_id=?"
            );
            ps.setInt(1, carId);
            ps.setString(2, company);
            ps.setString(3, policy);
            ps.setString(4, start);
            ps.setString(5, end);
            ps.setInt(6, insuranceId);

            ps.executeUpdate();
            res.sendRedirect("view_insurance.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
