package com.instagram.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String age = request.getParameter("age");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        MongoDatabase db = MongoDBConnection.getDatabase();
        MongoCollection<Document> users = db.getCollection("users");

        // Check existing user
        Document existingUser = users.find(new Document("username", username)).first();

        if (existingUser != null) {
            response.sendRedirect("signup.jsp?error=Username already exists");
            return;
        }

        Document user = new Document("name", name)
                .append("phone", phone)
                .append("email", email)
                .append("age", age)
                .append("username", username)
                .append("password", password);

        users.insertOne(user);

        response.sendRedirect("login.jsp?success=Registered Successfully");
    }
}