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
 * Servlet implementation class MemberEnrollController
 */
@WebServlet("/enroll.me")
public class MemberEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("userPhone");
		String birth = request.getParameter("userBirth");
		String gender = request.getParameter("gender");
		String address = request.getParameter("userAddress1");
		String subAddress = request.getParameter("userAddress2");
		String postcode = request.getParameter("postcode");
		String email = request.getParameter("userEmail");
		String introducer = request.getParameter("introducer");
		String[] adArr = request.getParameterValues("ad");
		
		String ad = "";
		if(adArr != null) {
			ad = String.join(",", adArr);
		}
		
		Member m = new Member(userName, userId, userPwd, phone, birth, gender, address, subAddress, postcode, email, introducer, ad);
		
		int result = new MemberService().insertMember(m);
		
		
		if(result > 0) {
			
			response.sendRedirect(request.getContextPath());
		} else {
			
			request.setAttribute("errorMsg", "회원가입 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
