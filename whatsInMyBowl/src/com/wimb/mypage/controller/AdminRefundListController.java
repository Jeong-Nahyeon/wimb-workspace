package com.wimb.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.common.model.vo.PageInfo;
import com.wimb.mypage.model.service.MyPageService;
import com.wimb.mypage.model.vo.Orders;

/**
 * Servlet implementation class AjaxAdminRefundListController
 */
@WebServlet("/refundList.admin")
public class AdminRefundListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRefundListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// -- 페이징 처리 --
		int rlistCount;    // 총 list갯수
		int rcurrentPage; // 현재페이지
		int rpageLimit;   // 페이징바 최대갯수
		int rlistLimit;  // 한 페이지에 보여질 list갯수
		int rmaxPage;     // 가장 마지막 페이지
		int rstartPage;   // 페이징바 시작수
		int rendPage;     // 페이징바 끝수
		
		rlistCount = new MyPageService().selectRListCount();
		rcurrentPage = Integer.parseInt(request.getParameter("cpage"));
		rpageLimit = 10;
		rlistLimit = 10;
		rmaxPage = (int)Math.ceil((double)rlistCount / rlistLimit);
		rstartPage = (rcurrentPage -1) / rpageLimit * rpageLimit + 1;
		rendPage = rstartPage + rpageLimit -1;
		
		if(rendPage > rmaxPage) {
			rendPage = rmaxPage;
		}
		
		PageInfo pi = new PageInfo(rlistCount, rcurrentPage, rpageLimit, rlistLimit, rmaxPage, rstartPage, rendPage);
		
				
		ArrayList<Orders> rlist = new MyPageService().adminRefundList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("rlist", rlist);
		request.getRequestDispatcher("views/mypage/adminRefundListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
