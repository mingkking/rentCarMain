package kr.co.hyundai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.hyundai.vo.CarReserveVO;
import kr.co.hyundai.vo.CarViewVO;
import kr.co.hyundai.vo.RentCarVO;

public class RentCarDAO {
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
	
	public int dayCompareTo(CarReserveVO crvo) {
		String ddayYear = crvo.getDday().substring(0,4);
		String ddayMonth = crvo.getDday().substring(5, 7);
		String ddayDay = crvo.getDday().substring(8, 10);
		String ddayHour = crvo.getDday().substring(11, 13);
		String ddayMin = crvo.getDday().substring(14, 16);
		String ddaySec = "00";
		String ddayTime = ddayYear + "-" + ddayMonth + "-" + ddayDay + " " + ddayHour + ":" + ddayMin;
		
		Date day1 = new Date();
		Date day2 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			day1 = sdf.parse(ddayTime);
			day2 = sdf.parse(sdf.format(day2));
			System.out.println("날짜 변환 성공");
		} catch (ParseException e) {
			System.out.println(e.getMessage());
			System.out.println("날짜 변환 실패");
		}
		
		int result = day1.compareTo(day2);
		if(result != -1) {
			crvo.setDday(ddayTime);
		}
		
		return result;
	}
	
	public Vector<RentCarVO> getSelectCar() {
		Vector<RentCarVO> vec = null;
		RentCarVO rvo = null;
		this.getConnection();
		
		try {
			String sql = "select * from rentcar order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int cnt = 0;
				vec = new Vector<RentCarVO>();
				do {
					rvo = new RentCarVO();
					rvo.setNo(rs.getInt(1));
					rvo.setCarName(rs.getString(2));
					rvo.setCategory(rs.getInt(3));
					rvo.setPrice(rs.getInt(4));
					rvo.setUsePeople(rs.getInt(5));
					rvo.setCompany(rs.getString(6));
					rvo.setImg(rs.getString(7));
					rvo.setInfo(rs.getString(8));
					vec.add(rvo);
					cnt++;
					if(cnt >= 3) {
						cnt = 0;
						break;
					}
				}while(rs.next());
			}
			System.out.println("최신 차 3개 가져오기 성공");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("최신 차 3개 가져오기 실패");
		}finally {
			
				try {
					if(con != null) con.close();
					if(pstmt != null) pstmt.close();
					if(rs != null) rs.close();
					System.out.println("닫기 성공");
				} catch (SQLException e) {
					System.out.println(e.getMessage());
					System.out.println("닫기 실패");
				} 
		}
		
		return vec;
	}
	
	public Vector<RentCarVO> getCategoryCar(int category) {
		Vector<RentCarVO> vec = null;
		RentCarVO rvo = null;
		this.getConnection();
		
		try {
			String sql = "select * from rentcar where category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vec = new Vector<RentCarVO>();
				do {
					rvo = new RentCarVO();
					rvo.setNo(rs.getInt(1));
					rvo.setCarName(rs.getString(2));
					rvo.setCategory(rs.getInt(3));
					rvo.setPrice(rs.getInt(4));
					rvo.setUsePeople(rs.getInt(5));
					rvo.setCompany(rs.getString(6));
					rvo.setImg(rs.getString(7));
					rvo.setInfo(rs.getString(8));
					vec.add(rvo);
				}while(rs.next());
			}
			System.out.println("카테고리별 차 가져오기 성공");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("카테고리별 차 가져오기 실패");
		}finally {
			
				try {
					if(con != null) con.close();
					if(pstmt != null) pstmt.close();
					if(rs != null) rs.close();
					System.out.println("닫기 성공");
				} catch (SQLException e) {
					System.out.println(e.getMessage());
					System.out.println("닫기 실패");
				} 
		}
		
		return vec;
	}
	
	public Vector<RentCarVO> getAllCar() {
		Vector<RentCarVO> vec = null;
		RentCarVO rvo = null;
		this.getConnection();
		
		try {
			String sql = "select * from rentcar order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vec = new Vector<RentCarVO>();
				do {
					rvo = new RentCarVO();
					rvo.setNo(rs.getInt(1));
					rvo.setCarName(rs.getString(2));
					rvo.setCategory(rs.getInt(3));
					rvo.setPrice(rs.getInt(4));
					rvo.setUsePeople(rs.getInt(5));
					rvo.setCompany(rs.getString(6));
					rvo.setImg(rs.getString(7));
					rvo.setInfo(rs.getString(8));
					vec.add(rvo);
				}while(rs.next());
			}
			System.out.println("전체 차 가져오기 성공");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("전체 차 가져오기 실패");
		}finally {
			
				try {
					if(con != null) con.close();
					if(pstmt != null) pstmt.close();
					if(rs != null) rs.close();
					System.out.println("닫기 성공");
				} catch (SQLException e) {
					System.out.println(e.getMessage());
					System.out.println("닫기 실패");
				} 
		}
		
		return vec;
	}
	
	public RentCarVO getOneCar(int no) {
		RentCarVO rvo = null;
		this.getConnection();
		
		try {
			String sql = "select * from rentcar where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					rvo = new RentCarVO();
					rvo.setNo(rs.getInt(1));
					rvo.setCarName(rs.getString(2));
					rvo.setCategory(rs.getInt(3));
					rvo.setPrice(rs.getInt(4));
					rvo.setUsePeople(rs.getInt(5));
					rvo.setCompany(rs.getString(6));
					rvo.setImg(rs.getString(7));
					rvo.setInfo(rs.getString(8));
			}
			System.out.println("차 정보 1개 가져오기 성공");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("차 정보 1개 가져오기 실패");
		}finally {
			
				try {
					if(con != null) con.close();
					if(pstmt != null) pstmt.close();
					if(rs != null) rs.close();
					System.out.println("닫기 성공");
				} catch (SQLException e) {
					System.out.println(e.getMessage());
					System.out.println("닫기 실패");
				} 
		}
		
		return rvo;
	}
	
	public void setReserveCar(CarReserveVO crvo) {
		this.getConnection();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		
		try {
			String sql = "insert into carReserve values(carReserve_seq.nextval, ?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, crvo.getId());
			pstmt.setInt(2, crvo.getNo());
			pstmt.setString(3, crvo.getImg());
			pstmt.setInt(4, crvo.getCnt());
			pstmt.setInt(5, crvo.getDay());
			pstmt.setTimestamp(6, new Timestamp(sdf.parse(crvo.getDday()).getTime()));
			pstmt.setInt(7, crvo.getInsurance());
			pstmt.setInt(8, crvo.getWifi());
			pstmt.setInt(9, crvo.getBabySeat());
			pstmt.setInt(10, crvo.getNavi());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("차 예약 등록 실패" + e.getMessage());
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				System.out.println("닫기 성공");
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println("닫기 실패");
			} 
		}
	}
	
	public CarReserveVO oneReserveCar(String id) {
		CarReserveVO crvo = null;
		this.getConnection();
		try {
			String sql = "select * from carReserve where id = ? order by carRno desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					crvo = new CarReserveVO();
					crvo.setCarRNo(rs.getInt(1));
					crvo.setId(rs.getString(2));
					crvo.setNo(rs.getInt(3));
					crvo.setImg(rs.getString(4));
					crvo.setCnt(rs.getInt(5));
					crvo.setDay(rs.getInt(6));
					crvo.setDday(rs.getString(7));
					crvo.setInsurance(rs.getInt(8));
					crvo.setWifi(rs.getInt(9));
					crvo.setBabySeat(rs.getInt(10));
					crvo.setNavi(rs.getInt(11));
			}
			System.out.println("예약된 차량 1개 가져오기 성공");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("예약된 차량 1개 가져오기 실패");
		}finally {
			
				try {
					if(con != null) con.close();
					if(pstmt != null) pstmt.close();
					if(rs != null) rs.close();
					System.out.println("닫기 성공");
				} catch (SQLException e) {
					System.out.println(e.getMessage());
					System.out.println("닫기 실패");
				} 
		}
		
		return crvo;
	}
	
	public Vector<CarViewVO> getAllReserve(String id){
		Vector<CarViewVO> vec = null;
		CarViewVO cvvo = null;
		this.getConnection();
		
		try {
			String sql = "select * from rentCar natural join carreserve where sysdate <= dday and id = ? order by dday desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vec = new Vector<CarViewVO>();
				do {
					cvvo = new CarViewVO();
					cvvo.setCarRNo(rs.getInt(9));
					cvvo.setCarName(rs.getString(3));
					cvvo.setPrice(rs.getInt(5));
					cvvo.setImg(rs.getString(2));
					cvvo.setCnt(rs.getInt(11));
					cvvo.setDay(rs.getInt(12));
					cvvo.setDday(rs.getTimestamp(13).toString());
					cvvo.setInsurance(rs.getInt(14));
					cvvo.setWifi(rs.getInt(15));
					cvvo.setBabySeat(rs.getInt(16));
					cvvo.setNavi(rs.getInt(17));
					vec.add(cvvo);
				} while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("getAllReserve 가져오기 실패");
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage() + " getAllReserve 닫기 실패");
			} 
		}
		
		return vec;
	}
	
	public void carReserveRemove(String id, int carRNo) {
		this.getConnection();
		
		try {
			String sql = "delete from carreserve where id = ? and carRNO = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, carRNo);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage() + " carReserveRemove 차 예약 삭제 실패");
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage() + " carReserveRemove 닫기 실패");
			} 
		}
	}
	
	public void carReserveUpdate(String id, int carRNo, CarReserveVO crvo) {
		
		this.getConnection();
		
		try {
			String sql = "update carreserve set cnt = ?, day = ?, dday = ?, insurance = ?, wifi = ?, babyseat = ?, navi = ? where id = ? and carRNo = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, crvo.getCnt());
			pstmt.setInt(2, crvo.getDay());
			pstmt.setString(3, crvo.getDday());
			pstmt.setInt(4, crvo.getInsurance());
			pstmt.setInt(5, crvo.getWifi());
			pstmt.setInt(6, crvo.getBabySeat());
			pstmt.setInt(7, crvo.getNavi());
			pstmt.setString(8, id);
			pstmt.setInt(9, carRNo);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage() + " carReserveUpdate 차 예약 수정 실패");
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage() + " carReserveUpdate 닫기 실패");
			} 
		}
		
	}
}


