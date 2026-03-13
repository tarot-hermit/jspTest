package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class MemberDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private MemberVO vo = null;
	
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

	// 회원 가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL문 오류(setMemberJoinOk) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 아이디 검색처리
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL문 오류(getMemberIdCheck) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 닉네임 중복체크
	public MemberVO getMemberNickNameCheck(String nickName) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL문 오류(getMemberNickNameCheck) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// ──────────────────────────────────────────────────────────
	// 방문 포인트 처리 (하루 3회 제한)
	// ※ visitCnt 는 이 메서드에서 건드리지 않음
	//   → 날짜 비교 후 visitCnt 증가는 MemberLoginOkCommand 에서 별도 처리
	// ──────────────────────────────────────────────────────────
	public void setMemberPointPlus(String mid) {
    // ✅ 지역변수로 선언 → 충돌 없음
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;

    try {
        // 1차 쿼리
        String sql = "SELECT todayCnt, lastDate FROM member WHERE mid = ?";
        pstmt1 = conn.prepareStatement(sql);
        pstmt1.setString(1, mid);
        rs = pstmt1.executeQuery();

        int todayCnt = 0;
        boolean isToday = false;

        if (rs.next()) {
            todayCnt = rs.getInt("todayCnt");
            java.sql.Date lastDate = rs.getDate("lastDate");
            isToday = lastDate != null && lastDate.toLocalDate().equals(LocalDate.now());
        }

        // 날짜가 다르면 todayCnt 초기화
        if (!isToday) todayCnt = 0;

        if (todayCnt < 3) {
            // 2차 쿼리
            String sql2 = "UPDATE member SET point = point + 10, todayCnt = ? WHERE mid = ?";
            pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setInt(1, todayCnt + 1);
            pstmt2.setString(2, mid);
            pstmt2.executeUpdate();
        }

    } catch (SQLException e) {
        System.out.println("SQL문 오류(setMemberPointPlus) : " + e.getMessage());
    } finally {
        // ✅ 각각 따로 닫기
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (pstmt1 != null) pstmt1.close(); } catch (Exception e) {}
        try { if (pstmt2 != null) pstmt2.close(); } catch (Exception e) {}
    }
}

	// ──────────────────────────────────────────────────────────
	// 방문수 처리: 날짜가 다를 때만 visitCnt +1, lastDate 갱신
	// MemberLoginOkCommand 에서 호출
	// ──────────────────────────────────────────────────────────
	public void updateVisitCntAndLastDate(String mid) {
		try {
			sql = "update member set visitCnt = visitCnt + 1, lastDate = now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL문 오류(updateVisitCntAndLastDate) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// ──────────────────────────────────────────────────────────
	// 오늘 이미 방문한 경우: lastDate(최근접속시간)만 갱신
	// visitCnt 변경 없음
	// ──────────────────────────────────────────────────────────
	public void updateLastDate(String mid) {
		try {
			sql = "update member set lastDate = now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL문 오류(updateLastDate) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 자동등업 조건
	public void setMemberLevelUp(String name) {
		try {
			sql = "UPDATE member SET level = 2 WHERE nickName = ? AND level = 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("SQL문 오류(setMemberLevelUp) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 전체 회원 건수 구하기
	public int getTotRecCnt() {
		int cnt = 0;
		try {
			sql = "select count(*) from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) cnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("SQL문 오류(getTotRecCnt) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return cnt;
	}

	// 페이징 처리된 회원 목록
	public List<MemberVO> getMemberList(int startIndexNo, int pageSize) {
		List<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "SELECT * FROM member WHERE userDel != 'Y' ORDER BY idx DESC LIMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL문 오류(getMemberList) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public int setMemberDelete(String mid) {
    int res = 0;
    try {
    	sql = "UPDATE member SET userDel = 'Y', deleteDate = NOW() WHERE mid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, mid);
        res = pstmt.executeUpdate();
    } catch (SQLException e) {
        System.out.println("SQL문 오류(setMemberDelete) : " + e.getMessage());
    } finally {
        pstmtClose();
    }
    return res;
	}
	
	public boolean isReJoinBlocked(String mid) {
    boolean blocked = false;
    try {
        sql = "SELECT COUNT(*) FROM member " +
              "WHERE mid = ? AND userDel = 'Y' " +
              "AND deleteDate > DATE_SUB(NOW(), INTERVAL 1 MONTH)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, mid);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            blocked = rs.getInt(1) > 0;
        }
    } catch (SQLException e) {
        System.out.println("SQL문 오류(isReJoinBlocked) : " + e.getMessage());
    } finally {
        rsClose();
    }
    return blocked;
}

	public int getDeleteMemberCnt() {
    int cnt = 0;
    try {
        // ✅ conn 상태 확인
        System.out.println("conn 상태 : " + (conn == null ? "null" : conn.isClosed() ? "닫힘" : "정상"));
        
        sql = "SELECT COUNT(*) FROM member WHERE userDel = 'Y'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            cnt = rs.getInt(1);
            System.out.println("탈퇴 회원 수 : " + cnt);
        }
    } catch (SQLException e) {
        System.out.println("SQL문 오류(getDeleteMemberCnt) : " + e.getMessage());
    } finally {
        rsClose();
    }
    return cnt;
}

	
	public List<MemberVO> getAdminMemberList(int startIndexNo, int pageSize) {
    List<MemberVO> vos = new ArrayList<MemberVO>();
    try {
        // ✅ userDel 조건 없이 전체 조회
        sql = "SELECT * FROM member ORDER BY idx DESC LIMIT ?, ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, startIndexNo);
        pstmt.setInt(2, pageSize);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            vo = new MemberVO();
            vo.setIdx(rs.getInt("idx"));
            vo.setMid(rs.getString("mid"));
            vo.setPwd(rs.getString("pwd"));
            vo.setNickName(rs.getString("nickName"));
            vo.setName(rs.getString("name"));
            vo.setGender(rs.getString("gender"));
            vo.setBirthday(rs.getString("birthday"));
            vo.setTel(rs.getString("tel"));
            vo.setAddress(rs.getString("address"));
            vo.setEmail(rs.getString("email"));
            vo.setHomePage(rs.getString("homePage"));
            vo.setJob(rs.getString("job"));
            vo.setHobby(rs.getString("hobby"));
            vo.setPhoto(rs.getString("photo"));
            vo.setContent(rs.getString("content"));
            vo.setUserInfor(rs.getString("userInfor"));
            vo.setUserDel(rs.getString("userDel"));
            vo.setPoint(rs.getInt("point"));
            vo.setLevel(rs.getInt("level"));
            vo.setVisitCnt(rs.getInt("visitCnt"));
            vo.setStartDate(rs.getString("startDate"));
            vo.setLastDate(rs.getString("lastDate"));
            vo.setTodayCnt(rs.getInt("todayCnt"));
            vos.add(vo);
        }
    } catch (SQLException e) {
        System.out.println("SQL문 오류(getAdminMemberList) : " + e.getMessage());
    } finally {
        rsClose();
    }
    return vos;
}
	public int getAdminTotRecCnt() {
    int cnt = 0;
    try {
        sql = "SELECT COUNT(*) FROM member";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if (rs.next()) cnt = rs.getInt(1);
    } catch (SQLException e) {
        System.out.println("SQL문 오류(getAdminTotRecCnt) : " + e.getMessage());
    } finally {
        rsClose();
    }
    return cnt;
}

	public List<MemberVO> getDeleteMemberList(int startIndexNo, int pageSize) {
    List<MemberVO> vos = new ArrayList<MemberVO>();
    try {
        sql = "SELECT * FROM member WHERE userDel = 'Y' ORDER BY deleteDate DESC LIMIT ?, ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, startIndexNo);
        pstmt.setInt(2, pageSize);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            vo = new MemberVO();
            vo.setIdx(rs.getInt("idx"));
            vo.setMid(rs.getString("mid"));
            vo.setNickName(rs.getString("nickName"));
            vo.setName(rs.getString("name"));
            vo.setDeleteDate(rs.getString("deleteDate"));
            vo.setUserDel(rs.getString("userDel"));
            vos.add(vo);
        }
    } catch (SQLException e) {
        System.out.println("SQL문 오류(getDeleteMemberList) : " + e.getMessage());
    } finally {
        rsClose();
    }
    return vos;
}
	
	public int setMemberLevelUpdate(String mid, int level) {
    int res = 0;
    try {
        sql = "UPDATE member SET level = ? WHERE mid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, level);
        pstmt.setString(2, mid);
        res = pstmt.executeUpdate();
    } catch (SQLException e) {
        System.out.println("SQL문 오류(setMemberLevelUpdate) : " + e.getMessage());
    } finally {
        pstmtClose();
    }
    return res;
}

	public int setMemberPwdUpdate(String mid, String newPwd) {
    int res = 0;
    try {
        sql = "UPDATE member SET pwd = ? WHERE mid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, newPwd);
        pstmt.setString(2, mid);
        res = pstmt.executeUpdate();
    } catch (SQLException e) {
        System.out.println("SQL문 오류(setMemberPwdUpdate) : " + e.getMessage());
    } finally {
        pstmtClose();
    }
    return res;
}

	
	
}
