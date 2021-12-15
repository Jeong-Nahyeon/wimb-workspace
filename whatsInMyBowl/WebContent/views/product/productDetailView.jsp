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
		margin-top:20px;
		width:1000px;
		height:auto;
	}

	/* 상품 상세 메인  */

	.main{
		box-sizing: border-box;
		border:1px solid red;
		margin:auto;
		margin-bottom: 20px;
		width:90%;
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

	.content, .amount,.total-price, .main-btns{
		box-sizing: border-box;
		border:1px solid red;
		width:100%;
	}

	.content{
		border-bottom:2px solid lightgray;
		height:50%;
		margin-bottom:10px;
	}

	.amount{
		border-bottom:2px solid lightgray;
		height:15%;
		margin-bottom:10px;
		padding-top: 10px;
	}

	.total-price{
		height:15%;
		margin-bottom:10px;
		padding-top: 10px;
	}
	
	.main-btns{
		height:13%;
	}
	
	.main-btns *{
		margin-top:10px;
	}


	/* 상세설명, 리뷰, 배송정보, 상품문의 이동 버튼 */

	.btns{
		box-sizing: border-box;
		border:1px solid red;
		margin:auto;
		margin-bottom: 20px;
		width:90%;
		height:50px;
	}
	.btn-detail, .btn-review, .btn-delivery, .btn-QnA{
		box-sizing: border-box;
		border:1px solid red;
		width:25%;
		height:100%;
		float:left;
	}

	.btns a{
		box-sizing: border-box;
		border:1px solid lightgray;
		text-decoration: none !important;
		display:block;
		width:100%;
		height:100%;
		color:black;
		text-align: center;
		line-height: 40px;
	}

	/* 상품 상세 설명 */
	.detail{
		box-sizing: border-box;
		border:1px solid red;
		margin:auto;
		margin-bottom: 20px;
		width:90%;
		height:auto;
	}

	.detail-content, .detail-img{
		box-sizing: border-box;
		border:1px solid red;
		width:100%;
	}

	.detail-content{
		height:auto;
		padding:10px;
	}

	.detail-img{
		height:auto;
	}

	

	/* 배송 정보 */
	
	.delivery-info{
		box-sizing: border-box;
		border:1px solid red;
		margin:auto;
		margin-bottom: 20px;
		width:90%;
		height:300px;
	}

	.delivery-info-title{
		box-sizing: border-box;
		border:1px solid red;
		height:13%;
		margin-bottom: 10px;
		border-bottom: 2px solid lightgray;
	}

	.delivery-info-content{
		box-sizing: border-box;
		border:1px solid red;
		height:84%;
		padding:10px;
	}




	/* 나경님 파일 합치면 삭제 */
	/* 상품 문의 */
	.product-QnA{
		box-sizing: border-box;
		border:1px solid red;
		margin:auto;
		margin-bottom: 20px;
		width:900px;
		height:600px;
	}


	/* 모달창 스타일 */





	/* 모달창 배경 스타일 */

	/* .modal-backdrop {
		position: fixed;
		top: 0;
		left: 0;
		z-index: 1040;
		width: 100vw;
		height: 100vh;
		background-color: white !important;
	} */

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

					<!-- 지역별 추가 배송비 창 => 기본 안 보이게 설정 -->
					<div class="extra-fee" style="border:2px solid lightgray; background:white; width:250px; height:100px; padding:5px; position:relative; z-index:2; top:260px; left:145px; display: none;">
						<i class="far fa-times-circle" style="margin-left: 215px; color:lightgray;"></i>
						
						<ul style="font-size:13px; font-weight: bolder; padding-left:30px; margin-top:10px;">
							<li>제주특별자치도 서귀포시 3000원</li>
							<li>제주특별자치도 제주시 3000원</li>
						</ul>
					</div>
					<div class="content" style="position:relative; z-index:1;">
						<h2 style="font-weight: bolder;">닭가슴살 샐러드</h2>
						<br>
						<!-- case1. 원가 -->
						<h5 style="font-weight: bolder; ">4900원</h5>
						<!-- case2. 할인가 -->
						<!-- <h5 style="font-weight: bolder; text-decoration: line-through; color:lightgray; display: inline-block;">4900원</h5>
						<h3 style="font-weight: bolder; color:salmon; display: inline-block;">4410원</h3> -->
						<br>
						<span style="font-size: 12px;">
							배송정보 3,000원 / 주문 시 결제 (선결제)
						</span>
						<button type="button" class="btn btn-sm " style="margin-left:55px; font-size:12px; border:1px solid lightgray;">지역별 배송비 추가</button>
						<br>
						<span style="font-size: 12px;">
							전체 결제 금액의 1% 적립 (배송비 제외)
						</span>
					</div>
					
					<div class="amount">
						<span>닭가슴살 샐러드</span>
						<span style="margin-left:175px;">
							<i class="fas fa-minus" onclick='count("minus")' value="-" style="cursor:pointer" style="color:lightgray;"></i>
							<input type="text" id="amount" name="amount" value="1" readonly style="width:50px; height:25px; text-align:center; border:1px solid lightgray; margin:0 5px;">
							<i class="fas fa-plus" onclick='count("plus")' value="+" style="cursor:pointer"></i>
						</span>
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

					<div class="total-price" align="right">
						<span style="font-size:20px; font-weight: bolder;">총 합계 금액</span>
						<!-- case1. 원가 총합 -->
						<span style="color:#9BD5BD; font-size:30px; font-weight: bolder; margin-left:30px;">4900원</span>
						<!-- case2. 할인가 총합 -->
						<!-- <span style="color:#9BD5BD; font-size:30px; font-weight: bolder; margin-left:30px;">4410원</span> -->
					</div>

					<table class="main-btns">
						<tr>
							<td class="like-btn" width="20%" align="center">
								<!-- case1. 찜 안 했을 경우 -->
								<i class="far fa-heart fa-2x" style="color:#9BD5BD;"></i>
								<!-- case2. 찜 했을 경우 -->
								<!-- <i class="fas fa-heart fa-2x" style="color:#9BD5BD;"></i> -->
							</td>
							<td class="buy-btn" width="40%">
								<button class="btn" style="background:#9BD5BD; color:white; font-weight: bolder; width:100%;">바로구매</button>
							</td>
							<td class="cart-btn" width="40%">
								<button class="btn" id="cart-btn"style="border:1px solid #9BD5BD; color:#9BD5BD; font-weight: bolder; width:100%;">장바구니</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 상세설명, 리뷰, 배송정보, 상품문의 이동 버튼 -->
		<div class="btns">
			<div class="btn-detail">
				<a href="#detail">상세설명</a>
			</div>
			<div class="btn-review">
				<a href="#review">상품후기 (110)</a>
			</div>
			<div class="btn-delivery">
				<a href="#delivery-info">배송정보</a>
			</div>
			<div class="btn-QnA">
				<a href="#product-QnA">상품문의</a>
			</div>
		</div>

		<!-- 상품 상세 설명 -->
		<div id="detail" class="detail" align="center">
			<div class="detail-content">
				<p>상품상세설명내용</p>
			</div>
			<div class="detail-img">
				상품상세설명이미지
				<img src="">
			</div>
		</div>

		<!-- 리뷰 -->
		<%@ include file="../review/reviewListView.jsp"%>

		<!-- 배송 정보 -->
		<div id="delivery-info" class="delivery-info">
			<div class="delivery-info-title">
				<h4 style="font-weight: bolder;">배송정보</h4>
			</div>
			<div class="delivery-info-content">
				<p>배송정보내용</p>
			</div>
		</div>

		<!-- 나경님 영역 => include로 합치기 -->
		<!-- 상품 문의 -->
		<div id="product-QnA" class="product-QnA">
			상품문의영역
			<!-- 
			<div class="product-QnA-title"></div>
			<div class="product-QnA-content"></div>
			<div class="product-QnA-btns"></div>
			-->
		</div> 
	

	</div>

	
	<%@ include file="../common/footer.jsp" %>


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
			$("#cart-btn").click(function(){
			$("#cart-success-modal").modal({backdrop: "static"});
			});
		});
	</script>


	



</body>
</html>