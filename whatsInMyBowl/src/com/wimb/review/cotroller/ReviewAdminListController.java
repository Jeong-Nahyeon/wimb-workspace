package com.wimb.review.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.common.model.vo.PageInfo;
import com.wimb.member.model.vo.Member;
import com.wimb.product.model.service.ProductService;
import com.wimb.product.model.vo.Product;
import com.wimb.review.model.service.ReviewService;
import com.wimb.review.model.vo.Review;

/**
 * Servlet implementation class ReviewAdminListController
 */
@WebServlet("/list.arev")
public class ReviewAdminListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAdminListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount; // 리뷰 총 개수
		int currentPage; // 사용자가 요청한 페이지 번호
		int pageLimit; // 페이징바에 보여질 최대 페이지 개수(단위)
		int boardLimit; // 한 페이지 보여질 최대 완제품 개수(단위)
		int maxPage; // 총 페이지 수 (가장 마지막 페이지 수)
		int startPage; // 시작 페이지 수
		int endPage; // 끝 페이지 수
		
		
		listCount = new ReviewService().selectAdminReviewListCount();
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10;
		
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> reviewList = new ReviewService().selectAdminReviewList(pi);
		
		
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		
		if(loginUser != null) {
			
			request.setAttribute("pi", pi);
			request.setAttribute("reviewList", reviewList);
			
			request.getRequestDispatcher("views/review/reviewAdminListView.jsp").forward(request, response);
			
		} else {
			
			request.setAttribute("errorMsg", "로그인 후 이용 가능합니다.");
			request.getRequestDispatcher("views/common/adminerrorPage.jsp").forward(request, response);
		
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
