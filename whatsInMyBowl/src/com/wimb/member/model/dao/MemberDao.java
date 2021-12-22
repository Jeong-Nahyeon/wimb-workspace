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
							   rset.getString("m_introducer"),
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
			pstmt.setString(11, m.getIntroducer());
			pstmt.setString(12, m.getmAd());
			
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
							   rset.getString("m_introducer"),
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
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("m_code"),
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
								    rset.getString("m_introducer"),
								    rset.getString("m_status"),
								    rset.getString("m_quitreason"),
								    rset.getDate("m_quitdate"),
								    rset.getString("m_ad"),
								    rset.getDate("m_blackdate"),
								    rset.getString("m_blackreason"),
								    rset.getInt("m_point")));
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
}
