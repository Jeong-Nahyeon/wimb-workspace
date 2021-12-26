package com.wimb.report.cotroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.report.model.service.ReportService;

/**
 * Servlet implementation class AjaxReportAdminInsertBlackListController
 */
@WebServlet("/insertBlackList.arep")
public class AjaxReportAdminInsertBlackListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportAdminInsertBlackListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] reportedMemberCode = request.getParameter("reviewmCodeArr").split(",");
		String blackReason = request.getParameter("blackReason");
		
		int result = new ReportService().insertAdminBlackList(reportedMemberCode, blackReason);
		
		// 처리된 행 수(0 || 0 이상) 응답 데이터로 전달
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
