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
import com.wimb.customerService.model.vo.Inquiry;

public class InquiryDao {
	
private Properties prop = new Properties();
	
	
	public InquiryDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(InquiryDao.class.getResource("/db/sql/Inquiry-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertInquiry(Connection conn, Inquiry inq) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inq.getmCode());
			pstmt.setString(2, inq.getiCategory());
			pstmt.setString(3, inq.getiTitle());
			pstmt.setString(4, inq.getiContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 첨부파일이 존재할경우에만 실행
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
	
	
	// 관리자 - 1:1문의 처리중인 페이징바 리스트 수 메소드
	public int selectInquiryProcessingListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInquiryProcessingListCount");
		
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
	
	
	// 관리자 - 1:1문의 처리중인 리스트를 띄우는 메소드
	public ArrayList<Inquiry> selectInquiryProcessingAdminView(Connection conn, PageInfo pi){
		ArrayList<Inquiry> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("selectInquiryProcessingAdminView");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Inquiry(rset.getInt("i_code"),
						             rset.getInt("m_code"),
						             rset.getString("i_category"),
						             rset.getString("i_title"),
						             rset.getString("i_content"),
						             rset.getString("i_answer"),
						             rset.getDate("i_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}	close(pstmt);

		return list;
	}	
	
	// 관리자 - 1:1문의 처리완료 페이징바 리스트 수 메소드
	public int selectInquiryCompletionListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInquiryCompletionListCount");
		
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
	
	
	// 관리자 - 1:1문의 처리완료 리스트를 띄우는 메소드
	public ArrayList<Inquiry> selectInquiryCompletionAdminView(Connection conn, PageInfo pi){
		ArrayList<Inquiry> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;	
		
		String sql = prop.getProperty("selectInquiryCompletionAdminView");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Inquiry(rset.getInt("i_code"),
						             rset.getInt("m_code"),
						             rset.getString("i_category"),
						             rset.getString("i_title"),
						             rset.getString("i_content"),
						             rset.getString("i_answer"),
						             rset.getDate("i_date"),
						             rset.getString("a_content"),
						             rset.getDate("a_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}	close(pstmt);

		return list;
	}	
		
	
	
	
}
