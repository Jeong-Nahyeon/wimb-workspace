package com.wimb.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxInsertOrderController
 */
@WebServlet("/orderinsert.pay")
public class AjaxInsertOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String[] saladCode = request.getParameterValues("saladCode");
		String[] saladCount = request.getParameterValues("saladCount");
		//String saladCode = request.getParameter("saladCode");
		//String saladCount = request.getParameter("saladCount");
		String pmCode = request.getParameter("pmCode");
		int mCode = Integer.parseInt(request.getParameter("mCode"));
		String oName = request.getParameter("name");
		String oAddress = request.getParameter("address");
		String oSubAddress = request.getParameter("subAddress");
		int zipCode = Integer.parseInt(request.getParameter("zipCode"));
		String oPhone = request.getParameter("phone");
		String oEmail = request.getParameter("email");
		String oRequest = request.getParameter("request");
		int oPoint = Integer.parseInt(request.getParameter("point"));
		
		System.out.println(saladCode[1]);
		System.out.println(saladCount);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
