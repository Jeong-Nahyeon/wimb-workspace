package com.wimb.customerService.model.dao;

import static com.wimb.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.common.model.vo.File;
import com.wimb.customerService.model.vo.Inquery;

public class InqueryDao {
	
private Properties prop = new Properties();
	
	
	public InqueryDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(InqueryDao.class.getResource("/db/sql/Inquery-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertInquery(Connection conn, Inquery inq) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInquery");
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
}
