package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Insurance;
import util.DBConnection;

@WebServlet("/EditInsurance")
public class EditInsuranceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int insuranceId = Integer.parseInt(req.getParameter("insurance_id"));

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM insurance WHERE insurance_id = ?");
            ps.setInt(1, insuranceId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Insurance insurance = new Insurance();
                insurance.setInsuranceId(rs.getInt("insurance_id"));
                insurance.setCarId(rs.getInt("car_id"));
                insurance.setInsuranceCompany(rs.getString("insurance_company"));
                insurance.setPolicyNumber(rs.getString("policy_number"));
                insurance.setStartDate(rs.getString("start_date"));
                insurance.setEndDate(rs.getString("end_date"));

                req.setAttribute("insurance", insurance);
                req.getRequestDispatcher("edit_insurance.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
