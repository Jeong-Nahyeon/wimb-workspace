package com.wimb.custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.custom.model.service.CustomService;
import com.wimb.custom.model.vo.Item;

/**
 * Servlet implementation class AdminItemInsertController
 */
@WebServlet("/aiteminsert.cu")
public class AdminItemInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminItemInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("ciCategory");
		String name = request.getParameter("ciName");
		int price = Integer.parseInt(request.getParameter("ciPrice"));
		String provider = request.getParameter("ciProvider");
		int providePrice = Integer.parseInt(request.getParameter("ciProvidePrice")); 
		int stock = Integer.parseInt(request.getParameter("ciStock"));
		String show = request.getParameter("ciShow");
	
		Item i = new Item(name, category, provider, providePrice, price, show, stock);
		
		int result = new CustomService().insertItemAdmin(i);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "재료 등록 성공");
			response.sendRedirect(request.getContextPath() + "/aitem.cu?cupage=1");
		} else {
			request.setAttribute("errorMsg", "재료 등록 실패");
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
