package study2.dbTest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HoewonDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/springgreen";
	private String user = "root";
	private String password = "1234";
	
	private String sql = "";
	private HoewonVO vo = null;
	
	public HoewonDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패 : " + e.getMessage());
		}
	}
	
	public void connClose() {
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {}
	}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}

	// 전체 회원 목록 보기
	public List<HoewonVO> getHoewonList() {
		List<HoewonVO> vos = new ArrayList<>();
		try {
			sql = "select * from hoewon order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new HoewonVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(getHoewonList) + " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원 등록 처리
	public int setHoewonInputOk(HoewonVO vo) {
		int res = 0;
		try {
			sql = "insert into hoewon values (default, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getAddress());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(setHoewonInputOk) + " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 개별회원 검색
	public HoewonVO getHoewonSearch(String name) {
		HoewonVO vo = new HoewonVO();
		try {
			sql = "select * from hoewon where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(getHoewonSearch) + " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원 정보 수정처리
	public int setHoewonUpdateOk(HoewonVO vo) {
		int res = 0;
		try {
			sql = "update hoewon set age=?, gender=?, address=? where name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAge());
			pstmt.setString(2, vo.getGender());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getName());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(getHoewonSearch) + " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 정보 삭제 처리
	public int setHoewonDelete(String name) {
		int res = 0;
		try {
			sql = "delete from hoewon where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(getHoewonSearch) + " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
}
