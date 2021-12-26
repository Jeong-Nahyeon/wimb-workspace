package com.wimb.cart.model.service;

import static com.wimb.common.JDBCTemplate.*;

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

}
