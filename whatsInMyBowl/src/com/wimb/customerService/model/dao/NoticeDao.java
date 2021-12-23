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

import com.wimb.common.model.vo.File;
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
	
	
	public int insertNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 첨부파일이 존재할경우에만 실행되는 dao
	public int insertFile(Connection conn, ArrayList<File> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFile");
		
		try {
			
			for(File f : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, f.getfName());
				pstmt.setString(2, f.getfRename());
				pstmt.setString(3, f.getfPath());
				pstmt.setString(4, f.getfRename());
				pstmt.setString(5, f.getfRename());
				
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteNotice(Connection conn, String nCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}
		
	public Notice selectAdminNotice(Connection conn, int nCode) {
		
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_code"),
						       rset.getString("notice_title"),
						       rset.getString("notice_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		return n;
		
	}
		
	public ArrayList<File> selectAdminFile(Connection conn, int nCode){
		ArrayList<File> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminFile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new File(rset.getInt("f_code"),
						  		  rset.getString("f_name"),
						  		  rset.getString("f_rename"),
						          rset.getString("f_path")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list; // null이 반환될 수도 있고 아닐수도있음
	}
	
	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	public int updateFile(Connection conn, ArrayList<File> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFile");
		
		try {
			for(File f : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, f.getfName());
				pstmt.setString(2, f.getfRename());
				pstmt.setString(3, f.getfPath());
				pstmt.setString(4, f.getfRename());
				pstmt.setString(5, f.getfRename());
				pstmt.setInt(6, f.getfCode());
				
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int insertNewFile(Connection conn, ArrayList<File> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewFile");
		
		try {
			for(File f : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, f.getfName());
				pstmt.setString(2, f.getfRename());
				pstmt.setString(3, f.getfPath());
				pstmt.setString(4, f.getfRename());
				pstmt.setString(5, f.getfRename());
				pstmt.setInt(6, f.getfRefCode());
				
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/* 검색기능 */
	public ArrayList<Notice> searchTitle(Connection conn, String searchWord) {
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchTitle");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				list.add(new Notice(rset.getInt("notice_code"),
						            rset.getString("notice_title"),
						            rset.getString("notice_content"),
						            rset.getDate("notice_date"),
						            rset.getInt("notice_view"),
						            rset.getString("notice_status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}	

	
	// 검색된 페이징바에 사용할 등록된 공지사항글의 총 갯수를 구하는 dao
	public int selectSerachListCount(Connection conn, String searchWord) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSerachListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
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
