package com.wimb.custom.model.dao;

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
import com.wimb.custom.model.vo.Item;
public class CustomDao {

	private Properties prop = new Properties();
	public CustomDao() {
		try {
			prop.loadFromXML(new FileInputStream(CustomDao.class.getResource("/db/sql/custom-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	
	// 커스텀 페이지 오른쪽 - 재료목록조회
	public ArrayList<Item> selectItemList(Connection conn){
		// select
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				list.add(new Item(rset.getString("ci_code"),
						   rset.getString("ci_name"),
						   rset.getString("ci_category"),
						   rset.getString("ci_provider"),
						   rset.getInt("ci_provideprice"),
						   rset.getInt("ci_price"),
						   rset.getString("ci_show"),
						   rset.getInt("ci_stock")
					 	   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Item> selectAdminItemList(Connection conn, PageInfo pi){
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				list.add(new Item(rset.getString("ci_code"),
						   rset.getString("ci_name"),
						   rset.getString("ci_category"),
						   rset.getString("ci_provider"),
						   rset.getInt("ci_provideprice"),
						   rset.getInt("ci_price"),
						   rset.getString("ci_show"),
						   rset.getInt("ci_stock")
					 	   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int updateMainImg(Connection conn, Item item) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMainImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item.getCiImg());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 재료등록
	public int insertItemAdmin(Connection conn, Item i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertItemAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getCiName());
			pstmt.setString(2, i.getCiCategory());
			pstmt.setString(3, i.getCiProvider());
			pstmt.setInt(4, i.getCiProvidePrice());
			pstmt.setInt(5, i.getCiPrice());
			pstmt.setInt(6, i.getCiStock());
			pstmt.setString(7, i.getCiShow());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 재료 하나 조회
	public Item selectItem(Connection conn, String ciCode) {
		Item i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ciCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				i = new Item(rset.getString("ci_code"),
							 rset.getString("ci_name"),
							 rset.getString("ci_category"),
							 rset.getString("ci_provider"),
							 rset.getInt("ci_provideprice"),
							 rset.getInt("ci_price"),
							 rset.getString("ci_show"),
							 rset.getInt("ci_stock")
							);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return i;
	}
	
	// 재료 수정
	public int updateItem(Connection conn, Item i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getCiName());
			pstmt.setString(2, i.getCiCategory());
			pstmt.setString(3, i.getCiProvider());
			pstmt.setInt(4, i.getCiProvidePrice());
			pstmt.setInt(5, i.getCiPrice());
			pstmt.setString(6, i.getCiShow());
			pstmt.setInt(7, i.getCiStock());
			pstmt.setString(8, i.getCiCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 노출여부 수정
	public int updateItemShow(Connection conn, Item i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateItemShow");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getCiShow());
			pstmt.setString(2, i.getCiCode());
			
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	

	// 카테고리별 목록 조회
	public ArrayList<Item> selecAdminCategoryList(Connection conn, String ciCategory) {
		ArrayList<Item> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selecAdminCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ciCategory);
			
			rset = pstmt.executeQuery();
			while(rset.next()){
				list.add(new Item(rset.getString("ci_code"),
						   rset.getString("ci_name"),
						   rset.getString("ci_category"),
						   rset.getString("ci_provider"),
						   rset.getInt("ci_provideprice"),
						   rset.getInt("ci_price"),
						   rset.getString("ci_show"),
						   rset.getInt("ci_stock")
					 	   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 비밀번호 확인
	public String pwdCheck(Connection conn) {
		String checkPwd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pwdCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				checkPwd = rset.getString("m_pwd");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return checkPwd;
	}

	// 재료삭제
	public int deleteItem(Connection conn, String ciCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ciCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	
	
	
	
	
	
}
