package com.wimb.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.payment.model.service.PaymentService;
import com.wimb.payment.model.vo.Card;
import com.wimb.payment.model.vo.Payment;

/**
 * Servlet implementation class AjaxPaymentInsertPayController
 */
@WebServlet("/paycheck.pay")
public class AjaxPaymentInsertPayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPaymentInsertPayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String impUid = request.getParameter("imp_uid");
		int paidAmount = Integer.parseInt(request.getParameter("paid_amount"));	// 결제금액
		String applyNum = request.getParameter("apply_num");	// 승인번호
		String cardName = request.getParameter("card_name");	// 카드사
		String cardNumber = request.getParameter("card_number");	// 카드번호
		int cardQuota = Integer.parseInt(request.getParameter("card_quota"));	// 할부
		int originPrice = Integer.parseInt(request.getParameter("originPrice"));	// 원결제금액
		
		Payment p = new Payment(originPrice, paidAmount);
		Card c = new Card(cardNumber, applyNum, cardName, cardQuota);
		String pmCode = new PaymentService().insertPayment(p, c);
		
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
