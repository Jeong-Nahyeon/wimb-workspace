package com.wimb.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.customerService.model.service.NoticeService;
import com.wimb.customerService.model.vo.Notice;

/**
 * Servlet implementation class NoticeAdminListViewController
 */
@WebServlet("/adminListView.no")
public class NoticeAdminListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 - 공지사항 리스트 띄우는 컨트롤러
		
		// 페이징 처리
		int listCount;     // 현재 총 배너게시글 갯수
		int currentPage;   // 현재 페이지
		int pageLimit;     // 페이징바에 페이지를 몇 개 단위씩 할 건지
		int boardLimit;    // 한 페이지내에 보여질 게시글 갯수
		
		int maxPage;       // 총 페이지 수 
		int startPage;     // 페이징바의 시작 수
		int endPage;       // 페이징바의 끝 수
		
		listCount = new NoticeService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 5;
		
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);		
		
		ArrayList<Notice> list = new NoticeService().selectAdminView(pi);
		request.setAttribute("pi", pi);
		request.setAttribute("noticeList", list);
		
		request.getRequestDispatcher("views/customerService/customerServiceAdminNoticeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
