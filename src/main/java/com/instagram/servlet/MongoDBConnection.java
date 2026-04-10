package com.instagram.servlet;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBConnection {

    private static final String URI = "mongodb://localhost:27017";
    private static final String DB_NAME = "instagram";

    private static MongoClient client;

    static {
        try {
            client = MongoClients.create(URI);
            System.out.println("MongoDB Connected Successfully");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static MongoDatabase getDatabase() {
        return client.getDatabase(DB_NAME);
    }
}