package com.wimb.payment.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wimb.member.model.vo.Member;
import com.wimb.payment.model.dao.PaymentDao;
import com.wimb.payment.model.vo.Card;
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

	
	
	

}
