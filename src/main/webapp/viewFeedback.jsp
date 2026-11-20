
<%@ page import="java.util.List" %>
<%@ page import="com.example.feedback.Feedback" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Feedback</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f5fa;
            padding: 30px;
        }

        .container {
            max-width: 700px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #2457a7;
        }

        .feedback {
            background: #eef4ff;
            padding: 15px;
            margin: 15px 0;
            border-radius: 8px;
        }

        a {
            color: #2457a7;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Submitted Feedback</h2>

    <%
        List<Feedback> feedbackList =
            (List<Feedback>) application.getAttribute("feedbackList");

        if (feedbackList == null || feedbackList.isEmpty()) {
    %>

        <p>No feedback submitted yet.</p>

    <%
        } else {
            synchronized (feedbackList) {
                for (Feedback feedback : feedbackList) {
    %>

        <div class="feedback">
            <p><strong>Name:</strong>
                <%= org.apache.commons.text.StringEscapeUtils.escapeHtml4(feedback.getName()) %>
            </p>

            <p><strong>Email:</strong>
                <%= org.apache.commons.text.StringEscapeUtils.escapeHtml4(feedback.getEmail()) %>
            </p>

            <p><strong>Message:</strong>
                <%= org.apache.commons.text.StringEscapeUtils.escapeHtml4(feedback.getMessage()) %>
            </p>
        </div>

    <%
                }
            }
        }
    %>

    <p><a href="feedback.jsp">Submit More Feedback</a></p>

</div>
</body>
</html>
