package com.wimb.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.cart.model.service.CartService;
import com.wimb.cart.model.vo.Cart;
import com.wimb.member.model.vo.Member;

/**
 * Servlet implementation class CartListController
 */
@WebServlet("/cartlist.cart")
public class CartListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		int mCode = 0;
		if(m != null) {
			mCode = m.getmCode();
		}else {
			mCode = 1;
		}
		
		System.out.println(mCode);
		ArrayList<Cart> list = new CartService().selectCart(mCode);
		
		System.out.println(list);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/cart/cartList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
