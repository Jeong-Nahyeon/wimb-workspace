package com.wimb.product.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.product.model.dao.ProductDao;
import com.wimb.product.model.vo.Product;

public class ProductService {
	
	// 회원용
	
	/** 회원용 페이징바용 완제품 총 개수 반환해주는 메소드
	 * @return
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ProductDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/** 회원용 완제품 전체 조회 해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectProductList(PageInfo pi){
		
		Connection conn = getConnection();
				
		ArrayList<Product> productList = new ProductDao().selectProductList(conn, pi);
		
		close(conn);
		
		return productList;
		
	}
	
	
	/** 인기상품순으로 완제품 조회해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectOptionListHot(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().selectOptionListHot(conn, pi);
		
		close(conn);
		
		return productList;
		
	}
	
	
	/** 낮은가격순으로 완제품 조회해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectOptionListMin(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().selectOptionListMin(conn, pi);
		
		close(conn);
		
		return productList;
		
	}
	
	
	/** 높은가격순으로 완제품 조회해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectOptionListMax(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> productList = new ProductDao().selectOptionListMax(conn, pi);
		
		close(conn);
		
		return productList;
		
	}
	
	
	/** 카테고리별(비건/육류/해산물) 완제품 총 개수 반환해주는 메소드
	 * @return
	 */
	public int categoryListCount(String category) {
		
		Connection conn = getConnection();
		
		int listCount = new ProductDao().categoryListCount(conn, category);
		
		close(conn);
		
		return listCount;
				
	}
	
	
	/** 카테고리별(비건/육류/해산물) 완제품 전체 조회해주는 메소드
	 * @param conn
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @param category  :  카테고리명
	 * @return
	 */
	public ArrayList<Product> selectCategoryList(PageInfo pi, String category) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> categoryList = new ProductDao().selectCategoryList(conn, pi, category);
		
		close(conn);
		
