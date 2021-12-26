<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.wimb.product.model.vo.Product" %>
    
<%
	Product p = (Product)(request.getAttribute("p"));

%>    
    
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
		/* border:1px solid red; */
		margin:auto;
		margin-top:20px;
		width:1000px;
		height:auto;
	}

	/* 상품 상세 메인  */

	.main{
		box-sizing: border-box;
		/* border:1px solid red; */
		margin:auto;
		margin-bottom: 20px;
		width:90%;
		height:500px;
	}
	
	.main-left, .main-right{
		box-sizing: border-box;
		/* border:1px solid red; */
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
		/* border:1px solid red; */
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
		/* border:1px solid red; */
		width:100%;
	}
	
	.content{
		border-bottom:2px solid lightgray;
		height:50%;
		margin-bottom:10px;
		position:relative; z-index:1;
	}
	
	#extra-fee{
		border:2px solid lightgray;
		background:white;
		width:250px;
		height:70px;
		padding:5px;
		position:relative;
		z-index:5; top:-125px;
		left:145px;
		display:none;
	}

	#extra-fee ul{
		font-size:13px;
		font-weight:bolder;
		padding-left:30px;
		margin-top:10px;
	}

	#extra-fee-btn{
		margin-left:55px;
		font-size:12px;
		border:1px solid lightgray;
	}

	#line-through-cost{
		font-weight:bolder;
		text-decoration:line-through;
		color:lightgray;
		display: inline-block;
	}

	.discount-area{
		font-weight:bolder;
		color:salmon;
		display:inline-block;
	}

	.cost-area{
		font-weight:bolder;
		display: inline-block;
	}

	.amount{
		border-bottom:2px solid lightgray;
		height:15%;
		margin-bottom:10px;
	}

	#amount{
		width:50px;
		height:25px;
		text-align:center;
		border:1px solid lightgray;
		margin:0 5px;
	}

	.total-price{
		height:15%;
		margin-bottom:10px;
		padding-top: 10px;
	}

	.total-price-area{
		color:#9BD5BD;
		font-size:30px;
		font-weight:bolder;
		margin-left:30px;
	}
	
	.main-btns{
		height:13%;
	}
	
	.main-btns *{
		margin-top:10px;
	}

	#buy-btn{
		background:#9BD5BD;
		color:white;
		font-weight:bolder;
		width:100%;
	}

	#cart-btn{
		border:1px solid #9BD5BD;
		color:#9BD5BD;
		font-weight:bolder;
		width:100%;
	}


	/* 상세설명, 리뷰, 배송정보, 상품문의 이동 버튼 */

	.btns{
		box-sizing: border-box;
		/* border:1px solid red; */
		margin:auto;
		margin-bottom: 20px;
		width:90%;
		height:50px;
	}
	.btn-detail, .btn-review, .btn-delivery, .btn-QnA{
		box-sizing: border-box;
		/* border:1px solid red; */
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
		/* border:1px solid red; */
		margin:auto;
		margin-bottom: 20px;
		width:90%;
		height:auto;
	}

	.detail-content, .detail-img{
		box-sizing: border-box;
		/* border:1px solid red; */
		width:100%;
	}

	.detail-content{
		height:auto;
		padding:10px;
	}

	.detail-img{
		height:auto;
	}

    /* 모달창 스타일 */


	/* 리뷰 등록 및 수정 모달창 */

    .review-product{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:100%;
        height:120px;
    }

    .review-product-img{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:20%;
        height:100%;
        line-height: 110px;
        float: left;
    }

    .review-product-name{
        /* border:1px solid red; */
        box-sizing:border-box;
        width:80%;
        height:100%;
        float: left;
    }

    .review-form-content{
        box-sizing:border-box;
        width:100%;
        height:500px;
        text-align: center;
    }  

    .review-form-content input, .review-form-content textarea{
        border:1px solid lightgray;
        width:100%;
    }


    /* 리뷰 신고 창  */

    .report-review{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:100%;
        height:120px;
    }

    .report-review-img{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:20%;
        height:100%;
        line-height: 110px;
        float: left;
    }

    .report-review-title{
        /* border:1px solid red; */
        box-sizing:border-box;
        width:80%;
        height:100%;
        float: left;
    }

    .report-form-content{
        box-sizing:border-box;
        width:100%;
        height:500px;
        text-align: center;
    }  

    .report-form-content input, .report-form-content textarea, .report-form-content select{
        border:1px solid lightgray;
        width:100%;
    }
	

	/* 배송 정보 */
	
	.delivery-info{
		box-sizing: border-box;
		/* border:1px solid red; */
		margin:auto;
		margin-bottom: 20px;
		width:90%;
		height:300px;
	}

	.delivery-info-title{
		box-sizing: border-box;
		/* border:1px solid red; */
		height:13%;
		margin-bottom: 10px;
		border-bottom: 2px solid lightgray;
	}

	.delivery-info-content{
		box-sizing: border-box;
		/* border:1px solid red; */
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
<%--	
	<script>
		$(function(){
			$.ajax({
				url:"reviewList.re?cpage=1",
				data:{pcode:"<%= p.getpCode() %>"},
				success:function(review){
					console.log(review);
				}, error:function(){
					console.log("ajax 통신 실패");
				} 
			});
		});
	</script>
--%>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">

		<!-- 상품 상세 메인 -->
		<div class="main">
			<div class="main-left">
				<img src="<%= p.getFilePath() %><%= p.getpMainImg() %>">
			</div>
			<div class="main-right">
				<div class="main-content">

					<div class="content">
						<h4 style="font-weight: bolder;"><%= p.getpName() %></h4>
						<!-- 장바구니 관련 상품코드 -->
						<input type="hidden" id="productCode" value="<%= p.getpCode() %>">
						<br>
						<% if(p.getDiscountPrice() != 0) { %>
							<!-- case1. 할인가 -->
							<h5 id="line-through-cost"><%= p.getpPrice() %>원</h5>
							<h3 id="discount" class="discount-area"><%= p.getDiscountPrice() %></h3>
							<h5 class="discount-area">원</h5>
						<% } else { %>
							<!-- case2. 원가 -->
							<h3 id="cost" class="cost-area"><%= p.getpPrice() %></h3>
							<h5 class="cost-area">원</h5>
						<% } %>
						<br>
						<span style="font-size: 12px;">
							배송정보 3,000원 / 주문 시 결제 (선결제)
						</span>
						<button id="extra-fee-btn" type="button" class="btn btn-sm ">지역별 배송비 추가</button>
						<br>
						<span style="font-size: 12px;">
							전체 결제 금액의 1% 적립 (배송비 제외)
						</span>
						<!-- 지역별 추가 배송비 창 => 기본 안 보이게 설정 -->
						<div id="extra-fee">
							<ul>
								<li>제주특별자치도 서귀포시 3000원</li>
								<li>제주특별자치도 제주시 3000원</li>
							</ul>
						</div>
						<script>
							$(function(){

								$("#extra-fee-btn").click(function(){
									const $content = $("#extra-fee");
									if($content.css("display") == "none") {
										$content.css("display", "block");
									} else {
										$content.css("display", "none");
									}
								});

							});
						</script>
					</div>
					
					<div class="amount" align="right">
						<span><%= p.getpName() %></span>
						<br>
						<span>
							<i class="fas fa-minus" onclick='count("minus")' value="-" style="cursor:pointer" style="color:lightgray;"></i>
							<input type="text" id="amount" name="amount" value="1" readonly>
							<i class="fas fa-plus" onclick='count("plus")' value="+" style="cursor:pointer"></i>
						</span>
					</div>
					<!-- 수량 및 합계금액 표시 -->
					<script>
						function count(type)  {
							
							// 수량 표시
							let $number = $("#amount").val(); // 수량 표시될 input 
							
							if(type == 'plus') {
								$number = parseInt($number) + 1;
							}else if(type == 'minus')  {
								if($number != '1'){
									$number = parseInt($number) - 1;
								} else{
									$number = 1;
								}
							}

							$("#amount").val($number);

							// 합계금액 표시
							let $discount = $("#discount").text(); // 할인가
							let $cost = $("#cost").text(); // 원가
							let $num = $("#amount").val(); // 수량

							if($discount != 0){
								$("#total-discount").text($discount * $num);
							} else {
								$("#total-cost").text($cost * $num);
							}

						}

					</script>

					<div class="total-price" align="right">
						<span style="font-size:20px; font-weight: bolder;">총 합계 금액</span>
						<% if(p.getDiscountPrice() != 0) { %>
							<!-- case1. 할인가 총합 -->
							<span id="total-discount" class="total-price-area"><%= p.getDiscountPrice() %></span>
							<span style="color:#9BD5BD; font-size:20px; font-weight: bolder;">원</span>
						<% } else { %>
							<!-- case2. 원가 총합 -->
							<span id="total-cost" class="total-price-area"><%= p.getpPrice() %></span>
							<span style="color:#9BD5BD; font-size:20px; font-weight: bolder;">원</span>
						<% } %>
						</div>

					<table class="main-btns">
						<tr>
							<td class="like-btn" width="20%" align="center">
								<!-- case1. 찜 안 했을 경우 -->
								<i class="far fa-heart fa-2x heart-btn" style="color:#9BD5BD;"></i>
								<!-- case2. 찜 했을 경우 -->
								<!-- <i class="fas fa-heart fa-2x" style="color:#9BD5BD;"></i> -->
							</td>
							<td class="buy-btn" width="40%">
								<button id="buy-btn" class="btn">바로구매</button>
							</td>
							<td class="cart-btn" width="40%">
								<button id="cart-btn" class="btn" onclick="addCartProduct();">장바구니</button>
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
				<a href="#review">상품후기</a>
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
				<p><%= p.getpDetail() %></p>
			</div>
			<div class="detail-img">
				<img width="100%" src="<%= p.getFilePath() %><%= p.getpDetailImg() %>">
			</div>
		</div>

		<!-- 리뷰 -->
		<iframe id="review" src="<%= contextPath %>/reviewList.rev?cpage=1&pcode=<%= p.getpCode() %>&pname=<%= p.getpName() %>"
		 style="width:100%; height:900px; border:none;"></iframe>

		<!-- 배송 정보 -->
		<div id="delivery-info" class="delivery-info">
			<div class="delivery-info-title">
				<h4 style="font-weight: bolder;">배송정보</h4>
			</div>
			<div class="delivery-info-content">
				<p>
					배송 비용 : 3,000원 (결제금액 50,000원 이상 무료) <br>
					배송 기간 : 1~2일 (제주도, 도서산간 2~3일) <br>
					배송 안내 : <br>
					- 제주 및 도서 산간지역은 운임 3,000원이 추가 됩니다. <br>
					- <b style="color:salmon">주문량이 많은 경우 배송 지연이 발생할 수 있습니다.</b> <br>
					- 신선 식품 배송으로 월요일 및 공휴일 다음날은 배송이 불가합니다. <br>
					- 롯데 택배로 배송되며, 상품 출고 후 송장번호가 문자로 발송됩니다. [오후 5시 이후] <br> 
					- 스티로폼 박스에 아이스팩과 함께 포장하여 배송됩니다. (단, 겨울철에는 아이스팩을 제외하고 배송됩니다) <br>
					- 고객님께서 주문하신 상품은 발송되는 날, 당일 제작하여 배송됩니다. <br>
				</p>
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
						<button type="submit" id="cart-page-btn" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;" onclick="location.href='<%= contextPath%>/cartlist.cart'">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	
	<!-- 장바구니 관련 스크립트 (나경) -->
	<script>
		function addCartProduct(){
			var productCode = $("#productCode").val();
			var productCount = $("#amount").val();

			$.ajax({
				url:"addcartpro.cart",
				data:{
					productCode:productCode,
					productCount:productCount
				},
				success:function(result){
					if(result == 1){
						$("#cart-success-modal").modal("show");
					}else{
						alert("이미 담겨있는 상품으로 수량을 변경했습니다.");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			})


		}
	</script>

	<!-- 주문하기 관련 스크립트 (나경)-->
	<script>

		$(document).ready(function(){
			$(document).on('click', '#buy-btn', function(){
				var form = $('<form></form>');
				form.attr('action', '<%= contextPath %>/order.pay');
				form.attr('method', 'post');
				form.appendTo('body');
				form.append($('<input type="hidden" value="' + $("#productCode").val() + '"name="saladCode">'));
				form.append($('<input type="hidden" value="' + $("#amount").val() + '"name="saladCount">'));
				form.append($('<input type="hidden" value="' + $(".total-price-area").text() + '"name="saladPrice">'));
				form.submit();
			} )
		})
	</script>
	
	<!-- 찜하기 기능 (지은)-->
	<script>
		$(".main-btns").on("click", ".heart-btn", function(){
			
			var pCode = $("#productCode").val();
			console.log(pCode);
			
			if(<%= loginUser.getmCode() %> == null) {
				alert('로그인 후 이용가능합니다.');
			}else {
				console.log("실행확인");
				$.ajax({
					url:"heartDetail.my",
					data:{pcode:pCode},
					type:"post",
					success:function(result){
						if(result > 0) {
							alert("해당 상품을 찜리스트에 추가하였습니다.");
							//$(this).child(".heart-btn").attr('class','.heart-btn2');
							//$(this).child(".heart-btn").css("display", "inline-block");
						}else {
							alert("이미 담은 상품입니다.")
						}
					}, error:function(){
						console.log("통신실패")
					}
					
				})
			}
	
		});
	</script>
</body>
</html>