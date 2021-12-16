package com.wimb.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.wimb.common.WimbFileRenamePolicy;
import com.wimb.product.model.service.ProductService;
import com.wimb.product.model.vo.Product;

/**
 * Servlet implementation class ProductInsertController
 */
@WebServlet("/insert.pr")
public class ProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/product_images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new WimbFileRenamePolicy());
			
			Product p = new Product();
			p.setpCategory(multiRequest.getParameter("productCategory"));
			p.setpName(multiRequest.getParameter("productName"));
			p.setpPrice(Integer.parseInt(multiRequest.getParameter("productPrice")));
			p.setpProvider(multiRequest.getParameter("provider"));
			p.setpProvidePrice(Integer.parseInt(multiRequest.getParameter("supplyPrice")));
			p.setpStock(Integer.parseInt(multiRequest.getParameter("productAmount")));
			p.setpKeyword(multiRequest.getParameter("productKeyword"));
			p.setpShow(multiRequest.getParameter("productStatus"));
			p.setpDetail(multiRequest.getParameter("detailContent"));
			
			// 대표이미지 => 무조건 담겨올 것 (required 속성 부여)
			if(multiRequest.getOriginalFileName("mainImg") != null) {
				p.setpMainImg(multiRequest.getParameter("mainImg"));
			}
			
			// 상세이미지
			if(multiRequest.getOriginalFileName("detailImg") != null) {
				p.setpDetailImg(multiRequest.getParameter("detailImg"));
			}
			
			// 이미지 저장경로
			p.setFilePath("resources/images/product_images/");
			
			int result = new ProductService().insertProduct(p);
			
			if(result > 0) { // 성공
				request.getSession().setAttribute("productMsg", "성공적으로 상품을 등록했습니다.");
				response.sendRedirect(request.getContextPath() + "list.apr?cpage=1");
				
			} else { // 실패
				
				if(p.getpMainImg() != null) { // 대표이미지가 있을 경우
					
					if(p.getpDetailImg() != null) { // 상세 이미지도 있을 경우
						new File(savePath + p.getpDetailImg()).delete();
					}
					
					new File(savePath + p.getpMainImg()).delete();
					
				}
				
				request.setAttribute("errorMsg", "상품 등록 실패");
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
