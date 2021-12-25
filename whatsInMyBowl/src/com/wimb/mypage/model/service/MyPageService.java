package com.wimb.mypage.model.service;

import static com.wimb.common.JDBCTemplate.close;
import static com.wimb.common.JDBCTemplate.commit;
import static com.wimb.common.JDBCTemplate.getConnection;
import static com.wimb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.dao.MyPageDao;
import com.wimb.mypage.model.vo.Inquiry;
import com.wimb.mypage.model.vo.MyOrders;
import com.wimb.mypage.model.vo.Orders;



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
	   public ArrayList<Inquiry> selectInquiryList(int mCode, PageInfo pi) {
	      Connection conn = getConnection();
	      ArrayList<Inquiry> list = new MyPageDao().selectInquiryList(conn, mCode, pi);
	      close(conn);
	      return list;
	   }
	   
	   // inquiry 목록조회 시 사용할 페이징바
	   public int selectInquiryListCount(int mCode) {
	      Connection conn = getConnection();
	      int listCount = new MyPageDao().selectInquiryListCount(conn, mCode);
	      close(conn);
	      
	      return listCount;
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
	
	/*
	// inquiry 수정 시 등록한 글을 불러오는 메소드
	public Inquiry selectInquiry(int iCode) {
		Connection conn = getConnection();
		Inquiry inq = new MyPageDao().selectInquiry(iCode);
		
		close(conn);
		return inq;
	}
	*/
	
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
		close(conn);
		return result;
	}
	
	// 찜리스트 - 장바구니 추가
	public int heartToCart(Member m, String pCode) {
		Connection conn = getConnection();
		int result = new MyPageDao().heartToCart(conn, m, pCode);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 페이징처리
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new MyPageDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 관리자 상품관리>주문내역리스트
	public ArrayList<Orders> adminOrderList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Orders> olist = new MyPageDao().adminOrderList(conn, pi);
		close(conn);
		return olist;
	}
	
	// 관리자 상품관리>주문상세조회
	public Orders adminOrderDetail(String oCode) {
		Connection conn = getConnection();
		Orders od = new MyPageDao().adminOrderDetail(conn, oCode);
		close(conn);
		return od;
	}
	
	// 관리자 택배정보 입력
	public int insertPost(String oCode, String com, String inv) {
		Connection conn = getConnection();
		int result = new MyPageDao().insertPost(conn, oCode, com, inv);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 관리자 주문목록 검색
	public ArrayList<Orders> searchOrder(String kword, String option){
		Connection conn = getConnection();
		ArrayList<Orders> olist = new MyPageDao().searchOrder(conn, kword, option);
		close(conn);
		return olist;
	}
}