package com.wimb.payment.model.dao;

import static com.wimb.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.wimb.payment.model.vo.PaymentCustom;
import com.wimb.payment.model.vo.PaymentProduct;

public class PaymentDao {
	
	private Properties prop = new Properties();
	public PaymentDao() {
		try {
			prop.loadFromXML(new FileInputStream(PaymentDao.class.getResource("/db/sql/payment-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public PaymentCustom selectCustom(Connection conn, String saladCode) {
		PaymentCustom custom = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCustom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saladCode);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				custom = new PaymentCustom(rset.getString("cu_code"),
						     			   rset.getString("cu_name"),
						     			   rset.getInt("cu_price"),
						     			   rset.getString("cu_mainimg")
						   				  );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return custom;
	}

	public PaymentProduct selectProduct(Connection conn, String saladCode) {
		PaymentProduct product = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		String filePath = "resources/images/product_images/";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saladCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				product = new PaymentProduct(rset.getString("p_code"),
										     rset.getString("p_name"),
										     rset.getString("p_mainimg"),
										     filePath
										    );	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return product;
	}

}
