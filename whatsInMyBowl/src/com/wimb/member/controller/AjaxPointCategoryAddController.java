package com.wimb.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.member.model.service.MemberService;
import com.wimb.member.model.vo.PointCategory;

/**
 * Servlet implementation class AjaxPointCategoryAddController
 */
@WebServlet("/pointCategoryAdd.me")
public class AjaxPointCategoryAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPointCategoryAddController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String pointName = request.getParameter("pointName");
		int pointAmount = Integer.parseInt(request.getParameter("pointAmount"));
		
		ArrayList<PointCategory> updateList = new MemberService().addPointCategory(pointName, pointAmount);
		
		request.setAttribute("updateList", updateList);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(updateList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
