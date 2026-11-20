
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f5fa;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 450px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            color: #2457a7;
        }

        label {
            display: block;
            margin-top: 15px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #2457a7;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Feedback Form</h2>

    <form action="feedback" method="post">
        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Feedback Message:</label>
        <textarea name="message" rows="5" required></textarea>

        <button type="submit">Submit Feedback</button>
    </form>
</div>

</body>
</html>
