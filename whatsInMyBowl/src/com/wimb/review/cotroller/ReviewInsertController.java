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
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.rev")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 최대파일용량
			int maxSize = 100 * 1024 * 1024; // 100MB
			
			// 저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/review_images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new WimbFileRenamePolicy());
			
			String pCode = multiRequest.getParameter("pcode");
			String pName = multiRequest.getParameter("pname");
			
			// Review 객체
			Review r = new Review();
			r.setOrderCode(multiRequest.getParameter("ocode"));
			r.setmCode(Integer.parseInt(multiRequest.getParameter("mcode")));
			r.setpCode(pCode);
			r.setrContent(multiRequest.getParameter("reviewContent"));
			
			
			// File에 여러번 Insert할 데이터 뽑기
			ArrayList<File> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) { // 첨부파일 존재할 경우
					String changeName = multiRequest.getFilesystemName(key);
					
					File f = new File();
					f.setfName(multiRequest.getOriginalFileName(key));
					f.setfRename(changeName);
					f.setfPath("resources/images/review_images/");
					f.setfExtension(changeName.substring(changeName.lastIndexOf(".")));
					
					list.add(f);
					
				}
				
			}
			
			int result = new ReviewService().insertReview(r, list);

			
			if(result > 0) { // 성공
				
				request.getSession().setAttribute("detailMsg", "성공적으로 후기를 등록했습니다.");
				response.sendRedirect(request.getContextPath() + "/reviewList.rev?cpage=1&pcode=" + pCode + "&pname=" + pName + "#review");
			
			} else { // 실패
				
				if(!list.isEmpty()) { // 첨부파일이 있는 경우 => 삭제
					
					for(File f : list) {

						new java.io.File(savePath + f.getfRename()).delete();
						
					}
				}
				
				request.setAttribute("errorMsg","후기 등록을 실패했습니다.");
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
