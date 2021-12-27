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
 * Servlet implementation class AjaxMemberUpdateAdminController
 */
@WebServlet("/updateMemAdmin.me")
public class MemberUpdateAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userIdM");
		String userName = request.getParameter("userNameM");
		String userPhone = request.getParameter("userPhoneM");
		String userEmail = request.getParameter("userEmailM");
		String userAddress = request.getParameter("userAddress1");
		String subAddress = request.getParameter("userAddress2");
		String postcode = request.getParameter("postcode");
		String userStatus = request.getParameter("userStatusM");
		
		Member m = new Member(userId, userName, userPhone, userEmail, userAddress, subAddress, postcode, userStatus);
		
		System.out.println(m);
		//System.out.println(userId);
		Member updateM = new MemberService().updateMemberA(m);
		System.out.println(updateM);
	
		
		if(updateM != null) {
			request.getSession().setAttribute("alertMsg", "회원정보 변경 성공");
			response.sendRedirect(request.getContextPath() + "/infoAdminClick.me?cpage=1");
		
		}else {	
			request.getSession().setAttribute("eerrorMsg", "회원정보 변경 실패");
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
