<%@ page import="java.util.*, model.Car" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Car Management</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 40px;
      background: #f5f7fa;
      color: #333;
    }

    h2 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 30px;
      animation: fadeInDown 0.5s ease-out;
    }

    .search-bar {
      text-align: center;
      margin-bottom: 20px;
    }

    .search-bar input[type="text"] {
      padding: 8px 12px;
      width: 300px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .search-bar button {
      padding: 8px 16px;
      background-color: #3498db;
      border: none;
      color: white;
      border-radius: 4px;
      cursor: pointer;
    }

    .search-bar button:hover {
      background-color: #2980b9;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      animation: fadeIn 1s ease;
    }

    th, td {
      padding: 12px 16px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }

    th {
      background-color: #2c3e50;
      color: white;
    }

    tr:hover {
      background-color: #ecf0f1;
      transition: background-color 0.3s ease;
    }

    .action-buttons button {
      margin-right: 6px;
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .edit-btn {
      background-color: #27ae60;
      color: white;
    }

    .edit-btn:hover {
      background-color: #1e8449;
    }

    .delete-btn {
      background-color: #e74c3c;
      color: white;
    }

    .delete-btn:hover {
      background-color: #c0392b;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @keyframes fadeInDown {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>

  <h2>Car Management</h2>

  <div class="search-bar">
    <form action="SearchCar" method="post">
      <input type="text" name="keyword" placeholder="Search by model, plate, or owner ID" required />
      <button type="submit">Search</button>
    </form>
  </div>

  <%
    List<Car> carList = (List<Car>) request.getAttribute("carList");
    if (carList != null && !carList.isEmpty()) {
  %>
    <table>
      <tr>
        <th>ID</th>
        <th>Owner ID</th>
        <th>Make</th>
        <th>Model</th>
        <th>Year</th>
        <th>License Plate</th>
        <th>Actions</th>
      </tr>
      <% for (Car car : carList) { %>
      <tr>
        <td><%= car.getId() %></td>
        <td><%= car.getOwnerId() %></td>
        <td><%= car.getMake() %></td>
        <td><%= car.getModel() %></td>
        <td><%= car.getYear() %></td>
        <td><%= car.getLicensePlate() %></td>
        <td class="action-buttons">
          <form action="edit_car.jsp" method="get" style="display:inline;">
            <input type="hidden" name="id" value="<%= car.getId() %>">
            <button type="submit" class="edit-btn">Edit</button>
          </form>
         <form action="DeleteCar" method="post" onsubmit="return confirm('Delete this car?');" style="display:inline;">
  <input type="hidden" name="id" value="<%= car.getId() %>">
  <button type="submit" class="delete-btn">Delete</button>
</form>
         
          
        </td>
      </tr>
      <% } %>
    </table>
  <% } else { %>
    <p style="text-align: center;">No cars found.</p>
  <% } %>

</body>
</html>