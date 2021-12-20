<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menubar.jsp" %>
<%@ page import="java.util.ArrayList, com.wimb.admin.model.vo.Banner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--<link rel="stylesheet" href="css/style.css">-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
<script>
	$(document).ready(function(){
		$('.bxslider').bxSlider({
			auto: true,
			speed: 500,
			pause: 5000,
			mode: 'horizontal',
			autoControls: true,
			pager: true,
			captions: true
		});
	});
</script>
<style>
	#mainBannerBox{
		width: 800px;
		height: 300px;
		margin: auto;
		margin-top: 100px;
		
	}
	#mainBannerBox img{
		width: 800px;
		height: 300px;
	}
	#mainBannerBox li{
		list-style: none;
	}
	#bestMenuBox, #bestReviewBox{margin-top: 150px;}
	#bestMenuBox>div, #bestReviewBox>div{
		width: 700px; height:30px; margin: auto;
		 vertical-align: bottom; margin-bottom: 50px;}	
	#bestMenuBox a, #bestReviewBox a{text-decoration: none; color: black; font-weight: bold;}
	
	#bestMenuBox a:hover, #bestReviewBox a:hover{color: rgb(155, 213, 189)}
	.bestMenu img, .bestReview img{width: 170px; height:170px; position:relative;}
	.bestMenu img:hover, .bestReview img:hover{opacity: 0.5;}
	.heartBtn, .cartBtn{
		position: absolute;
		font-size:large;
	}
	.heartBtn{margin-left: -160px; margin-top: 140px;}
	.cartBtn{margin-left: -30px; margin-top: 140px;}
	.bestMenu, .bestReview{width: 700px;}
	.bestMenu td, .bestReview td{text-align: center;}
</style>
</head>
<body>
	<div id="mainBannerBox">
		<ul class="bxslider" style="width:800px">
		
				<!-- ajax로 메인배너 띄워주는 위치 -->
			
		</ul>
	</div>
	<br clear="both">
	<div id="bestMenuBox">
		<div>
			<p style="font-size:xx-large;">BEST</p>
		</div>
		<div style="text-align: right;">
			<a href="" >더보기</a>
		</div>
		<table class="bestMenu" align="center">
			<tr height="200">
				<td>
					<a href=""><img src="<%= contextPath %>/resources/images/LOGO.png"></a>
					<a href="" class="heartBtn"><i class="fas fa-heart"></i></a>
					<a href="" class="cartBtn"><i class="fas fa-cart-plus"></i></a>
				</td>
				<td>
					<a href=""><img src="<%= contextPath %>/resources/images/LOGO.png"></a>
					<a href="" class="heartBtn"><i class="fas fa-heart"></i></a>
					<a href="" class="cartBtn"><i class="fas fa-cart-plus"></i></a>
				</td>
				<td>
					<a href=""><img src="<%= contextPath %>/resources/images/LOGO.png"></a>
					<a href="" class="heartBtn"><i class="fas fa-heart"></i></a>
					<a href="" class="cartBtn"><i class="fas fa-cart-plus"></i></a>
				</td>
			</tr>
			<tr>
				<td>
					<p>
						상품명 <br>
						가격
					</p>
				</td>
				<td>
					<p>
						상품명 <br>
						가격
					</p>
				</td>
				<td>
					<p>
						상품명 <br>
						가격
					</p>
				</td>
			</tr>
		</table>
	</div>
	<div id="bestReviewBox">
		<div>
			<p style="font-size:xx-large;">Best Review</p>
		</div>
		<div style="text-align: right;">
			<a href="">더보기</a>
		</div>
		<table class="bestReview" align="center">
			<tr height="200">
				<td>
					<a href=""><img src="<%= contextPath %>/resources/images/LOGO.png"></a>
				</td>
				<td>
					<a href=""><img src="<%= contextPath %>/resources/images/LOGO.png"></a>
				</td>
				<td>
					<a href=""><img src="<%= contextPath %>/resources/images/LOGO.png"></a>
				</td>
			</tr>
			<tr>
				<td>
					<p>
						리뷰내용요약
					</p>
				</td>
				<td>
					<p>
						리뷰내용요약
					</p>
				</td>
				<td>
					<p>
						리뷰내용요약
					</p>
				</td>
			</tr>
		</table>

	</div>
	<script>
	function test4(){
		$.ajax({
			url:"mainPage.banner",
			data:{},
			success:function(list){ 
				
				console.log(list);
				
				let result = "";
				for(let i=0; i<list.length; i++){
					result += "<li><a href='#'><img src='" + list[i].mainImg + "></a></li>";
				}
	
				
				$(".bxslider").html(result);
				
				
			},error:function(){
				console.log("ajax 통신 실패");
			}
		});
		
		
	}
	
	</script>
</body>
</html>