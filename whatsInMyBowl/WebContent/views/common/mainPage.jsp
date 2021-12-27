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


	/* 베스트 리뷰 스타일 */

	.best-review{
		/* border:1px solid red; */
		width:30%;
		height:100%;
		float:left;
		margin-left: 5px;
		margin-right: 5px;
	}

	#best-reviews-area img{
		width:100%;
		height:190px;
		margin-bottom:10px;
		cursor: pointer !important;
	}

	#best-reviews-area b{ 
		color:#9BD5BD;
		margin-bottom:10px;
	}

	/* 내용 텍스트 길 경우 뒷부분 생략 되는 스타일 */
    .review-content{
        /* border:1px solid red; */
		margin-top:10px;
        width: 100%;
        height: 70px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .review-detail{
        color:black;
    }

</style>
</head>
<body>
	<div id="mainBannerBox">
		<ul class="bxslider" style="width:800px">
		
				<!-- ajax로 메인배너 띄워주는 위치 -->
			<li><a href="#"><img class="img1" src=""></a></li>
			<li><a href="#"><img class="img2" src=""></a></li>
			<li><a href="#"><img class="img3" src=""></a></li>
		</ul>
	</div>
	<br clear="both">
	<div id="bestMenuBox">
		<div>
			<p style="font-size:xx-large;">BEST</p>
		</div>
		<div style="text-align: right;">
			<a href="<%= contextPath %>/bestList.pr" >더보기</a>
		</div>
		<table class="bestMenu" align="center">
			<!-- 베스트 상품 3위까지만 보여줄 자리 -->
		</table>
	</div>
	<div id="bestReviewBox">
		<div>
			<p style="font-size:xx-large;">Best Review</p>
		</div>
		<div style="text-align: right;">
			<!--<a href="">더보기</a>--> <!-- 모달창으로 상세 내용 보여져서 일단 패스 --> 
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
						등록된 베스트 후기가<br>
						없습니다
					</p>
				</td>
				<td>
					<p>
						등록된 베스트 후기가<br>
						없습니다
					</p>
				</td>
				<td>
					<p>
						등록된 베스트 후기가<br>
						없습니다
					</p>
				</td>
			</tr>
		</table>


		<!-- 베스트 리뷰 조회될 경우 -->
		<div id="best-reviews-area" align="center" style="height:300px">
			<!-- 베스트 리뷰 영역-->
		</div>



		
		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
	</div>
	<script>
	$(function(){
		test4();
		
		bestMenu();
		bestReview();
	})
	
	function test4(){
		$.ajax({
			url:"mainPage.banner",
			data:{},
			success:function(list){ 
				
				let result = "";
				for(let i=0; i<list.length; i++){
					$(".img" + (i+1)).attr("src", '/wimb/' + list[i].mainImg);
					//result += "<li><a href='#'><img src='/wimb/" + list[i].mainImg + "'></a></li>";
				}

			
			},error:function(){
				console.log("ajax 통신 실패");
			}
		});
		
	}
	
	
	
	
	
	
	// 베스트 메뉴 조회 (나현)
	function bestMenu(){
		
		$.ajax({
			
			url:"bestMenu.main",
			success:function(bestMenuList){
				
				console.log(bestMenuList);

				if(bestMenuList != null){
					let result = "<tr height='200'>"
									+ "<td>"
										+ "<a href='<%= contextPath %>/detail.pr?pcode=" + bestMenuList[0].pCode + "'>"
												+ "<img style='cursor:pointer' src='<%= contextPath %>/" + bestMenuList[0].filePath + bestMenuList[0].pMainImg + "'>"
										+ "</a>"
									+ "</td>"
									+ "<td>"
										+ "<a href='<%= contextPath %>/detail.pr?pcode=" + bestMenuList[1].pCode + "'>"
												+ "<img style='cursor:pointer' src='<%= contextPath %>/" + bestMenuList[1].filePath + bestMenuList[1].pMainImg + "'>"
										+ "</a>"
									+ "</td>"	
									+ "<td>"
										+ "<a href='<%= contextPath %>/detail.pr?pcode=" + bestMenuList[2].pCode + "'>"
												+ "<img style='cursor:pointer' src='<%= contextPath %>/" + bestMenuList[2].filePath + bestMenuList[2].pMainImg + "'>"
										+ "</a>"
									+ "</td>"
									
								+ "</tr>"
								+ "<tr>"
									+ "<td>"
										+ "<p style='font-weight:bolder'>" + bestMenuList[0].pName + "<br>" + bestMenuList[0].pPrice + "</p>"
									+ "</td>"	
									+ "<td>"
										+ "<p style='font-weight:bolder'>" + bestMenuList[1].pName + "<br>" + bestMenuList[1].pPrice + "</p>"
									+ "</td>"
									+ "<td>"
										+ "<p style='font-weight:bolder'>" + bestMenuList[2].pName + "<br>" + bestMenuList[2].pPrice + "</p>"
									+ "</td>"
								+ "</tr>";
								
					$(".bestMenu").html(result);
				}	
					
			}, error:function(){
				console.log("ajax 통신 실패");
			}
			
		});
		
	}




	// 베스트 리뷰 조회 (나현)
	function bestReview(){
		
		$.ajax({
			
			url:"bestReview.main",
			success:function(bestReviewList){
				
				
				let result = "";
				if(bestReviewList != null){
					
					// console.log(bestReviewList);
					$(".bestReview").text("");
					
					for(let i=0; i<bestReviewList.length; i++){

						result += "<div class='best-review'>" 
									+ "<a href='<%= contextPath %>/detail.pr?pcode=" + bestReviewList[i].pCode + "'>"
										+ "<img src='<%= contextPath %>/" + bestReviewList[i].mainImg + "'>"	
									+ "</a>"
									+ "<b>" + bestReviewList[i].pName + "</b>"
									+ "<div class='review-content'>"
										+ "<a class='review-detail'>"  + bestReviewList[i].rContent + "</a>"
									+ "</div>"
								+ "</div>";		

					}
					console.log(result);	
					$("#best-reviews-area").html(result);

				}	
					
			}, error:function(){
				console.log("ajax 통신 실패");
			}
			
		});
		
	}


	
	</script>
</body>
</html>