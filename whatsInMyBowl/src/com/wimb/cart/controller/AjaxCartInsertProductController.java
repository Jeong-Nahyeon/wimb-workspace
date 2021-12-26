package com.wimb.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.wimb.cart.model.service.CartService;
import com.wimb.cart.model.vo.Cart;
import com.wimb.member.model.vo.Member;

/**
 * Servlet implementation class AjaxCartInsertProductController
 */
@WebServlet("/addcartpro.cart")
public class AjaxCartInsertProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCartInsertProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pCode = request.getParameter("productCode");
		int pCount = Integer.parseInt(request.getParameter("productCount"));
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		int mCode = 0;
		if(m != null) {
			mCode = m.getmCode();
		}else {
			mCode = 1;
		}
		
		Cart c = new Cart();
		c.setmCode(mCode);
		c.setpCode(pCode);
		c.setCaAmount(pCount);
		
		boolean insertAlready = new CartService().findCartProduct(c);
		int result = 0;
		if(insertAlready == true) {
			// 이미 있는 경우
			// cart테이블에 해당 제품 수량을 증가
			result = new CartService().updateProductAmount(c);
			if(result > 0) {
				result = 777;
			}else {
				request.setAttribute("errorMsg", "장바구니 등록 실패");
				request.getRequestDispatcher("views/common/adminerrorPage.jsp").forward(request, response);
			}
		}else {
			// 상품이 없는 경우
			result = new CartService().insertCartProduct(c);
		}
		
		if(result > 0) {
			
			new Gson().toJson(result, response.getWriter());
		}else {
			request.setAttribute("errorMsg", "장바구니 등록 실패");
			request.getRequestDispatcher("views/common/adminerrorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
