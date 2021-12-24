package com.wimb.payment.model.dao;

import static com.wimb.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.wimb.member.model.vo.Member;
import com.wimb.payment.model.vo.Card;
import com.wimb.payment.model.vo.Order;
import com.wimb.payment.model.vo.Payment;
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

	// 카드결제 후 결제테이블에 결제정보 insert
	public int insertPayment(Connection conn, Payment p, Card c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getPmTotalPrice());
			pstmt.setInt(2, p.getPmFinalPrice());
			pstmt.setString(3, c.getCardApproval());
			pstmt.setString(4, c.getCardCompany());
			pstmt.setInt(5, c.getCardInstalment());
			pstmt.setString(6, c.getCardId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectPaymentCode(Connection conn) {
		String pmCode = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPaymentCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				pmCode = rset.getString("pm_code");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return pmCode;
	}

	public int insertOrder(Connection conn, Order order) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getmCode());
			pstmt.setString(2, order.getPmCode());
			pstmt.setInt(3, order.getoAmount());
			pstmt.setString(4, order.getoName());
			pstmt.setString(5, order.getoAddress());
			pstmt.setString(6, order.getoSubAddress());
			pstmt.setInt(7, order.getoZipCode());
			pstmt.setString(8, order.getoPhone());
			pstmt.setString(9, order.getoEmail());
			pstmt.setString(10, order.getoRequest());
			pstmt.setInt(11, order.getoPoint());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 주문코드 조회
	public String selectOrderCode(Connection conn) {
		String orderCode = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				orderCode = rset.getString("order_code");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return orderCode;
	}

	public int insertSubOrderCustom(Connection conn, PaymentCustom custom, String orderCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSubOrderCustom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderCode);
			pstmt.setString(2, custom.getCuCode());
			pstmt.setInt(3, custom.getCuCount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertSubOrderProduct(Connection conn, PaymentProduct product, String orderCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSubOrderProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderCode);
			pstmt.setString(2, product.getpCode());
			pstmt.setInt(3, product.getpCount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	

	

	

}
