<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
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
            background: white;
            padding: 25px;
            max-width: 500px;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            animation: fadeInUp 1s ease;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0,123,255,0.4);
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1e7e34;
        }

        a.back-link {
            display: inline-block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
            transition: color 0.3s;
        }

        a.back-link:hover {
            color: #0056b3;
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<h2>Add New Customer</h2>

<form action="AddCustomer" method="post">
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" required>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required>

    <label for="mobile">Phone:</label>
    <input type="text" name="mobile" id="mobile" required>

    <label for="address">Address:</label>
    <textarea name="address" id="address" required></textarea>

    <input type="submit" value="Add Customer">
</form>

<a href="view_customers.jsp" class="back-link">Back to Customer List</a>

</body>
</html>
