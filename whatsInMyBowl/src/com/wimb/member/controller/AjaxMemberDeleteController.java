package com.wimb.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxMemberDeleteController
 */
@WebServlet("/selectDelete.me")
public class AjaxMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int count =  Integer.parseInt(request.getParameter("count"));
		String[] arr = request.getParameterValues("checkArr");
		
		int result = 0;
	
		if(arr != null && count > 0) {
			for(int i=0; i<count; i++) {
				int userNo = Integer.parseInt(arr[i]);
				result = new MemberService().deleteMemberA(userNo);
			}
		}
		
		if(result > 0) {
			//response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(result);
		}else {
			request.setAttribute("errorMsg", "회원 삭제 실패");
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
