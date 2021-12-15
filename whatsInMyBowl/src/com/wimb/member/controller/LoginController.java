package com.wimb.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wimb.member.model.service.MemberService;
import com.wimb.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mId = request.getParameter("userId");
		String mPwd = request.getParameter("userPwd");
		
		Member loginUser = new MemberService().loginMember(mId, mPwd);
		
		HttpSession session = request.getSession();

		if(loginUser == null) {
			request.setAttribute("errorMsg", "로그인 실패했습니다. <br> 아이디 또는 비밀번호를 확인해주세요.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
		}else {
			
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath());
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
