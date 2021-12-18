package com.wimb.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.common.model.vo.PageInfo;
import com.wimb.product.model.service.ProductService;
import com.wimb.product.model.vo.Product;

/**
 * Servlet implementation class AjaxProductOptionListController
 */
@WebServlet("/optionListAjax.apr")
public class AjaxProductOptionListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductOptionListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String option = request.getParameter("option"); // 카테고리 옵션명
		
		int listCount = new ProductService().selectOptionListCount(option); // 카테고리 옵션별 완제품 총 개수
		
		// 카테고리 옵션별 완제품 목록 조회
		ArrayList<Product> optionList = new ProductService().selectOptionList(option);
		
		response.setContentType("application/json; charset=UTF-8"); 
		new Gson().toJson(optionList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
