<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://kit.fontawesome.com/fca98d1848.js" crossorigin="anonymous"></script>

<style>
    * {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;}
    .fas{vertical-align: middle;}
    .outer{
        border:1px solid red;
        margin-top:200px;
        /*margin-left:210px;*/
        margin-left: 20px;
        width:800px;
        height:900px;
    }
    .inquiry_categoty h2{
        display:inline;
        font-size: 25px;
    }
    .productInquiry_admin{
        width: 750px;
        margin: auto;
    }
    .product_category{
        height: 50px;
        margin: 20px 0 20px 0;
        /*border: 1px solid blue;*/
    }
    .productInquiry_category{
        height: 30px;
        margin: 20px 0 5px 0;
        /*border: 1px solid purple;*/
    }
    /* 완제품, 커스텀 버튼*/
    #product_category{
        box-sizing: border-box;
        /* border:1px solid red;  */
        width:1000px;
        height:50px;
        margin:auto;
        margin-top:20px;
    }
    #left, #right{
        box-sizing: border-box;
        /* border:1px solid red;  */
        width:50%;
        height:100%;
        float:left;
    }
    #product-button, #custom-button{
        box-sizing: border-box;
        width:99%;
        height:100%;
        border:1px solid lightgray;
        border-bottom:none;
        background-color:rgb(245, 245, 245);
        line-height:50px;
        text-align: center;
    }

    #product-button>a, #custom-button>a{
        display: block;
        /* border:1px solid red; */
        width:100%;
        height:100%;
        color:black;
        text-decoration-line:none;
    }
    /*custom 총 개수, 선택삭제 버튼*/
    .productInquiry_manage{
        /*border: 1px solid green;*/
        width: 100%;
        height: 30px;
        overflow: hidden;
    }
    .productInquiry_manage>div{
        /*border: 1px solid pink;*/
        float: left;
        width: 50%;
        height: 100%;
    }
    .productInquiry_info>span, .productInquiry_btn>button{
        font-size: 13px;
    }
    .productInquiry_btn>button{
        width: auto;
        height: 25px;
        background-color: rgb(247,223,125);
        border: none;
        border-radius: 5%;
    }
    /*커스텀 재료 목록 테이블*/
    #productInquiry_table{
        border: 1px solid lightgrey;
        width: 750px;
        font-size: 13px;
    }
    #productInquiry_table th, #productInquiry_table td{
        text-align: center;
    }
    #productInquiry_table a:hover{
        color: red;
    }
    /*.customIG_name{color: black;}*/
    /*.customIG_name:hover{color: red;}*/
    /*페이징 바*/
    .paging_area{
        /*border: 1px solid coral;*/
        width: 100%;
        text-align: center;
    }
    .paging_area>button{
        width: 20px;
        height: 20px;
        font-size: 10px;
        border: none;
        border-radius: 5%;
    }
    /*검색창*/
    #product-list{text-align: center; margin-top: 15px;}
    #product-list span{
        border: 1px solid lightgrey;
        border-radius: 5%;
        padding: 0 10px;
        height: 25px;
    }
    #product-list input{
        border:1px solid lightgray;
        border-radius:3px;
        width:250px;
        height:25px;
    }
    #product-list button{
        border:1px solid lightgray;
        border-radius:3px;
        padding:0 10px;
        margin-left:10px;
        background-color:white;
    }
    #product-list>thead th{background:lightgray}

    /*노출 여부 영역*/
    .status{
        margin: auto;
        margin-top: 15px;
        width: 120px;
        height: 140px;
        padding-top: 10px;
        text-align: center;
    }
    .status>span{font-weight: 700;}
    .status select{
        display: block;
        margin: auto;
        margin-top: 20px;
        width: 50px;
    }
    .status button{
        margin-top: 25px;
        padding: 5px 5px;
        width: 50px; height: 25px;
        font-size: 13px; vertical-align: middle;
        border: none;
        background-color: rgb(247,223,125);
        border-radius: 5%;
    }
    /*문의 상세보기 모달*/
    .modal-body{height: auto;}
    .modal-body table{
        margin: auto; 
        border-collapse: separate; 
        border-spacing: 10px; 
        font-size: 13px;
    }
    #answer-table th{
        width: 80px;
        margin-left: 20px;
    }
    #answer-table td{
        width: 120px;
    }
    #answer-table textarea, .answer-area textarea{
        width: 420px; height: auto;
        resize: none;
        border: 1px solid lightgrey;
    }
    .answer-area{margin-bottom: 40px;}
    .answer-area div{
        margin: auto;
        margin-left: 20px;
    }
    #answer-btn{
        margin: auto;
        margin-top: 20px;
        text-align: center;
    }
    #answer-btn button{
        background-color: rgb(247,223,125);
    }
