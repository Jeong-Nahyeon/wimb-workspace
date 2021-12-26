package com.wimb.review.cotroller;

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
import com.wimb.review.model.service.ReviewService;
import com.wimb.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/update.rev")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
						
			int maxSize = 100 * 1024 * 1024; //100mb
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/review_images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new WimbFileRenamePolicy());
			
			// 상품번호
			String pCode = multiRequest.getParameter("pcode");
			
			// 상품이름
			String pName = multiRequest.getParameter("pname");
			
			// 리뷰번호
			int rCode = Integer.parseInt(multiRequest.getParameter("rcode"));
			
			// 리뷰내용
			String rContent = multiRequest.getParameter("reviewContent");
			
			Review r = new Review();
			r.setrCode(rCode);
			r.setrContent(rContent);
			
			ArrayList<File> fileList1 = new ArrayList<>(); // 새로운 첨부파일 O + 기존파일 O
			ArrayList<File> fileList2 = new ArrayList<>(); // 새로운 첨부파일 O + 기존파일 X
			String filePath = "resources/images/review_images/";
			
			int result1 = 0; // 새로운 첨부파일 X 
			int result2 = 0; // 새로운 첨부파일 O + 기존파일 O
			int result3 = 0; // 새로운 첨부파일 O + 기존파일 X
			
			
			result1 = new ReviewService().updateReviewOnly(r); // 리뷰만 수정
			
			
			// 첨부파일 최대 3개 수정
			for(int i=1; i<=3; i++) {
					
				 File f = new File();
				 String newKey = "file" + i;
				 String oldKey = "originfCode" + i;
				 
				if(multiRequest.getOriginalFileName(newKey) != null) { // 새로 넘어온 첨부파일이 있을 경우 
					
					f.setfName(multiRequest.getOriginalFileName(newKey));
					f.setfRename(multiRequest.getFilesystemName(newKey));
					f.setfPath(filePath);
					
					String originName = multiRequest.getOriginalFileName(newKey);
					f.setfExtension(originName.substring(originName.lastIndexOf(".")));
					
					
					
					if(multiRequest.getParameter(oldKey) != null) { // 기존파일 O
						
						
						if(oldKey.equals("originfCode1")) { // 기존 대표이미지 있고 새로운 대표이미지 있을 경우
							r.setMainImg(filePath + multiRequest.getFilesystemName(newKey));
						}

						f.setfCode(Integer.parseInt(multiRequest.getParameter(oldKey)));
						
						fileList1.add(f);
						
						
					} else { // 기존파일 X
												
						if(newKey.equals("file1")) { // 새로운 대표이미지만 있을 경우
							r.setMainImg(filePath + multiRequest.getFilesystemName(newKey));
						}
						
						f.setfRefCode(rCode);
						
						fileList2.add(f);
					
					}
					
				} 
				
			}
			
		
				
			result2 = new ReviewService().updateReviewUpdateFile(r, fileList1); // 리뷰 및 파일 수정
			
			result3 = new ReviewService().updateReviewInsertFile(r, fileList2); // 리뷰 수정 및 파일 추가
			
			
			
		 
			
			if(result1 > 0 || result2 > 0 || result3 > 0) { // 성공
				
				request.getSession().setAttribute("detailMsg", "성공적으로 수정되었습니다");
				response.sendRedirect(request.getContextPath() + "/reviewList.rev?cpage=1&pcode=" + pCode + "&pname=" + pName + "#review");
			
			} else { // 실패
				
				// fileList1 첨부파일이 있는 경우 => 삭제
				if(!fileList1.isEmpty()) { 
					
					for(File f : fileList1) {

						new java.io.File(savePath + f.getfRename()).delete();
						
					}
					
				}
				
				// fileList2 첨부파일이 있는 경우 => 삭제
				if(!fileList2.isEmpty()) { 
					
					for(File f : fileList2) {

						new java.io.File(savePath + f.getfRename()).delete();
						
					}
					
				}
				
				request.getSession().setAttribute("detailMsg", "후기 수정을 실패했습니다");
				response.sendRedirect(request.getContextPath() + "/reviewList.rev?cpage=1&pcode=" + pCode + "&pname=" + pName + "#review");
			
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
