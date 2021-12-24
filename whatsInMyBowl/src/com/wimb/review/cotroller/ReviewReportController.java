package com.wimb.review.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.member.model.vo.Member;
import com.wimb.review.model.service.ReviewService;
import com.wimb.review.model.vo.Report;

/**
 * Servlet implementation class ReviewReportController
 */
@WebServlet("/report.rev")
public class ReviewReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String pCode = request.getParameter("pcode");
		String pName = request.getParameter("pname");
		
		// 신고리뷰번호
		int rCode = Integer.parseInt(request.getParameter("rcode"));
		System.out.println(rCode);
		
		// 신고글작성자 회원번호
		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		int mCode = m.getmCode();
		System.out.println(mCode);
		
		// 신고사유 카테고리
		String reportCategory = request.getParameter("reportCategory");
		
		// 신고내용
		String reportContent = request.getParameter("reportContent");
		
		Report report = new Report(mCode, rCode, reportCategory, reportContent);
		
		int result = new ReviewService().insertReportReview(report);
		
			if(result > 0) {
				request.getSession().setAttribute("detailMsg", "성공적으로 신고되었습니다.");
				response.sendRedirect(request.getContextPath() + "/reviewList.rev?cpage=1&pcode=" + pCode + "&pname=" + pName + "#review");
			} else {
				request.setAttribute("errorMsg","후기 등록을 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
