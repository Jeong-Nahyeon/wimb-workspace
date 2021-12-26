package com.wimb.cart.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.cart.model.vo.Cart;
import static com.wimb.common.JDBCTemplate.*;

public class CartDao {

	private Properties prop = new Properties();
	public CartDao() {
		try {
			prop.loadFromXML(new FileInputStream(CartDao.class.getResource("/db/sql/cart-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Cart> selectCart(Connection conn, int mCode) {
		ArrayList<Cart> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Cart(rset.getInt("m_code"),
								  rset.getString("cu_code"),
								  rset.getString("p_code"),
								  rset.getInt("ca_amount"),
								  rset.getString("cu_name"),
								  rset.getString("p_name"),
								  rset.getInt("cu_price"),
								  rset.getInt("p_price")
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
