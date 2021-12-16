package com.wimb.custom.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.custom.model.vo.Item;
import static com.wimb.common.JDBCTemplate.*;
public class CustomDao {

	private Properties prop = new Properties();
	public CustomDao() {
		try {
			prop.loadFromXML(new FileInputStream(CustomDao.class.getResource("/db/sql/custom-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
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
	
	// 커스텀 페이지 오른쪽 - 재료목록조회
	public ArrayList<Item> selectItemList(Connection conn){
		// select
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				list.add(new Item(rset.getString("ci_code"),
						   rset.getString("ci_name"),
						   rset.getString("ci_category"),
						   rset.getString("ci_provider"),
						   rset.getInt("ci_provideprice"),
						   rset.getInt("ci_price"),
						   rset.getString("ci_mainimg"),
						   rset.getString("ci_show"),
						   rset.getInt("ci_stock")
					 	   ));
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
