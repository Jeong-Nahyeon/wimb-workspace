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
		String[] adArr = request.getParameterValues("ad");
		
		String ad = "";
		if(adArr != null) {
			ad = String.join(",", adArr);
		}
		
		Member m = new Member(userName, userId, userPwd, phone, birth, gender, address, subAddress, postcode, email, ad);
		
		// 회원가입
		int result1 = new MemberService().insertMember(m);
		
		// 포인트 테이블에 회원 가입시 포인트 주는 로그 작성
		int result2 = new MemberService().insertPoint(m.getmCode());

		// member테이블 내 point업데이트
		int result3 = new MemberService().updatePoint(m.getmCode());
		
		HttpSession session = request.getSession();
		
		if(result1 * result2 * result3 > 0) {
			session.setAttribute("alertMsg", "회원가입에 성공했습니다.");
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
