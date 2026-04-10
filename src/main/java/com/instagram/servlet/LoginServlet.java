package com.instagram.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        MongoDatabase db = MongoDBConnection.getDatabase();
        MongoCollection<Document> users = db.getCollection("users");

        Document user = users.find(
                new Document("username", username)
                        .append("password", password)
        ).first();

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);

            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid Credentials");
        }
    }
}