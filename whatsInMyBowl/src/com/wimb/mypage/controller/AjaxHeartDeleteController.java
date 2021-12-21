package com.wimb.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.member.model.vo.Member;
import com.wimb.mypage.model.service.MyPageService;

/**
 * Servlet implementation class AjaxHeartDeleteController
 */
@WebServlet("/deleteHeart.my")
public class AjaxHeartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHeartDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = ((Member)request.getSession().getAttribute("loginUser"));
		int count = Integer.parseInt(request.getParameter("count"));
		String[] pArr = request.getParameterValues("pArr");
		
		System.out.println(count);
		System.out.println(pArr[0]);
		System.out.println(m.getmCode());
		
		int result = 0;
		if(pArr != null && count > 0) {
			for(int i=0; i<pArr.length; i++) {
				String pCode = pArr[i];
				result = new MyPageService().deleteHeart(m, pCode);
			}
		}
		
		if(result > 0) {
			response.getWriter().print(result);
		}else {
			request.setAttribute("errorMsg", "삭제실패\n관리자에게 문의하세요");
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
