package com.chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://db01.dbhost.dev:5051/db_454tbfea3"
            + "?useSSL=false"
            + "&serverTimezone=Asia/Kolkata"
            + "&allowPublicKeyRetrieval=true";

    private static final String USER =
            "user_454tbfea3";

    private static final String PASSWORD =
            "p454tbfea3";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD
                    );

            System.out.println(
                    "Database connected successfully!"
            );

            return connection;

        } catch (ClassNotFoundException e) {

            System.out.println(
                    "MySQL JDBC Driver not found."
            );

            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println(
                    "Database connection failed."
            );

            e.printStackTrace();
        }

        return null;
    }
}