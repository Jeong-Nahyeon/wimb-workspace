package com.wimb.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.payment.model.service.PaymentService;
import com.wimb.payment.model.vo.Order;
import com.wimb.payment.model.vo.PaymentCustom;
import com.wimb.payment.model.vo.PaymentProduct;

/**
 * Servlet implementation class AjaxInsertOrderCashController
 */
@WebServlet("/ordercashComplete.pay")
public class AjaxInsertOrderCashController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertOrderCashController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] saladCode = request.getParameterValues("saladCode");
		String[] saladCount = request.getParameterValues("saladCount");
		int totalCount = Integer.parseInt(request.getParameter("totalCount"));
		String pmCode = request.getParameter("pmCode");
		
		String oName = request.getParameter("name");
		String oAddress = request.getParameter("address");
		String oSubAddress = request.getParameter("subAddress");
		int zipCode = Integer.parseInt(request.getParameter("zipCode"));
		String oPhone = request.getParameter("phone");
		String oEmail = request.getParameter("email");
		String oRequest = request.getParameter("request");
		int oPoint = Integer.parseInt(request.getParameter("point"));
		String oState = "입금대기";
		
		// 회원번호 담기 / 회원=회원번호 / 비회원 = 0
		int mCode = 0;
		if(request.getParameter("mCode").equals("1")) {
			mCode = 0;
		}else {
			mCode = Integer.parseInt(request.getParameter("mCode"));
		}
		
		// 상품 코드 분류
			PaymentCustom custom = new PaymentCustom();
			PaymentProduct product = new PaymentProduct(); 
			int result2 = 0;
			Order order = new Order(mCode, pmCode, totalCount, oName, oAddress, oSubAddress, zipCode, oPhone, oEmail, oRequest, oPoint, oState);
			String orderCode = new PaymentService().insertOrder(order);
			if(orderCode != null) {
				for(int i=0; i<saladCode.length;i++) {
					if(saladCode[i].startsWith("CU")) {
						custom.setCuCode(saladCode[i]);
						custom.setCuCount(Integer.parseInt(saladCount[i]));
						result2 = new PaymentService().insertSubOrderCustom(custom, orderCode);
					}else {
						product.setpCode(saladCode[i]);
						product.setpCount(Integer.parseInt(saladCount[i]));
						result2 = new PaymentService().insertSubOrderProduct(product, orderCode);
					}
				}
			}
			
			if(result2 > 0) {
				response.setContentType("application/json; charset=UTF-8");
				new Gson().toJson(orderCode, response.getWriter());
			}else {
				
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
