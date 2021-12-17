package com.wimb.custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.wimb.common.WimbFileRenamePolicy;
import com.wimb.custom.model.service.CustomService;
import com.wimb.custom.model.vo.Item;

/**
 * Servlet implementation class AjaxUpdateMainImgController
 */
@WebServlet("/amainimg.cu")
public class AjaxUpdateMainImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateMainImgController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			System.out.println(request);
			
			// 저장시킬 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/custom_images/");
			
			// 전달된 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new WimbFileRenamePolicy());
			
			// DB에 기록할 값
			Item i = new Item();
			String imgName = savePath + multiRequest.getFilesystemName("mainImg");
			System.out.println(imgName);
			i.setCiImg(imgName);
			
			int result = new CustomService().updateMainImg(i);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "대표이미지 변경 완료");
				response.sendRedirect(request.getContextPath() + "/aitem.cu?cupage=1");
				//response.setContentType("application/json; charset=UTF-8");
				//response.getWriter().print(result);
			}else {
				request.setAttribute("errorMsg", "대표이미지 변경 실패");
				request.getRequestDispatcher("views/common/adminerrorPage.jsp").forward(request, response);
			}
			
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
