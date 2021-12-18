package com.wimb.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.mypage.model.service.MyPageService;
import com.wimb.mypage.model.vo.MyOrders;

/**
 * Servlet implementation class AjaxCancelInsertController
 */
@WebServlet("/cancelInsert.my")
public class AjaxCancelInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCancelInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String orderCode = request.getParameter("orderCode");
		String pmCode = request.getParameter("pmCode");
		
		MyOrders mo = new MyOrders();
		mo.setOrderCode(orderCode);
		mo.setPmCode(pmCode);
		
		int result = new MyPageService().insertCancel(mo);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