</style>
</head>
<body>
    <div class="outer">
        <div class="inquiry_categoty">
            <h2 style="color:gray;">상품관리</h2>
            <h2>&gt; 상품문의 관리</h2>
        </div>

        <div class="productInquiry_admin">

            <!-- 카테고리 선택 -->
            <div class="productInquiry_category">
                <select name="category" style="font-size: 13px;">
                    <option>상품문의 선택</option>
                    <option value="">채소</option>
                    <option value="">메인토핑</option>
                    <option value="">사이드토핑</option>
                    <option value="">드레싱</option>
                </select>
            </div>

            <!-- 총 상품(재료) 개수 / 등록 버튼 -->
            <div class="productInquiry_manage">
                <div class="productInquiry_info">
                    <span>총</span>
                    <span style="color: orange;">12</span>
                    <span>건</span>
                </div>
                <div class="productInquiry_btn" align="right">
                    <button type="button" data-toggle="modal" data-target="#costom_insert_Modal">문의 삭제</button>
                </div>
            </div>

            <table id="productInquiry_table" class="table table-sm table-hover" border="1">
                <thead>
                    <tr>
                        <th width="30px"></th>
                        <th width="40px">번호</th>
                        <th width="50px">문의유형</th>
                        <th width="80px">ID</th>
                        <th width="50px">최종등록일</th>
                        <th width="100px">상품명</th>
                        <th width="150px">문의내용</th>
                        <th width="50px">답변여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input type="checkbox">
                        </td>
                        <td>12</td>
                        <td>배송</td>
                        <td> 
                            user05
                        </td>
                        <td>2021.11.11</td>
                        <td>닭가슴살 샐러드</td>
                        <td>
                            <a href="" class="customIG_name" data-toggle="modal" data-target="#inquiryAnswer-Modal">
                                배송 언제되나요???????????
                            </a>
                        </td>
                        <td>
                            <span style="color: red;">대기</span> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox">
                        </td>
                        <td>12</td>
                        <td>배송</td>
                        <td> 
                            nakyung0202
                        </td>
                        <td>2021.11.11</td>
                        <td>닭가슴살 샐러드</td>
                        <td>
                            <a href="" class="customIG_name" data-toggle="modal" data-target="#inquiryAnswer-Modal">
                                배송 언제되나요???????????
                            </a>
                        </td>
                        <td>
                            답변완료
                        </td>
                    </tr>
                </tbody>
            </table>


            <!-- 페이징바 -->
            <div class="paging_area">
                <button>&lt;</button>
                <button>1</button>
                <button>2</button>
                <button>&gt;</button>
            </div>

            <!-- 검색창 -->
            <div class="search">
                <form action="" id="product-list">
                    <tr>
                        <td>
                            <span>상품명</span>
                        </td>
                        <td>
                            <input type="text">
                        </td>
                        <td><button type="submit">조회</button></td>
                    </tr>
                </form>
            </div>

            <!-- The Modal -->
            <div class="modal" id="inquiryAnswer-Modal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">문의 상세 조회</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <table id="answer-table">
                            <tr>
                                <th>문의유형</th>
                                <td>배송</td>
                                <th>문의상품명</th>
                                <td>닭가슴살 샐러드</td>
                            </tr>
                            <tr>
                                <th>최초등록일</th>
                                <td colspan="3">2021.11.11</td>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <td colspan="3">user01</td>
                            </tr>
                            <tr>
                                <th>휴대전화</th>
                                <td colspan="3">010-22334-5213</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td colspan="3">user01@naver.com</td>
                            </tr>
                            <tr>
                                <th>문의제목</th>
                                <td colspan="3">배송 언제되나요</td>
                            </tr>
                            <tr>
                                <th>문의상세내용</th>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <textarea name="" id=""></textarea>
                                </td>
                            </tr>
                        </table>
                        <hr style="border: 1px solid lighgrey;">

                        <form action="">
                            <div class="answer-area">
                                <div>
                                    <h4>답변 등록</h4>
                                </div>
                                <div>
                                    <textarea name="" id=""></textarea>
                                </div>
                                <div id="answer-btn">
                                    <button class="btn btn-sm">
                                        <span>등록</span>
                                    </button>
                                    <button class="btn btn-sm" data-dismiss="modal">
                                        <span>취소</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

            
                </div>
                </div>
            </div>

        </div>
        
    </div>
</body>
</html>