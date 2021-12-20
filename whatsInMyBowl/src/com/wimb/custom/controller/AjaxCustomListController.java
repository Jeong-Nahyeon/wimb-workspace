package com.wimb.custom.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.custom.model.service.CustomService;
import com.wimb.custom.model.vo.CustomItemList;

/**
 * Servlet implementation class AjaxCustomListController
 */
@WebServlet("/selectCustom.cu")
public class AjaxCustomListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCustomListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cuCode = request.getParameter("cuCode");
		
		ArrayList<CustomItemList> list = new CustomService().selectCustomItem(cuCode);

		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
