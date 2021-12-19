package com.wimb.admin.model.dao;

import static com.wimb.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.admin.model.vo.Banner;
import com.wimb.common.model.vo.PageInfo;

public class bannerDao {


	private Properties prop = new Properties();
	
	
	public bannerDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(termsDao.class.getResource("/db/sql/banner-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 배너를 등록하는 dao
	public int insertBanner(Connection conn, Banner b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBanner");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getbName());
			pstmt.setString(2, b.getbPostion());
			pstmt.setString(3, b.getbPath());
			pstmt.setString(4, b.getbOriginName());
			pstmt.setString(5, b.getbChangeName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 전체보기 시 배너 리스트를 조회하는 dao
	public ArrayList<Banner> selectBannerList(Connection conn, PageInfo pi){
		ArrayList<Banner> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBannerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Banner(rset.getInt("b_code"),
						            rset.getString("b_name"),
						            rset.getDate("b_startdate"),
						            rset.getString("b_status"),
						            rset.getString("b_position")));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	// 게시중인 배너 리스트를 조회하는 dao
	public ArrayList<Banner> selectPostingBannerList(Connection conn, PageInfo pi){
		ArrayList<Banner> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPostingBannerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Banner(rset.getInt("b_code"),
						            rset.getString("b_name"),
						            rset.getDate("b_startdate"),
						            rset.getString("b_status"),
						            rset.getString("b_position")));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	// 게시종료 배너 리스트를 조회하는 dao
	public ArrayList<Banner> selectEndOfPostingBannerList(Connection conn, PageInfo pi){
		ArrayList<Banner> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectEndOfPostingBannerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Banner(rset.getInt("b_code"),
						            rset.getString("b_name"),
						            rset.getDate("b_startdate"),
						            rset.getString("b_status"),
						            rset.getString("b_position")));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	// 페이징바에 사용할 등록된 베너게시글의 총 갯수를 구하는 dao
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	// 페이징바에 사용할 게시중인 베너게시글의 총 갯수를 구하는 dao
	public int selectPostingListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostingListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	// 페이징바에 사용할 게시종료한 베너게시글의 총 갯수를 구하는 dao
	public int selectEndPostingListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEndPostingListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	// 체크박스에 선택된 다수의 값을 한꺼번에 삭제시켜주는 dao
	/*
	public int deleteSelectAll(Connection conn) {
		int result = 0;
	}
	*/
	
	
	// 메인1 글씨 오른쪽 '변경하기'버튼 클릭 시 생성되는 모달창 안에 띄워줄 게시종료 상태 리스트
	public ArrayList<Banner> selectFisrtMainList(Connection conn){
		
		ArrayList<Banner> Firstlist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectFisrtMainList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Firstlist.add(new Banner(rset.getInt("b_code"),
						                 rset.getString("b_name"),
						                 rset.getString("filepath")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return Firstlist;
		
		
	}
	
	// 메인1에 등록하고자 하는 메인의 라디오버튼 선택 후 '등록'버튼 클릭 시 선택한 게시글 번호를 넘겨받아 화면에 띄우는 DAO
	// step 1. 게시글 번호가 넘겨오면 게시여부 상태를 'N'에서 'Y'로 바꾸는 DAO
	public int updateFirstMain(Connection conn, int selectMainNum) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFirstMain");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, selectMainNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// step 2. 'Y'바뀐 게시글의 정보를 조회해오는 dao
	public Banner selectFirstMain(Connection conn, int selectMainNum) {
		
		Banner b = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectFirstMain");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, selectMainNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Banner();
				b.setbCode(rset.getInt("b_code"));
				b.setbName(rset.getString("b_name"));
				b.setStartDate(rset.getDate("b_startdate"));
				b.setStatus(rset.getString("b_status"));
				b.setbPostion(rset.getString("b_position"));
				b.setMainImg(rset.getString("filepath"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
		
	}
	
	public ArrayList<Banner> selectMainBanner(Connection conn){
		
		ArrayList<Banner> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMainBanner");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Banner(rset.getInt("b_code"),
						            rset.getString("b_name"),
						            rset.getDate("b_startdate"),
						            rset.getString("b_status"),
						            rset.getString("b_position"),
						            rset.getString("filepath")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
}
