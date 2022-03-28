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
	
	
	/** 메인 베스트 리뷰 조회
	 * @return
	 */
	public ArrayList<Review> selectMainBestReviewList(){
		
		Connection conn = getConnection();
				
		ArrayList<Review> bestList = new ReviewDao().selectMainBestReviewList(conn);
		
		close(conn);
		
		return bestList;
		
	}
	
	
	/** 리뷰 목록 조회 시 해당 상품 리뷰 총 개수 조회
	 * @param pCode  :  완제품 상품 번호
	 * @return
	 */
	public int selectReviewListCount(String pCode) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectReviewListCount(conn, pCode);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/** 리뷰 목록 조회
	 * @param pi  :  페이징 정보
	 * @param pCode  :  완제품 상품 번호
	 * @return
	 */
	public ArrayList<Review> selectReviewList(PageInfo pi, String pCode) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> reviewList = new ReviewDao().selectReviewList(conn, pi, pCode);
		
		close(conn);
		
		return reviewList;
		
	}
	
	
	/** 리뷰 목록 조회 시 리뷰 해당 상품 정보 조회
	 * @param pCode  :  완제품 상품 번호
	 * @return
	 */
	public Product selectProduct(String pCode) {
		
		Connection conn = getConnection();
		
		Product p = new ReviewDao().selectProduct(conn, pCode);
		
		close(conn);
		
		return p;
		
	}

	
	/** 리뷰 목록 조회 시 로그인한 회원의 해당 상품 후기 작성 가능 확인용 주문 정보 조회
	 * @param pCode  :  완제품 상품 번호
	 * @param mCode  :  로그인한 회원 번호
	 * @return
	 */
	public Order selectOrderList(String pCode, int mCode) {
		
		Connection conn = getConnection();
		
		Order orderInfo = new ReviewDao().selectOrderList(conn, pCode, mCode);
		
		close(conn);
		
		return orderInfo;
		
	}
	
	
	/** 리뷰 등록
	 * @param r  :  리뷰 정보
	 * @param list  :  첨부파일 목록
	 * @return
	 */
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
	
	
	/** 리뷰 수정 폼 요청 시 해당 리뷰 정보 조회
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
	public Review selectReview(int rCode) {

		Connection conn = getConnection();
		
		Review r = new ReviewDao().selectReview(conn, rCode);
		
		close(conn);
		
		return r;
		
	}
	
	
	/** 리뷰 수정 폼 요청 시 해당 리뷰 첨부파일 조회
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
	public ArrayList<File> selectFileList(int rCode) {
		
		Connection conn = getConnection();
		
		ArrayList<File> list = new ReviewDao().selectFileList(conn, rCode);
		
		close(conn);
		
		return list;
		
	}	
	
	
	/** 리뷰 삭제
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
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
	
	
	/** 타회원 리뷰 신고
	 * @param report  :  신고 정보
	 * @return
	 */
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
	
	
	
	/** 리뷰 상세 조회
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
	public Review selectReviewDetail(int rCode) {
		
		Connection conn = getConnection();
		
		Review r = new ReviewDao().selectReviewDetail(conn, rCode);
		
		close(conn);
		
		return r;
	
	}
	
	
	/** 리뷰 상세 조회 시 첨부파일 목록 조회
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
	public ArrayList<File> selectReviewDetailFileList(int rCode) {
		
		Connection conn = getConnection();
		
		ArrayList<File> list = new ReviewDao().selectReviewDetailFileList(conn, rCode);
		
		close(conn);
		
		return list;
		
	}
	
	
	/** 포토 리뷰 목록 조회 시 해당 상품 리뷰 총 개 수
	 * @param pCode  :  완제품 상품 번호
	 * @return
	 */
	public int selectReviewPhotoListCount(String pCode) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectReviewPhotoListCount(conn, pCode);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/** 포토 리뷰 목록 조회
	 * @param pi  :  페이징 정보
	 * @param pCode  :  완제품 상품 번호
	 * @return
	 */
	public ArrayList<Review> selectReviewPhotoList(PageInfo pi, String pCode) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> photoList = new ReviewDao().selectReviewPhotoList(conn, pi, pCode);
		
		close(conn);
		
		return photoList;
		
	}
	
	
	/** 리뷰만 수정
	 * @param r  :  수정한 리뷰 정보
	 * @return
	 */
	public int updateReviewOnly(Review r) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().updateReviewOnly(conn, r);
		
		if(result > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
	
		close(conn);
		
		return result;
		
	}
	
	
	/** 리뷰 수정 시 기존 파일 O, 새로운 파일 O 경우 첨부파일 수정
	 * @param r  :  수정한 리뷰 정보
	 * @param fileList1  :  첨부파일 목록
	 * @return
	 */
	public int updateReviewUpdateFile(Review r, ArrayList<File> fileList1) {
		
		Connection conn = getConnection();
		
		int result1 = 0;
		
		if(r.getMainImg() != null) { // 대표이미지 파일 부분에 새로운 파일이 추가 되었을 경우
			result1 = new ReviewDao().updateReview(conn, r);
		} else { // 대표 이미지 파일 부분 외에 새로운 파일이 추가되었을 경우
			result1 = new ReviewDao().updateReviewOnly(conn, r);
		}
		
		int result2 = new ReviewDao().updateReviewUpdateFile(conn, fileList1);
		
		if(result1 > 0 && result2 > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
	
		close(conn);
		
		return result1 * result2;
		
	}
	
	
	/** 리뷰 수정 시 기존 첨부파일 X, 새로운 첨부파일 O 경우 첨부파일 등록
	 * @param r  :  수정한 리뷰 정보
	 * @param fileList2  : 첨부파일 목록
	 * @return
	 */
	public int updateReviewInsertFile(Review r, ArrayList<File> fileList2) {
		
		Connection conn = getConnection();
		
		int result1 = 0;
		
		if(r.getMainImg() != null) { // 대표이미지 파일 부분에 새로운 파일이 추가 되었을 경우
			result1 = new ReviewDao().updateReview(conn, r);
		} else { // 대표 이미지 파일 부분 외에 새로운 파일이 추가되었을 경우
			result1 = new ReviewDao().updateReviewOnly(conn, r);
		}
		
		int result2 = new ReviewDao().updateReviewInsertFile(conn, fileList2);
		
		if(result1 > 0 && result2 > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
	
		close(conn);
		
		return result1 * result2;
		
	}
	
	
	
	
	
	
	
	// 관리자
	
	
	/** 관리자 리뷰 목록 조회 시 리뷰 총 개수
	 * @return
	 */
	public int selectAdminReviewListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectAdminReviewListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/** 관리자 리뷰 목록 조회
	 * @param pi  :  페이징 정보
	 * @return
	 */
	public ArrayList<Review> selectAdminReviewList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> reviewList = new ReviewDao().selectAdminReviewList(conn, pi);
		
		close(conn);
		
		return reviewList;
		
	}
	
	
	/** 관리자 리뷰 상세 조회
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
	public Review selectAdminReviewDetail(int rCode) {

		Connection conn = getConnection();
		
		Review r = new ReviewDao().selectAdminReviewDetail(conn, rCode);
		
		close(conn);
		
		return r;
		
	}
	
	
	/** 관리자 리뷰 메인 노출 상태 수정
	 * @param rCode  :  리뷰 번호
	 * @param rMainStatus  :  메인 노출 상태
	 * @return
	 */
	public int updateAdminReviewMainStatus(int rCode, String rMainStatus) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().updateAdminReviewMainStatus(conn, rCode, rMainStatus);
		
		if(result > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/** 관리자 회원 리뷰 포인트 지급
	 * @param rCode  :  리뷰 번호
	 * @param orderCode  :  주문 번호
	 * @param mCode  :  회원 번호
	 * @return
	 */
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
	
	
	/** 관리자 회원 리뷰 완전 삭제
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
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
	
	
	/** 관리자 회원 리뷰 비노출
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
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
	
	
	/** 관리자 상품명으로 회원 리뷰 검색
	 * @param searchKeyword  :  검색 키워드
	 * @return
	 */
	public ArrayList<Review> selectAdminReviewSearchList(String searchKeyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> searchList = new ReviewDao().selectAdminReviewSearchList(conn, searchKeyword);
		
		close(conn);
		
		return searchList;
	
	}
	
	
	
	
	
	
	
	
}
