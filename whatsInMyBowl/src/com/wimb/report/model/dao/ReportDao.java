package com.wimb.report.model.dao;

import static com.wimb.common.JDBCTemplate.close;
import static com.wimb.common.JDBCTemplate.getConnection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.member.model.vo.Member;
import com.wimb.product.model.vo.Product;
import com.wimb.report.model.vo.Report;
import com.wimb.review.model.vo.Review;

public class ReportDao {
	
private Properties prop = new Properties();
	
	public ReportDao() {
		
		try {
			
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/db/sql/report-mapper.xml").getPath()));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/** 리뷰 신고 목록 조회 시 신고글 총 개수
	 * @param conn
	 * @return
	 */
	public int selectAdminReportListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReportListCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
						
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	/** 리뷰 신고 목록 조회
	 * @param conn
	 * @param pi  :  페이징 정보
	 * @return
	 */
	public ArrayList<Report> selectAdminReportList(Connection conn, PageInfo pi) {

		ArrayList<Report> reportList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReportList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
			int endRow = startRow + pi.getBoardLimit() - 1; // 끝값

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				reportList.add(new Report(rset.getInt("report_code"),
						          		  rset.getInt("from_m"),
						          		  rset.getInt("r_code"),
						          		  rset.getString("report_date"),
						          		  rset.getString("report_category"),
						          		  rset.getString("report_content"),
						          		  rset.getInt("to_m"),
						          		  rset.getInt("m_reportcount")));
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return reportList;
		
	}
	
	
	/** 리뷰 신고글 상세 조회 시 해당 리뷰 상세 조회
	 * @param conn
	 * @param rCode  :  리뷰 번호
	 * @return
	 */
	public Review selectAdminReviewDetail(Connection conn, int rCode) {

		Review rev = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReviewDetail");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				rev.setmId(rset.getString("m_id"));
				rev.setmName(rset.getString("m_name"));
				rev.setrDate(rset.getString("r_date"));
				rev.setrContent(rset.getString("r_content"));
				
			}
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return rev;
		
	}
	
	
	/** 리뷰 신고글 상세 조회
	 * @param conn
	 * @param reportCode  :  신고글 번호
	 * @return
	 */
	public Report selectAdminReportDetail(Connection conn, int reportCode) {

		Report rep = new Report();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReportDetail");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reportCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				rep.setmId(rset.getString("m_id"));
				rep.setmName(rset.getString("m_name"));
				rep.setReportDate(rset.getString("report_date"));
				rep.setReportCategory(rset.getString("report_category"));
				rep.setReportContent(rset.getString("report_content"));
				
			}
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return rep;
		
	}
	
	
	/** 신고 작성 회원번호로 신고글 검색
	 * @param conn
	 * @param searchKeyword  :  검색 키워드
	 * @return
	 */
	public ArrayList<Report> selectAdminReportSearchList(Connection conn, String searchKeyword) {
		
		ArrayList<Report> searchList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReportSearchList"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchKeyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				searchList.add(new Report(rset.getInt("report_code"),
										  rset.getInt("from_m"),
										  rset.getInt("r_code"),
										  rset.getString("report_date"),
										  rset.getString("report_category"),
										  rset.getString("report_content"),
										  rset.getInt("to_m"),
										  rset.getInt("m_reportcount"),
										  rset.getString("to_m_id")));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return searchList;
		
	}
	
	
	/** 리뷰 신고글 삭제
	 * @param conn
	 * @param reportCode  :  신고글 번호
	 * @return
	 */
	public int deleteAdminReport(Connection conn, String[] reportCode) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAdminReport"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			for(String r : reportCode) {
				
				pstmt.setInt(1, Integer.parseInt(r));
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/** 신고 대상 회원 블랙리스트 추가
	 * @param conn
	 * @param reportedMemberCode  :  신고 대상 회원 번호
	 * @param blackReason  :  등록 사유
	 * @return
	 */
	public int insertAdminBlackList(Connection conn, String[] reportedMemberCode, String blackReason) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdminBlackList"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			for(String m : reportedMemberCode) {
				
				pstmt.setString(1, blackReason);
				pstmt.setInt(2, Integer.parseInt(m));
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/** 블랙리스트 목록 조회 시 총 블랙리스트 회원 수
	 * @param conn
	 * @return
	 */
	public int selectAdminBlackListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminBlackListCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
						
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	/** 블랙리스트 목록 조회 시
	 * @param conn
	 * @param pi  :  페이징 정보
	 * @return
	 */
	public ArrayList<Member> selectAdminBlackList(Connection conn, PageInfo pi) {

		ArrayList<Member> blackList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminBlackList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
			int endRow = startRow + pi.getBoardLimit() - 1; // 끝값

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member();
				m.setmCode(rset.getInt("m_code"));
				m.setmId(rset.getString("m_id"));
				m.setmName(rset.getString("m_name"));
				m.setmPhone(rset.getString("m_phone"));
				m.setmBlackDate(rset.getDate("m_blackdate"));
				m.setmBlackReason(rset.getString("m_blackreason"));
				m.setmReportCount(rset.getInt("m_reportcount"));
				
				blackList.add(m);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return blackList;
		
	}
	
	
	/** 회원 아이디로 블랙리스트 검색
	 * @param conn
	 * @param searchKeyword  :  검색 키워드
	 * @return
	 */
	public ArrayList<Member> selectAdminSearchBlackList(Connection conn, String searchKeyword) {
		
		ArrayList<Member> searchList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminSearchBlackList"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchKeyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member();
				
				m.setmCode(rset.getInt("m_code"));
				m.setmId(rset.getString("m_id"));
				m.setmName(rset.getString("m_name"));
				m.setmPhone(rset.getString("m_phone"));
				m.setmBlackDate(rset.getDate("m_blackdate"));
				m.setmBlackReason(rset.getString("m_blackreason"));
				m.setmReportCount(rset.getInt("m_reportcount"));
				
				searchList.add(m);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return searchList;
		
	}
	
	
	/** 블랙리스트 해제
	 * @param conn
	 * @param mCode  :  회원 번호
	 * @return
	 */
	public int deleteAdminBlackList(Connection conn, String[] mCode) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAdminBlackList"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			for(String m : mCode) {
				
				pstmt.setInt(1, Integer.parseInt(m));
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	

}
