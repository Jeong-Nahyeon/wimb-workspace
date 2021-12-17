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
	
	
	
	
	
	
	
	
	
	
	
}
