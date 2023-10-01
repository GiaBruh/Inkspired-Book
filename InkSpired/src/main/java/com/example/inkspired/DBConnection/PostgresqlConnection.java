package com.example.inkspired.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgresqlConnection {
    public static Connection getConn()  {
        Connection conn = null;
        try {
            // Connect method #2
            // Replace #database# with your database name
            // Replace #username# with your actual postgresql username
            // Replace #password# with your actual postgresql password
            String dbURL = "jdbc:postgresql://localhost:5432/InkSpired";
            String user = "giabuu";
            String pass = "11122003";
            Class.forName("org.postgresql.Driver"); // do not remove this line
            conn = DriverManager.getConnection(dbURL, user, pass);
            if (conn != null) {
                System.out.println("Connected to database");
            }
        } catch (Exception e) {
            e.printStackTrace();
//            } finally {
//                try {
//                    if (conn != null && !conn.isClosed()) {
//                        conn.close();
//                    }
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
        }
        return conn;
    }
}
