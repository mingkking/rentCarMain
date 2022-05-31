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

public class BoardDAO {
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
	
	public void insertBoard(BoardVO bVO) {
		this.getConnection();
		
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		
		String refSql = "select max(ref) from smartBoard";
		try {
			pstmt = con.prepareStatement(refSql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ref = rs.getInt(1) + 1;
				System.out.println("ref 게시글 번호 증가 성공");
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
			System.out.println("ref 게시글 번호 증가 실패");
		}
		
		String sql = "insert into smartBoard values(Board1_seq.nextVal,?,?,?,?,sysdate,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bVO.getWriter());
			pstmt.setString(2, bVO.getEmail());
			pstmt.setString(3, bVO.getSubject());
			pstmt.setString(4, bVO.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setInt(8, 0);
			pstmt.setString(9, bVO.getContent());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			
			pstmt.executeUpdate();
			System.out.println("게시글 삽입 성공");
		} catch (SQLException e) {
			System.out.println("게시글 삽입 실패");
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
	
	public Vector<BoardVO> selectAllBoard() {
		this.getConnection();
		
		String sql = "select * from smartBoard order by ref desc, re_level";
		Vector<BoardVO> vec = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vec = new Vector<BoardVO>();
				do {
					BoardVO bVO = new BoardVO(); 
					bVO.setNum(rs.getInt(1));
					bVO.setWriter(rs.getString(2));
					bVO.setEmail(rs.getString(3));
					bVO.setSubject(rs.getString(4));
					bVO.setPassword(rs.getString(5));
					bVO.setReg_date(rs.getDate(6).toString());
					bVO.setRef(rs.getInt(7));
					bVO.setRe_step(rs.getInt(8));
					bVO.setRe_level(rs.getInt(9));
					bVO.setReadCount(rs.getInt(10));
					bVO.setContent(rs.getString(11));
					bVO.setCnt(rs.getInt(12));
					bVO.setPno(rs.getInt(13));
					
					vec.add(bVO);
				} while(rs.next());
			}
			
			System.out.println("게시글 목록 가져오기 성공");
		} catch (SQLException e) {
			System.out.println("게시글 목록 가져오기 실패");
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
	
	public BoardVO selectOneBoard(int num) {
		this.getConnection();
		BoardVO bVO = null;
		
		try {
			String readSql = "update smartBoard set readCount = readCount + 1 where num = ?";
			pstmt = con.prepareStatement(readSql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			System.out.println("조회수 증가 성공");
		} catch(Exception e) {
			e.getMessage();
			System.out.println("조회수 증가 실패");
		}
		
		String sql = "select * from smartBoard where num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVO = new BoardVO(); 
				bVO.setNum(rs.getInt(1));
				bVO.setWriter(rs.getString(2));
				bVO.setEmail(rs.getString(3));
				bVO.setSubject(rs.getString(4));
				bVO.setPassword(rs.getString(5));
				bVO.setReg_date(rs.getDate(6).toString());
				bVO.setRef(rs.getInt(7));
				bVO.setRe_step(rs.getInt(8));
				bVO.setRe_level(rs.getInt(9));
				bVO.setReadCount(rs.getInt(10));
				bVO.setContent(rs.getString(11));
				bVO.setCnt(rs.getInt(12));
				bVO.setPno(rs.getInt(13));
			}
			System.out.println("게시글 하나 가져오기 성공");
		} catch (SQLException e) {
			System.out.println("게시글 하나 가져오기 실패");
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
		return bVO;
	}
	
	public BoardVO updateCheck(int num) {
		this.getConnection();
		BoardVO bVO = null;
		
		String sql = "select password from smartBoard where num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVO = new BoardVO(); 
				bVO.setPassword(rs.getString(1));
			}
			System.out.println("패스워드 가져오기 성공");
		} catch (SQLException e) {
			System.out.println("패스워드 가져오기 실패");
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
		return bVO;
	}
	
	public void updateBoard(int num, BoardVO bVO) {
		this.getConnection();
		
		String sql = "update smartBoard set subject = ?, password = ?, content = ? where num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bVO.getSubject());
			pstmt.setString(2, bVO.getPassword());
			pstmt.setString(3, bVO.getContent());
			pstmt.setInt(4, num);
			
			pstmt.executeUpdate();
			System.out.println("게시글 수정 성공");
		} catch (SQLException e) {
			System.out.println("게시글 수정 실패");
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
	
	public void deleteBoard(int num, BoardVO bVO) {
		this.getConnection();
		
		int ref = bVO.getRef();
		int re_step = bVO.getRe_step();
		int re_level = bVO.getRe_level();
		int cnt = bVO.getCnt();
		int pno = bVO.getPno();
		
		try {
			while(true) {
				String sql2 = "select pno from smartBoard where num = ?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getInt(1) == 0) {
						sql2 = "update smartBoard set cnt = cnt - ? where num = ?";
						pstmt = con.prepareStatement(sql2);
						pstmt.setInt(1, cnt + 1);
						pstmt.setInt(2, rs.getInt(1));
						pstmt.executeUpdate();
						
						break;
					}
					else {
						sql2 = "update smartBoard set cnt = cnt - ? where num = ?";
						pstmt = con.prepareStatement(sql2);
						pstmt.setInt(1, cnt + 1);
						pstmt.setInt(2, rs.getInt(1));
						pstmt.executeUpdate();
						
						sql2 = "select * from smartBoard where ref = ? and num = ?";
						pstmt = con.prepareStatement(sql2);
						pstmt.setInt(1, ref);
						pstmt.setInt(2, rs.getInt(1));
						rs = pstmt.executeQuery();
						if(rs.next()) {
							num = rs.getInt(1);
						}
						continue;
					}
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} 
		
		String sql = "delete from smartBoard where re_level >= ? and re_level <= ? and ref = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_level);
			pstmt.setInt(2, re_level + cnt);
			pstmt.setInt(3, ref);
			
			pstmt.executeUpdate();
			System.out.println("게시글 삭제 성공");
		} catch (SQLException e) {
			System.out.println("게시글 삭제 실패");
			System.out.println(e.getMessage());
		} 
		
		sql = "update smartBoard set re_level = re_level - ? where ref = ? and re_level > ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cnt + 1);
			pstmt.setInt(2, ref);
			pstmt.setInt(3, re_level + cnt);
			
			pstmt.executeUpdate();
			System.out.println("게시글 삭제 성공");
		} catch (SQLException e) {
			System.out.println("게시글 삭제 실패");
			System.out.println(e.getMessage());
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
	
	public void insertComment(BoardVO bVO) {
		this.getConnection();
		
		int num = bVO.getNum();
		int ref = bVO.getRef();
		int re_step = bVO.getRe_step();
		int re_level = bVO.getRe_level();
		int cnt = bVO.getCnt();
		int pno = bVO.getPno();
	
		ArrayList<Integer> arr1 = null; 
		
		
		
		String sql = "update smartBoard set re_level = re_level + 1 where ref = ? and re_level > ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level + cnt);
			
			pstmt.executeUpdate();
			System.out.println("부모게시판보다 레델 낮은 애들 + 1 성공");
		} catch (SQLException e) {
			e.getMessage();
			System.out.println("부모게시판보다 레델 낮은 애들 + 1 실패");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println("닫기 실패");
			}
		}
		
		int result = 0;
		sql = "insert into smartBoard values(board1_seq.nextVal,?,?,?,?,sysdate,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bVO.getWriter());
			pstmt.setString(2, bVO.getEmail());
			pstmt.setString(3, bVO.getSubject());
			pstmt.setString(4, bVO.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step+1);
			pstmt.setInt(7, re_level + cnt + 1);
			pstmt.setInt(8, 0);
			pstmt.setString(9, bVO.getContent());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, num);
			result = pstmt.executeUpdate();
			System.out.println("게시판 댓글 쓰기 성공");
		} catch (SQLException e) {
			e.getMessage();
			System.out.println("게시판 댓글 쓰기 실패");
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println("닫기 실패");
			}
		}
		
		try {
			while(true) {
				String sql2 = "select pno from smartBoard where num = ?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getInt(1) == 0) {
						sql2 = "update smartBoard set cnt = cnt + 1 where num = ?";
						pstmt = con.prepareStatement(sql2);
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						break;
					}
					else {
						sql2 = "update smartBoard set cnt = cnt + 1 where num = ?";
						pstmt = con.prepareStatement(sql2);
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						
						sql2 = "select * from smartBoard where ref = ? and num = ?";
						pstmt = con.prepareStatement(sql2);
						pstmt.setInt(1, ref);
						pstmt.setInt(2, rs.getInt(1));
						rs = pstmt.executeQuery();
						if(rs.next()) {
							num = rs.getInt(1);
						}
						continue;
					}
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
}