		return categoryList;
		
	}
	
	
	/** 인기순으로 카테고리별(비건/육류/해산물) 완제품 정렬해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @param category  :  카테고리명
	 * @return
	 */
	public ArrayList<Product> selectCategoryOptionListHot(PageInfo pi, String category) {

		Connection conn = getConnection();
		
		ArrayList<Product> categoryList = new ProductDao().selectCategoryOptionListHot(conn, pi, category);
		
		close(conn);
		
		return categoryList;
	}
	
	
	/** 낮은가격순으로 카테고리별(비건/육류/해산물) 완제품 정렬해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @param category  :  카테고리명
	 * @return
	 */
	public ArrayList<Product> selectCategoryOptionListMin(PageInfo pi, String category) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> categoryList = new ProductDao().selectCategoryOptionListMin(conn, pi, category);
		
		close(conn);
		
		return categoryList;
		
	}
	
	
	/** 높은가격순으로 카테고리별(비건/육류/해산물) 완제품 정렬해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @param category  :  카테고리명
	 * @return
	 */
	public ArrayList<Product> selectCategoryOptionListMax(PageInfo pi, String category) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> categoryList = new ProductDao().selectCategoryOptionListMax(conn, pi, category);
		
		close(conn);
		
		return categoryList;
		
	}
	
	
	/** 베스트 메뉴 조회해주는 메소드
	 * @return
	 */
	public ArrayList<Product> selectBestList() {

		Connection conn = getConnection();
		
		ArrayList<Product> bestList = new ProductDao().selectBestList(conn);
		
		close(conn);
		
		return bestList;
		
	}
	
	
	/** 인기순으로 베스트 메뉴 정렬해주는 메소드 
	 * @return
	 */
	public ArrayList<Product> selectBestOptionListHot() {

		Connection conn = getConnection();
		
		ArrayList<Product> bestList = new ProductDao().selectBestOptionListHot(conn);
		
		close(conn);
		
		return bestList;
		
	}
	
	
	/** 낮은가격순으로 베스트 메뉴 정렬해주는 메소드
	 * @return
	 */
	public ArrayList<Product> selectBestOptionListMin() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> bestList = new ProductDao().selectBestOptionListMin(conn);
		
		close(conn);
		
		return bestList;
		
	}
	
	
	/** 높은가격순으로 베스트 메뉴 정렬해주는 메소드
	 * @return
	 */
	public ArrayList<Product> selectBestOptionListMax() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> bestList = new ProductDao().selectBestOptionListMax(conn);
		
		close(conn);
		
		return bestList;
		
	}
	
	
	/** 세일상품 총 개수 반환해주는 메소드
	 * @return
	 */
	public int selectSaleListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ProductDao().selectSaleListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/** 세일상품 전체 조회해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectSaleList(PageInfo pi){
		
		Connection conn = getConnection();
				
		ArrayList<Product> saleList = new ProductDao().selectSaleList(conn, pi);
		
		close(conn);
		
		return saleList;
		
	}
	
	
	/** 인기상품순으로 세일상품 조회해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectSaleOptionListHot(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> saleList = new ProductDao().selectSaleOptionListHot(conn, pi);
		
		close(conn);
		
		return saleList;
		
	}
	
	
	/** 낮은가격순으로 세일상품 조회해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectSaleOptionListMin(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> saleList = new ProductDao().selectSaleOptionListMin(conn, pi);
		
		close(conn);
		
		return saleList;
		
	}
	
	
	/** 높은가격순으로 세일상품 조회해주는 메소드
	 * @param pi  :  회원이 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectSaleOptionListMax(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> saleList = new ProductDao().selectSaleOptionListMax(conn, pi);
		
		close(conn);
		
		return saleList;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 관리자용
	
	/** 관리자용 완제품 등록해주는 메소드
	 * @param p  :  관리자가 작성한 등록할 완제품 정보
	 * @return
	 */
	public int insertProduct(Product p) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().insertProduct(conn, p);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/** 관리자용 페이징바용 완제품 총 개수 반환해주는 메소드
	 * @return
	 */
	public int selectAdminListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ProductDao().selectAdminListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/** 관리자용 완제품 목록 조회 해주는 메소드
	 * @param pi  :  관리자가 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectAdminProductList(PageInfo pi){
		
		Connection conn = getConnection();
				
		ArrayList<Product> totalList = new ProductDao().selectAdminProductList(conn, pi);
		
		close(conn);
		
		return totalList;
		
	}

	
	/** 관리자용 완제품 상세 조회해주는 메소드
	 * @param pCode  :  상세 정보 조회할 상품의 상품번호
	 * @return
	 */
	public Product selectAdminProductDetail(String pCode) {
		
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectAdminProductDetail(conn, pCode);
		
		close(conn);
		
		return p;
		
	}
	
	
	/** 관리자용 카테고리 옵션별 완제품 총 개수 반환해주는 메소드
	 * @param option  :  관리자가 선택한 카테고리 옵션값
	 * @return
	 */
	public int selectAdminOptionListCount(String option) {
		
		Connection conn = getConnection();
		
		int listCount = new ProductDao().selectAdminOptionListCount(conn, option);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/** 관리자용 카테고리 옵션별 완제품 목록 조회해주는 메소드
	 * @param option  :  관리자가 선택한 카테고리 옵션값
	 * @param pi  :  관리자가 요청한 페이지 정보 담은 PageInfo 객체
	 * @return
	 */
	public ArrayList<Product> selectAdminOptionList(String option) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> optionList = new ProductDao().selectAdminOptionList(conn, option);
		
		close(conn);
		
		return optionList;
		
	}
	
	
	/** 관리자용 상품명으로 상품목록 검색해주는 메소드
	 * @param searchKeyword  :  관리자가 입력한 상품명
	 * @return
	 */
	public ArrayList<Product> selectAdminSearchList(String searchKeyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> searchList = new ProductDao().selectAdminSearchList(conn, searchKeyword);
		
		close(conn);
		
		return searchList;
	
	}
	
	
	/** 관리자용 완제품 수정 시 새로운 대표이미지만 있거나 둘다 있을 경우 실행할 메소드
	 * @param p  :  관리자가 수정 요청한 완제품 정보
	 * @return
	 */
	public int updateAdminProductNewMainImg(Product p, String existingDetailImg) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().updateAdminProductNewMainImg(conn, p, existingDetailImg);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/** 관리자용 완제품 수정 시 새로운 상세이미지만 있을 경우 실행할 메소드
	 * @param p  :  관리자가 수정 요청한 완제품 정보
	 * @return
	 */
	public int updateAdminProductNewDetailImg(Product p) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().updateAdminProductNewDetailImg(conn, p);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/** 관리자용 완제품 수정 시 새로운 파일이 없을 경우 실행할 메소드
	 * @param p  :  관리자가 수정 요청한 완제품 정보
	 * @return
	 */
	public int updateAdminProduct(Product p) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().updateAdminProduct(conn, p);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/** 관리자용 완제품 삭제(노출여부 변경)해주는 메소드
	 * @param pCode  :  관리자가 선택한 완제품의 상품번호들을 하나의 문자열로 나열한 값 => P1023', 'P1022', 'P1021
	 * @return
	 */
	public int deleteAdminProduct(String[] pCode) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().deleteAdminProduct(conn, pCode);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
}
