package com.wimb.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxPwdCheckController
 */
@WebServlet("/pwdCheck.me")
public class AjaxPwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPwdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String userId = "admin01";
		String userId = request.getParameter("userId");
		String checkPwd = request.getParameter("userPwd");
		
		//System.out.println(userId);
		//System.out.println(checkPwd);
		
		int count = new MemberService().pwdCheck(userId, checkPwd);
		
		if(count > 0) {
			response.getWriter().print("NNNNY");
		}else{
			response.getWriter().print("NNNNN");
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
