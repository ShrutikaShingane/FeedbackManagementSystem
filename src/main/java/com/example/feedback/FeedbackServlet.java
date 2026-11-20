
package com.example.feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        if (getServletContext().getAttribute("feedbackList") == null) {
            getServletContext().setAttribute(
                    "feedbackList",
                    new ArrayList<Feedback>()
            );
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        if (name == null || email == null || message == null
                || name.isBlank() || email.isBlank()
                || message.isBlank()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "All fields are required."
            );
            return;
        }

        @SuppressWarnings("unchecked")
        List<Feedback> feedbackList =
                (List<Feedback>) getServletContext()
                        .getAttribute("feedbackList");

        synchronized (feedbackList) {
            feedbackList.add(new Feedback(name, email, message));
        }

        response.sendRedirect(
                request.getContextPath() + "/viewFeedback.jsp"
        );
    }
}
