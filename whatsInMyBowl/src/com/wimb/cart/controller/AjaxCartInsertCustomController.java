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
 * Servlet implementation class AjaxCartInsertCartController
 */
@WebServlet("/addcartcu.cart")
public class AjaxCartInsertCustomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCartInsertCustomController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String[] arrCustomCode = request.getParameterValues("arrCustomCode");
		String[] arrCustomCount = request.getParameterValues("arrCustomCount");
		
		System.out.println();
		
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
		
		boolean insertAlready = false;
		
		response.setContentType("application/json; charset=UTF-8");
		int result = 0;
		for(int i=0;i<arrCustomCode.length;i++) {
			String cuCode = arrCustomCode[i];
			int customCount = Integer.parseInt(arrCustomCount[i]);
			c.setCuCode(cuCode);
			c.setCaAmount(customCount);
			insertAlready = new CartService().findCartCustom(c);
			
			if(insertAlready == true) {
				// 이미 상품이 있는 경우
				result = 777;
				//new Gson().toJson(result, response.getWriter());
			}else {
				// 상품이 없는 경우
				result = new CartService().insertCartCustom(c);
				
			}
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
