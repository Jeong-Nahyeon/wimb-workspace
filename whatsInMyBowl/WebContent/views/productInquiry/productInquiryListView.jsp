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
    .wrap{
        /*border: 1px solid blue;*/
        width: 1000px;
        height: auto;
        margin: auto;
    }
    .productIq-area{
        /*border: 1px solid red;*/
        margin: auto;
        width: 900px;
        height: auto;
    }
    /*상품문의 타이틀*/
    #productIq-title{
        border-bottom: 2px solid lightgray;
        margin-bottom: 10px;
    }
    
    /*상품문의 목록 테이블*/
    .table{
        margin: auto;
        text-align: center;
        border-bottom: 1px solid rgb(219, 219, 219);
    }
    .table td{
        font-size: 13px;
    }
    #product-btn button{
        width: 40px;
        height: 20px; 
        padding: 0; margin: 0;
        background-color: lightgray ;
    }
    #product-btn span{
        display: inline-block;
        line-height: 18px;
        font-size: 10px;
        vertical-align: top;
    }
    /*등록버튼*/
    #productIq-insert{
        margin: auto;
        margin-top: 10px;
        text-align: right;
    }
    #productIq-insert button, #insertform-btn-area button{
        width: 100px;
        height: 30px;
        padding: 0; margin: 0;
    }
    #productIq-insert span, #insertform-btn-area span{
        display: inline-block;
        line-height: 28px;
        font-size: 13px;
        vertical-align: top;
    }
    #insert-btn, #insertform-btn-area button[type="submit"]{
        background-color: rgb(155,213,189);
    }
    #list-btn, #insertform-btn-area button[type="button"]{
        border: 1px solid rgb(155,213,189);
    }
    /*파일등록*/
    #productIq-insert-modal input[type="file"]{
        position: absolute;
        width: 0; height: 0; padding: 0; border: 0;
        overflow: hidden; 
    }
    #productIq-insert-modal label{
        padding: 5px 10px;
        color: #fff;
        vertical-align: middle;
        background-color: #999999;
        cursor: pointer;
        height: 30px; font-size: 13px;
        margin: 0 0 3px 10px;    
    }
    /*문의등록 form*/
    /*상품정보*/
    #product-info{
        margin: auto;
        padding-bottom: 20px;
        border-bottom: 1px solid lightgray;
    }
    #product-info span{font-size: 15px;}
    #product-info img{
        width: 80px; height: 80px;
        margin-left: 135px; margin-right: 25px;
    }
    #productIq-insert-modal table{
        margin: auto;
        width: 500px;
        border-collapse: separate;
        border-spacing: 0 10px;
    }
    #productIq-insert-modal th{width: 100px;}
    #productIq-insert-modal td{width: 350px;}
    #productIq-insert-modal select{border: 1px solid lightgray;}
    #productIq-insert-modal input, #productIq-insert-modal textarea{
        width: 100%;
        border: 1px solid lightgray;
        font-size: 13px;
    }
    #productIq-insert-modal input{height: 28px;}
    #productIq-insert-modal option{font-size: 13px;}
    #productIq-insert-modal textarea{
        height: 200px;resize: none;
    }
    #insertform-btn-area{
        margin: 30px 0;
        padding-top: 30px;
        text-align: center;
        border-top: 1px solid lightgray;
    }
</style>

</head>
<body>
    <div class="wrap">
        <div class="productIq-area">
            <div id="productIq-title">
                <h4 style="font-weight: 700;">상품 문의</h4>
            </div>
            <div id="productIq-content">

                

                <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th>번호</th>
                            <th>상품명</th>
                            <th>제목</th>
                            <th>문의유형</th>
                            <th>작성일</th>
                            <th>답변상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> <span>1</span> </td>
                            <td> <span>왓츠인_샐러드1</span> </td>
                            <td>
                                <span>해당상품 알러지정보가 궁금해요.</span>
                            </td>
                            <td>
                                <span>상품</span>
                            </td>
                            <td>
                                <span>21.10.27</span>
                            </td>
                            <td>
                                <span>답변완료</span> 
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>왓츠인_샐러드1</td>
                            <td>
                                <span>해당상품 알러지정보가 궁금해요.</span>
                            </td>
                            <td>
                                <span>상품</span>
                            </td>
                            <td>
                                <span>21.10.27</span>
                            </td>
                            <td>
                                <span>답변미등록</span>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>왓츠인_샐러드1</td>
                            <td>
                                <span>해당상품 알러지정보가 궁금해요.</span>
                            </td>
                            <td>
                                <span>상품</span>
                            </td>
                            <td>
                                <span>21.10.27</span>
                            </td>
                            <td>
                                <div id="product-btn">
                                    <button class="btn btn-sm">
                                        <span>수정</span>
                                    </button>
                                    <button class="btn btn-sm">
                                        <span>삭제</span>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div id="productIq-insert">
                    <button class="btn" id="insert-btn" data-toggle="modal" data-target="#productIq-insert-modal">
                        <span>문의하기</span>
                    </button>
                    <button class="btn" id="list-btn">
                        <span>전체보기</span>
                    </button>
                </div>

                <!-- 문의 등록 Modal -->
                <div class="modal" id="productIq-insert-modal">
                    <div class="modal-dialog modal-lg">
                    <div class="modal-content" >
                
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">문의 작성</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div id="product-info">
                                <img src="" alt="">
                                <span>왓츠인마이볼 상품1</span>
                            </div>
                            <form action="">
                                <table>
                                    <tr>
                                        <th>카테고리</th>
                                        <td>
                                            <select name="" id="">
                                                <option>카테고리선택</option>
                                                <option value="">배송</option>
                                                <option value="">상품</option>
                                                <option value="">교환/환불</option>
                                                <option value="">기타</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>작성자</th>
                                        <td>
                                            <input type="text" name="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>제목</th>
                                        <td>
                                            <input type="text" name="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                        <td>
                                            <textarea name=""></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>파일</th>
                                        <td style="padding-top: 3px;">
                                            <input class="upload_name" style="width: 300px;">
                                            <label for="file">파일찾기</label>
                                            <input type="file" name="" id="file">
                                        </td>
                                        <script>
                                            $("#file").on('change',function(){
                                                var fileName = $("#file").val();
                                                $(".upload_name").val(fileName);
                                            });
                                        </script>
                                    </tr>
                                </table>

                                <div id="insertform-btn-area">
                                    <button type="button" class="btn" data-dismiss="modal">
                                        <span>취소</span>
                                    </button>
                                    <button type="submit" class="btn">
                                        <span>등록</span>
                                    </button>
                                </div>
                            </form>
                        
                        </div>
                        
                
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>