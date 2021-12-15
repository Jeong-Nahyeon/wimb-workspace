<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.wimb.common.model.vo.PageInfo" %>
    
<%
	PageInfo pi = (PageInfo)(request.getAttribute("pi"));

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완제품 목록</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	.outer{
		box-sizing: border-box;
		/* border:1px solid red; */
		margin:auto;
		margin-top:50px;
		width:1000px;
		height:auto;
	}

	/* 타이틀 영역 */
	.product-list-area{
		box-sizing: border-box;
		/* border:1px solid red; */
		margin:auto;
		width:90%;
	}

	.title-area{
		box-sizing: border-box;
		/* border:1px solid red; */
		border-bottom:2px solid lightgray;
		margin:auto;
		margin-bottom: 20px;
		width:100%;
		height:50px;
		line-height: 50px;
	}

	.title-area>h4{
		font-weight: bolder;
		display:inline-block;
		margin-right:40px;
	}

	.title-area>a{
		margin-right:10px;
		color:black;
		text-decoration: none;
	}

	.title-area>a:{
		font-weight: border;
		font-size: large;
		color:#9BD5BD;
	}

	/* 상품 정렬 목록 */
	.sort-list-area{
		box-sizing: border-box;
		/* border:1px solid red; */
		margin:auto;
		margin-bottom: 20px;
		width:100%;
		height:50px;
		line-height: 50px;
	}

	/* 상품 목록 */

	.product-area{
		box-sizing: border-box;
		/* border:1px solid red; */
		margin:auto;
		width:100%;
	}

	.product{
		box-sizing: border-box;
		/* border:1px solid red; */
		width:200px;
		height:260px;
		display: inline-block;
		margin-top: 20px;
		margin-right: 10px;
		margin-left: 10px;
		margin-bottom: 50px;
	}

	.product-img{
		box-sizing: border-box;
		/* border:1px solid red; */
		background: white;
		width:200px;
		height:200px;
		margin-bottom: 5px;
		position: relative;
		overflow: hidden;

		cursor:pointer;
	}

	.product-img>img{
		box-sizing: border-box;
		width:200px;
		height:200px;
		transform: scale(1);
		
	}

	.product-img>img:hover{
		transform: scale(1.05);
		transition-duration: 0.1s;
		
		
	}

	.heart-btn{
		position: absolute;
		left:10px;
		bottom:10px;
		color:#ffffff;
		text-shadow: 0px 0px 20px black;

		transform: scale(1);
	}

	.cart-btn{
		position: absolute;
		right:10px;
		bottom:10px;
		color:#ffffff;
		text-shadow: 0px 0px 20px black;

		transform: scale(1);
	}

	.heart-btn:hover, .cart-btn:hover{
		transform: scale(1.05);
		transition-duration: 0.1s;
	}

	.product h6{
		/* border:1px solid red; */
		font-weight: bolder;
		display:inline-block;
	}
	.product h4{
		/* border:1px solid red; */
		font-weight: bolder;
		display:inline-block;
		color: #9BD5BD
		
	}

	/* 장바구니 모달창 */

	.cart-product{
		/* border:1px solid red; */
		width:100%;
		height:200px;
	}

	.cart-product-img{
		/* border:1px solid red; */
		width:200px; 
		height:200px; 
		float:left;
	}

	.cart-product-content{
		/* border:1px solid red; */
		width:264px; 
		height:200px; 
		float:left; 
		padding:20px; 
		padding-bottom:20px;
	}

	#amount{
		border:1px solid lightgray;
		width:50px;
		height:25px;
		text-align:center;
		margin:0 5px;
	}

	#cart-close-btn{
		background:white;
		border:1px solid lightgray;
		margin:0px 5px;
	}


	/* 모달창 배경 스타일 */

	.modal-backdrop {
		position: fixed;
		top: 0;
		left: 0;
		z-index: 1040;
		width: 100vw;
		height: 100vh;
		background-color: white !important;
	}

