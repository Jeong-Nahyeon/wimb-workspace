package com.wimb.payment.model.dao;

import static com.wimb.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.member.model.vo.Member;
import com.wimb.payment.model.vo.Card;
import com.wimb.payment.model.vo.Cash;
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
	
	// payment, cash 테이블 insert
	public int insertCashPayment(Connection conn, int totalPrice, Cash cash) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCashPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, totalPrice);
			pstmt.setInt(2, totalPrice);
			pstmt.setString(3, cash.getCashBank());
			pstmt.setString(4, cash.getCashName());
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
			pstmt.setString(12, order.getoStatus());
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

	// Order 테이블 조회
	public Order selectOrder(Connection conn, String orderCode) {
		Order order = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderCode);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				order = new Order (rset.getString("order_code"),
							 rset.getInt("m_code"),
							 rset.getString("pm_code"),
							 rset.getString("order_name"),
							 rset.getString("order_address"),
							 rset.getString("order_subaddress"),
							 rset.getInt("order_zipcode"),
							 rset.getString("order_phone"),
							 rset.getString("order_email"),
							 rset.getString("order_request"),
							 rset.getInt("order_point"),
							 rset.getString("order_date")
							);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return order;
	}

	// payment 테이블 조회
	public Payment selectPayment(Connection conn, String pmCode) {
		Payment p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pmCode);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Payment(rset.getString("pm_code"),
							rset.getString("pm_method"),
							rset.getString("pm_date"),
							rset.getInt("pm_totalcost"),
							rset.getInt("pm_finalcost")
							);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	// 커스텀샐러드 이름 조회
	public ArrayList<PaymentCustom> selectCustomName(Connection conn, String orderCode) {
		ArrayList<PaymentCustom> customList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCustomName");		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				customList.add(new PaymentCustom(
							   rset.getString("cu_code"),
							   rset.getString("cu_name")
						 	   ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return customList;
	}

	// 완제품 샐러드 이름 조회
	public ArrayList<PaymentProduct> selectProductName(Connection conn, String orderCode) {
		ArrayList<PaymentProduct> product = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductName");		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				product.add(new PaymentProduct(rset.getString("p_code"),
											   rset.getString("p_name")
											));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return product;
	}

	// 카드결제 정보 조회
	public Card selectCard(Connection conn, String pmCode) {
		Card card = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pmCode);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				card = new Card(rset.getString("pm_code"),
								rset.getString("card_id"),
								rset.getString("card_approval"),
								rset.getString("card_company"),
								rset.getInt("card_instalment")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return card;
	}
	
	// 무통장입금 정보 조회
	public Cash selectCash(Connection conn, String pmCode) {
		Cash cash = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCash");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pmCode);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				cash = new Cash();
				cash.setCashBank(rset.getString("cash_bank"));
				cash.setCashName(rset.getString("cash_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cash;
	}
	
	

	

	

}
