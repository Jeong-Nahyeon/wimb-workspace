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
 * Servlet implementation class ProductUpdateController
 */
@WebServlet("/update.apr")
public class ProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			System.out.println("잘 실행되나?");
			
			int maxSize = 100 * 1024 * 1024; //100mb
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/product_images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new WimbFileRenamePolicy());
			
			String productCode = multiRequest.getParameter("productCode");
			String productCategory = multiRequest.getParameter("productCategory");
			String productName = multiRequest.getParameter("productName");
			int productPrice = Integer.parseInt(multiRequest.getParameter("productPrice"));
			String provider = multiRequest.getParameter("provider");
			int supplyPrice = Integer.parseInt(multiRequest.getParameter("supplyPrice"));
			int productAmount = Integer.parseInt(multiRequest.getParameter("productAmount"));
			String productKeyword = multiRequest.getParameter("productKeyword");
			String productStatus = multiRequest.getParameter("productStatus");
			String detailContent = multiRequest.getParameter("detailContent");
			
			// 기존에 존재하는 상세이미지 => Dao에서 조건 검사할 때 필요
			String existingDetailImg = "";
			
			if(multiRequest.getParameter("existingDetailImg") != null) {
				existingDetailImg = multiRequest.getParameter("existingDetailImg");
			}
			
			// 대표이미지
			String mainImg = "";
			
			if(multiRequest.getOriginalFileName("mainImg") != null) {
				mainImg = multiRequest.getFilesystemName("mainImg");
			}
			
			// 상세이미지
			String detailImg = "";
			
			if(multiRequest.getOriginalFileName("detailImg") != null) {
				detailImg = multiRequest.getFilesystemName("detailImg");
			}
			
			Product p = new Product(productCode, productName, productCategory, productPrice,
									provider, supplyPrice, mainImg, detailImg, detailContent,
									productStatus, productAmount, productKeyword);
			
			int result = 0;
			
			if(!mainImg.equals("") || !detailImg.equals("")) { // 대표이미지와 상세이미지 둘 중에 하나라도 새로운 파일 있을 경우
				
				// 대표이미지만 있거나 둘다 있을 경우
				if(!mainImg.equals("")) {
					result = new ProductService().updateAdminProductNewMainImg(p, existingDetailImg);
				}
				
				// 상세이미지만 있을 경우
				if(!detailImg.contentEquals("")) {
					result = new ProductService().updateAdminProductNewDetailImg(p);
				}
				
			} else {
				// 대표이미지와 상세이미지 둘 다 새로운 파일 없을 경우
				result = new ProductService().updateAdminProduct(p);
				
			}
			
			if(result > 0) {
					
				request.getSession().setAttribute("productMsg", "성공적으로 수정되었습니다");
				response.sendRedirect(request.getContextPath() + "/updateDeleteList.apr?cpage=1");
				
			} else {
				
				if(p.getpMainImg() != null) { // 대표이미지가 있을 경우
					new File(savePath + p.getpMainImg()).delete();
				}
				
				if(p.getpDetailImg() != null) { // 상세 이미지 있을 경우
					new File(savePath + p.getpDetailImg()).delete();
				}
				
				request.setAttribute("errorMsg", "상품 수정 실패");
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
