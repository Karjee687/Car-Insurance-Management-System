<%@ page import="model.Insurance" %>
<%
    Insurance insurance = (Insurance) request.getAttribute("insurance");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Insurance</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f2f2f2, #d9e4f5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            width: 400px;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: 600;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Insurance</h2>
        <form action="UpdateInsurance" method="post">
            <input type="hidden" name="insurance_id" value="<%= insurance.getInsuranceId() %>">

            <label>Car ID</label>
            <input type="number" name="car_id" value="<%= insurance.getCarId() %>" required>

            <label>Insurance Company</label>
            <input type="text" name="insurance_company" value="<%= insurance.getInsuranceCompany() %>" required>

            <label>Policy Number</label>
            <input type="text" name="policy_number" value="<%= insurance.getPolicyNumber() %>" required>

            <label>Start Date</label>
            <input type="date" name="start_date" value="<%= insurance.getStartDate() %>" required>

            <label>End Date</label>
            <input type="date" name="end_date" value="<%= insurance.getEndDate() %>" required>

            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
