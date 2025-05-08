package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Insurance;
import util.DBConnection;

@WebServlet("/SearchInsurance")
public class SearchInsuranceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String searchQuery = req.getParameter("search_query");
        
        List<Insurance> insuranceList = new ArrayList<>();
        
        // SQL query to search insurance records
        String sql = "SELECT * FROM insurance WHERE insurance_company LIKE ? OR policy_number LIKE ?";

        try (Connection con = DBConnection.getConnection()) {
            // Prepare the statement with search criteria
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%"); // Search by insurance company
            ps.setString(2, "%" + searchQuery + "%"); // Search by policy number

            // Execute the query and get the result set
            ResultSet rs = ps.executeQuery();

            // Loop through the result set and create Insurance objects
            while (rs.next()) {
                Insurance insurance = new Insurance();
                insurance.setInsuranceId(rs.getInt("id"));
                insurance.setCarId(rs.getInt("car_id"));
                insurance.setInsuranceCompany(rs.getString("insurance_company"));
                insurance.setPolicyNumber(rs.getString("policy_number"));
                insurance.setStartDate(rs.getString("start_date"));
                insurance.setEndDate(rs.getString("end_date"));

                // Add the insurance object to the list
                insuranceList.add(insurance);
            }

            // Set the list of insurance records as a request attribute
            req.setAttribute("insuranceList", insuranceList);

            // Forward the request to the view page to display the search results
            req.getRequestDispatcher("view_insurance.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
