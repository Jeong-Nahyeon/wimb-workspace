package com.wimb.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.payment.model.service.PaymentService;
import com.wimb.payment.model.vo.Card;
import com.wimb.payment.model.vo.Cash;
import com.wimb.payment.model.vo.Order;
import com.wimb.payment.model.vo.Payment;
import com.wimb.payment.model.vo.PaymentCustom;
import com.wimb.payment.model.vo.PaymentProduct;

/**
 * Servlet implementation class OrderCompleteController
 */
@WebServlet("/ordercomplete.pay")
public class OrderCompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCompleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String orderCode = request.getParameter("ono");
		System.out.println(orderCode);
		
		Order order = new PaymentService().selectOrder(orderCode);
		
		// pmCode 값, payment 조회
		String pmCode = order.getPmCode();
		Payment p = new PaymentService().selectPayment(pmCode);
		
		Card card = null;
		Cash cash = null;
		if(p.getPmMethod().equals("카드")) {
			card = new PaymentService().selectCard(pmCode);
		}else {
			cash = new PaymentService().selectCash(pmCode);
		}
		
		// 샐러드명 조회
		ArrayList<PaymentCustom> custom = new PaymentService().selectCustomName(orderCode);
		ArrayList<PaymentProduct> product = new PaymentService().selectProductName(orderCode);
		
		request.setAttribute("order", order);
		request.setAttribute("p", p);
		request.setAttribute("custom", custom);
		request.setAttribute("product", product);
		request.setAttribute("card", card);
		request.setAttribute("cash", cash);
		request.getRequestDispatcher("views/payment/orderCompleteView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
