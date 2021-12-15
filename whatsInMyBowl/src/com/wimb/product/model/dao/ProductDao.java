package com.wimb.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		
		try {
			
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath()));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
