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
	
	
	/** 회원용 페이징바용 완제품 총 개수 반환해주는 메소드
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
	
	
	/** 회원용 완제품 목록 조회 해주는 메소드
	 * @param conn
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi){
		
		ArrayList<Product> productList = new ArrayList<>();
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
				
				productList.add(new Product(rset.getString("p_code"),
										  rset.getString("p_name"),
										  rset.getString("p_category"),
										  rset.getInt("p_price"),
										  rset.getString("p_mainimg"),
										  rset.getInt("p_stock"),
										  filePath));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return productList;
		
	}
	
	
	public ArrayList<Product> selectOptionListHot(Connection conn, PageInfo pi){
		
		ArrayList<Product> productList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 파일저장경로
		String filePath = "resources/images/product_images/";
		
		String sql = prop.getProperty("selectOptionListHot");
		
		try {
			
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
				int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					
					productList.add(new Product(rset.getString("p_code"),
											  rset.getString("p_name"),
											  rset.getString("p_category"),
											  rset.getInt("p_price"),
											  rset.getString("p_mainimg"),
											  rset.getInt("p_stock"),
											  filePath));
					
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
		
		return productList;
		
	}
	
	
	public ArrayList<Product> selectOptionListMin(Connection conn, PageInfo pi){
			
			ArrayList<Product> productList = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			// 파일저장경로
			String filePath = "resources/images/product_images/";
			
			String sql = prop.getProperty("selectOptionListMin");
			
			try {
					
					pstmt = conn.prepareStatement(sql);
					
					int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
					int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
					
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
					
					rset = pstmt.executeQuery();
					
					while(rset.next()){
						
						productList.add(new Product(rset.getString("p_code"),
												  rset.getString("p_name"),
												  rset.getString("p_category"),
												  rset.getInt("p_price"),
												  rset.getString("p_mainimg"),
												  rset.getInt("p_stock"),
												  filePath));
						
					}
					
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
			
			return productList;
			
		}
	
		
	public ArrayList<Product> selectOptionListMax(Connection conn, PageInfo pi){
		
		ArrayList<Product> productList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 파일저장경로
		String filePath = "resources/images/product_images/";
		
		String sql = prop.getProperty("selectOptionListMax");
		
		try {
					
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
				int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					
					productList.add(new Product(rset.getString("p_code"),
											  rset.getString("p_name"),
											  rset.getString("p_category"),
											  rset.getInt("p_price"),
											  rset.getString("p_mainimg"),
											  rset.getInt("p_stock"),
											  filePath));
					
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
		return productList;
		
	}
	
	
	
	
	
	
	/** 관리자용 완제품 등록해주는 메소드
	 * @param conn
	 * @param p  :  관리자가 등록한 완제품 정보
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
			
			if(!p.getpDetailImg().contentEquals("")) { // 상세이미지 있을 경우
				pstmt.setString(7, p.getpDetailImg()); // 상세이미지
			} else { // 상세이미지 없을 경우
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
	
	
	/** 관리자용 페이징바용 완제품 총 개수 반환해주는 메소드
	 * @param conn
	 * @return  :  완제품 총 개수
	 */
	public int selectAdminListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminListCount"); // 완성된 sql문
		
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
	
	
	/** 관리자용 완제품 목록 조회 해주는 메소드
	 * @param conn
	 * @param pi  :  관리자가 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectAdminProductList(Connection conn, PageInfo pi){
		
		ArrayList<Product> totalList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminProductList"); // 미완성 sql문
		
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
										  rset.getInt("p_provideprice"),
										  rset.getString("p_show"),
										  rset.getInt("p_stock")));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalList;
		
	}
	
	
	/** 관리자용 완제품 상세 조회해주는 메소드
	 * @param conn
	 * @param pCode  :  상세 정보 조회할 상품의 상품번호
	 * @return
	 */
	public Product selectAdminProductDetail(Connection conn, String pCode) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 파일저장경로
		String filePath = "resources/images/product_images/";
		
		String sql = prop.getProperty("selectAdminProductDetail"); // 미완성 sql문
		
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
	
	
		/** 관리자용 카테고리 옵션별 완제품 총 개수 반환해주는 메소드
		 * @param conn
		 * @param option  :  관리자가 선택한 카테고리 옵션값
		 * @return
		 */
		public int selectAdminOptionListCount(Connection conn, String option) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminOptionListCount"); // 미완성 sql문
		
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
		
		
	/** 관리자용 카테고리 옵션별 완제품 목록 조회해주는 메소드
	 * @param conn
	 * @param option  :  관리자가 선택한 카테고리 옵션값
	 * @param pi  :  관리자가 요청한 페이지 정보 담은 PageInfo 객체
	 * @return
	 */
	public ArrayList<Product> selectAdminOptionList(Connection conn, String option){
		
		ArrayList<Product> optionList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String sql = prop.getProperty("selectAdminOptionList"); // 미완성 sql문
		
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
									 	   rset.getString("p_show"),
									 	   rset.getInt("p_stock")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return optionList;
		
	}
	
	
	/** 관리자용 상품명으로 상품목록 검색해주는 메소드
	 * @param conn
	 * @param searchKeyword  :  관리자가 입력한 상품명
	 * @return
	 */
	public ArrayList<Product> selectAdminSearchList(Connection conn, String searchKeyword) {
		
		ArrayList<Product> searchList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminSearchList"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchKeyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				searchList.add(new Product(rset.getString("p_code"),
										   rset.getString("p_name"),
										   rset.getString("p_category"),
										   rset.getInt("p_price"),
										   rset.getString("p_provider"),
										   rset.getInt("p_providePrice"),
									 	   rset.getString("p_show"),
									 	   rset.getInt("p_stock")));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return searchList;
		
	}
	
	
	/** 관리자용 완제품 수정 시 새로운 대표이미지만 있거나 둘다 있을 경우 실행할 메소드
	 * @param conn
	 * @param p  :  관리자가 수정 요청한 완제품 정보
	 * @return
	 */
	public int updateAdminProductNewMainImg(Connection conn, Product p, String existingDetailImg) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAdminProductNewMainImg"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getpName());
			pstmt.setString(2, p.getpCategory());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getpProvider());
			pstmt.setInt(5, p.getpProvidePrice());
			pstmt.setString(6, p.getpMainImg());
			
			if(!p.getpDetailImg().equals("")) { // 새로운 상세이미지가 있을 경우
				pstmt.setString(7, p.getpDetailImg());
			} else { // 새로운 상세이미지가 없을 경우
				if(existingDetailImg.equals("")) { // 기존의 상세이미지가 없을 경우
					pstmt.setNull(7, java.sql.Types.VARCHAR);
				} else { // 기존의 상세이미지가 있을 경우
					pstmt.setString(7, existingDetailImg);
				}
			}
			
			pstmt.setString(8, p.getpDetail());
			pstmt.setString(9, p.getpShow());
			pstmt.setInt(10, p.getpStock());
			pstmt.setString(11, p.getpKeyword());
			pstmt.setString(12, p.getpCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/** 관리자용 완제품 수정 시 새로운 상세이미지만 있을 경우 실행할 메소드
	 * @param conn
	 * @param p  :  관리자가 수정 요청한 완제품 정보
	 * @return
	 */
	public int updateAdminProductNewDetailImg(Connection conn, Product p) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAdminProductNewDetailImg"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getpName());
			pstmt.setString(2, p.getpCategory());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getpProvider());
			pstmt.setInt(5, p.getpProvidePrice());
			pstmt.setString(6, p.getpDetailImg());
			pstmt.setString(7, p.getpDetail());
			pstmt.setString(8, p.getpShow());
			pstmt.setInt(9, p.getpStock());
			pstmt.setString(10, p.getpKeyword());
			pstmt.setString(11, p.getpCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/** 관리자용 완제품 수정 시 새로운 파일이 없을 경우 실행할 메소드
	 * @param conn
	 * @param p  :  관리자가 수정 요청한 완제품 정보
	 * @return
	 */
	public int updateAdminProduct(Connection conn, Product p) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAdminProduct"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getpName());
			pstmt.setString(2, p.getpCategory());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getpProvider());
			pstmt.setInt(5, p.getpProvidePrice());
			pstmt.setString(6, p.getpDetail());
			pstmt.setString(7, p.getpShow());
			pstmt.setInt(8, p.getpStock());
			pstmt.setString(9, p.getpKeyword());
			pstmt.setString(10, p.getpCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/** 관리자용 완제품 삭제(노출여부 변경)해주는 메소드
	 * @param conn
	 * @param pCode  :  관리자가 선택한 완제품의 상품번호들을 하나의 문자열로 나열한 값 => P1023', 'P1022', 'P1021
	 * @return
	 */
	public int deleteAdminProduct(Connection conn, String[] pCode) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAdminProduct"); // 미완성 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			for(String s : pCode) {
				
				pstmt.setString(1, s);
				
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
