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
			e.printStackTrace();
		}
		
	}
	
	
	/** 페이징바용 완제품 총 개수 반환해주는 메소드
	 * @param conn
	 * @return  :  완제품 총 개수
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
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	/** 완제품 목록 조회 해주는 메소드
	 * @param conn
	 * @param pi  :  사용자가 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
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
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalList;
		
	}
	
	
	/** 완제품 등록해주는 메소드
	 * @param conn
	 * @param p  :  사용자가 작성한 등록할 완제품 정보
	 * @return
	 */
	public int insertProduct(Connection conn, Product p) {
		
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getpName()); // 상품명
			pstmt.setString(2, p.getpCategory()); // 카테고리명
			pstmt.setInt(3, p.getpPrice()); // 판매가격
			pstmt.setString(4, p.getpProvider()); // 공급자명
			pstmt.setInt(5, p.getpProvidePrice()); // 공급가격
			pstmt.setString(6, p.getpMainImg()); // 대표이미지
			
			if(p.getpDetailImg() != null) { // 상세이미지 => null이 아닌 경우
				pstmt.setString(7, p.getpDetailImg()); // 상세이미지
			} else { // 상세이미지 => null인 경우
				pstmt.setNull(7, java.sql.Types.VARCHAR); // 과연 null처리 해줄 것인가????????
			}
			
			pstmt.setString(8, p.getpDetail()); // 상세내용
			pstmt.setString(9, p.getpShow()); // 노출여부
			pstmt.setInt(10, p.getpStock()); // 입고수량
			pstmt.setString(11, p.getpKeyword()); // 검색키워드
			
			result = pstmt.executeUpdate();
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/** 완제품 상세 조회해주는 메소드
	 * @param conn
	 * @param pCode  :  상세 정보 조회할 상품의 상품번호
	 * @return
	 */
	public Product selectProductDetail(Connection conn, String pCode) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 파일저장경로
		String filePath = "resources/images/product_images/";
		
		String sql = prop.getProperty("selectProductDetail"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				p = new Product(rset.getString("p_code"),
								rset.getString("p_name"),
								rset.getString("p_category"),
								rset.getInt("p_price"),
								rset.getString("p_provider"),
								rset.getInt("p_provideprice"),
								rset.getString("p_mainimg"),
								rset.getString("p_detailimg"),
								rset.getString("p_detail"),
								rset.getString("p_show"),
								rset.getString("p_date"),
								rset.getInt("p_stock"),
								rset.getString("p_keyword"),
								filePath);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}
	
	
		/** 카테고리 옵션별 완제품 총 개수 반환해주는 메소드
		 * @param conn
		 * @param option  :  사용자가 선택한 카테고리 옵션값
		 * @return
		 */
		public int selectOptionListCount(Connection conn, String option) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOptionListCount"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, option);
			
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
		
		
	/** 카테고리 옵션별 완제품 목록 조회해주는 메소드
	 * @param conn
	 * @param option  :  사용자가 선택한 카테고리 옵션값
	 * @param pi  :  사용자가 요청한 페이지 정보 담은 PageInfo 객체
	 * @return
	 */
	public ArrayList<Product> selectOptionList(Connection conn, String option){
		
		ArrayList<Product> optionList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 파일저장경로
		String filePath = "resources/images/product_images/";
		
		String sql = prop.getProperty("selectOptionList"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, option);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				optionList.add(new Product(rset.getString("p_code"),
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
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return optionList;
		
	}

}
