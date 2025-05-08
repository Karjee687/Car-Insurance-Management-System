<%@ page import="java.sql.*, util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM cars WHERE id = ?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    if (!rs.next()) {
        out.println("<h3 style='color:red; text-align:center;'>Car not found!</h3>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Car</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f7f9fb;
            padding: 30px;
        }
        .form-box {
            animation: slideIn 0.4s ease-in;
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 12px;
            background: #fefefe;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        @keyframes slideIn {
            from { transform: translateX(-100px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 6px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background: #2980b9;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #1c5985;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Edit Car</h2>
        <form action="UpdateCar" method="post">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            Owner ID: <input type="number" name="owner_id" value="<%= rs.getInt("owner_id") %>" required><br>
            Make: <input type="text" name="make" value="<%= rs.getString("make") %>" required><br>
            Model: <input type="text" name="model" value="<%= rs.getString("model") %>" required><br>
            Year: <input type="number" name="year" value="<%= rs.getInt("year") %>" required><br>
            License Plate: <input type="text" name="license_plate" value="<%= rs.getString("license_plate") %>" required><br><br>
            <input type="submit" value="Update Car">
        </form>
    </div>
</body>
</html>
<%
    rs.close();
    ps.close();
    con.close();
%>
