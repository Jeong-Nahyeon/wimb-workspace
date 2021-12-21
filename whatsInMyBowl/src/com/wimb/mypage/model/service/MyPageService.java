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
	
	// 주문 취소 요청 insert|update
	public int insertUpdateCancel(String oCode, String payCode) {
		Connection conn = getConnection();
		int result1 = new MyPageDao().insertCancel(conn, oCode, payCode);
		int result2 = new MyPageDao().updateCancel(conn, oCode);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	// 주문 환불 요청 insert|update
		public int insertUpdateRefund(String oCode, String payCode, String reReason) {
			Connection conn = getConnection();
			int result1 = new MyPageDao().insertRefund(conn, oCode, payCode, reReason);
			int result2 = new MyPageDao().updateRefund(conn, oCode);
			
			if(result1>0 && result2>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result1 * result2;
		}
	
	// 취소/환불조회 페이지
	public ArrayList<MyOrders> selectCancelList(Member m, String startDay, String endDay) {
		Connection conn = getConnection();
		ArrayList<MyOrders> clist = new MyPageDao().selectCancelList(conn, m, startDay, endDay);
		close(conn);
		return clist;
	
	}
	
	// 취소/환불 상세조회
	public MyOrders selectRCDetail(String orderCode) {
		Connection conn = getConnection();
		MyOrders mo = new MyPageDao().selectRCDetail(conn, orderCode);
		close(conn);
		return mo;
	}
	
	// 찜리스트 조회
	public ArrayList<MyOrders> selectHeart(Member m) {
		Connection conn = getConnection();
		ArrayList<MyOrders> hlist = new MyPageDao().selectHeart(conn, m);
		close(conn);
		return hlist;
	}
	
	// 찜리스트 선택삭제
	public int deleteHeart(Member m, String pCode) {
		Connection conn = getConnection();
		int result = new MyPageDao().deleteHeart(conn, m, pCode);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
}