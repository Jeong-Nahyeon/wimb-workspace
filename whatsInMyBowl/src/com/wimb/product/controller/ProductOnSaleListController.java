package com.wimb.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.product.model.service.ProductService;
import com.wimb.product.model.vo.Product;

/**
 * Servlet implementation class ProductOnSaleListController
 */
@WebServlet("/onSaleList.pr")
public class ProductOnSaleListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOnSaleListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount; // 완제품 총 개수
		int currentPage; // 사용자가 요청한 페이지 번호
		int pageLimit; // 페이징바에 보여질 최대 페이지 개수(단위)
		int boardLimit; // 한 페이지 보여질 최대 완제품 개수(단위)
		int maxPage; // 총 페이지 수 (가장 마지막 페이지 수)
		int startPage; // 시작 페이지 수
		int endPage; // 끝 페이지 수
		
		
		listCount = new ProductService().selectSaleListCount();
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10;
		
		boardLimit = 12;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
		String selectOrder = "";
		ArrayList<Product> saleList = new ArrayList<>();
		
		if(request.getParameter("selectOrder") != null) { // 세일상품 옵션별 정렬 조회
			
			selectOrder = request.getParameter("selectOrder");
			
			if(selectOrder.equals("hot")) { // 인기상품순
				
				saleList = new ProductService().selectSaleOptionListHot(pi);
				
			} else if(selectOrder.equals("min")) { // 낮은가격순
				
				saleList = new ProductService().selectSaleOptionListMin(pi);
				
			} else if(selectOrder.equals("max")) { // 높은가격순
				
				saleList = new ProductService().selectSaleOptionListMax(pi);
				
			}
			
			request.setAttribute("selectOrder", selectOrder);
			request.setAttribute("pi", pi);
			request.setAttribute("saleList", saleList);
			
			request.getRequestDispatcher("views/product/productOnSaleListView.jsp").forward(request, response);
			
		} else { // 세일상품 전체 조회
		
			saleList = new ProductService().selectSaleList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("saleList", saleList);
		
		request.getRequestDispatcher("views/product/productOnSaleListView.jsp").forward(request, response);
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
