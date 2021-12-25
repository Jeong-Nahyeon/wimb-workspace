package com.wimb.review.cotroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.review.model.service.ReviewService;

/**
 * Servlet implementation class AjaxReviewPointController
 */
@WebServlet("/point.arev")
public class AjaxReviewPointController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewPointController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rCode = Integer.parseInt(request.getParameter("rcode"));
		String orderCode = request.getParameter("orderCode");
		int mCode = Integer.parseInt(request.getParameter("mcode"));
		
		int result = new ReviewService().insertUpdateAdminReviewPoint(rCode, orderCode, mCode);
		
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
