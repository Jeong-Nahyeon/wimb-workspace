package com.wimb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wimb.admin.model.service.bannerService;
import com.wimb.admin.model.vo.Banner;

/**
 * Servlet implementation class BannerSelectFirstMainController
 */
@WebServlet("/BannerSelectFirstMainController")
public class BannerAjaxSelectFirstMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BannerAjaxSelectFirstMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메인1에 등록하고자 하는 메인의 라디오버튼 선택 후 '등록'버튼 클릭 시 선택한 게시글 번호를 넘겨받아 화면에 띄우는 컨트롤러
		int selectMainNum = Integer.parseInt(request.getParameter("selectMainNum"));
		
		Banner b = new bannerService().selectFirstMain(selectMainNum);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
