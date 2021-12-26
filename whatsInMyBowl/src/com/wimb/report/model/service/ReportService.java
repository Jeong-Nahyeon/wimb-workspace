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

	public int selectAdminReportListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReportDao().selectAdminReportListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}


	public ArrayList<Report> selectAdminReportList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Report> reportList = new ReportDao().selectAdminReportList(conn, pi);
		
		close(conn);
		
		return reportList;
		
	}
	
	
	public Review selectAdminReviewDetail(int rCode) {

		Connection conn = getConnection();
		
		Review rev = new ReportDao().selectAdminReviewDetail(conn, rCode);

		close(conn);
		
		return rev;
		
	}
	
	
	public Report selectAdminReportDetail(int reportCode) {
		
		Connection conn = getConnection();
		
		Report rep = new ReportDao().selectAdminReportDetail(conn, reportCode);
		
		close(conn);
		
		return rep;
		
	}
	
	
	public ArrayList<Report> selectAdminReportSearchList(String searchKeyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Report> searchList = new ReportDao().selectAdminReportSearchList(conn, searchKeyword);
		
		close(conn);
		
		return searchList;
	
	}
	
	
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
	
	
	public int selectAdminBlackListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReportDao().selectAdminBlackListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}


	public ArrayList<Member> selectAdminBlackList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> blackList = new ReportDao().selectAdminBlackList(conn, pi);
		
		close(conn);
		
		return blackList;
		
	}
	
	
	public ArrayList<Member> selectAdminSearchBlackList(String searchKeyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> searchList = new ReportDao().selectAdminSearchBlackList(conn, searchKeyword);
		
		close(conn);
		
		return searchList;
	
	}
	
	
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
