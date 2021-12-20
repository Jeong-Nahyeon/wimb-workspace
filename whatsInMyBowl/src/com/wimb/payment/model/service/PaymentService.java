package com.wimb.payment.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wimb.payment.model.dao.PaymentDao;
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

}
