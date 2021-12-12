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
		box-sizing: border-box;
		border:1px solid red;
		margin:auto;
		margin-bottom: 20px;
		width:90%;
		height:800px;
	}

	.review-title, .review-btn1, .review-content, .review-btn2{
		box-sizing: border-box;
		/* border:1px solid red; */
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
		box-sizing: border-box;
		/* border:1px solid red; */
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

    .review-content-left>img{
        box-sizing: border-box;
        width:100%;
        height:100%;
    }

	.review-content-right{
		box-sizing: border-box;
		border:1px solid red;
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
                    <a href="">수정</a> <span>&nbsp;&#124;&nbsp;</span>
                    <a href="">삭제</a> <span>&nbsp;&#124;&nbsp;</span>
                    <a href="">신고</a>
                </span>
                <!-- [고려사항]
                    상품후기내용 => 글자수 제한해서 영역 범위 넘어가지 않도록 해야할 듯....
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


    <!-- 후기등록 모달창 -->
    <div class="modal fade" id="review-insert-modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content insert-review-modal">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    <h3 class="modal-title">후기 등록</h3>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area modal-dialog-scrollable">
                    <form action="" id="review-insert-form" method="post" enctype="multipart/form-data">
                       
                    </form>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div id="button-left-area">
                        <button type="reset" class="btn btn-sm" style="background:white; border:1px solid lightgray;" form="review-insert-form">취소</button>
                    </div>
                    <div id="button-right-area">
                        <button type="submit" class="btn btn-sm" style="background:#9BD5BD;" form="review-insert-form">등록</button>
                    </div>
                </div>
            
            </div>
        </div>
        </div>

</body>
</html>