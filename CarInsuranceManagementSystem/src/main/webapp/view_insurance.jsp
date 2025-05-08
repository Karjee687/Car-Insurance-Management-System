<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Insurance</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 80%;
            margin-top: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            overflow: hidden;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
            animation: fadeIn 1s ease-in-out;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            animation: fadeInUp 1s ease-out;
        }

        table th, table td {
            padding: 10px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:hover {
            background-color: #f1f1f1;
            transform: scale(1.02);
            transition: transform 0.2s ease-in-out;
        }

        .actions a {
            color: #007bff;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #e7f1ff;
            transition: background-color 0.3s;
        }

        .actions a:hover {
            background-color: #007bff;
            color: white;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .search-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .search-container input {
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ddd;
            width: 250px;
            margin-right: 10px;
        }

        .search-container button {
            padding: 10px 20px;
            font-size: 1rem;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Insurance Records</h1>

        <!-- Search bar -->
        <div class="search-container">
            <form action="SearchInsurance" method="get">
                <input type="text" name="search_query" placeholder="Search insurance records..." required>
                <button type="submit">Search</button>
            </form>
        </div>

        <!-- Insurance Table -->
        <table>
            <thead>
                <tr>
                    <th>Insurance ID</th>
                    <th>Car ID</th>
                    <th>Company</th>
                    <th>Policy Number</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="insurance" items="${insuranceList}">
                    <tr>
                        <td>${insurance.insuranceId}</td>
                        <td>${insurance.carId}</td>
                        <td>${insurance.insuranceCompany}</td>
                        <td>${insurance.policyNumber}</td>
                        <td>${insurance.startDate}</td>
                        <td>${insurance.endDate}</td>
                        <td class="actions">
                            <a href="EditInsurance?insurance_id=${insurance.insuranceId}">Edit</a> |
                            <a href="DeleteInsurance?insurance_id=${insurance.insuranceId}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
