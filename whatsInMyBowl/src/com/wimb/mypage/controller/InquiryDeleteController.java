package com.wimb.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.mypage.model.service.MyPageService;

/**
 * Servlet implementation class InquiryDeleteController
 */
@WebServlet("/delete.inquiry")
public class InquiryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int iCode = Integer.parseInt(request.getParameter("num"));
		
		int result = new MyPageService().deleteInquiryList(iCode);
		
		if(result > 0) { // 삭제성공시
			//request.getSession().setAttribute("alertMsg", "문의가 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/inquiryList.my");
		} else { // 삭제실패시
			//request.setAttribute("errorMsg", "문의 삭제 실패");
			request.getRequestDispatcher("views/common/inquiryList.jsp").forward(request, response);
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
