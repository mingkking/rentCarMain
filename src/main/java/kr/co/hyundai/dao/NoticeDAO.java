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
import kr.co.hyundai.vo.NoticeVO;

public class NoticeDAO {
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
	
	public void insertNotice(NoticeVO nVO) {
		this.getConnection();
		
		int noticeNum = 0;
		
		String refSql = "select max(noticeNum) from notice";
		try {
			pstmt = con.prepareStatement(refSql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				noticeNum = rs.getInt(1) + 1;
				System.out.println("noticeNum ���� ��ȣ ���� ����");
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
			System.out.println("noticeNum ���� ��ȣ ���� ����");
		}
		
		String sql = "insert into notice values(?,?,?,?,sysdate)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noticeNum);
			pstmt.setString(2, nVO.getNoticeSubject());
			pstmt.setString(3, nVO.getNoticeWrite());
			pstmt.setString(4, nVO.getNoticeContent());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "���� �ۼ� ����");
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				System.out.println("�ݱ� ����");
			} catch (SQLException e) {
				System.out.println("�ݱ� ����");
			}
		}
	}
	
	public Vector<NoticeVO> selectAllNotice() {
		this.getConnection();
		
		String sql = "select * from Notice order by noticeNum desc";
		Vector<NoticeVO> vec = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vec = new Vector<NoticeVO>();
				do {
					NoticeVO nVO = new NoticeVO(); 
					nVO.setNoticeNum(rs.getInt(1));
					nVO.setNoticeSubject(rs.getString(2));
					nVO.setNoticeWrite(rs.getString(3));
					nVO.setNoticeContent(rs.getString(4));
					nVO.setNoticeReg_date(rs.getDate(5).toLocaleString());
					
					vec.add(nVO);
				} while(rs.next());
			}
		} catch (SQLException e) {
			System.out.println("���� ��� �������� ����");
			e.getMessage();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
				System.out.println("�ݱ� ����");
			} catch (SQLException e) {
				System.out.println("�ݱ� ����");
			}
		}
		
		return vec;
	}
	
	public NoticeVO selectOneNotice(int num) {
		this.getConnection();
		NoticeVO nVO = null;
		
		String sql = "select * from notice where noticeNum = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nVO = new NoticeVO(); 
				nVO.setNoticeNum(rs.getInt(1));
				nVO.setNoticeSubject(rs.getString(2));
				nVO.setNoticeWrite(rs.getString(3));
				nVO.setNoticeContent(rs.getString(4));
				nVO.setNoticeReg_date(rs.getDate(5).toLocaleString());
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "���� �ϳ� �������� ����");
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				System.out.println("�ݱ� ����");
			}
		}
		return nVO;
	}
	
	public void updateNotice(NoticeVO nVO) {
		this.getConnection();
		
		String sql = "update notice set noticeSubject = ?, noticeContent = ?, noticeReg_date = sysdate where noticeNum = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nVO.getNoticeSubject());
			pstmt.setString(2, nVO.getNoticeContent());
			pstmt.setInt(3, nVO.getNoticeNum());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("�Խñ� ���� ����" + e.getMessage());
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				System.out.println("�ݱ� ����");
			}
		}
	}
	
	public void deleteNotice(int num) {
		this.getConnection();
		
		String sql = "delete from notice where noticeNum = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("���� ���� ����" + e.getMessage());
		} 
		
		String sql2 = "update notice set noticeNum = noticeNum - 1 where noticeNum > ?";
		try {
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("���� ��ȣ ������Ʈ ����" + e.getMessage());
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				System.out.println("�ݱ� ����"  + e.getMessage());
			}
		}
	}
	
	
}
