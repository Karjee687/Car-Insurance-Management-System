<%@ page import="java.sql.*, util.DBConnection" %>
<%
    String search = request.getParameter("search");
    String query = "SELECT * FROM customers";
    if (search != null && !search.isEmpty()) {
        query += " WHERE name LIKE '%" + search + "%' OR email LIKE '%" + search + "%'";
    }
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement(query);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
            animation: fadeInDown 0.8s ease;
        }

        form {
            margin-bottom: 15px;
            animation: fadeIn 1s ease;
        }

        input[type="text"] {
            padding: 8px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        input[type="submit"] {
            padding: 8px 16px;
            background-color: #007BFF;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            margin-right: 10px;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            animation: fadeInUp 1s ease;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
            transition: background-color 0.3s ease;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        .add-btn {
            display: inline-block;
            margin-bottom: 15px;
            background-color: #28a745;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .add-btn:hover {
            background-color: #1e7e34;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to   { opacity: 1; }
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<h2>Customer List</h2>

<form method="get" action="view_customers.jsp">
    <input type="text" name="search" placeholder="Search by name or email" value="<%= search != null ? search : "" %>"/>
    <input type="submit" value="Search"/>
</form>

<a href="add_customer.jsp" class="add-btn"> Add New Customer</a>

<table>
    <tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>Actions</th></tr>
    <% while(rs.next()) { %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("address") %></td>
            <td>
                <a href="edit_customer.jsp?id=<%= rs.getInt("id") %>"> Edit</a>
                <a href="DeleteCustomer?id=<%= rs.getInt("id") %>" onclick="return confirm('Delete this customer?')">Delete</a>
            </td>
        </tr>
    <% } %>
</table>

</body>
</html>
