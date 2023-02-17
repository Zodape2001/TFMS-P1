package com.revature.tfms.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DatabaseConnection {
	
	private static Connection connection = null;
	public static Connection getConnection() {
		if (connection == null) {
//			ResourceBundle resourceBundle = ResourceBundle.getBundle("mysql");
//			String driver = resourceBundle.getString("driver");
//			String dburl = resourceBundle.getString("dburl");
//			String username = resourceBundle.getString("username");
//			String password = resourceBundle.getString("password");
			String dburl="jdbc:mysql://localhost/tfms_p0";
			String driver="com.mysql.cj.jdbc.Driver";

			try {
				Class.forName(driver);
				connection = DriverManager.getConnection(dburl, "root", "1234");
				System.out.println("connected");
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
}
