package com.wimb.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.payment.model.service.PaymentService;
import com.wimb.payment.model.vo.Cash;

/**
 * Servlet implementation class AjaxInsertPaymentCashController
 */
@WebServlet("/cashpay.pay")
public class AjaxInsertPaymentCashController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertPaymentCashController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String cashBank = request.getParameter("cashBank");
		String cashName = request.getParameter("cashName");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		Cash cash = new Cash(cashBank, cashName);
		String pmCode = new PaymentService().insertCashPayment(totalPrice, cash);
		
		System.out.println(pmCode);
		if(pmCode != null) {
			response.getWriter().print(pmCode);
		}else {
			response.getWriter().print("N");
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
