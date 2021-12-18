package com.wimb.mypage.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.dao.MyPageDao;
import com.wimb.mypage.model.vo.Inquiry;
import com.wimb.mypage.model.vo.MyOrders;



public class MyPageService {
	
	// 주문/배송목록 - 메인페이지
	public ArrayList<MyOrders> selectOrderList(Member m) {
		Connection conn = getConnection();
		ArrayList<MyOrders> list = new MyPageDao().selectOrderList(conn, m);
		close(conn);
		return list;
	}
	
	// od1
	public MyOrders orderStatus1(Member m) {
		Connection conn = getConnection();
		
		MyOrders od = new MyPageDao().orderStatus1(conn, m);
		
		close(conn);
		return od;
	
	}
	
	// od2
	public MyOrders orderStatus2(Member m) {
		Connection conn = getConnection();
		
		MyOrders od = new MyPageDao().orderStatus2(conn, m);
		
		close(conn);
		return od;
	
	}
	
	// od3
	public MyOrders orderStatus3(Member m) {
		Connection conn = getConnection();
		
		MyOrders od = new MyPageDao().orderStatus3(conn, m);
		
		close(conn);
		return od;
	
	}
	
	// od4
	public MyOrders orderStatus4(Member m) {
		Connection conn = getConnection();
		
		MyOrders od = new MyPageDao().orderStatus4(conn, m);
		
		close(conn);
		return od;
	
	}
	
	// od5
	public MyOrders orderStatus5(Member m) {
		Connection conn = getConnection();
		
		MyOrders od = new MyPageDao().orderStatus5(conn, m);
		
		close(conn);
		return od;
	
	}
	
	
	
	// inquiry 목록조회
	public ArrayList<Inquiry> selectInquiryList() {
		Connection conn = getConnection();
		
		ArrayList<Inquiry> list = new MyPageDao().selectInquiryList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	// inquiry 삭제
	public int deleteInquiryList(int iCode) {
		Connection conn = getConnection();	
		int result = new MyPageDao().deleteInquiryList(conn, iCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
	
		return result;
	}
	
	
	// 주문목록/배송조회 페이지
	public ArrayList<MyOrders> orderListDetail(Member m, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<MyOrders> list = new MyPageDao().orderListDetail(conn, m, startDate, endDate);
		close(conn);
		return list;
	}
	
	
	
}