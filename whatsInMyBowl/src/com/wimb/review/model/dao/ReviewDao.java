package com.wimb.review.model.dao;

import java.io.FileInputStream;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.wimb.common.JDBCTemplate.*;

import com.wimb.common.model.vo.File;
import com.wimb.common.model.vo.PageInfo;
import com.wimb.payment.model.vo.Order;
import com.wimb.product.model.vo.Product;
import com.wimb.report.model.vo.Report;
import com.wimb.review.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public int selectReviewListCount(Connection conn, String pCode) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewListCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pCode);
			
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
	
	
	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi, String pCode) {

		ArrayList<Review> reviewList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
			int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
			
			pstmt.setString(1, pCode);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reviewList.add(new Review(rset.getInt("r_code"),
										  rset.getInt("m_code"),
										  rset.getString("p_name"),
										  rset.getString("r_content"),
										  rset.getString("r_date"),
										  rset.getString("mainimg"),
										  rset.getString("m_name")));
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewList;
		
	}
	
	
	public Product selectProduct(Connection conn, String pCode) {

		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				p.setpCode(rset.getString("p_code"));
				p.setpName(rset.getString("p_name"));
				p.setpMainImg(rset.getString("p_mainimg"));
				p.setFilePath("resources/images/product_images/");
				
			}
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}
	
	
	public Order selectOrderList(Connection conn, String pCode, int mCode) {

		Order orderInfo = new Order();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pCode);
			pstmt.setInt(2, mCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				orderInfo.setoCode(rset.getString("order_code"));
				orderInfo.setmCode(rset.getInt("m_code"));
				
			}
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return orderInfo;
		
	}
	
	
	public int insertReview(Connection conn, Review r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview"); // 미완성 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getOrderCode());
			pstmt.setInt(2, r.getmCode());
			pstmt.setString(3, r.getpCode());
			pstmt.setString(4, r.getrContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int insertFileList(Connection conn, ArrayList<File> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFileList"); // 미완성 sql문
		
		try {
			
			for(File f : list) {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, f.getfName());
				pstmt.setString(2, f.getfRename());
				pstmt.setString(3, f.getfPath());
				pstmt.setString(4, f.getfExtension());
				
				result = pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public Review selectReview(Connection conn, int rCode) {

		Review r = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReview");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				r.setrCode(rset.getInt("r_code"));
				r.setrContent(rset.getString("r_content"));
				
			}
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
		
	}
	
	
	public ArrayList<File> selectFileList(Connection conn, int rCode) {

		ArrayList<File> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFileList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				File f = new File();
				
				f.setfCode(rset.getInt("f_code"));
				f.setfName(rset.getString("f_name"));
				f.setfRename(rset.getString("f_rename"));
				f.setfPath(rset.getString("f_path"));
				f.setfRefCode(rset.getInt("f_refcode"));
				
				list.add(f);
				
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public int deleteReview(Connection conn, int rCode) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview"); // 미완성 sql문
		
		try {
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, rCode);
				result = pstmt.executeUpdate();
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int insertReportReview(Connection conn, Report report) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReportReview"); // 미완성 sql문
		
		try {
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, report.getmCode());
				pstmt.setInt(2, report.getrCode());
				pstmt.setString(3, report.getReportCategory());
				pstmt.setString(4, report.getReportContent());
				
				result = pstmt.executeUpdate();
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public Review selectReviewDetail(Connection conn, int rCode) {

		Review r = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewDetail");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				r.setrCode(rset.getInt("r_code"));
				r.setmName(rset.getString("m_name"));
				r.setrContent(rset.getString("r_content"));
				r.setrDate(rset.getString("r_date"));
				
			}
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
		
	}
	
	
	public ArrayList<File> selectReviewDetailFileList(Connection conn, int rCode) {

		ArrayList<File> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewDetailFileList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				File f = new File();
				
				f.setfCode(rset.getInt("f_code"));
				f.setfRename(rset.getString("f_rename"));
				f.setfPath(rset.getString("f_path"));
				
				list.add(f);
				
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public int selectReviewPhotoListCount(Connection conn, String pCode) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewPhotoListCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pCode);
			
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
	
	
	public ArrayList<Review> selectReviewPhotoList(Connection conn, PageInfo pi, String pCode) {

		ArrayList<Review> photoList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewPhotoList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
			int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
			
			pstmt.setString(1, pCode);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				photoList.add(new Review(rset.getInt("r_code"),
										  rset.getInt("m_code"),
										  rset.getString("p_name"),
										  rset.getString("r_content"),
										  rset.getString("r_date"),
										  rset.getString("mainimg"),
										  rset.getString("m_name")));
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return photoList;
		
	}
	
	
	public int updateReview(Connection conn, int rCode, String rContent) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReview");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rContent);
			pstmt.setInt(2, rCode);
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateReviewOnly(Connection conn, Review r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReviewOnly"); // 미완성 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getrContent());
			pstmt.setInt(2, r.getrCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateReview(Connection conn, Review r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview"); // 미완성 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getrContent());
			
			if(r.getMainImg() == null) {
				pstmt.setNull(2, java.sql.Types.VARCHAR);
			} else {
				pstmt.setString(2, r.getMainImg());
			}
			
			pstmt.setInt(3, r.getrCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateReviewUpdateFile(Connection conn, ArrayList<File> fileList1) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReviewUpdateFile"); // 미완성 sql문
		
		try {
			
			for(File f : fileList1) {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, f.getfName());
				pstmt.setString(2, f.getfRename());
				pstmt.setString(3, f.getfPath());
				pstmt.setString(4, f.getfExtension());
				pstmt.setInt(5, f.getfCode());
				
				result = pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateReviewInsertFile(Connection conn, ArrayList<File> fileList2) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReviewInsertFile"); // 미완성 sql문
		
		try {
			
			for(File f : fileList2) {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, f.getfName());
				pstmt.setString(2, f.getfRename());
				pstmt.setString(3, f.getfPath());
				pstmt.setString(4, f.getfExtension());
				pstmt.setInt(5, f.getfRefCode());
				
				result = pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	// 관리자
	
	
	public int selectAdminReviewListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReviewListCount");
		
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
	
	
	public ArrayList<Review> selectAdminReviewList(Connection conn, PageInfo pi) {
		

		ArrayList<Review> reviewList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReviewList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
			int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Review r = new Review();
				
				r.setrCode(rset.getInt("r_code"));
				r.setOrderCode(rset.getString("order_code"));
				r.setmCode(rset.getInt("m_code"));
				r.setmName(rset.getString("m_id"));
				r.setpCode(rset.getString("p_name"));
				r.setrContent(rset.getString("r_content"));
				r.setrDate(rset.getString("r_date"));
				r.setrMainstatus(rset.getString("r_mainstatus"));
				r.setrStatus(rset.getString("r_status"));
				r.setPointStatus(rset.getString("point_status"));
				
				reviewList.add(r);
				
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewList;
		
	}
	
	
	public Review selectAdminReviewDetail(Connection conn, int rCode) {

		Review r = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReviewDetail");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				r.setrCode(rset.getInt("r_code"));
				r.setmName(rset.getString("m_id"));
				r.setpCode(rset.getString("p_name"));
				r.setrContent(rset.getString("r_content"));
				r.setrDate(rset.getString("r_date"));
				r.setrMainstatus(rset.getString("r_mainstatus"));
				r.setMainImg(rset.getString("mainimg"));
				
			}
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return r;
		
	}
	
	
	public int updateAdminReviewMainStatus(Connection conn, int rCode, String rMainStatus) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAdminReviewMainStatus"); // 미완성
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rMainStatus);
			pstmt.setInt(2, rCode);
			
			result = pstmt.executeUpdate();
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateAdminPointStatus(Connection conn, int rCode) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAdminPointStatus"); // 미완성
		
		try {
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rCode);
			
			result = pstmt.executeUpdate();
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
			
	}
	
	
	public int insertAdminReviewPoint(Connection conn, String orderCode, int mCode) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAdminReviewPoint"); // 미완성
		
		try {
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, mCode);
			pstmt.setString(2, orderCode);
			
			result = pstmt.executeUpdate();
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
			
	}
	
	
	public int deleteAdminReview(Connection conn, String[] rCode) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAdminReview"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			for(String r : rCode) {
				
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
	
	
	public int updateAdminReviewStatus(Connection conn, String[] rCode) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAdminReviewStatus"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			for(String r : rCode) {
				
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
	
	
	public ArrayList<Review> selectAdminReviewSearchList(Connection conn, String searchKeyword) {
		
		ArrayList<Review> searchList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminReviewSearchList"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchKeyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Review r = new Review();
				
				r.setrCode(rset.getInt("r_code"));
				r.setOrderCode(rset.getString("order_code"));
				r.setmCode(rset.getInt("m_code"));
				r.setmName(rset.getString("m_id"));
				r.setpCode(rset.getString("p_name"));
				r.setrContent(rset.getString("r_content"));
				r.setrDate(rset.getString("r_date"));
				r.setrMainstatus(rset.getString("r_mainstatus"));
				r.setrStatus(rset.getString("r_status"));
				r.setPointStatus(rset.getString("point_status"));
				
				searchList.add(r);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return searchList;
		
	}
	
	
	
	
	
	
	
}
