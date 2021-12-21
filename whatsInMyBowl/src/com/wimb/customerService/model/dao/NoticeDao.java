package com.wimb.customerService.model.dao;

import static com.wimb.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.customerService.model.vo.Notice;

public class NoticeDao {
	
private Properties prop = new Properties();
	
	
	public NoticeDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 고객센터 사용자 화면을 보여주는 Dao
	public ArrayList<Notice> selectNoticeUserView(Connection conn, PageInfo pi){
		ArrayList<Notice> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("selectNoticeUserView");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_code"),
						            rset.getString("notice_title"),
						            rset.getDate("notice_date"),
						            rset.getInt("notice_view")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}	close(pstmt);

		return list;
	}
	
	// 페이징바에 사용할 등록된 공지사항글의 총 갯수를 구하는 dao
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
	
	// 조회수 증가용
	public int increaseCount(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 공지사항 상세보기
	public Notice selectNotice(Connection conn, int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_code"),
						       rset.getString("notice_title"),
						       rset.getString("notice_content"),
						       rset.getDate("notice_date"),
						       rset.getInt("notice_view"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}
	
	// 공지사항 관리자 화면을 보여주는 Service
	public ArrayList<Notice> selectAdminView(Connection conn, PageInfo pi){
		ArrayList<Notice> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("selectNoticeUserView");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_code"),
						            rset.getString("notice_title"),
						            rset.getDate("notice_date"),
						            rset.getInt("notice_view")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}	close(pstmt);

		return list;
	}	
	
	
	
	
	
	
	
	
	
	
	
}
