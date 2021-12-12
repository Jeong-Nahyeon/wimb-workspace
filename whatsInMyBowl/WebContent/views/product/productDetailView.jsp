<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완제품 상세</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	.outer{
		box-sizing: border-box;
		border:1px solid red;
		margin:auto;
		margin-top:50px;
		width:1000px;
		height:auto;
	}

	.main, .btns, .detail, .review, .delivery-info, .product-QnA{
		box-sizing: border-box;
		border:1px solid red;
		margin:auto;
		margin-bottom: 20px;
		width:90%;
	}
	/* 상품 상세 메인  */
	.main{
		box-sizing: border-box;
		border:1px solid red;
		height:500px;
	}
	
	.main-left, .main-right{
		box-sizing: border-box;
		border:1px solid red;
		width:50%;
		height:100%;
		float:left;
	}

	.main-left{
		position:relative;
	}

	.main-left>img{
		width:400px;
		height:400px;
		position:absolute;
		margin:auto;
		top:0;
		bottom:0;
		left:0;
		right:0;
	}

	.main-right{
		position:relative;
	}

	.main-right>.main-content{
		box-sizing: border-box;
		border:1px solid red;
		width:400px;
		height:400px;
		position:absolute;
		margin:auto;
		top:0;
		bottom:0;
		left:0;
		right:0;
	}

	.title, .price, .delivery-charge, .total-price, .main-btns{
		box-sizing: border-box;
		border:1px solid red;
		width:100%;
	}

	.title{
		height:10%;
		margin-bottom:10px;
	}

	/* 상세설명, 리뷰, 배송정보, 상품문의 이동 버튼 */
	.btns{
		box-sizing: border-box;
		border:1px solid red;
		height:50px;
	}
	.btn-detail, .btn-review, .btn-delivery, .btn-QnA{
		box-sizing: border-box;
		border:1px solid red;
		width:25%;
		height:100%;
		float:left;
	}

	/* 상품 상세 설명 */
	.detail{
		box-sizing: border-box;
		border:1px solid red;
		height:2200px; /* auto로 고치기 */
	}

	.detail-content, .detail-img{
		box-sizing: border-box;
		border:1px solid red;
		width:100%;
	}

	.detail-content{
		height:20%;
	}

	.detail-img{
		height:80%;
	}

	/* 리뷰 */

	.review{
		box-sizing: border-box;
		border:1px solid red;
		height:800px;
	}

	.review-title, .review-btn1, .review-content, .review-btn2{
		box-sizing: border-box;
		border:1px solid red;
		width:100%;
	}

	.review-title{
		height:5%;
		margin-bottom:10px;
	}

	.review-btn1, .review-btn2{
		height:5%;
		margin-bottom:20px;
	}

	.review-btn1-left, .review-btn1-right, .review-btn2-left, .review-btn2-right{
		box-sizing: border-box;
		border:1px solid red;
		width:50%;
		height:100%;
		float:left;
	}
	
	.review-content{
		height:24%;
		margin-bottom:20px;
	}

	.review-content-left{
		box-sizing: border-box;
		border:1px solid red;
		width:20%;
		height:100%;
		float:left;
	}

	.review-content-right{
		box-sizing: border-box;
		border:1px solid red;
		width:80%;
		height:100%;
		float:left;
	}

	/* 배송 정보 */
	
	.delivery-info{
		height:300px;
	}

	.delivery-info-title{
		box-sizing: border-box;
		border:1px solid red;
		height:13%;
		margin-bottom: 10px;
	}

	.delivery-info-content{
		box-sizing: border-box;
		border:1px solid red;
		height:84%;
	}

		/* 상품 문의 */
	.product-QnA{
		height:500px;
	}


</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">

		<!-- 상품 상세 메인 -->
		<div class="main">
			<div class="main-left">
				<img src="">
			</div>
			<div class="main-right">
				<div class="main-content">
					<div class="content">
						<h2 style="font-weight: bolder;">닭가슴살 샐러드</h2>
						<br>
						<h5 style="font-weight: bolder;">4900원</h5>
						<span style="font-size: 12px;">
							배송정보 3,000원 / 주문 시 결제 (선결제)
						</span>
						<button type="button" class="btn btn-sm " style="margin-left:58px; font-size:12px; border:1px solid lightgray;">지역별 배송비 추가</button>
						<br>
						<span style="font-size: 12px;">
							전체 결제 금액의 1% 적립 (배송비 제외)
						</span>
					</div>
					<div class="amount">

					</div>
					<div class="total-price">

					</div>
					<table class="main-btns">
						<tr>
							<td class="like-btn">

							</td>
							<td class="buy-btn">

							</td>
							<td class="cart-btn">

							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 상세설명, 리뷰, 배송정보, 상품문의 이동 버튼 -->
		<div class="btns">
			<div class="btn-detail">

			</div>
			<div class="btn-review">

			</div>
			<div class="btn-delivery">

			</div>
			<div class="btn-QnA">

			</div>
		</div>

		<!-- 상품 상세 설명 -->
		<div class="detail">
			<div class="detail-content">

			</div>
			<div class="detail-img">

			</div>
		</div>

		<!-- [고려사항] 
			review 페이지 따로 만들어서 include로 합쳐야 할 듯
		 -->
		<!-- 리뷰 -->
		<div class="review">
			<div class="review-title">

			</div>
			<div class="review-btn1">
				<div class="review-btn1-left">

				</div>
				<div class="review-btn1-right">

				</div>
			</div>
			<div class="review-content">
				<div class="review-content-left">

				</div>
				<div class="review-content-right">
					
				</div>
			</div>
			<div class="review-content">
				<div class="review-content-left">

				</div>
				<div class="review-content-right">
					
				</div>
			</div>
			<div class="review-content">
				<div class="review-content-left">

				</div>
				<div class="review-content-right">
					
				</div>
			</div>
			<div class="review-btn2">
				<div class="review-btn2-left">

				</div>
				<div class="review-btn2-right">
					
				</div>
			</div>
		</div>

		<!-- 배송 정보 -->
		<div class="delivery-info">
			<div class="delivery-info-title">

			</div>
			<div class="delivery-info-content">

			</div>
		</div>

		<!-- 나경님 영역 -->
		<!-- 상품 문의 -->
		<div class="product-QnA">
			상품문의영역
			<!-- 
			<div class="product-QnA-title"></div>
			<div class="product-QnA-content"></div>
			<div class="product-QnA-btns"></div>
			-->
		</div> 
	

	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>