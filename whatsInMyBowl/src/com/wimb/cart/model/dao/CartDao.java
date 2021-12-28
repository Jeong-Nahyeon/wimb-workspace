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
								  rset.getInt("p_price"),
								  rset.getString("p_mainimg")
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

	
	// 장바구니에 해당 상품이 있는지 확인하는 메소드
	public boolean findCartCustom(Connection conn, Cart c) {
		boolean check = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findCartCustom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getmCode());
			pstmt.setString(2, c.getCuCode());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				check = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
	}

	// 장바구니 테이블에 커스텀 상품 등록
	public int insertCartCustom(Connection conn, Cart c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCartCustom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getmCode());
			pstmt.setString(2, c.getCuCode());
			pstmt.setInt(3, c.getCaAmount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		 
		return result;
	}

	// 장바구니에 해당 완제품 있는지 확인
	public boolean findCartProduct(Connection conn, Cart c) {
		boolean check = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findCartProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getmCode());
			pstmt.setString(2, c.getpCode());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				check = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
	}

	// 장바구니 상품 수량 변경
	public int updateProductAmount(Connection conn, Cart c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProductAmount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getCaAmount());
			pstmt.setString(2, c.getpCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 장바구니에 완제품 상품 등록
	public int insertCartProduct(Connection conn, Cart c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCartProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getmCode());
			pstmt.setString(2, c.getpCode());
			pstmt.setInt(3, c.getCaAmount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		 
		return result;
	}

	// 장바구니 커스텀 삭제
	public int deleteCartCustom(Connection conn, Cart c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCartCustom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getmCode());
			pstmt.setString(2, c.getCuCode());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 장바구니 완제품 삭제
	public int deleteCartProduct(Connection conn, Cart c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCartProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getmCode());
			pstmt.setString(2, c.getpCode());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
