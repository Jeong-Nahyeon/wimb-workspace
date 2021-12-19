package com.wimb.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.product.model.service.ProductService;

/**
 * Servlet implementation class AjaxProductAdminDeleteController
 */
@WebServlet("/delete.apr")
public class AjaxProductAdminDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductAdminDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get 방식으로 전송해서 인코딩 안 해줘도 되지만 일단 혹시 모르니까 인코딩 설정
		
		String pCode = request.getParameter("pCodeArr");
		
		System.out.println(pCode);
		
		int result = new ProductService().deleteAdminProduct(pCode);
		
		// 처리된 행 수(0|1) 응답 데이터로 전달
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
