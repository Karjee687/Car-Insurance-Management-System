<%@ page import="java.sql.*, util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Cars</title>
    <style>
        .container {
            max-width: 700px;
            margin: auto;
            padding: 30px;
            background: #f1f1f1;
            border-radius: 15px;
            animation: fadeIn 0.5s ease-in;
        }
        input[type=text], input[type=number] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            animation: fadeIn 0.3s ease-in;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Search Cars by Make or License Plate</h2>
        <form action="SearchCar" method="get">
            <input type="text" name="keyword" placeholder="Enter make or license plate">
            <input type="submit" value="Search">
        </form>

        <%
            String keyword = request.getParameter("keyword");
            if (keyword != null && !keyword.trim().isEmpty()) {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM cars WHERE make LIKE ? OR license_plate LIKE ?");
                ps.setString(1, "%" + keyword + "%");
                ps.setString(2, "%" + keyword + "%");
                ResultSet rs = ps.executeQuery();
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Owner ID</th>
                <th>Make</th>
                <th>Model</th>
                <th>Year</th>
                <th>License Plate</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getInt("owner_id") %></td>
                <td><%= rs.getString("make") %></td>
                <td><%= rs.getString("model") %></td>
                <td><%= rs.getInt("year") %></td>
                <td><%= rs.getString("license_plate") %></td>
            </tr>
            <% } %>
        </table>
        <% con.close(); } %>
    </div>
</body>
</html>
