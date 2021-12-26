package com.wimb.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.mypage.model.service.MyPageService;
import com.wimb.mypage.model.vo.Orders;

/**
 * Servlet implementation class AdminCancelListController
 */
@WebServlet("/cancelList.admin")
public class AdminCancelListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCancelListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// -- 페이징 처리 --
		int listCount;    // 총 list갯수
		int currentPage; // 현재페이지
		int pageLimit;   // 페이징바 최대갯수
		int listLimit;  // 한 페이지에 보여질 list갯수
		int maxPage;     // 가장 마지막 페이지
		int startPage;   // 페이징바 시작수
		int endPage;     // 페이징바 끝수
		
		listCount = new MyPageService().selectCListCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		listLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / listLimit);
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, listLimit, maxPage, startPage, endPage);
		
				
		ArrayList<Orders> clist = new MyPageService().adminCancelList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("views/mypage/adminCancelListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
