package com.wimb.review.model.service;

import static com.wimb.common.JDBCTemplate.close;

import static com.wimb.common.JDBCTemplate.commit;
import static com.wimb.common.JDBCTemplate.getConnection;
import static com.wimb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.File;
import com.wimb.common.model.vo.PageInfo;
import com.wimb.payment.model.vo.Order;
import com.wimb.product.model.dao.ProductDao;
import com.wimb.product.model.vo.Product;
import com.wimb.review.model.dao.ReviewDao;
import com.wimb.report.model.vo.Report;
import com.wimb.review.model.vo.Review;

public class ReviewService {
	
	public int selectReviewListCount(String pCode) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectReviewListCount(conn, pCode);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	public ArrayList<Review> selectReviewList(PageInfo pi, String pCode) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> reviewList = new ReviewDao().selectReviewList(conn, pi, pCode);
		
		close(conn);
		
		return reviewList;
		
	}
	
	
	public Product selectProduct(String pCode) {
		
		Connection conn = getConnection();
		
		Product p = new ReviewDao().selectProduct(conn, pCode);
		
		close(conn);
		
		return p;
		
	}

	
	public Order selectOrderList(String pCode, int mCode) {
		
		Connection conn = getConnection();
		
		Order orderInfo = new ReviewDao().selectOrderList(conn, pCode, mCode);
		
		close(conn);
		
		return orderInfo;
		
	}
	
	
	public int insertReview(Review r, ArrayList<File> list) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertReview(conn, r);
		
		int result2 = 1;
		
		if(!list.isEmpty()) { 
			
			result2 = new ReviewDao().insertFileList(conn, list);
			
		}


		if(result1 > 0 && result2 > 0) { // 둘다 성공한 경우
			commit(conn);
		} else { // 둘 중에 하나라도 실패한 경우
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2; // 둘 중에 하나라도 실패 => 0 | 둘 다 성공 => 1
		
	}
	
	
	public Review selectReview(int rCode) {

		Connection conn = getConnection();
		
		Review r = new ReviewDao().selectReview(conn, rCode);
		
		close(conn);
		
		return r;
		
	}
	
	
	public ArrayList<File> selectFileList(int rCode) {
		
		Connection conn = getConnection();
		
		ArrayList<File> list = new ReviewDao().selectFileList(conn, rCode);
		
		close(conn);
		
		return list;
		
	}	
	
	
	public int deleteReview(int rCode) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn, rCode);
		
		if(result > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	public int insertReportReview(Report report) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertReportReview(conn, report);
		
		if(result > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 관리자
	
	
	public int selectAdminReviewListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectAdminReviewListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	public ArrayList<Review> selectAdminReviewList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> reviewList = new ReviewDao().selectAdminReviewList(conn, pi);
		
		close(conn);
		
		return reviewList;
		
	}
	
	
	public Review selectAdminReviewDetail(int rCode) {

		Connection conn = getConnection();
		
		Review r = new ReviewDao().selectAdminReviewDetail(conn, rCode);
		
		close(conn);
		
		return r;
		
	}
	
	
	public int updateAdminReviewMainStatus(int rCode, String rMainStatus) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().updateAdminReviewMainStatus(conn, rCode, rMainStatus);
		
		if(result > 0) { 
//			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	public int insertUpdateAdminReviewPoint(int rCode, String orderCode, int mCode) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().updateAdminPointStatus(conn, rCode);
		
		int result2 = new ReviewDao().insertAdminReviewPoint(conn, orderCode, mCode);
		
		if(result1 > 0 && result2 > 0) { // 둘다 성공
			commit(conn);
		} else { // 둘다 실패
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
	
	
	public int deleteAdminReview(String[] rCode) {

		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteAdminReview(conn, rCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	public int updateAdminReviewStatus(String[] rCode) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().updateAdminReviewStatus(conn, rCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	public ArrayList<Review> selectAdminReviewSearchList(String searchKeyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> searchList = new ReviewDao().selectAdminReviewSearchList(conn, searchKeyword);
		
		close(conn);
		
		return searchList;
	
	}
	
	
	
	
	
	
	
	
}
