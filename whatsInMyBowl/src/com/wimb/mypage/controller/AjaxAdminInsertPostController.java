package com.wimb.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.mypage.model.service.MyPageService;

/**
 * Servlet implementation class AjaxAdminInsertPostController
 */
@WebServlet("/insertPost.admin")
public class AjaxAdminInsertPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminInsertPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String oCode = request.getParameter("oCode");
		String com = request.getParameter("com");
		String inv = request.getParameter("inv");
		
		System.out.println(oCode + com + inv);
		
		int result = new MyPageService().insertPost(oCode, com, inv);
		
		response.getWriter().print(result);
		/*
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "배송정보가 등록되었습니다.");
			//response.sendRedirect(request.getContextPath() + "/orderList.admin?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "요청에 실패하였습니다.\n관리자에게 문의하세요.");
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
