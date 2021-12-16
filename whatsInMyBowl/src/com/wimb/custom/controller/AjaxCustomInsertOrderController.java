package com.wimb.custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.custom.model.service.CustomService;

/**
 * Servlet implementation class AjaxCustomInsertOrderController
 */
@WebServlet("/insertOrder.cu")
public class AjaxCustomInsertOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCustomInsertOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cuName = request.getParameter("cuName");
		
		String totalPrice = request.getParameter("totalPrice");
		String ciCode = request.getParameter("ciCode");
		String ciCount = request.getParameter("ciCount");
		
		//int result1 = new CustomService().insertCustomOrder();
		int result1 = 1;
		
		
		System.out.println(cuName);
		System.out.println(totalPrice);
		System.out.println(ciCode);
		System.out.println(ciCount);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(ciCode);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
