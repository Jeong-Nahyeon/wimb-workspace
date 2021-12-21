package com.wimb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.wimb.admin.model.service.bannerService;

/**
 * Servlet implementation class BannerStatusChangeController
 */
@WebServlet("/StatusChange.banner")
public class BannerStatusChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BannerStatusChangeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 상태 '변경' 버튼 클릭 시 게시여부 상태를 (Y일경우 N, N일경우 Y) 변경해주는 컨트롤러
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		String bStatus = request.getParameter("bStatus");
		
		// count : 현재 게시중인 배너의 개수
		int count = new bannerService().selectMainBannerCount();
		System.out.println(count);
		if(count<2 && bStatus.equals("Y")){
			request.getSession().setAttribute("alertMsg", "배너는 최소 1개 이상이어야합니다.");
		} else if(count==3 && bStatus.equals("N")){
			request.getSession().setAttribute("alertMsg", "배너 등록은 최대 3개까지 가능합니다.");			
		} else {
			
			int result = new bannerService().statusChange(bCode, bStatus);
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
			request.getSession().setAttribute("alertMsg", "상태 변경 성공");
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
