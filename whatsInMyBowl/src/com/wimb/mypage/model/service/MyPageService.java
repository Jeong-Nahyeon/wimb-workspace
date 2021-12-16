package com.wimb.mypage.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.dao.MyPageDao;
import com.wimb.mypage.model.vo.Inquiry;
import com.wimb.mypage.model.vo.MyOrders;



public class MyPageService {
	
	public ArrayList<MyOrders> selectOrderList(Member m) {
		Connection conn = getConnection();
		
		ArrayList<MyOrders> list1 = new MyPageDao().selectOrderList(conn, m);
		
		close(conn);
		return list1;
	
	}
	
	public ArrayList<MyOrders> selectMainPagePostStatus(Member m) {
		Connection conn = getConnection();
		
		ArrayList<MyOrders> list2 = new MyPageDao().selectMainPagePostStatus(conn, m);
		
		close(conn);
		return list2;
	
	}
	
	// inquiry 목록조회
	public ArrayList<Inquiry> selectInquiryList() {
		Connection conn = getConnection();
		
		ArrayList<Inquiry> list = new MyPageDao().selectInquiryList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	
	
	
}