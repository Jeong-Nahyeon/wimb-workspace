package com.wimb.custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.custom.model.service.CustomService;
import com.wimb.custom.model.vo.Custom;
import com.wimb.custom.model.vo.CustomItem;

/**
 * Servlet implementation class AjaxCustomInsertController
 */
@WebServlet("/customInsert.cu")
public class AjaxCustomInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCustomInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String[] arrItemCode = request.getParameterValues("arrItemCode");
		String[] arrItemCount = request.getParameterValues("arrItemCount");
		int itemTotalPrice = Integer.parseInt(request.getParameter("itemPrice"));
		String saladName = request.getParameter("saladName");
		int userCode = Integer.parseInt(request.getParameter("userNum"));
		
		
		Custom c = new Custom();
		c.setmCode(userCode);
		c.setCuName(saladName);
		c.setCuPrice(itemTotalPrice);
		
		String ciCode = new CustomService().insertCustom(c);
		int result = 0;
		if(ciCode != null) {
			for(int i=0; i<arrItemCode.length;i++) {
				String itemCode = arrItemCode[i];
				int itemCount = Integer.parseInt(arrItemCount[i]);
				CustomItem customItem = new CustomItem(ciCode, itemCode, itemCount);
				
				result = new CustomService().insertCustomItem(customItem);
			}
		}
		if(result > 0) {
			//response.getWriter().print(ciCode);
			new Gson().toJson(ciCode, response.getWriter());
		}else {
			request.setAttribute("errorMsg", "커스텀 샐러드 등록 실패");
			request.getRequestDispatcher("views/common/adminerrorPage.jsp").forward(request, response);
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
