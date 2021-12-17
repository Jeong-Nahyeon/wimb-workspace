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
 * Servlet implementation class BannerFirstMainListViewController
 */
@WebServlet("/BannerFirstMainListViewController")
public class BannerFirstMainListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BannerFirstMainListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메인1 글씨 오른쪽 '변경하기'버튼 클릭 시 생성되는 모달창 안에 띄워줄 게시종료 상태 리스트
		ArrayList<Banner> Firstlist = new bannerService().selectFisrtMainList();
		
		request.setAttribute("Firstlist", Firstlist);
		request.getRequestDispatcher("views/admin/bannerListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
