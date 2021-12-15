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
	
	
	
	
	
	
	
	
	
}
