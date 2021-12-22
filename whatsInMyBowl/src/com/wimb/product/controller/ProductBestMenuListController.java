package com.wimb.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.product.model.service.ProductService;
import com.wimb.product.model.vo.Product;

/**
 * Servlet implementation class ProductBestMenuListController
 */
@WebServlet("/bestList.pr")
public class ProductBestMenuListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBestMenuListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String selectOrder = "";
		ArrayList<Product> bestList = new ArrayList<>();
		
		if(request.getParameter("selectOrder") != null) { // 완제품 옵션별 정렬 조회
			
			selectOrder = request.getParameter("selectOrder");
			
			if(selectOrder.equals("hot")) { // 인기상품순
				
				bestList = new ProductService().selectBestOptionListHot();
				
			} else if(selectOrder.equals("min")) { // 낮은가격순
				
				bestList = new ProductService().selectBestOptionListMin();
				
			} else if(selectOrder.equals("max")) { // 높은가격순
				
				bestList = new ProductService().selectBestOptionListMax();
				
			}
			
			request.setAttribute("selectOrder", selectOrder);
			request.setAttribute("bestList", bestList);
			
			request.getRequestDispatcher("views/product/productBestMenuListView.jsp").forward(request, response);
			
		} else { // 완제품 전체 조회
		
			bestList = new ProductService().selectBestList();

			request.setAttribute("bestList", bestList);
			
			request.getRequestDispatcher("views/product/productBestMenuListView.jsp").forward(request, response);
		
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
