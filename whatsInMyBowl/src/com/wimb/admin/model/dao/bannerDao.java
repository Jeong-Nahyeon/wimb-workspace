package com.wimb.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.admin.model.vo.Banner;

public class bannerDao {


	private Properties prop = new Properties();
	
	
	public bannerDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(termsDao.class.getResource("/db/sql/terms-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Banner> selectBannerList(Connection conn){
		ArrayList<Banner> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
