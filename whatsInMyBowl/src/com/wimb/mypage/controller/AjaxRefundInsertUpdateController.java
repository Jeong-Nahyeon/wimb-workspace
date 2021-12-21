package com.wimb.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.mypage.model.service.MyPageService;

/**
 * Servlet implementation class AjaxRefundInsertUpdateController
 */
@WebServlet("/refundInsert.my")
public class AjaxRefundInsertUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRefundInsertUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String oCode = request.getParameter("orderCode");
		String pmCode = request.getParameter("pmCode");
		String reReason = request.getParameter("reReason");
	
		int result = new MyPageService().insertUpdateRefund(oCode, pmCode, reReason);
		
		if(result>0) {
			response.getWriter().print(result);
		}else {
			request.getSession().setAttribute("alertMsg", "요청에 실패했습니다.\n관리자에게 문의하세요.");
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
