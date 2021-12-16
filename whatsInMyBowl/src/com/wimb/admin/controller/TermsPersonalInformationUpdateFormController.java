package com.wimb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.admin.model.service.termsService;
import com.wimb.admin.model.vo.Terms;

/**
 * Servlet implementation class TermsUpdateFormController
 */
@WebServlet("/PersonalInformationupdateForm.terms")
public class TermsPersonalInformationUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TermsPersonalInformationUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 개인정보처리방침 리스트에서 수정 버튼 클릭 시 수정하고자 하는 글의 내용을 띄워주는 컨트롤러
		int termsCode = Integer.parseInt(request.getParameter("num"));		
		Terms t = new termsService().selectTerms(termsCode);
	
		request.setAttribute("t", t);
		request.getRequestDispatcher("views/admin/termsPersonalInformationUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
