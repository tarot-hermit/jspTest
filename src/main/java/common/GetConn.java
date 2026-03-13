package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {
	private static Connection conn = null;
	
	@SuppressWarnings("unused")
	private static GetConn instance = new GetConn();
  
	private GetConn() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/springgreen";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패 : " + e.getMessage());
		}
	}
	
	public static Connection getConn() {
		return conn;
	}
	
}
