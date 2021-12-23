package com.wimb.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.customerService.model.service.FAQService;

/**
 * Servlet implementation class FAQAdminInsertController
 */
@WebServlet("/insert.faq")
public class FAQAdminInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQAdminInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 자주묻는질문 등록 컨트롤러
		request.setCharacterEncoding("UTF-8");
		
		String faqTitle = request.getParameter("title");
		String faqCategory = request.getParameter("FAQ_category_option");
		String faqContent = request.getParameter("FAQ_Box_question_answer");
		
		faqContent = faqContent.replace("\r\n","<br>");   // textarea영역에 적힌 띄어쓰기나 개행을 그대로 적용시켜주는 구문
		
		int result = new FAQService().insertFaq(faqTitle, faqCategory, faqContent);
		
		if(result > 0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "자주묻는질문 등록 성공");
			response.sendRedirect(request.getContextPath() + "/adminEnrollForm.faq");
		} else {
			request.setAttribute("errorMsg", "자주묻는질문 등록 실패");
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
