package com.wimb.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.admin.model.service.bannerService;
import com.wimb.admin.model.vo.Banner;

/**
 * Servlet implementation class BannerMainController
 */
@WebServlet("/main.banner")
public class BannerMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BannerMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 메인1,2,3에 띄워줄 메인에 등록될 사진을 띄워주는 컨트롤러
		ArrayList<Banner> list = new bannerService().selectMainBanner();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/bannerMain.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
