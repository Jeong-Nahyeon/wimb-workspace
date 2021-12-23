package com.wimb.customerService.model.service;

import static com.wimb.common.JDBCTemplate.*;
import static com.wimb.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.customerService.model.dao.FAQDao;
import com.wimb.customerService.model.vo.FAQ;

public class FAQService {

	// FAQ 전체보기 리스트를 띄워주는 서비스
	public ArrayList<FAQ> selectFAQListAll(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectFAQListAll(conn, pi);
		close(conn);
		return list;
	}
	
	// 페이징바에 사용할 등록된 자주묻는질문의 총 갯수를 구하는 서비스
	public int selectListCount() {
		 Connection conn = getConnection();
		 int listCount = new FAQDao().selectListCount(conn);
		 close(conn);
		 
		 return listCount;
	}
	
	// 검색 시 검색된 페이징바에 사용할 서비스
	public int selectSearchListCount(String searchWord) {
		 Connection conn = getConnection();
		 int listCount = new FAQDao().selectSearchListCount(conn, searchWord);
		 close(conn);
		 
		 return listCount;
	}
	
	// 검색된 리스트를 불러오는 서비스
	public ArrayList<FAQ> selectSearchList(PageInfo pi, String searchWord){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectSearchList(conn, pi, searchWord);
		
		close(conn);
		return list;
	}
	
	
	// 배송 카테고리 리스트를 불러오는 서비스
	public ArrayList<FAQ> selectDeliveryList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectDeliveryList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 배송 카테고리 페이징바 서비스
	public int selectDeliveryListCount(){
		Connection conn = getConnection();
		int listCount = new FAQDao().selectDeliveryListCount(conn);
		close(conn);
		return listCount;
	}	
	
	// 적립금 카테고리 리스트를 불러오는 서비스
	public ArrayList<FAQ> selectPointList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectPointList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 적립금 카테고리 페이징바 서비스
	public int selectPointListCount(){
		Connection conn = getConnection();
		int listCount = new FAQDao().selectPointListCount(conn);
		close(conn);
		return listCount;
	}	
		
	// 주문/결제 카테고리 리스트를 불러오는 서비스
	public ArrayList<FAQ> selectOrderPaymentList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectOrderPaymentList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 주문/결제 카테고리 페이징바 서비스
	public int selectOrderPaymentListCount(){
		Connection conn = getConnection();
		int listCount = new FAQDao().selectOrderPaymentListCount(conn);
		close(conn);
		return listCount;
	}		
	
	// 취소/환불 카테고리 리스트를 불러오는 서비스
	public ArrayList<FAQ> selectCencelRefundList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectCencelRefundList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 취소/환불 카테고리 페이징바 서비스
	public int selectCencelRefundListCount(){
		Connection conn = getConnection();
		int listCount = new FAQDao().selectCencelRefundListCount(conn);
		close(conn);
		return listCount;
	}	

	// 상품 카테고리 리스트를 불러오는 서비스
	public ArrayList<FAQ> selectProductList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectProductList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 상품 카테고리 페이징바 서비스
	public int selectProductListCount(){
		Connection conn = getConnection();
		int listCount = new FAQDao().selectProductListCount(conn);
		close(conn);
		return listCount;
	}	
	
	// 이용/기타 카테고리 리스트를 불러오는 서비스
	public ArrayList<FAQ> selectETCList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectETCList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 이용/기타 카테고리 페이징바 서비스
	public int selectETCListCount(){
		Connection conn = getConnection();
		int listCount = new FAQDao().selectETCListCount(conn);
		close(conn);
		return listCount;
	}	
	
	// 관리자 - 전체 리스트를 가져오기
	public ArrayList<FAQ> selectAdminAllListView(){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectAdminAllListView(conn);
		close(conn);
		return list;
	}
	
	// 관리자 - 자주묻는질문 등록
	public int insertFaq(String faqTitle, String faqCategory, String faqContent) {
		Connection conn = getConnection();
		int result = new FAQDao().insertFaq(conn, faqTitle, faqCategory, faqContent);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
}
