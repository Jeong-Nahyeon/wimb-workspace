package com.wimb.customerService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.wimb.common.WimbFileRenamePolicy;
import com.wimb.common.model.vo.File;
import com.wimb.customerService.model.service.InqueryService;
import com.wimb.customerService.model.vo.Inquery;

/**
 * Servlet implementation class InqueryUserInsertController
 */
@WebServlet("/userInsert.inq")
public class InqueryUserInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryUserInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자 - 1대1문의 등록 컨트롤러
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전송용량제한
			int maxSize = 10 * 1024 * 1024; 
			// 저장폴더의 물리적 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/inquery_upfiles/");
			
			// 전달된 파일 업로드
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new WimbFileRenamePolicy()); 
			
			int mCode = Integer.parseInt(multi.getParameter("userNo"));
			String iCategory = multi.getParameter("inquiry_category");
			String iTitle = multi.getParameter("title");
			String iContent = multi.getParameter("content");
			
			Inquery inq = new Inquery(mCode, iCategory, iTitle, iContent);
			
			// File에 여러번 insert할 데이터 뽑기
			ArrayList<File> list = new ArrayList<>(); // 공지사항 등록 시 첨부파일이 없을 수도 있고, 여러개 존재할수도 있음
			
			for(int i=1; i<=2; i++) {
				String key = "file" + i;
				
				if(multi.getOriginalFileName(key) != null) { 
					// 첨부파일이 존재할경우 => File 객체 생성 => 원본명, 수정명, 저장경로, 확장자 
					File f = new File();
					f.setfName(multi.getOriginalFileName(key));
					f.setfRename(multi.getFilesystemName(key));
					f.setfPath("resources/images/inquery_upfiles/");
					
					list.add(f);
				}
			}
			
			// list : 넘어온 첨부파일이 없다면 null로 전달
			int result = new InqueryService().insertInquery(inq, list);
		
			if(result > 0) { // 성공 => URL 재요청
				request.getSession().setAttribute("alertMsg", "1:1문의 등록 완료");
				response.sendRedirect(request.getContextPath() + "/userEnrollForm.inq");
			} else { // 실패 => 에러페이지
				request.setAttribute("errorMsg", "1:1문의 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);	
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
