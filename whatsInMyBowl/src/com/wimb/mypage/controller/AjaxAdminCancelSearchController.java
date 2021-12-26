package com.wimb.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.mypage.model.service.MyPageService;
import com.wimb.mypage.model.vo.Orders;

/**
 * Servlet implementation class AjaxAdminCancelSearchController
 */
@WebServlet("/cancelSearch.admin")
public class AjaxAdminCancelSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminCancelSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String kword = request.getParameter("kword");
		String option = request.getParameter("option");
		
		ArrayList<Orders> clist = new MyPageService().searchCancel(kword, option);
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(clist, response.getWriter());	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
