package com.wimb.report.model.service;

import static com.wimb.common.JDBCTemplate.close;
import static com.wimb.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
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
	
	
	
	
	
	
	
	
}
