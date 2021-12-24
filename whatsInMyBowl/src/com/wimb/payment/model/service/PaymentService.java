package com.wimb.payment.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wimb.member.model.vo.Member;
import com.wimb.payment.model.dao.PaymentDao;
import com.wimb.payment.model.vo.Card;
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
		return result;
	}

	
	
	

}
