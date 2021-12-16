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

import com.wimb.admin.model.vo.Terms;

public class termsDao {

	private Properties prop = new Properties();
	
	
	public termsDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(termsDao.class.getResource("/db/sql/terms-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	// 이용약관 리스트를 가져오는 dao
	public ArrayList<Terms> selectTermsList(Connection conn) {
		
		ArrayList<Terms> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectTermsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Terms(rset.getInt("terms_Code"),
								   rset.getString("terms_content")));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	// 이용약관 등록하는 dao
	public int insertTerms(Connection conn, String termsContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTerms");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, termsContent);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 수정하기 클릭 시 선택한 이용약관의 내용을 불러오는 dao
	public Terms selectTerms(Connection conn, int termsCode) {
		Terms t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, termsCode);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				t = new Terms(rset.getInt("terms_code"),
						      rset.getString("terms_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return t;
	
	}
	
	// 수정하기 창에서 수정 시 기존의 이용약관 내용을 변경하는 dao
	public int updateTerms(Connection conn, Terms t) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTermsContent());
			pstmt.setInt(2, t.getTermsCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 이용약관 글을 삭제하는 dao
	public int deleteTerms(Connection conn, int termsCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, termsCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 개인정보처리방침 리스트를 가져오는 dao
	public ArrayList<Terms> selectPersonalInformationTermsList(Connection conn) {
		
		ArrayList<Terms> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectPersonalInformationTermsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Terms(rset.getInt("terms_Code"),
								   rset.getString("terms_content")));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	// 개인정보처리방침 글을 등록하는 dao
	public int insertPersonalInformationTerms(Connection conn, String termsContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPersonalInformationTerms");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, termsContent);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
