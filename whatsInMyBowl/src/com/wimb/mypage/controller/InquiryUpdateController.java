package com.wimb.mypage.controller;

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
import com.wimb.customerService.model.service.InquiryService;
import com.wimb.customerService.model.vo.Notice;
import com.wimb.mypage.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryUpdateController
 */
@WebServlet("/InquiryUpdate.my")
public class InquiryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전송용량제한
			int maxSize = 10 * 1024 * 1024; 
			// 저장폴더의 물리적 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/inquiry_upfiles/");
			
			// 전달된 파일 업로드
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new WimbFileRenamePolicy()); 
			
			// 수정 시 공통적으로 수행할 부분 : Update Notice
			int iCode = Integer.parseInt(multi.getParameter("inquiryNo"));
			int mCode = Integer.parseInt(multi.getParameter("userNo"));
			String iCategory = multi.getParameter("inquiry_category");
			String iTitle = multi.getParameter("title");
			String iContent = multi.getParameter("content");
			
			Inquiry inq = new Inquiry(iCode, mCode, iCategory, iTitle, iContent);
			
			// File에 여러번 insert할 데이터 뽑기
			ArrayList<File> list = new ArrayList<>(); // 공지사항 등록 시 첨부파일이 없을 수도 있고, 여러개 존재할수도 있음
			
			for(int i=1; i<=2; i++) {
				String key = "file" + i;
				
				if(multi.getOriginalFileName(key) != null) { 
					// 첨부파일이 존재할경우 => File 객체 생성 => 원본명, 수정명, 저장경로, 확장자 
					File f = new File();
					f.setfName(multi.getOriginalFileName(key));
					f.setfRename(multi.getFilesystemName(key));
					f.setfPath("resources/images/inquiry_upfiles/");
					
					if(multi.getParameter("originFileNo") != null) {
						// 기존의 첨부파일이 있었을경우 => update file => 기존의 첨부파일 번호 필요
						f.setfCode(Integer.parseInt(multi.getParameter("originFileNo")));
						list.add(f);
					}  else {
						// 기존의 첨부파일이 없었을경우 => insert file => 현재 게시글 번호 필요
						f.setfRefCode(iCode);
						list.add(f);
						
					}
					
					// 넘어온 첨부파일이 없었을 경우 list는 계속 null;
				}
			}
				int result = new InquiryService().updateInq(inq, list);
				// 새로운 첨부파일이 없을경우                       => n, null              => updateNotice
				// 새로운 첨부파일o, 기존 첨부파일o     => n, fCode가 담긴 list    => updateNotice, update File
				// 새로운 첨부파일o, 기존 첨부파일x     => n, refCode가 담긴 list  => updateNotice, insert File
				
				if(result > 0) { // 성공 => URL 재요청
					request.getSession().setAttribute("alertMsg", "공지사항 수정 완료");
					response.sendRedirect(request.getContextPath() + "/adminDetailView.no?num=" + iCode);
				} else { // 실패 => 에러페이지
					request.setAttribute("errorMsg", "공지사항 수정 실패");
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
