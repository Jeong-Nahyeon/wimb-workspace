package com.wimb.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.payment.model.service.PaymentService;
import com.wimb.payment.model.vo.PaymentCustom;
import com.wimb.payment.model.vo.PaymentProduct;

/**
 * Servlet implementation class OrderEnrollFormController
 */
@WebServlet("/order.pay")
public class OrderEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] saladCode = request.getParameterValues("saladCode");
		String[] saladCount2 = request.getParameterValues("saladCount");
		String[] saladPrice = request.getParameterValues("saladPrice");
		
		//String[] saladCode = {"CU1001", "CU1002", "CU1003", "CU1004"};
		//String[] saladCount = {"1", "1", "2", "3"};
		//String[] saladPrice = {"10000", "15000", "9000", "13000"};
		
		//System.out.println(saladCode[0]);
		//System.out.println(saladCount2[0]);
		//System.out.println(saladPrice[0]);
		//System.out.println(saladCode);
		//System.out.println(saladCount2);
		System.out.println(saladCount2.length);
		
		for(int i=0; i<saladCode.length; i++) {
			System.out.println("샐러드 코드 : " + saladCode[i]);
		}
		
		for(int i=0; i<saladCount2.length; i++) {
			System.out.println("샐러드 코드 : " + saladCount2[i]);
		}
		
		int[] saladCount = new int[saladCount2.length];
		if(saladCount2 != null) {
			//saladCount = new int[saladCount2.length];
			for(int i=0; i<saladCount2.length;i++) {
				try {
					saladCount[i]=Integer.parseInt(saladCount2[i]);
				}catch(NumberFormatException e) {
					
				}
			}
		}
		
		
		PaymentCustom custom = new PaymentCustom();
		PaymentProduct product = new PaymentProduct(); 
		
		ArrayList<PaymentCustom> customList = new ArrayList<PaymentCustom>();
		ArrayList<PaymentProduct> productList = new ArrayList<PaymentProduct>();
		
		for(int i=0; i<saladCode.length; i++) {
			if(saladCode[i].startsWith("CU")) {
				custom = new PaymentService().selectCustom(saladCode[i]);
				custom.setCuCount(saladCount[i]);
				customList.add(custom);
			}else if(saladCode[i].startsWith("P")) {
				product = new PaymentService().selectProduct(saladCode[i]);
				product.setpCount(saladCount[i]);
				product.setpPrice(Integer.parseInt(saladPrice[i]));
				productList.add(product);
			}
		}
		//System.out.println(saladCode.length);
		//System.out.println(saladCode[1]);
		//System.out.println(custom);
		//System.out.println(product);
		
		//System.out.println(customList);
		//System.out.println(productList);
		
		request.setAttribute("customList", customList);
		request.setAttribute("productList", productList);
		request.getRequestDispatcher("views/payment/orderForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
