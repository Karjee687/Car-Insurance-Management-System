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

@WebServlet("/DeleteInsurance")
public class DeleteInsuranceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int insuranceId = Integer.parseInt(req.getParameter("insurance_id"));

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM insurance WHERE insurance_id = ?");
            ps.setInt(1, insuranceId);
            ps.executeUpdate();

            res.sendRedirect("view_insurance.jsp"); // Refresh view page after deletion
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
