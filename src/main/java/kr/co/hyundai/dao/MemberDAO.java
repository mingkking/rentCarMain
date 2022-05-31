package kr.co.hyundai.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.hyundai.vo.MemberVO;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			Context initctx = new InitialContext();
			DataSource ds = (DataSource) initctx.lookup("java:comp/env/jdbc/OracleDB");
			
			con = ds.getConnection();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public int insertMember(MemberVO mVO) {
		con = this.getConnection();
		
		String sql = "insert into customer values(customer_seq.nextVal,?,?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mVO.getId());
			pstmt.setString(2, mVO.getPassword1());
			pstmt.setString(3, mVO.getPassword2());
			pstmt.setString(4, mVO.getEmail());
			pstmt.setString(5, mVO.getTel());
			pstmt.setString(6, mVO.getHobby());
			pstmt.setString(7, mVO.getJob());
			pstmt.setInt(8, mVO.getAge());
			pstmt.setString(9, mVO.getInfo());
			
			result = pstmt.executeUpdate();
			System.out.println("회원가입 성공");
		} catch (SQLException e) {
			System.out.println("회원가입 실패");
			e.getMessage();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println("닫기 실패");
			}
		}
		return result;
	}
	
	public ArrayList<MemberVO> selectMemberAll(){
		ArrayList<MemberVO> arr = null;
		MemberVO mVO = null;
		
		con = this.getConnection();
		String sql = "select * from customer order by num";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				arr = new ArrayList<MemberVO>();
			    do {
			    	mVO = new MemberVO();
			    	mVO.setNum(rs.getInt(1));
					mVO.setId(rs.getString(2));
					mVO.setPassword1(rs.getString(3));
					mVO.setPassword2(rs.getString(4));
					mVO.setEmail(rs.getString(5));
					mVO.setTel(rs.getString(6));
					mVO.setHobby(rs.getString(7));
					mVO.setJob(rs.getString(8));
					mVO.setAge(rs.getInt(9));
					mVO.setInfo(rs.getString(10));
					
					arr.add(mVO);
					
					
			    } while(rs.next());
			}
			System.out.println("전체 회원 보기 성공");
		} catch (SQLException e) {
			System.out.println("전체 회원 보기 실패");
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
		return arr;
	}
	
	public MemberVO selectMemberOne(String id){
		MemberVO mVO = null;
		
		con = this.getConnection();
		if(con == null) {
			System.out.println("con null");
		}
		String sql = "select * from customer where id = ?";
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mVO = new MemberVO();
				mVO.setNum(rs.getInt(1));
				mVO.setId(rs.getString(2));
				mVO.setPassword1(rs.getString(3));
				mVO.setPassword2(rs.getString(4));
				mVO.setEmail(rs.getString(5));
				mVO.setTel(rs.getString(6));
				mVO.setHobby(rs.getString(7));
				mVO.setJob(rs.getString(8));
				mVO.setAge(rs.getInt(9));
				mVO.setInfo(rs.getString(10));
			}
			System.out.println("상세 정보 보기 성공");
		} catch (SQLException e) {
			System.out.println("상세 정보 보기 실패");
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
		return mVO;
	}
	
	public void updateMember(MemberVO mVO) {
		con = this.getConnection();
		
		String sql = "update customer set password1=?, password2=?, email=?, tel=?, hobby=?, job=?, age=?, info=? where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mVO.getPassword1());
			pstmt.setString(2, mVO.getPassword2());
			pstmt.setString(3, mVO.getEmail());
			pstmt.setString(4, mVO.getTel());
			pstmt.setString(5, mVO.getHobby());
			pstmt.setString(6, mVO.getJob());
			pstmt.setInt(7, mVO.getAge());
			pstmt.setString(8, mVO.getInfo());
			pstmt.setString(9, mVO.getId());
			
			pstmt.executeUpdate();
			System.out.println("회원정보 수정 성공");
		} catch (SQLException e) {
			System.out.println("회원정보 수정 실패");
			e.getMessage();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println("닫기 실패");
			}
		}
	}
	
	public void deleteMember(MemberVO mVO) {
		con = this.getConnection();
		
		String sql = "delete from customer where id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mVO.getId());
			
			pstmt.executeUpdate();
			System.out.println("회원정보 삭제 성공");
		} catch (SQLException e) {
			System.out.println("회원정보 삭제 실패");
			e.getMessage();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println("닫기 실패");
			}
		}
	}
	
	public void insertEventCode(MemberVO mVO) {
		con = this.getConnection();
		
		String sql = "update customer set eventCode = ? where id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mVO.getEventCode());
			pstmt.setString(2, mVO.getId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("회원 이벤트코드 추가 실패" + e.getMessage());
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println("닫기 실패");
			}
		}
	}
	
	public int getCoupon(String id){
		int EventCode = 0;
		
		con = this.getConnection();
		String sql = "select eventCode from customer where id = ?";
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				EventCode = rs.getInt(1);
				System.out.println(rs.getInt(1));
			}
		} catch (SQLException e) {
			System.out.println("EventCode 가져오기 실패" + e.getMessage());
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
		return EventCode;
	}
}
