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

import com.wimb.common.model.vo.File;
import com.wimb.common.model.vo.PageInfo;
import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.vo.Inquiry;
import com.wimb.mypage.model.vo.MyOrders;
import com.wimb.mypage.model.vo.Orders;

import jdk.nashorn.internal.runtime.Debug;

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
		String filePath = "resources/images/product_images/";
		String sql = prop.getProperty("selectOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MyOrders(rset.getString("order_code"),
									  rset.getInt("order_amount"),
									  rset.getString("order_company"),
									  rset.getString("order_invoice"),
									  rset.getString("order_status"),
									  rset.getDate("order_date"),
									  rset.getString("cu_Name"),
									  rset.getString("cu_mainimg"),
									  rset.getString("p_Name"),
									  rset.getString("p_mainimg"),
									  rset.getInt("pm_totalcost"),
									  rset.getString("pm_code"),
									  filePath));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	// 최근 30일 주문정보 (배송현황) 조회1
	public MyOrders orderStatus1(Connection conn, Member m) {
		MyOrders od = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderStatus1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				od = new MyOrders(rset.getInt("count"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return od;
		
	}
	
	// 최근 30일 주문정보 (배송현황) 조회2
	public MyOrders orderStatus2(Connection conn, Member m) {
		MyOrders od = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderStatus2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				od = new MyOrders(rset.getInt("count"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return od;
		
	}
	
	// 최근 30일 주문정보 (배송현황) 조회3
	public MyOrders orderStatus3(Connection conn, Member m) {
		MyOrders od = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderStatus3");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				od = new MyOrders(rset.getInt("count"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return od;
		
	}
	
	
	// 최근 30일 주문정보 (배송현황) 조회4
	public MyOrders orderStatus4(Connection conn, Member m) {
		MyOrders od = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderStatus4");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				od = new MyOrders(rset.getInt("count"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return od;
		
	}
	
	
	// 최근 30일 주문정보 (배송현황) 조회5
	public MyOrders orderStatus5(Connection conn, Member m) {
		MyOrders od = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderStatus5");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				od = new MyOrders(rset.getInt("count"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return od;
		
	}
	
    // inquiry 목록조회
    public ArrayList<Inquiry> selectInquiryList(Connection conn, int mCode, PageInfo pi) {
       ArrayList<Inquiry> list = new ArrayList<>();
       ResultSet rset = null;
       PreparedStatement pstmt = null;
 
       String sql = prop.getProperty("selectInquiryList");
       try {
          pstmt = conn.prepareStatement(sql);
          int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
          int endRow = startRow + pi.getBoardLimit() - 1;
          
          pstmt.setInt(1, mCode);
          pstmt.setInt(2, startRow);
          pstmt.setInt(3, endRow);
          
          rset = pstmt.executeQuery();
          
          while(rset.next()) {
             list.add(new Inquiry(rset.getInt("i_code"),
                                  rset.getInt("m_code"),
                                  rset.getString("i_category"),
                                  rset.getString("i_title"),
                                  rset.getString("i_content"),
                                  rset.getString("i_answer"),
                                  rset.getDate("i_date"),
                                  rset.getString("a_content"),
                                  rset.getDate("a_date")));
          }
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          close(rset);
          close(pstmt);
       }
       return list;
    }
    
    // inquiry 목록조회 시 사용할 페이징바
    public int selectInquiryListCount(Connection conn, int mCode) {
       int listCount = 0;
       PreparedStatement pstmt = null;
       ResultSet rset = null;
       
       String sql = prop.getProperty("selectInquiryListCount");
       try {
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, mCode);
          
          rset = pstmt.executeQuery();
          if(rset.next()) {
             listCount = rset.getInt("count");
          }
          
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          close(rset);
          close(pstmt);
       }
       return listCount;
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
 
 // inquiry 수정 시 등록한 글을 불러오는 메소드
 public Inquiry selectInquiry(Connection conn, int mCode, int iCode) {
    Inquiry inq = null;
    ResultSet rset = null;
    PreparedStatement pstmt = null;
    
    String sql = prop.getProperty("selectInquiry");
    
    try {
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, mCode);
       pstmt.setInt(2, iCode);

       rset = pstmt.executeQuery();
       if(rset.next()) {
          inq = new Inquiry(rset.getInt("i_code"),
                          rset.getInt("m_code"),
                          rset.getString("i_category"),
                          rset.getString("i_title"),
                          rset.getString("i_content"),
                          rset.getDate("i_date"));
       }
    } catch (SQLException e) {
       e.printStackTrace();
    } finally {
       close(rset);
       close(pstmt);
    }
    return inq;
    
 }
 
 // inquiry 수정 시 첨부파일을 불러오는 메소드
 public ArrayList<File> selectInquiryFile(Connection conn, int iCode){
    ArrayList<File> list = new ArrayList<>();
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    
    String sql = prop.getProperty("selectInquiryFile");
    
    try {
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, iCode);
       
       rset = pstmt.executeQuery();
       
       while(rset.next()) {
          list.add(new File(rset.getInt("f_code"),
                    rset.getString("f_name"),
                    rset.getString("f_rename"),
                    rset.getString("f_path")));
       }
       
       
    } catch (SQLException e) {
       e.printStackTrace();
    } finally {
       close(rset);
       close(pstmt);
    }
    return list;
    
 }

	
	// 주문목록/배송조회 페이지
	public ArrayList<MyOrders> orderListDetail(Connection conn, Member m, String startDate, String endDate) {
		ArrayList<MyOrders> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		// 저장경로
		String filePath = "resources/images/product_images/";
		String sql = prop.getProperty("orderListDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MyOrders(rset.getString("order_code"),
										   rset.getInt("order_amount"),
										   rset.getString("order_company"),
										   rset.getString("order_invoice"),
										   rset.getString("order_status"),
										   rset.getDate("order_date"),
										   rset.getString("cu_Name"),
										   rset.getString("cu_mainimg"),
										   rset.getString("p_Name"),
										   rset.getString("p_mainimg"),
										   rset.getInt("pm_totalcost"),
										   rset.getString("pm_code"),
										   filePath));
		} 
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
		
	}
	
	// 주문 취소 요청 insert
		public int insertCancel(Connection conn, String oCode, String payCode) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertCancel");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, oCode);
				pstmt.setString(2, payCode);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
			
		}
		
	// 주문 취소 요청 update 
	public int updateCancel(Connection conn, String oCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCancel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 주문 횐불 요청 insert
	public int insertRefund(Connection conn, String oCode, String payCode, String reReason) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRefund");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oCode);
			pstmt.setString(2, payCode);
			pstmt.setString(3, reReason);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 주문 횐불 요청 update 
	public int updateRefund(Connection conn, String oCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRefund");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	// 취소/환불조회 페이지
	public ArrayList<MyOrders> selectCancelList(Connection conn, Member m, String startDay, String endDay) {
		ArrayList<MyOrders> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCancelList");
		// 저장경로
		String filePath = "resources/images/product_images/";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			pstmt.setString(2, startDay);
			pstmt.setString(3, endDay);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				clist.add(new MyOrders(rset.getString("order_code"),
									   rset.getInt("order_amount"),
									   rset.getString("order_Status"),
									   rset.getDate("order_date"),
									   rset.getString("cu_name"),
									   rset.getString("cu_mainimg"),
									   rset.getString("p_name"),
									   rset.getString("p_mainimg"),
									   rset.getInt("pm_totalcost"),
									   filePath,
									   rset.getInt("pm_finalcost"),
									   rset.getString("cancel_code"),
									   rset.getString("cancel_status"),
									   rset.getDate("cancel_completement"),
									   rset.getString("re_code"),
									   rset.getString("re_status"),
									   rset.getDate("re_completement")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return clist;
	}
	
	// 취소/환불 상세조회
	public MyOrders selectRCDetail(Connection conn, String orderCode) {
		MyOrders mo = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRCDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderCode);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				mo = new MyOrders(rset.getString("order_code"),
						   rset.getInt("order_amount"),
						   rset.getDate("order_date"),
						   rset.getString("cu_name"),
						   rset.getString("p_name"),
						   rset.getInt("pm_totalcost"),
						   rset.getInt("pm_finalcost"),
						   rset.getString("cancel_code"),
						   rset.getString("cancel_status"),
						   rset.getDate("cancel_completement"),
						   rset.getString("re_code"),
						   rset.getString("re_status"),
						   rset.getDate("re_completement"),
						   rset.getString("cancel_reason"),
						   rset.getString("re_reason"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mo;
	}
	
	// 찜리스트 조회
	public ArrayList<MyOrders> selectHeart(Connection conn, Member m) {
		ArrayList<MyOrders> hlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHeart");
		// 저장경로
		String filePath = "resources/images/product_images/";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				MyOrders mo = new MyOrders(rset.getString("p_name"),
						                   rset.getString("p_mainImg"),
						                   filePath,
						                   rset.getString("p_code"),
						                   rset.getInt("p_provideprice"));
				hlist.add(mo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hlist;
	}
	
	// 찜리스트 삭제
	public int deleteHeart(Connection conn, Member m, String pCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteHeart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			pstmt.setString(2, pCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 찜리스트 - 장바구니 추가
	public int heartToCart(Connection conn, Member m, String pCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("heartToCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			pstmt.setString(2, pCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	// 페이징처리
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 관리자 상품관리>주문내역리스트
	public ArrayList<Orders> adminOrderList(Connection conn, PageInfo pi) {
		ArrayList<Orders> olist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Orders od = new Orders(rset.getString("order_code"),
						               rset.getInt("m_code"),
						               rset.getString("pm_code"),
						               rset.getInt("order_amount"),
						               rset.getString("order_name"),
						               rset.getString("order_address"),
						               rset.getString("order_subaddress"),
						               rset.getInt("order_zipcode"),
						               rset.getString("order_phone"),
						               rset.getString("order_email"),
						               rset.getString("order_request"),
						               rset.getInt("order_point"),
						               rset.getString("company"),
						               rset.getString("invoice"),
						               rset.getString("order_status"),
						               rset.getDate("order_date"),
						               rset.getInt("rnum"),
						               rset.getString("p_code"),
						               rset.getString("p_name"),
						               rset.getString("cu_code"),
						               rset.getString("cu_name"),
						               rset.getInt("pm_totalcost"),
						               rset.getInt("pm_finalcost"),
						               rset.getString("pm_method"));
				olist.add(od);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return olist;
	}
	
	// 관리자 상품관리>주문상세조회
	public Orders adminOrderDetail (Connection conn, String oCode) {
		Orders od = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminOrderDetail");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			pstmt.setString(1, oCode);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				od = new Orders(rset.getString("order_code"),
						               rset.getString("order_name"),
						               rset.getString("order_address"),
						               rset.getString("order_subaddress"),
						               rset.getInt("order_zipcode"),
						               rset.getString("order_phone"),
						               rset.getString("order_email"),
						               rset.getString("order_request"),
						               rset.getInt("order_point"),
						               rset.getDate("order_date"),
						               rset.getString("p_code"),
						               rset.getString("p_name"),
						               rset.getString("cu_code"),
						               rset.getString("cu_name"),
						               rset.getString("company"),
						               rset.getString("invoice"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return od;
	}
	
	// 관리자 택배정보 입력
	public int insertPost(Connection conn, String oCode, String com, String inv) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, com);
			pstmt.setString(2, inv);
			pstmt.setString(3, oCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 관리자 주문목록 검색
	public ArrayList<Orders> searchOrder(Connection conn, String kword, String option) {
		ArrayList<Orders> olist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kword);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Orders od = new Orders(rset.getString("order_code"),
						               rset.getInt("m_code"),
						               rset.getString("pm_code"),
						               rset.getInt("order_amount"),
						               rset.getString("order_name"),
						               rset.getString("order_address"),
						               rset.getString("order_subaddress"),
						               rset.getInt("order_zipcode"),
						               rset.getString("order_phone"),
						               rset.getString("order_email"),
						               rset.getString("order_request"),
						               rset.getInt("order_point"),
						               rset.getString("company"),
						               rset.getString("invoice"),
						               rset.getString("order_status"),
						               rset.getDate("order_date"),
						               rset.getInt("rnum"),
						               rset.getString("p_code"),
						               rset.getString("p_name"),
						               rset.getString("cu_code"),
						               rset.getString("cu_name"),
						               rset.getInt("pm_totalcost"),
						               rset.getInt("pm_finalcost"),
						               rset.getString("pm_method"));
				olist.add(od);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return olist;
	}
	
	// 관리자 환불 목록 리스트
	public ArrayList<Orders> adminRefundList(Connection conn, PageInfo pi) {
		ArrayList<Orders> olist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminRefundList");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Orders od = new Orders(rset.getString("order_code"),
						               rset.getInt("m_code"),
						               rset.getString("pm_code"),
						               rset.getInt("order_amount"),
						               rset.getString("order_name"),
						               rset.getString("order_address"),
						               rset.getString("order_subaddress"),
						               rset.getInt("order_zipcode"),
						               rset.getString("order_phone"),
						               rset.getString("order_email"),
						               rset.getString("order_request"),
						               rset.getInt("order_point"),
						               rset.getString("company"),
						               rset.getString("invoice"),
						               rset.getString("order_status"),
						               rset.getDate("order_date"),
						               rset.getInt("rnum"),
						               rset.getString("p_code"),
						               rset.getString("p_name"),
						               rset.getString("cu_code"),
						               rset.getString("cu_name"),
						               rset.getInt("pm_totalcost"),
						               rset.getInt("pm_finalcost"),
						               rset.getString("pm_method"));
				olist.add(od);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return olist;
		
	}
	
	// 관리자 취소목록 리스트
	public ArrayList<Orders> adminCancelList(Connection conn, PageInfo pi) {
		ArrayList<Orders> olist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminCancelList");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Orders od = new Orders(rset.getString("order_code"),
						               rset.getInt("m_code"),
						               rset.getString("pm_code"),
						               rset.getInt("order_amount"),
						               rset.getString("order_name"),
						               rset.getString("order_address"),
						               rset.getString("order_subaddress"),
						               rset.getInt("order_zipcode"),
						               rset.getString("order_phone"),
						               rset.getString("order_email"),
						               rset.getString("order_request"),
						               rset.getInt("order_point"),
						               rset.getString("company"),
						               rset.getString("invoice"),
						               rset.getString("order_status"),
						               rset.getDate("order_date"),
						               rset.getInt("rnum"),
						               rset.getString("p_code"),
						               rset.getString("p_name"),
						               rset.getString("cu_code"),
						               rset.getString("cu_name"),
						               rset.getInt("pm_totalcost"),
						               rset.getInt("pm_finalcost"),
						               rset.getString("pm_method"));
				olist.add(od);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return olist;
		
	}
	
	// 찜리스트 insert
	public int insertHeart(Connection conn, Member m, String pCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHeart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getmCode());
			pstmt.setString(2, pCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
}
