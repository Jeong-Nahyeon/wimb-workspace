package com.wimb.product.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wimb.product.model.dao.ProductDao;

public class ProductService {
	
	/** 완제품 총 개수 반환해주는메소드
	 * @return
	 */
	public int selectProductListCount() {
		
		Connection conn = getConnection();
		
		int productListCount = new ProductDao().selectProductListCount(conn);
		
		close(conn);
		
		return productListCount;
		
	}

}
