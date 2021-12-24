package com.wimb.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.GsonBuilder;
import com.wimb.mypage.model.service.MyPageService;
import com.wimb.mypage.model.vo.Orders;

/**
 * Servlet implementation class AjaxAdminOrderDetailController
 */
@WebServlet("/orderDetail.admin")
public class AjaxAdminOrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminOrderDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String oCode = request.getParameter("oCode");
		
		Orders od = new MyPageService().adminOrderDetail(oCode);

		response.setContentType("application/json; charset=utf-8");
		//new Gson().toJson(od, response.getWriter());
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(od, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
