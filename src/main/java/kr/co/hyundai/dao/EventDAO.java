package kr.co.hyundai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.hyundai.vo.BoardVO;
import kr.co.hyundai.vo.EventVO;
import kr.co.hyundai.vo.NoticeVO;

public class EventDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConnection() {
		try {
			Context initctx = new InitialContext();
			DataSource ds = (DataSource) initctx.lookup("java:comp/env/jdbc/OracleDB");
			
			con = ds.getConnection();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertEvent(EventVO eVO) {
		this.getConnection();
		
		int eventNum = 0;
		
		String refSql = "select max(eventNum) from event";
		try {
			pstmt = con.prepareStatement(refSql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				eventNum = rs.getInt(1) + 1;
				System.out.println("eventNum 공지 번호 증가 성공");
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
			System.out.println("eventNum 공지 번호 증가 실패");
		}
		
		String sql = "insert into event values(?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eventNum);
			pstmt.setInt(2, eVO.getEventCode());
			pstmt.setString(3, eVO.getEventContent());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "이벤트 발생 실패");
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println("닫기 실패");
			}
		}
	}
	
	public Vector<EventVO> selectAllEvent() {
		this.getConnection();
		
		String sql = "select * from Event order by EventNum desc";
		Vector<EventVO> vec = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vec = new Vector<EventVO>();
				do {
					EventVO eVO = new EventVO(); 
					eVO.setEventNum(rs.getInt(1));
					eVO.setEventCode(rs.getInt(2));
					eVO.setEventContent(rs.getString(3));
					
					vec.add(eVO);
				} while(rs.next());
			}
		} catch (SQLException e) {
			System.out.println("공지 목록 가져오기 실패");
			e.getMessage();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println("닫기 실패");
			}
		}
		
		return vec;
	}
	
	public void deleteEvent(int num) {
		this.getConnection();
		
		String sql = "delete from event where eventNum = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("이벤트 삭제 실패" + e.getMessage());
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				System.out.println("닫기 실패"  + e.getMessage());
			}
		}
	}
	
	
}
