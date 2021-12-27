package com.wimb.payment.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.member.model.vo.Member;
import com.wimb.payment.model.dao.PaymentDao;
import com.wimb.payment.model.vo.Card;
import com.wimb.payment.model.vo.Cash;
import com.wimb.payment.model.vo.Order;
import com.wimb.payment.model.vo.Payment;
import com.wimb.payment.model.vo.PaymentCustom;
import com.wimb.payment.model.vo.PaymentProduct;

public class PaymentService {

	public PaymentCustom selectCustom(String saladCode) {
		Connection conn = getConnection();
		PaymentCustom custom = new PaymentDao().selectCustom(conn, saladCode);
		//System.out.println("서비스 :" + saladCode);
		close(conn);
		return custom;
	}

	public PaymentProduct selectProduct(String saladCode) {
		Connection conn = getConnection();
		PaymentProduct product = new PaymentDao().selectProduct(conn, saladCode);
		close(conn);
		return product;
	}

	// 카드결제 후 결제테이블에 결제정보 insert
	public String insertPayment(Payment p, Card c) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertPayment(conn, p, c);
		String pmCode = null;
		if(result > 0) {
			commit(conn);
			pmCode = new PaymentDao().selectPaymentCode(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return pmCode;
	}
	
	// payment, cash 테이블에 insert
	public String insertCashPayment(int totalPrice, Cash cash) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertCashPayment(conn, totalPrice, cash);
		String pmCode = null;
		if(result > 0) {
			commit(conn);
			pmCode = new PaymentDao().selectPaymentCode(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return pmCode;
	}

	// 주문테이블에 정보 insert
	public String insertOrder(Order order) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertOrder(conn, order);
		String orderCode = null;
		if(result > 0) {
			commit(conn);
			orderCode = new PaymentDao().selectOrderCode(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return orderCode;
	}
	
	

	// 커스텀 제품에 대한 subOrder 등록
	public int insertSubOrderCustom(PaymentCustom custom, String orderCode) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertSubOrderCustom(conn, custom, orderCode);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 완제품에 대한 subOrder 등록
	public int insertSubOrderProduct(PaymentProduct product, String orderCode) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertSubOrderProduct(conn, product, orderCode);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// Order 테이블 조회
	public Order selectOrder(String orderCode) {
		Connection conn = getConnection();
		Order order = new PaymentDao().selectOrder(conn, orderCode);
		close(conn);
		return order;
	}

	// payment 테이블 조회
	public Payment selectPayment(String pmCode) {
		Connection conn = getConnection();
		Payment p = new PaymentDao().selectPayment(conn, pmCode);
		close(conn);
		return p;
	}

	// 커스텀 샐러드 이름 조회
	public ArrayList<PaymentCustom> selectCustomName(String orderCode) {
		Connection conn = getConnection();
		ArrayList<PaymentCustom> customList = new PaymentDao().selectCustomName(conn, orderCode);
		close(conn);
		return customList;
	}

	// 완제품 이름 조회
	public ArrayList<PaymentProduct> selectProductName(String orderCode) {
		Connection conn = getConnection();
		ArrayList<PaymentProduct> productList = new PaymentDao().selectProductName(conn, orderCode);
		close(conn);
		return productList;
	}

	// 카드결제 정보 조회
	public Card selectCard(String pmCode) {
		Connection conn = getConnection();
		Card card = new PaymentDao().selectCard(conn, pmCode);
		close(conn);
		return card;
	}

	// 무통장입금 결제 정보 조회
	public Cash selectCash(String pmCode) {
		Connection conn = getConnection();
		Cash cash = new PaymentDao().selectCash(conn, pmCode);
		close(conn);
		return cash;
	}

	// 포인트 적립
	public int insertPointPlus(int mCode, String orderCode) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertPointPlus(conn, mCode, orderCode);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return 0;
	}
	
	// 포인트 차감
	public int insertPointMinus(int mCode, String orderCode) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertPointMinus(conn, mCode, orderCode);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	
	
	
	
	
	

}
