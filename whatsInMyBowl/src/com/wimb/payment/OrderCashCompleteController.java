package com.wimb.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.payment.model.service.PaymentService;
import com.wimb.payment.model.vo.Cash;
import com.wimb.payment.model.vo.Order;
import com.wimb.payment.model.vo.Payment;
import com.wimb.payment.model.vo.PaymentCustom;
import com.wimb.payment.model.vo.PaymentProduct;

/**
 * Servlet implementation class OrderCashCompleteController
 */
@WebServlet("/cashComplete.pay")
public class OrderCashCompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCashCompleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		// 주문테이블
		String[] saladCode = request.getParameterValues("product_code");
		String[] saladCount = request.getParameterValues("product-num");
		System.out.println(saladCode);
		System.out.println(saladCount[0]);
		
		int totalCount = Integer.parseInt(request.getParameter("total_count"));
		String oName = request.getParameter("oName");
		String oAddress = request.getParameter("oAddress");
		String oSubAddress = request.getParameter("oSubAddress");
		int zipCode = Integer.parseInt(request.getParameter("oZipCode"));
		String oPhone = request.getParameter("oPhone");
		String oEmail = request.getParameter("oEmail");
		String oRequest = request.getParameter("oRequest");
		int oPoint = Integer.parseInt(request.getParameter("oPoint"));
		String oStatus = "입금대기";
		int mCode = 0;
		if(request.getParameter("mCode").equals("1")) {
			mCode = 0;
		}else {
			mCode = Integer.parseInt(request.getParameter("mCode"));
		}
		PaymentCustom custom = new PaymentCustom();
		PaymentProduct product = new PaymentProduct(); 
		int result2 = 0;
		
		// 결제테이블
		String cashBank = request.getParameter("cashCompany");
		String cashName = request.getParameter("cashName");
		int totalPrice = Integer.parseInt(request.getParameter("total_price"));
		
		Cash cash = new Cash(cashBank, cashName);
		String pmCode = new PaymentService().insertCashPayment(totalPrice, cash);
		
		Order order = new Order(mCode, pmCode, totalCount, oName, oAddress, oSubAddress, zipCode, oPhone, oEmail, oRequest, oPoint, oStatus);
		String orderCode = null;
		if(pmCode != null) {
			orderCode = new PaymentService().insertOrder(order);
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
		}else {
			// 오류페이지
		}	
		
		if(result2 > 0) {
			order = new PaymentService().selectOrder(orderCode);
			custom = new PaymentService().selectCustomName(orderCode);
			product = new PaymentService().selectProductName(orderCode);	
			Payment p = new PaymentService().selectPayment(pmCode);
			request.setAttribute("order", order);
			request.setAttribute("custom", custom);
			request.setAttribute("product", product);
			request.setAttribute("payment", p);
		}
		
		
		
		
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
