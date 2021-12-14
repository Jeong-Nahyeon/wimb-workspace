package com.wimb.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

public class termsDao {

	private Properties prop = new Properties();
	
	
	public termsDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(termsDao.class.getResource("/db/sql/terms-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	public void selectNoticeList(Connection conn) {
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
}
