package com.wimb.member.model.dao;

import static com.wimb.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.member.model.vo.Member;
import com.wimb.member.model.vo.Point;
import com.wimb.member.model.vo.PointCategory;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 로그인
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("m_code"),
							   rset.getString("m_name"),
							   rset.getString("m_id"),
							   rset.getString("m_pwd"),
							   rset.getString("m_phone"),
							   rset.getString("m_birth"),
							   rset.getString("m_gender"),
							   rset.getString("m_address"),
							   rset.getString("m_subaddress"),
							   rset.getString("m_postcode"),
							   rset.getString("m_email"),
							   rset.getDate("m_enrolldate"),
							   rset.getString("m_status"),
							   rset.getString("m_quitreason"),
							   rset.getDate("m_quitdate"),
							   rset.getString("m_ad"),
							   rset.getDate("m_blackdate"),
							   rset.getString("m_blackreason"),
							   rset.getInt("m_point"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public int emailCheck(Connection conn, String checkEmail) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmName());
			pstmt.setString(2, m.getmId());
			pstmt.setString(3, m.getmPwd());
			pstmt.setString(4, m.getmPhone());
			pstmt.setString(5, m.getmBirth());
			pstmt.setString(6, m.getmGender());
			pstmt.setString(7, m.getmAddress());
			pstmt.setString(8, m.getSubAddress());
			pstmt.setString(9, m.getPostcode());
			pstmt.setString(10, m.getmEmail());
			pstmt.setString(11, m.getmAd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int pwdCheck(Connection conn, String userId, String checkPwd) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pwdCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, checkPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public int deleteMember(Connection conn, String userId, String userPwd, String reason) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reason);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmPwd());
			pstmt.setString(2, m.getmName());
			pstmt.setString(3, m.getmPhone());
			pstmt.setString(4, m.getmEmail());
			pstmt.setString(5, m.getmAddress());
			pstmt.setString(6, m.getSubAddress());
			pstmt.setString(7, m.getPostcode());
			pstmt.setString(8, m.getmAd());
			pstmt.setString(9, m.getmId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public Member selectMember(Connection conn, String userId) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("m_code"),
							   rset.getString("m_name"),
							   rset.getString("m_id"),
							   rset.getString("m_pwd"),
							   rset.getString("m_phone"),
							   rset.getString("m_birth"),
							   rset.getString("m_gender"),
							   rset.getString("m_address"),
							   rset.getString("m_subaddress"),
							   rset.getString("m_postcode"),
							   rset.getString("m_email"),
							   rset.getDate("m_enrolldate"),
							   rset.getString("m_status"),
							   rset.getString("m_quitreason"),
							   rset.getDate("m_quitdate"),
							   rset.getString("m_ad"),
							   rset.getDate("m_blackdate"),
							   rset.getString("m_blackreason"),
							   rset.getInt("m_point"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
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
	
	public ArrayList<Member> selectAllMember(Connection conn, PageInfo pi){
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("m_code"),
									rset.getString("m_id"),
								    rset.getString("m_name"),
								    rset.getString("m_phone"),
								    rset.getInt("count"),
								    rset.getInt("sum"),
								    rset.getInt("m_point"),
								    rset.getDate("m_enrolldate"),
								    rset.getString("m_status")));
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Point> selectPoint(Connection conn, String userId, String startDate, String endDate){
		
		ArrayList<Point> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Point(rset.getInt("m_code"),
								   rset.getString("m_id"),
								   rset.getString("order_code"),
								   rset.getString("point_name"),
								   rset.getInt("point"),
								   rset.getString("point_reason"),
								   rset.getString("modifydate"),
								   rset.getInt("m_Point"),
								   rset.getInt("point_typecode")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public String searchIdEmail(Connection conn, String userEmail, String userName) {
		
		String userId = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchIdEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				userId = (rset.getString("m_id"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
	}
	
	
	public String searchIdPhone(Connection conn, String userPhone, String userName) {
		
		String userId = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchIdPhone");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPhone);
			pstmt.setString(2, userName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				userId = (rset.getString("m_id"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
		
	}
	
	public int searchPwd(Connection conn, String userId, String userName, String userEmail) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	public int changePwd(Connection conn, String userId, String userPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<PointCategory> selectPointCategory(Connection conn){
		
		ArrayList<PointCategory> list  = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPointCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new PointCategory(rset.getInt("point_typecode"),
						 				   rset.getString("point_name"),
						 				   rset.getInt("point_amount")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int pointCategoryCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pointCategoryCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public int addPointCategory(Connection conn, String pointName, int pointAmount) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("addPointCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pointName);
			pstmt.setInt(2, pointAmount);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updateMemberA(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemberA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getmName());
			pstmt.setString(2, m.getmPhone());
			pstmt.setString(3, m.getmEmail());
			pstmt.setString(4, m.getmAddress());
			pstmt.setString(5, m.getSubAddress());
			pstmt.setString(6, m.getPostcode());
			pstmt.setString(7, m.getmId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteMemberA(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMemberA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public Point totalPointSelect(Connection conn, int userNo) {
		
		Point ttp = new Point();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("totalPointSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				ttp.setmCode(rset.getInt("m_code"));
				ttp.setTtlPoint(rset.getInt("ttl_point"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return ttp;
		
	}
	
	public int insertPoint(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
	}
	
	
	
}
