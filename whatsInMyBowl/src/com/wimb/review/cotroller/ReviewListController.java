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
import com.wimb.payment.model.vo.Order;
import com.wimb.review.model.service.ReviewService;
import com.wimb.review.model.vo.Review;

/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/reviewList.rev")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; // 해당 상품 리뷰 총 개수
		int currentPage; // 사용자가 요청한 페이지 번호
		int pageLimit; // 페이징바에 보여질 최대 페이지 개수(단위)
		int boardLimit; // 한 페이지 보여질 최대 완제품 개수(단위)
		int maxPage; // 총 페이지 수 (가장 마지막 페이지 수)
		int startPage; // 시작 페이지 수
		int endPage; // 끝 페이지 수
		
		String pCode = request.getParameter("pcode"); // 요청 시 전달된 상품코드
		String pName = request.getParameter("pname"); // 요청 시 전달된 상품명
		Member m = (Member)(request.getSession().getAttribute("loginUser")); // 현재 로그인한 회원 정보
		
		System.out.println(m);
		
		listCount = new ReviewService().selectReviewListCount(pCode);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10;
		
		boardLimit = 3;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> reviewList = new ReviewService().selectReviewList(pi, pCode);
		
		if(m != null) {
			
			Order orderInfo = new ReviewService().selectOrderList(pCode, m.getmCode());
			request.setAttribute("orderInfo", orderInfo);
			
		}
		
		request.setAttribute("pCode", pCode);
		request.setAttribute("pName", pName);
		request.setAttribute("pi", pi);
		request.setAttribute("reviewList", reviewList);
		
		request.getRequestDispatcher("views/review/reviewListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
