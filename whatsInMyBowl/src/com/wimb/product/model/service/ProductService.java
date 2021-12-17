package com.wimb.product.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.product.model.dao.ProductDao;
import com.wimb.product.model.vo.Product;

public class ProductService {
	
	/** 페이징바용 완제품 총 개수 반환해주는 메소드
	 * @return
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ProductDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/** 완제품 목록 조회 해주는 메소드
	 * @param pi  :  사용자가 요청한 페이지 정보 담은 PageInfo 객체 
	 * @return
	 */
	public ArrayList<Product> selectProductList(PageInfo pi){
		
		Connection conn = getConnection();
				
		ArrayList<Product> totalList = new ProductDao().selectProductList(conn, pi);
		
		close(conn);
		
		return totalList;
		
	}
	
	
	/** 완제품 등록해주는 메소드
	 * @param p  :  사용자가 작성한 등록할 완제품 정보
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

	
	/** 완제품 상세 조회해주는 메소드
	 * @param pCode  :  상세 정보 조회할 상품의 상품번호
	 * @return
	 */
	public Product selectProductDetail(String pCode) {
		
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectProductDetail(conn, pCode);
		
		close(conn);
		
		return p;
		
	}
}