</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

	<div class="outer">
		<div class="product-list-area">

			<div class="title-area">
				<h4>샐러드</h4>
				<a href="<%= contextPath %>/list.pr?pno=1">전체상품</a>
				<a href="">비건샐러드</a>
				<a href="">육류샐러드</a>
				<a href="">해산물샐러드</a>
			</div>

			<div class="sort-list-area" align="right">
				<select class="selectpicker" name="select-sort" style="border:1px solid lightgray;">
					<option value="">신상품순</option>
					<option value="">인기상품순</option>
					<option value="">낮은가격순</option>
					<option value="">높은가격순</option>
				</select>
			</div>

			<div class="product-area">

				<div class="product">
					<div class="product-img">
						<img src="../../resources/images/product_images/main_images/meatsalad1.jpg">
					
						<!-- case1. 찜 안 했을 경우 -->
						<i class="far fa-heart fa-2x heart-btn"></i>
					<!-- case2. 찜 했을 경우 -->
						<!-- <i class="fas fa-heart fa-2x heart-btn"></i> -->

						<i id="cart-btn" class="fas fa-cart-plus fa-2x cart-btn"></i>
					</div>

					<h6>닭가슴살 샐러드</h6>

					<!-- case1. 원가 -->
					<h4>4900원</h4>
					<!-- case2. 할인가 -->
					<!-- <h4 style="text-decoration: line-through; color:lightgray; font-size: medium;">4900원</h4>
					<h4 style="color:salmon;">4410원</h4> -->
				</div>
				<div class="product">
					<div class="product-img">
						<img src="../../resources/images/product_images/main_images/meatsalad1.jpg">
						<i class="far fa-heart fa-2x heart-btn"></i>
						<i class="fas fa-cart-plus fa-2x cart-btn"></i>
					</div>
					<h6>닭가슴살 샐러드</h6>
					<h4>4900원</h4>
				</div>
				<div class="product">
					<div class="product-img">
						<img src="../../resources/images/product_images/main_images/meatsalad1.jpg">
						<i class="far fa-heart fa-2x heart-btn"></i>
						<i class="fas fa-cart-plus fa-2x cart-btn"></i>
					</div>
					<h6>닭가슴살 샐러드</h6>
					<h4>4900원</h4>
				</div>
				<div class="product">
					<div class="product-img">
						<img src="../../resources/images/product_images/main_images/meatsalad1.jpg">
						<i class="far fa-heart fa-2x heart-btn"></i>
						<i class="fas fa-cart-plus fa-2x cart-btn"></i>
					</div>
					<h6>닭가슴살 샐러드</h6>
					<h4>4900원</h4>
				</div>
				

			</div>

			<!-- 페이징바 -->
            <div id="paging-bar" align="center">
            	<ul class="pagination">
            		<% if(currentPage != 1) { %>
				   		 <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.pr?cpage=<%= currentPage - 1 %>">&lt;</a></li>
				    <% } %>
				    
				    <% for(int p=startPage; p<=endPage; p++ ) { %>
				    	<% if(p == currentPage) { %>
					    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
					    <% } else { %>
					  		 <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.pr?cpage=<%= p %>"><%= p %></a></li>
					    <% } %>
				    <% } %>
				    
				    <% if(currentPage != maxPage) { %>
				 		   <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.pr?cpage=<%= currentPage + 1 %>">&gt;</a></li>
				    <% } %>
			    </ul>
            </div>
		</div>
	</div>
	
	
	<%@ include file="../common/footer.jsp" %>
	<button id="cart-success-btn">장바구니 담기 성공 창 테스트</button>


	<!-- 장바구니 모달창 -->
    <div class="modal fade" id="cart-modal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content cart-modal-content">
                
                <!-- Modal Header -->
                <div class="modal-header cart-title-area">
                    <h6 class="modal-title">장바구니 담기</h6>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body cart-content-area">
                    <form action="" id="cart-insert-form" method="get">
                      
						<div class="cart-product">
						   
							<div class="cart-product-img">
								<img src="" style="width:100%; height:100%;">
						   </div>

						   <div class="cart-product-content">
								
								<h4 style="font-weight:bolder; margin-bottom: 30px;" align="left">닭가슴살 샐러드</h4>
								
								<span>수량 선택</span>
								<span style="margin-left:50px;">
									<i class="fas fa-minus" onclick='count("minus")' value="-" style="cursor:pointer" style="color:lightgray;"></i>
									<input type="text" id="amount" name="amount" value="1" readonly>
									<i class="fas fa-plus" onclick='count("plus")' value="+" style="cursor:pointer"></i>
								</span>
								<hr>

								<h2 style="font-weight: bolder; color:#9BD5BD;" align="right">4900원</h2>
						   
							</div>

							<!-- 수량 표시 영역 기능 -->
							<script>
								function count(type)  {
									// 결과를 표시할 element
									const amount = document.getElementById('amount');
									
									// 현재 화면에 표시된 값
									let number = amount.value;
									
									// 더하기/빼기
									if(type === 'plus') {
										number = parseInt(number) + 1;
									}else if(type === 'minus')  {
										if(number != '1'){
											number = parseInt(number) - 1;
										} else{
											number = 1;
										}
										
									}
									
									// 결과 출력
									amount.value = number;
								}
							</script>

					   </div>
					   
                    </form>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer button-area">
					<div class="btns" align="center" style="width:100%;">
						<button type="reset" id="cart-close-btn" class="btn btn-sm" data-dismiss="modal">취소</button>
						<button type="submit" id="cart-insert-btn" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;" form="cart-insert-form">등록</button>
					</div>
                </div>
            
            </div>
        </div>
    </div>
	<script>
		$(document).ready(function(){
			$("#cart-btn").click(function(){
			$("#cart-modal").modal({backdrop: "static"});
			});
		});
	</script>


		   
	<!-- 장바구니 담기 성공 모달창  -->

	<div class="modal fade" id="cart-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px; height:350px;">
			<div class="modal-content success-cart-modal">
				
				<!-- Modal Header -->
				<div class="modal-header title-area">
					<h6 class="modal-title">장바구니 담기</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body content-area">
					<div class="cart-success-img" align="center" style=" height:40%;">
						<i class="fas fa-cart-plus fa-4x" style="color:#9BD5BD;"></i>
					</div>

					<div class="cart-success-content" align="center" style=" height:60%;">
						<br>
						<b>상품이 장바구니에 담겼습니다.</b>
						<br>
						바로 확인하시겠습니까?
					</div>

				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area">
					<div class="cart-success-btns" align="center" style="width:100%;">
						<button type="button" class="btn btn-sm" style="border:1px solid lightgray; margin:0px 5px;" data-dismiss="modal">취소</button>
						<button type="submit" id="cart-page-btn" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#cart-success-btn").click(function(){
			$("#cart-success-modal").modal({backdrop: "static"});
			});
		});
	</script>

</body>
</html>