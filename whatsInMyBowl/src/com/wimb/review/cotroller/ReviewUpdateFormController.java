package com.wimb.review.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.common.model.vo.File;
import com.wimb.review.model.service.ReviewService;
import com.wimb.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateFormController
 */
@WebServlet("/updateForm.rev")
public class ReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rCode = Integer.parseInt(request.getParameter("rcode"));
		String pCode = request.getParameter("pcode");
		String pName = request.getParameter("pName");
		
		
		// 리뷰 게시글
		Review r = new ReviewService().selectReview(rCode);
		
		
		// 첨부 파일 => null | 최대 3개
		ArrayList<File> list = new ReviewService().selectFileList(rCode);
		
		request.getSession().setAttribute("review", r);
		request.getSession().setAttribute("fileList", list);
		
//		request.getRequestDispatcher("views/review/reviewListView.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/reviewList.rev?cpage=1&pcode=" + pCode + "&pname=" + pName + "#review");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
