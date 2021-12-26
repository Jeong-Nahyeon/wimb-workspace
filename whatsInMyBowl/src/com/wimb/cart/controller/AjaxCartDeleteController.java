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
 * Servlet implementation class AjaxCartDeleteController
 */
@WebServlet("/deletecart.cart")
public class AjaxCartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCartDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String[] saladCode = request.getParameterValues("saladCode");
		int mCode = Integer.parseInt(request.getParameter("mCode"));
		
		Cart c = new Cart();
		c.setmCode(mCode);
		
		System.out.println(mCode);
		System.out.println(saladCode);
		
		int result = 0;
		for(int i=0; i<saladCode.length; i++) {
			if(saladCode[i].startsWith("CU")) {
				c.setCuCode(saladCode[i]);
				result = new CartService().deleteCartCustom(c);
			}else if(saladCode[i].startsWith("P")){
				c.setpCode(saladCode[i]);
				result = new CartService().deleteCartProduct(c);
			}
		}
		
		if(result > 0) {
			new Gson().toJson(result, response.getWriter());
		}else {
			
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
