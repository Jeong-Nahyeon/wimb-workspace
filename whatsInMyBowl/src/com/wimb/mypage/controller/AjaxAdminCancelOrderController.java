package com.wimb.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.mypage.model.service.MyPageService;

/**
 * Servlet implementation class AjaxAdminCancelOrderController
 */
@WebServlet("/cancelOrder.admin")
public class AjaxAdminCancelOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminCancelOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int count = Integer.parseInt(request.getParameter("count"));
		String[] oCodes = request.getParameterValues("oCodes");
		String[] pmCodes = request.getParameterValues("pmCodes");
		
		//System.out.println(count);
		//System.out.println(pArr[0]);
		//System.out.println(m.getmCode());
		
		int result1 = 0;
		int result2 = 0;
		String oCode = "";
		String pmCode = "";
		if(oCodes != null && pmCodes != null && count > 0) {
			for(int i=0; i<oCodes.length; i++) {
				oCode = oCodes[i];
			}
			for(int a=0; a<pmCodes.length; a++) {
				pmCode = pmCodes[a];
			}
			System.out.println();
			result1 = new MyPageService().adminCancelOrder(oCode, pmCode);
			result2 = new MyPageService().adminUpdateCancel(oCode);
		}
		
		int result = result1 + result2;
		
		if(result > 1) {
			response.getWriter().print(result);
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
