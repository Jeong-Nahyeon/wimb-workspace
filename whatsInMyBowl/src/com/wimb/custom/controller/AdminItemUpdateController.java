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
 * Servlet implementation class AdminItemUpdateController
 */
@WebServlet("/adminitemupdate.cu")
public class AdminItemUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminItemUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String ciCode = request.getParameter("ciCode");
		String ciCategory = request.getParameter("ciCategory");
		String ciName = request.getParameter("ciName");
		int ciPrice = Integer.parseInt(request.getParameter("ciPrice"));
		String ciProvider = request.getParameter("ciProvider");
		int ciProvidePrice = Integer.parseInt(request.getParameter("ciProvidePrice"));
		int ciStock = Integer.parseInt(request.getParameter("ciStock"));
		String ciShow = request.getParameter("ciShow");
		
		System.out.println(ciShow);
		
		Item i = new Item(ciCode, ciName, ciCategory, ciProvider, ciProvidePrice, ciPrice, ciShow, ciStock);
	
		int result = new CustomService().updateItem(i);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "재료 수정 성공");
			response.sendRedirect(request.getContextPath() + "/aUplist.cu?update=1");
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
