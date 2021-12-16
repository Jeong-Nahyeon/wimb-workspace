package com.wimb.product.model.service;

import static com.wimb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.product.model.dao.ProductDao;
import com.wimb.product.model.vo.Product;

public class ProductService {
	
	/** 완제품 총 개수 반환해주는메소드
	 * @return
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ProductDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	public ArrayList<Product> selectProductList(PageInfo pi){
		
		Connection conn = getConnection();
				
		ArrayList<Product> totalList = new ProductDao().selectProductList(conn, pi);
		
		close(conn);
		
		return totalList;
		
	}
	
	
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

}
