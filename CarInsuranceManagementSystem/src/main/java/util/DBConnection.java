package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	 private static final String URL = "jdbc:mysql://localhost:3306/mydb";
	    private static final String USER = "root";
	    private static final String PASS = "password123";

	    public static Connection getConnection() throws SQLException {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        return DriverManager.getConnection(URL, USER, PASS);
	    }
	

}
