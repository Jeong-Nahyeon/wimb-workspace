package com.wimb.review.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.common.model.vo.File;
import com.wimb.review.model.service.ReviewService;
import com.wimb.review.model.vo.Review;

/**
 * Servlet implementation class AjaxReviewDetailController
 */
@WebServlet("/detail.rev")
public class AjaxReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int rCode = Integer.parseInt(request.getParameter("rcode"));
		
		ArrayList detailList = new ArrayList();
		
		Review r = new ReviewService().selectReviewDetail(rCode);
		ArrayList<File> list = new ReviewService().selectReviewDetailFileList(rCode);
		
		detailList.add(r);
		detailList.add(list);
		
		response.setContentType("application/json; charset=UTF-8"); 
		new Gson().toJson(detailList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
