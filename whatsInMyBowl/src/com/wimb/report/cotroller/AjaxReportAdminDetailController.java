package com.wimb.report.cotroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.report.model.service.ReportService;
import com.wimb.report.model.vo.Report;
import com.wimb.review.model.vo.Review;

/**
 * Servlet implementation class AjaxReportAdminDetailController
 */
@WebServlet("/detail.arep")
public class AjaxReportAdminDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportAdminDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int rCode = Integer.parseInt(request.getParameter("rcode"));
		int reportCode = Integer.parseInt(request.getParameter("reportCode"));
		
		Review rev = new ReportService().selectAdminReviewDetail(rCode);
		Report rep = new ReportService().selectAdminReportDetail(reportCode);
		
		ArrayList detailList = new ArrayList();
		
		detailList.add(rev);
		detailList.add(rep);
		
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
