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
 * Servlet implementation class MemberUpdateFormController
 */
@WebServlet("/updateForm.me")
public class MemberUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
        String userName = request.getParameter("userName");
        String phone = request.getParameter("userPhone");
        String email = request.getParameter("userEmail");
        String address = request.getParameter("userAddress1");
        String subAddress = request.getParameter("userAddress2");
        String postcode = request.getParameter("postcode");
        String[] adArr = request.getParameterValues("ad");
        
        String ad = "";
        if(adArr != null) {
        	ad = String.join(",", adArr);
        }
        
       
        Member m = new Member(userId, userPwd, userName, phone, email, address, subAddress, postcode, ad);
       
        Member updateMem = new MemberService().updateMember(m);
        
        HttpSession session = request.getSession();
        
        if(updateMem == null) {
        	
        	request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
        	request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        }else {
        	
        	session.setAttribute("loginUser", updateMem);
        	session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
        	
        	response.sendRedirect(request.getContextPath() + "/memberUpdate.me");
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
