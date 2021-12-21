package com.wimb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.customerService.model.service.NoticeService;
import com.wimb.customerService.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailUserViewController
 */
@WebServlet("/detailUserView.no")
public class NoticeDetailUserViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailUserViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("num"));
		
		// 조회수 증가
		int result = new NoticeService().increaseCount(noticeNo);
		
		if(result > 0) {
			Notice n = new NoticeService().selectNotice(noticeNo);
			request.setAttribute("notice", n);
			request.getRequestDispatcher("views/customerService/customerServiceNoticeDetailView.jsp").forward(request, response);
		} else {
			
			request.setAttribute("alertMsg", "공지사항 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
