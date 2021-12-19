package com.wimb.custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.custom.model.service.CustomService;
import com.wimb.custom.model.vo.Custom;

/**
 * Servlet implementation class AjaxCustomInsertController
 */
@WebServlet("/customInsert.cu")
public class AjaxCustomInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCustomInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String[] itemCode = request.getParameterValues("arrItemCode");
		String[] itemCount = request.getParameterValues("arrItemCount");
		int itemTotalPrice = Integer.parseInt(request.getParameter("utemPrice"));
		String saladName = request.getParameter("saladName");
		int userCode = Integer.parseInt(request.getParameter("userNum"));
		
		Custom c = new Custom();
		c.setmCode(userCode);
		c.setCuName(saladName);
		c.setCuPrice(itemTotalPrice);
		
		int result = new CustomService().insertCustom(c);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
