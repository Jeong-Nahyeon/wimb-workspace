package com.wimb.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.member.model.service.MemberService;
import com.wimb.member.model.vo.Member;

/**
 * Servlet implementation class AdminLoginController
 */
@WebServlet("/adminlogin.me")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userId = request.getParameter("userId");
		String userPwd  = request.getParameter("userPwd");
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		if(loginUser == null) {
			request.setAttribute("errorMsg", "로그인 실패");
			request.getRequestDispatcher("views/common/adminerrorPage.jsp").forward(request, response); 
			
		} else if(loginUser.getStatus().equals("Y")) { // 사용자 로그인 => 사용자 홈페이지로 이동
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			response.sendRedirect("/wimb");
		
		} else if(loginUser.getStatus().equals("A")) { // 관리자 로그인 => 관리자 홈페이지로 이동
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			
			
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
