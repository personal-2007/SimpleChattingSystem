package com.chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://db01.dbhost.dev:5051/db_454t232q8"
            + "?useSSL=false"
            + "&serverTimezone=Asia/Kolkata"
            + "&allowPublicKeyRetrieval=true";

    private static final String USER = "user_454t232q8";

    /*
     * Put your ByteXL MySQL password here.
     */
    private static final String PASSWORD = "p454t232q8";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL JDBC Driver not found.");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("Database connection failed.");
            e.printStackTrace();
        }

        return null;
    }
}