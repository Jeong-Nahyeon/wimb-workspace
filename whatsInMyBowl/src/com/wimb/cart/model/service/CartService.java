package com.wimb.cart.model.service;

import static com.wimb.common.JDBCTemplate.*;
import static com.wimb.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.wimb.cart.model.dao.CartDao;
import com.wimb.cart.model.vo.Cart;
public class CartService {

	public ArrayList<Cart> selectCart(int mCode) {
		Connection conn = getConnection();
		ArrayList<Cart> list = new CartDao().selectCart(conn, mCode);
		close(conn);
		return list;
	}

	// 장바구니에 해당 상품이 있는지 확인하는 메소드
	public boolean findCartCustom(Cart c) {
		Connection conn = getConnection();
		boolean check = new CartDao().findCartCustom(conn, c);
		close(conn);
		return check;
	}

	// 장바구니에 커스텀 상품 등록
	public int insertCartCustom(Cart c) {
		Connection conn = getConnection();
		int result = new CartDao().insertCartCustom(conn, c);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 장바구니에 해당 완제품이 있는지 확인하는 메소드
	public boolean findCartProduct(Cart c) {
		Connection conn = getConnection();
		boolean check = new CartDao().findCartProduct(conn, c);
		close(conn);
		return check;
	}

	// 장바구니의 상품수량 증가
	public int updateProductAmount(Cart c) {
		Connection conn = getConnection();
		int result = new CartDao().updateProductAmount(conn, c);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 장바구니에 완제품 상품 등록
	public int insertCartProduct(Cart c) {
		Connection conn = getConnection();
		int result = new CartDao().insertCartProduct(conn, c);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 장바구니 커스텀 상품 삭제
	public int deleteCartCustom(Cart c) {
		Connection conn = getConnection();
		int result = new CartDao().deleteCartCustom(conn, c);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 장바구니 완제품 상품 삭제
	public int deleteCartProduct(Cart c) {
		Connection conn = getConnection();
		int result = new CartDao().deleteCartProduct(conn, c);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
