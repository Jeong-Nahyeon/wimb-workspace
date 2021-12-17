package com.wimb.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.service.MyPageService;
import com.wimb.mypage.model.vo.MyOrders;

/**
 * Servlet implementation class OrderPostListController
 */
@WebServlet("/orderList.my")
public class OrderPostListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPostListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전달값 기록
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");		
		String startDay = request.getParameter("startDate");
		String endDay = request.getParameter("endDate");
		
		
		// 요청처리
		ArrayList<MyOrders> list = new MyPageService().orderListDetail(m, startDay, endDay);
		
		// 응답뷰
		request.getSession().setAttribute("list", list);
		request.getRequestDispatcher("views/mypage/orderPostList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
