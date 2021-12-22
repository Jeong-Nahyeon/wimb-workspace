package com.wimb.customerService.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.wimb.admin.model.service.bannerService;
import com.wimb.admin.model.vo.Banner;
import com.wimb.common.WimbFileRenamePolicy;

/**
 * Servlet implementation class NoticeAdminInsertController
 */
@WebServlet("/insert.no")
public class NoticeAdminInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 공지사항 등록 컨트롤러
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전송용량제한
			int maxSize = 10 * 1024 * 1024; 
			// 저장폴더의 물리적 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/notice_upfiles/");
			
			// 전달된 파일 업로드
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new WimbFileRenamePolicy()); 
			
			String bannerTitle = multi.getParameter("bannerTitle");
			String bannerPosition = multi.getParameter("bannerPosition");
			String bannerPath = "resources/images/notice_upfiles/";	
			String originName = multi.getOriginalFileName("bannerFile");
			String changeName = multi.getFilesystemName("bannerFile");				
			
			Banner b = new Banner(bannerTitle, bannerPosition, bannerPath, originName, changeName);
			
		
			int result = new bannerService().insertBanner(b);
			
			if(result > 0) { // 성공 => /wimb/list.banner 재요청
				request.getSession().setAttribute("alertMsg", "배너 등록 완료");
				response.sendRedirect(request.getContextPath() + "/list.banner?cpage=1");
			} else { // 실패 => 에러페이지
				request.setAttribute("errorMsg", "배너 등록 실패");
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
