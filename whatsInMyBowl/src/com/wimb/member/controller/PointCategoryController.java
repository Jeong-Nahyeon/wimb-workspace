package com.wimb.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.member.model.service.MemberService;
import com.wimb.member.model.vo.PointCategory;

/**
 * Servlet implementation class PointCategoryController
 */
@WebServlet("/pointCategory.me")
public class PointCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PointCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<PointCategory> list = new MemberService().selectPointCategory();
		int count = new MemberService().pointCategoryCount();

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		//System.out.println(list);
		//System.out.println(count);
		request.getRequestDispatcher("/views/member/pointAdmin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
