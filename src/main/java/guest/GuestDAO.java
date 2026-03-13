package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private GuestVO vo = null;
	
	public GuestDAO() {
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
	
	public void connClose() {
		try {
			conn.close();
		} catch (SQLException e) {}
	}
	
	public void pstmtClose() {
		try {
			if(pstmt != null) pstmt.close();
		} catch (Exception e) {}
	}
	
	public void rsClose() {
		try {
			if(rs != null) rs.close();
			pstmtClose();
		} catch (Exception e) {}
	}
	
	// 방명록 전체 자료 가져오기
	public List<GuestVO> getGuestList(int startIndexNo, int pageSize) {
		List<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "select * from guest order by idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setClientIp(rs.getString("clientIp"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류(getGuestList) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 방명록에 글 등록처리
	public int setGuestInputOk(GuestVO vo) {
		int res = 0;
		try {
			sql = "insert into guest values (default,?,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getClientIp());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류(setGuestInputOk) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 게시글 삭제처리
	public int setGuestDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from guest where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류(setGuestDeleteOk) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 전체 레코드 건수 구하기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from guest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql 오류(getTotRecCnt) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

	public List<GuestVO> getGuestListByName(String name) {
    List<GuestVO> list = new ArrayList<>();
    try {
        sql = "SELECT * FROM guest WHERE name = ? ORDER BY idx DESC";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        while(rs.next()) {
            GuestVO vo = new GuestVO();
            vo.setIdx(rs.getInt("idx"));
            vo.setName(rs.getString("name"));
            vo.setContent(rs.getString("content"));
            vo.setEmail(rs.getString("email"));
            vo.setHomePage(rs.getString("homePage"));
            vo.setVisitDate(rs.getString("visitDate"));
            vo.setClientIp(rs.getString("clientIp"));
            list.add(vo);
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        rsClose();
    }
    return list;
}
	public int getGuestWriteDayCnt(String name) {
    int cnt = 0;
    try {
        sql = "SELECT COUNT(DISTINCT DATE(visitDate)) FROM guest WHERE name = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        if(rs.next()) cnt = rs.getInt(1);
    } catch(SQLException e) {
        System.out.println("SQL문 오류(getGuestWriteDayCnt) : " + e.getMessage());
    } finally {
        rsClose();
    }
    return cnt;
}
	
}


