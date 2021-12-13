<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		border:1px solid red;
		margin:auto;
		margin-top:50px;
		width:1000px;
		height:auto;
	}

	/* 타이틀 영역 */
	.product-list-area{
		box-sizing: border-box;
		border:1px solid red;
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
		border:1px solid red;
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



</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

	<div class="outer">
		<div class="product-list-area">

			<div class="title-area">
				<h4>샐러드</h4>
				<a href="">전체상품</a>
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

						<i class="fas fa-cart-plus fa-2x cart-btn"></i>
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
                <a href="">&lt;</a>
                <a href="">1</a>
                <a href="">&gt;</a>
            </div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>