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
		/* border:1px solid red; */
		box-sizing: border-box;
		margin:auto;
		margin-bottom: 20px;
		width:900px;
		height:800px;
	}

	.review-title, .review-btn1, .review-content, .review-btn2{
		/* border:1px solid red; */
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
		/* border:1px solid red; */
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
        /* border:1px solid red; */
		height:24%;
		margin-bottom:20px;
	}

	.review-content-left{
		/* border:1px solid red; */
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
		/* border:1px solid red; */
		box-sizing: border-box;
		width:80%;
		height:100%;
		float:left;
        padding:10px;
	}

    /* 리뷰 수정, 삭제, 신고 버튼 */
    .review-content-right a{
        color:black;
        text-align: center;
        text-decoration: none !important;
        cursor: pointer;
    }

    .review-btn2-left, .review-btn2-center, .review-btn2-right{
		box-sizing: border-box;
		/* border:1px solid red; */
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

    .review-form-close-btn{
		background:white;
		border:1px solid lightgray;
		margin:0px 5px;
    }


    /* 리뷰 신고 창  */

      /* 내용 텍스트 길 경우 뒷부분 생략 되는 스타일 */
      .report-review-content{
        border:1px solid red;
        width: 200px;
        height: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
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
                <b>홍길동</b> <span>&nbsp;&#124;&nbsp;</span><span> 2021.12.11</span>
                <span style="margin-left:400px;">
                    <a data-toggle="modal" data-target="#review-update-modal" data-backdrop="static" data-keyboard="false">수정</a> <span>&nbsp;&#124;&nbsp;</span>
                    <a href="">삭제</a> <span>&nbsp;&#124;&nbsp;</span>
                    <a data-toggle="modal" data-target="#report-insert-modal" data-backdrop="static" data-keyboard="false">신고</a>
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
                <button class="btn" data-toggle="modal" data-target="#review-insert-modal" data-backdrop="static" data-keyboard="false">후기등록</button>
            </div>
        </div>
    </div>



    <button data-toggle="modal" data-target="#review-success-modal" data-backdrop="static" data-keyboard="false">리뷰등록/수정성공창테스트</button>
    


    <!-- 후기등록 모달창 -->
    <div class="modal fade" id="review-insert-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content insert-review-modal" style="width:800px; height:800px;">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기 등록</h6>
                    
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
                                    <th>작성자</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><textarea name="" id="" rows="13" style="resize:none;"></textarea></td>
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
						<button type="reset" class="review-form-close-btn" class="btn btn-sm" data-dismiss="modal">취소</button>
					
						<button type="submit" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;" form="reviewInsertForm">등록</button>
					</div>
                </div>
            
            </div>
        </div>
        </div>


    <!-- 후기수정 모달창 -->
    <div class="modal fade" id="review-update-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content update-review-modal" style="width:800px; height:800px;">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기 수정</h6>
                    
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
                                    <th>작성자</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
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
						<button type="reset" class="review-form-close-btn" class="btn btn-sm" data-dismiss="modal">취소</button>
					
						<button type="submit" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;" form="reviewUpdateForm">등록</button>
					</div>
                </div>
            
            </div>
        </div>
        </div>


    <!-- 후기등록/수정 성공 모달창 -->
    <div class="modal fade" id="review-success-modal" style="opacity: 100%;">
        <div class="modal-dialog modal-dialog-centered " role="document" style="width:500px; height:350px;">
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
                        <b>싱품후기 등록 또는 수정을 완료했습니다.</b>
                        <br>
                        마이페이지에서 확인하시겠습니까?
                    </div>

                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div class="cart-success-btns" align="center" style="width:100%;">
                        <button type="reset" id="review-success-close-btn" class="btn btn-sm" data-dismiss="modal">취소</button>
                    
                        <button type="submit" id="myPage-btn" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;">확인</button>
                    </div>
                </div>
            
            </div>


    <!-- 후기신고 모달창 -->
    <div class="modal fade" id="report-insert-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content idal" style="width:800px; height:800px;">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기 신고</h6>
                    
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area" align="center">

                    <form action="" id="report-insert-form" method="post" enctype="multipart/form-data">

                    <div class="report-insert-content" style="box-sizing:border-box; width:750px;">

                        <div class="report-review">

                            <div class="reprotreview-img">
                                    <!-- case1. 등록된 리뷰사진 없을 경우  -->
                                    <!-- <i class="fas fa-image" width="100px" height="100px"></i> -->
                                    <!-- case2. 등록된 리뷰사진 있을 경우 => 첫번째 사진 표시 -->
                                    <img src="" width="100px" height="100px">
                            </div>
                            <div class="report-review-content">
                                    욕설 리뷰 내용
                            </div>
                        </div>

                        <hr>

                        <table class="review-form-content" id="reviewInsertForm">
                                <tr>
                                    <th>작성자</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><textarea name="" id="" rows="13" style="resize:none;"></textarea></td>
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
                        <button type="reset" class="review-form-close-btn" class="btn btn-sm" data-dismiss="modal">취소</button>
                    
                        <button type="submit" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;" form="reviewInsertForm">등록</button>
                    </div>
                </div>
            
            </div>
        </div>
        </div>


    

</body>
</html>