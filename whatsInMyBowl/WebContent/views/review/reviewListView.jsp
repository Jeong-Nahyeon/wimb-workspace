<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	
	.review{
		border:1px solid red;
		box-sizing: border-box;
		margin:auto;
		margin-bottom: 20px;
		width:900px;
		height:800px;
	}

	.review-title, .review-btn1, .review-content, .review-btn2{
		border:1px solid red;
		box-sizing: border-box;
		width:100%;
	}

	.review-title{
        border-bottom: 2px solid lightgray;
		height:5%;
		margin-bottom:10px;
	}

	.review-btn1, .review-btn2{
		height:5%;
		margin-bottom:20px;
	}

	.review-btn1-left, .review-btn1-right{
		border:1px solid red;
		box-sizing: border-box;
		width:50%;
		height:100%;
		float:left;
	}

    .review-btn1 a{
        box-sizing: border-box;
		border:1px solid lightgray;
        display:block;
        width:100%;
        height:100%;
        color:black;
        text-align: center;
        line-height: 35px;
        text-decoration: none !important;
        font-size:12px;
    }
	
	.review-content{
        border:1px solid red;
		height:24%;
		margin-bottom:20px;
	}

	.review-content-left{
		border:1px solid red;
		box-sizing: border-box;
		width:20%;
		height:100%;
		float:left;
    }

    .review-content-left>img{
        box-sizing: border-box;
        width:100%;
        height:100%;
    }

	.review-content-right{
		border:1px solid red;
		box-sizing: border-box;
		width:80%;
		height:100%;
		float:left;
        padding:10px;
	}

    /* 상품후기 수정, 삭제, 신고 버튼 */
	
    .review-content-right a{
        color:black;
        text-align: center;
        text-decoration: none !important;
        cursor: pointer;
    }

    .review-btn2-left, .review-btn2-center, .review-btn2-right{
		border:1px solid red;
		box-sizing: border-box;
		height:100%;
		float:left;
	}

    .review-btn2-center{
        width:60%;
        text-align: center;
        line-height: 35px;
    }

    .review-btn2-right{
        width:20%;
        text-align: right;
    }

    .review-btn2-right>button{
        box-sizing: border-box;
        background:#9BD5BD;
        color:white;
        font-weight: bolder;
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


    
</style>
</head>
<body>

    <div id="review" class="review">
        <div class="review-title">
            <h4 style="font-weight: bolder;">상품후기</h4>
        </div>

        <div class="review-btn1">
            <div class="review-btn1-left">
                <a href="">전체후기</a> 
            </div>
            <div class="review-btn1-right">
                <a href="">포토후기</a>
            </div>
        </div>

        <div class="review-content">
            <div class="review-content-left">
                <img src="">
            </div>
            <div class="review-content-right">
                <!-- 후기신고 성공 모달창 테스트용 임시 아이디 부여 -->
                <b id="report-success-btn">홍길동</b> <span>&nbsp;&#124;&nbsp;</span><span> 2021.12.11</span>
                <span style="margin-left:400px;">
                    <a id="review-update-btn">수정</a>
                    <span>&nbsp;&#124;&nbsp;</span>
                    <a id="review-delete-btn">삭제</a> <!-- 리뷰삭제 성공 모달창 테스트용 임시 아이디 부여 -->
                    <span>&nbsp;&#124;&nbsp;</span>
                    <a id="report-review-btn">신고</a>
                </span>
                <!-- [고려사항]
                    상품후기내용 => 입력 받을 때 글자수 제한해서 영역 범위 넘어가지 않도록 해야할 듯....
                -->
                <p>
                    <br>
                    상품후기내용
                </p> 
            </div>
        </div>
        <div class="review-content">
            <div class="review-content-left">
                <img src="">
            </div>
            <div class="review-content-right">
                <p>상품후기내용</p>
            </div>
        </div>
        <div class="review-content">
            <div class="review-content-left">
                <img src="">
            </div>
            <div class="review-content-right">
                <p>상품후기내용</p>
            </div>
        </div>

        <div class="review-btn2">
            <div class="review-btn2-left" style="width:20%"></div>
            <div class="review-btn2-center">
                <a href="">&lt;</a>
                <a href="">1</a>
                <a href="">&gt;</a>
            </div>
            <div class="review-btn2-right">
                <button class="btn" id="review-insert-btn">후기등록</button>
            </div>
        </div>
    </div>


    <!-- 후기등록 모달창 -->

    <div class="modal fade" id="review-insert-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content insert-review-modal">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기등록</h6>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area" align="center">

                    <form action="" id="review-insert-form" method="post" enctype="multipart/form-data">
                       <div class="review-insert-content" style="box-sizing:border-box; width:750px;">

                           <div class="review-product">
                               <div class="review-product-img">
                                    <img src="" width="100px" height="100px">
                               </div>
                               <div class="review-product-name">
                                    <h4 style="margin-top: 40px;">닭가슴살 샐러드</h4>
                               </div>
                           </div>

                           <hr>

                           <table class="review-form-content" id="reviewInsertForm">
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><textarea name="" id="" rows="15" style="resize:none;"></textarea></td>
                                </tr>
                                <tr>
                                    <th>파일첨부</th>
                                    <td><input type="file" name="" id=""></td>
                                </tr>
                           </table>

                       </div>

                    </form>
                </div>

				<!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div class="btns" align="center" style="width:100%;">
						<button type="reset" class="btn" style="border:1px solid lightgray;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:#9BD5BD; margin-left:10px;" form="review-insert-form">등록</button>
					</div>
                </div>

			</div>	
		</div>	
	</div>
	<script>
		$(document).ready(function(){
			$("#review-insert-btn").click(function(){
			$("#review-insert-modal").modal({backdrop: "static"});
			});
		});
	</script>


	<!-- 후기수정 모달창 -->

    <div class="modal fade" id="review-update-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content update-review-modal">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기수정</h6>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area" align="center">
                    <form action="" id="review-update-form" method="post" enctype="multipart/form-data">

                       <div class="review-update-content" style="box-sizing:border-box; width:750px;">

                           <div class="review-product">
                               <div class="review-product-img">
                                    <img src="" width="100px" height="100px">
                               </div>
                               <div class="review-product-name">
                                    <h4 style="margin-top: 40px;">닭가슴살 샐러드</h4>
                               </div>
                           </div>

                           <hr>

                           <table class="review-form-content" id="reviewUpdateForm">
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><textarea name="" id="" rows="15" style="resize:none;"></textarea></td>
                                </tr>
                                <tr>
                                    <th>파일첨부</th>
                                    <td><input type="file" name="" id=""></td>
                                </tr>
                           </table>

                       </div>
                    </form>

                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div class="btns" align="center" style="width:100%;">
						<button type="reset" class="btn" style="border:1px solid lightgray;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:#9BD5BD; margin-left:10px;" form="review-update-form">등록</button>
					</div>
                </div>
            
            </div>
        </div>
    </div>
	<script>
		$(document).ready(function(){
			$("#review-update-btn").click(function(){
			$("#review-update-modal").modal({backdrop: "static"});
			});
		});
	</script>


	<!-- 후기등록/수정 성공 모달창 -->

	<div class="modal fade" id="review-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px; height:350px;">
			<div class="modal-content success-review-modal">
				
				<!-- Modal Header -->
				<div class="modal-header title-area">
					<h6 class="modal-title">후기등록/수정 완료</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body content-area">
					<div class="review-success-img" align="center" style=" height:40%;">
                        <i class="fas fa-check fa-4x" style="color:#9BD5BD;"></i>
                    </div>

                    <div class="review-success-content" align="center" style=" height:60%;">
                        <br>
                        <b>상품후기가 등록 또는 수정되었습니다.</b>
                        <br>
                        마이페이지에서 확인하시겠습니까?
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area">
					<div class="cart-success-btns" align="center" style="width:100%;">
						<button type="button" class="btn btn-sm" style="border:1px solid lightgray; margin:0px 5px;" data-dismiss="modal">취소</button>
						<button type="submit" id="my-page-btn" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#review-success-btn").click(function(){
			$("#review-success-modal").modal({backdrop: "static"});
			});
		});
	</script>


	<!-- 후기 삭제 성공 모달창 -->

	<div class="modal fade" id="review-delete-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px; height:350px;">
			<div class="modal-content success-delete-review-modal">
				
				<!-- Modal Header -->
				<div class="modal-header title-area">
					<h6 class="modal-title">후기삭제 완료</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body content-area">
					<div class="delete-success-img" align="center" style=" height:40%;">
                        <i class="fas fa-check fa-4x" style="color:#9BD5BD;"></i>
                    </div>

                    <div class="delete-success-content" align="center" style=" height:60%;">
                        <br>
                        <b>상품후기가 삭제되었습니다.</b>
                        <br>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area">
					<div class="cart-success-btns" align="center" style="width:100%;">
						<button type="submit" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#review-delete-btn").click(function(){
			$("#review-delete-success-modal").modal({backdrop: "static"});
			});
		});
	</script>




    <!-- 후기신고 모달창 -->

    <div class="modal fade" id="report-review-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content review-report-modal">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기신고</h6>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area">
                    <form action="" id="report-review-form" method="post" enctype="multipart/form-data">

                       <div class="report-review-content" style="box-sizing:border-box; width:750px;">

                           <div class="report-review" align="center">
                               <div class="report-review-img">
                                    <img src="" width="100px" height="100px">
                               </div>
                               <div class="report-review-title">
                                    <h4 style="margin-top: 40px;">신고 :: 신고할 리뷰 타이틀</h4>
                               </div>
                           </div>

                           <hr>

                           <table class="report-form-content" id="reportReviewForm" align="center">
                               <tr>
                                    <th>신고사유</th>
                                    <td>
                                        <select name="reportCategory">
                                            <option>욕설</option>
                                            <option>도배</option>
                                            <option>음란/청소년 유해</option>
                                            <option>티회원 비방</option>
                                            <option>타사 홍보</option>
                                        </select>
                                    </td>
                               </tr>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><textarea name="" id="" rows="15" style="resize:none;"></textarea></td>
                                </tr>
                           </table>

                       </div>
                    </form>

                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div class="btns" align="center" style="width:100%;">
						<button type="reset" class="btn" style="border:1px solid lightgray;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:#9BD5BD; margin-left:10px;" form="review-update-form">등록</button>
					</div>
                </div>
            
            </div>
        </div>
    </div>
	<script>
		$(document).ready(function(){
			$("#report-review-btn").click(function(){
			$("#report-review-modal").modal({backdrop: "static"});
			});
		});
	</script>


    <!-- 후기신고 성공 모달창 -->

	<div class="modal fade" id="report-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px; height:350px;">
			<div class="modal-content success-report-modal">
				
				<!-- Modal Header -->
				<div class="modal-header title-area">
					<h6 class="modal-title">후기신고 완료</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body content-area">
					<div class="report-success-img" align="center" style=" height:40%;">
                        <i class="fas fa-check fa-4x" style="color:#9BD5BD;"></i>
                    </div>

                    <div class="report-success-content" align="center" style=" height:60%;">
                        <br>
                        <b>후기가 신고되었습니다.</b>
                        <br>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area">
					<div class="report-success-btns" align="center" style="width:100%;">
						<button type="submit" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#report-success-btn").click(function(){
			$("#report-success-modal").modal({backdrop: "static"});
			});
		});
	</script>

</body>
</html>