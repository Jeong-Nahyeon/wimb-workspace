package com.wimb.report.model.service;

import static com.wimb.common.JDBCTemplate.close;
import static com.wimb.common.JDBCTemplate.commit;
import static com.wimb.common.JDBCTemplate.getConnection;
import static com.wimb.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.member.model.vo.Member;
import com.wimb.report.model.dao.ReportDao;
import com.wimb.report.model.vo.Report;
import com.wimb.review.model.dao.ReviewDao;
import com.wimb.review.model.vo.Review;

public class ReportService {

	/** 리뷰 신고 목록 조회 시 신고글 총 개수
	 * @return
	 */
	public int selectAdminReportListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReportDao().selectAdminReportListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}


	/** 리뷰 신고 목록 조회
	 * @param pi  :  페이징 정보
	 * @return
	 */
	public ArrayList<Report> selectAdminReportList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Report> reportList = new ReportDao().selectAdminReportList(conn, pi);
		
		close(conn);
		
		return reportList;
		
	}
	
	
	/** 리뷰 신고글 상세 조회 시 해당 리뷰 상세 조회
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
	public Review selectAdminReviewDetail(int rCode) {

		Connection conn = getConnection();
		
		Review rev = new ReportDao().selectAdminReviewDetail(conn, rCode);

		close(conn);
		
		return rev;
		
	}
	
	
	/** 리뷰 신고글 상세 조회
	 * @param reportCode  :  신고글 번호
	 * @return
	 */
	public Report selectAdminReportDetail(int reportCode) {
		
		Connection conn = getConnection();
		
		Report rep = new ReportDao().selectAdminReportDetail(conn, reportCode);
		
		close(conn);
		
		return rep;
		
	}
	
	
	/** 신고 작성 회원번호로 리뷰 신고글 검색
	 * @param searchKeyword  :  검색 키워드
	 * @return
	 */
	public ArrayList<Report> selectAdminReportSearchList(String searchKeyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Report> searchList = new ReportDao().selectAdminReportSearchList(conn, searchKeyword);
		
		close(conn);
		
		return searchList;
	
	}
	
	
	/** 리뷰 신고글 삭제
	 * @param reportCode  :  신고글 번호
	 * @return
	 */
	public int deleteAdminReport(String[] reportCode) {

		Connection conn = getConnection();
		
		int result = new ReportDao().deleteAdminReport(conn, reportCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/** 신고 대상 회원 블랙리스트 추가
	 * @param reportedMemberCode  :  신고 대상 회원 번호
	 * @param blackReason  :  등록 사유
	 * @return
	 */
	public int insertAdminBlackList(String[] reportedMemberCode, String blackReason) {
		
		Connection conn = getConnection();
		
		int result = new ReportDao().insertAdminBlackList(conn, reportedMemberCode, blackReason);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/** 블랙리스트 목록 조회 시 총 블랙리스트 회원 수
	 * @return
	 */
	public int selectAdminBlackListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReportDao().selectAdminBlackListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}


	/** 블랙리스트 목록 조회 시
	 * @param pi  :  페이징 정보
	 * @return
	 */
	public ArrayList<Member> selectAdminBlackList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> blackList = new ReportDao().selectAdminBlackList(conn, pi);
		
		close(conn);
		
		return blackList;
		
	}
	
	
	/** 회원 아이디로 블랙리스트 검색
	 * @param searchKeyword  :  검색 키워드
	 * @return
	 */
	public ArrayList<Member> selectAdminSearchBlackList(String searchKeyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> searchList = new ReportDao().selectAdminSearchBlackList(conn, searchKeyword);
		
		close(conn);
		
		return searchList;
	
	}
	
	
	/** 블랙리스트 해제
	 * @param mCode  :  회원 번호
	 * @return
	 */
	public int deleteAdminBlackList(String[] mCode) {

		Connection conn = getConnection();
		
		int result = new ReportDao().deleteAdminBlackList(conn, mCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
}
