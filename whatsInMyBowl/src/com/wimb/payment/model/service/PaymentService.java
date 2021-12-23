package com.wimb.payment.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wimb.member.model.vo.Member;
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

	// 배송지가져오기 체크시 회원의 주소를 가져오는 서비스
	public Member selectMember(int mCode) {
		Connection conn = getConnection();
		Member m = new PaymentDao().selectMember(conn, mCode);
		close(conn);
		return null;
	}

	// 회원의 전체 포인트 조회
	public int selectAllPoint(int mCode) {
		// TODO Auto-generated method stub
		return 0;
	}

}
