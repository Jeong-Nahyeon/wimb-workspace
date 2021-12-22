package com.wimb.customerService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.common.model.vo.File;
import com.wimb.customerService.model.service.NoticeService;
import com.wimb.customerService.model.vo.Notice;

/**
 * Servlet implementation class NoticeAdminUpdateFormController
 */
@WebServlet("/adminUpdateForm.no")
public class NoticeAdminUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 수정하기 클릭 시 클릭한 게시글의 수정화면을 띄워주는 컨트롤러
		int nCode = Integer.parseInt(request.getParameter("num"));
		
		NoticeService nService = new NoticeService();
		Notice n = nService.selectAdminNotice(nCode);
		ArrayList<File> list = nService.selectAdminFile(nCode);
		
		request.setAttribute("n", n);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/customerService/customerServiceAdminNoticeUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
