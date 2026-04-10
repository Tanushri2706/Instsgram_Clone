package com.instagram.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

@WebServlet("/post")
public class PostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String content = request.getParameter("content");
        String image = request.getParameter("image");

        MongoDatabase db = MongoDBConnection.getDatabase();
        MongoCollection<Document> posts = db.getCollection("posts");

        Document post = new Document("user", user)
                .append("content", content)
                .append("image", image);

        posts.insertOne(post);

        response.sendRedirect("home.jsp");
    }
}