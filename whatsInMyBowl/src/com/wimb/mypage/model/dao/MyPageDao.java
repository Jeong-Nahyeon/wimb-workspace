package com.wimb.mypage.model.dao;

import static com.wimb.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.vo.Inquiry;
import com.wimb.mypage.model.vo.MyOrders;

public class MyPageDao {
	
	// Properties 객체 생성
	private Properties prop = new Properties();
	
	public MyPageDao() {
		
		try {
			prop.loadFromXML(new FileInputStream( MyPageDao.class.getResource("/db/sql/mypage-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	// Properties 객체 생성 끝
	
	// 최근 30일 주문정보 조회
	public ArrayList<MyOrders> selectOrderList(Connection conn, Member m) {
		ArrayList<MyOrders> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainPageOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyOrders mo = new MyOrders(rset.getString("order_code"),
										   rset.getInt("order_amount"),
										   rset.getString("order_company"),
										   rset.getString("order_invoice"),
										   rset.getString("order_status"),
										   rset.getDate("order_date"),
										   rset.getString("cu_Name"),
										   rset.getString("p_Name"),
										   rset.getString("p_mainimg"),
										   rset.getInt("pm_totalcost"));
				list.add(mo);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
		// 최근 30일 주문정보 (배송현황) 조회
		public ArrayList<MyOrders> selectMainPagePostStatus(Connection conn, Member m) {
			
			ArrayList<MyOrders> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMainPagePostStatus");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m.getmCode());
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					MyOrders mo = new MyOrders();
					mo.setOrderStatus(rset.getString("order_status"));
					mo.setStatusCount(rset.getInt("count"));
					
					
					list.add(mo);	
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
			
			
		}
	
	// inquiry 목록조회
		public ArrayList<Inquiry> selectInquiryList(Connection conn) {
			// 여러행 ArrayList<Inquiry>객체
			ArrayList<Inquiry> list = new ArrayList<>(); // 텅빈리스트
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectInquiryList");
			
			try {
				pstmt = conn.prepareStatement(sql);			
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Inquiry(rset.getInt("i_code"),
										 rset.getString("m_name"),
										 rset.getString("i_category"),
										 rset.getString("i_title"),
										 rset.getString("i_answer"),
										 rset.getDate("i_date")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}
		
		// inquiry 삭제 dao
		public int deleteInquiryList(Connection conn, int iCode) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteInquiryList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, iCode);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}


	
}
