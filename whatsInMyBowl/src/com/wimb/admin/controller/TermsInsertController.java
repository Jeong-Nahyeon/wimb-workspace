package com.wimb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.admin.model.service.termsService;

/**
 * Servlet implementation class TermsInsertController
 */
@WebServlet("/insert.terms")
public class TermsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TermsInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String termsContent = request.getParameter("termsContent");
		termsContent = termsContent.replace("\r\n","<br>");   // textarea영역에 적힌 띄어쓰기나 개행을 그대로 적용시켜주는 구문
		int result = new termsService().insertTerms(termsContent);
		
		if(result > 0) { // 성공 => /wimb/list.terms 
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.terms");
			
		} else { // 실패 => 에러메시지 포워딩
			request.setAttribute("alertMsg", "이용약관 등록 실패");
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
