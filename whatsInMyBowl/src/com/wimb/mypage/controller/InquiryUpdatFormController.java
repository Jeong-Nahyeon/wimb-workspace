package com.wimb.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.common.model.vo.File;
import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.service.MyPageService;
import com.wimb.mypage.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryUpdatFormController
 */
@WebServlet("/InquiryUpdatForm.my")
public class InquiryUpdatFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdatFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 수정 버튼 클릭 시 수정창을 불러오는 컨트롤러
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mCode = loginUser.getmCode();
		
		int iCode = Integer.parseInt(request.getParameter("num"));
		
		Inquiry inq = new MyPageService().selectInquiry(mCode, iCode);
		ArrayList<File> list = new MyPageService().selectInquiryFile(iCode);
		
		request.setAttribute("inq", inq);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/mypage/inquiryUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
