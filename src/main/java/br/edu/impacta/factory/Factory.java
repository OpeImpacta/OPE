package br.edu.impacta.factory;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Factory {
	
	public Connection getConnection() throws SQLException, Exception{
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/ope", "root", "1234");
		return connection;
	}

}
