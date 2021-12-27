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
 * Servlet implementation class FAQUpdateController
 */
@WebServlet("/update.faq")
public class FAQAdminUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQAdminUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int faqCode = Integer.parseInt(request.getParameter("fCode"));
		String faqTitle = request.getParameter("title");
		String faqContent = request.getParameter("FAQ_Box_question_answer");
		faqContent = faqContent.replace("\r\n","<br>");
		int result = new FAQService().updateFAQ(faqCode, faqTitle, faqContent);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "자주묻는질문 수정 성공");
			response.sendRedirect(request.getContextPath() + "/adminList.faq?cpage=1");
		} else {
			request.setAttribute("errorMsg", "자주묻는질문 수정 실패");
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
