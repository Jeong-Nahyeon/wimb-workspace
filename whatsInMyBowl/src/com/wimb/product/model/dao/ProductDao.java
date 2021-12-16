package com.wimb.product.model.dao;

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
import com.wimb.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		
		try {
			
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath()));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	/** 완제품 총 개수 반환해주는메소드
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount"); // 완성된 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi){
		
		ArrayList<Product> totalList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 파일저장경로
		String filePath = "resources/images/product_images/";
		
		String sql = prop.getProperty("selectProductList"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
			int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				totalList.add(new Product(rset.getString("p_code"),
										  rset.getString("p_name"),
										  rset.getString("p_category"),
										  rset.getInt("p_price"),
										  rset.getString("p_provider"),
										  rset.getInt("p_providePrice"),
										  rset.getString("p_mainimg"),
										  rset.getString("p_show"),
										  rset.getInt("p_stock"),
										  filePath));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalList;
		
	}
	
	
	public int insertProduct(Connection conn, Product p) {
		
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getpName());
			pstmt.setString(2, p.getpCategory());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getpProvider());
			pstmt.setInt(5, p.getpProvidePrice());
			pstmt.setString(6, p.getpMainImg());
			
			if(p.getpDetailImg() != null) { // 상세이미지 => null이 아닌 경우
				pstmt.setString(7, p.getpDetailImg());
			} else { // 상세이미지 => null인 경우
				pstmt.setNull(7, java.sql.Types.VARCHAR); // 과연 null처리 해줄 것인가????????
			}
			
			pstmt.setString(8, p.getpDetail());
			pstmt.setInt(9, p.getpStock());
			pstmt.setString(10, p.getpKeyword());
			
			result = pstmt.executeUpdate();
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
