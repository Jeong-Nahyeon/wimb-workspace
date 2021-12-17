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
@WebServlet("/insert.apr")
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
			
			String productCategory = multiRequest.getParameter("productCategory");
			String productName = multiRequest.getParameter("productName");
			int productPrice = Integer.parseInt(multiRequest.getParameter("productPrice"));
			String provider = multiRequest.getParameter("provider");
			int supplyPrice = Integer.parseInt(multiRequest.getParameter("supplyPrice"));
			int productAmount = Integer.parseInt(multiRequest.getParameter("productAmount"));
			String productKeyword = multiRequest.getParameter("productKeyword");
			String productStatus = multiRequest.getParameter("productStatus");
			String detailContent = multiRequest.getParameter("detailContent");
			
			String filePath = "resources/images/product_images/";
			
			String mainImg = null;
			if(multiRequest.getOriginalFileName("mainImg") != null) {
				mainImg = multiRequest.getFilesystemName("mainImg");
			}
			
			String detailImg = null;
			if(multiRequest.getOriginalFileName("detailImg") != null) {
				detailImg = multiRequest.getFilesystemName("detailImg");
			}
			
			
			Product p = new Product(productName, productCategory, productPrice, provider, supplyPrice,
									mainImg, detailImg, detailContent, productStatus, productAmount, productKeyword, filePath);
			
			int result = new ProductService().insertProduct(p);
		
			if(result > 0) { // 성공
				request.getSession().setAttribute("productMsg", "성공적으로 상품을 등록했습니다.");
				response.sendRedirect(request.getContextPath() + "/list.apr?cpage=1");
				
			} else { // 실패
				
				if(p.getpMainImg() != null) { // 대표이미지가 있을 경우
					new File(savePath + p.getpMainImg()).delete();
				}
				
				if(p.getpDetailImg() != null) { // 상세 이미지 있을 경우
					new File(savePath + p.getpDetailImg()).delete();
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
