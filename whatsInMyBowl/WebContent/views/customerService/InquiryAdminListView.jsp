<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .outer{
        margin-top: 100px;
        margin-left: 25%;
        width: 1000px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    #mainTitle, #sort_box, #sort_box div{display: inline-block;}
    #sort_box{float: right;}
    #sort_box div{
        font-size: 18px;
        margin: 0 10px;
        font-weight: bold;
    }
    #sort_box select{padding: 5px 5px;}
    .progressing_table, .done_table{
        width: 1000px;
        border: 2px solid gray;
        text-align: center;
    }
    .progressing_table tr, .done_table tr{
        border: 1px solid lightgray;
    }
    .progressing_paging_area{margin-bottom: 100px;}
    .paging-area{margin-top: 30px;}
    .table_title{
        font-weight: bold;
        border-bottom: 2px solid lightgray;
        padding-bottom: 10px;
        margin-bottom: 50px;
    }
    .table_header{
        background-color: lightgray;
    }
    .paging-area button{
        margin-top: 20px;
        border: 0;
    }
    .done_paging_area{
        margin-bottom: 80px;
    }
    .search_box input{width: 400px;}
    .search_box input:focus{outline: none;}
    .search_box button:focus{outline: none;}
    .search_box button:hover{background-color: #fdd835;}
    .search_box button{
        border: none;
        background-color: #ffee58;
        padding: 4px 20px;
        border-radius: 5px;
    }
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="../common/adminBar.jsp" %>

    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">고객센터관리</h2>
            <h2>> 1:1 문의</h2>
        </div>

        <div id="sort_box" align="right">
            <div>정렬</div>
            <select name="" id="">
                <option value="">전체보기</option>
                <option value="">처리중</option>
                <option value="">완료</option>
            </select>
        </div>

        <table class="progressing_table">
            <h3 class="table_title">처리중</h3>
            
            <tr class="table_header">
                <th class="header_num">글번호</th>
                <th class="header_category">문의유형</th>
                <th class="header_writer">작성자</th>
                <th class="header_title">제목</th>
                <th class="header_enrolldate">등록일자</th>
                <th class="header_status">진행상황</th>
                <th class="header_enddate">처리날짜</th>
            </tr>
            <tr>
                <td class="header_num">5</td>
                <td class="header_category">결제관련</td>
                <td class="header_writer">홍길동</td>
                <td class="header_title">결제가 안되는데요?</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate"></td>
            </tr>
            <tr>
                <td class="header_num">4</td>
                <td class="header_category">홈페이지이용</td>
                <td class="header_title">홍길동</td>
                <td class="header_title">홈페이지가 자주 렉걸려요</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate"></td>
            </tr>
            <tr>
                <td class="header_num">3</td>
                <td class="header_category">배송</td>
                <td class="header_title">홍길동</td>
                <td class="header_title">배송지 변경 요청</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate"></td>
            </tr>
            <tr>
                <td class="header_num">2</td>
                <td class="header_category">상품</td>
                <td class="header_title">홍길동</td>
                <td class="header_title">잘못된 상품이 온 것 같은데 확인해주세요</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate"></td>
            </tr>
            <tr>
                <td class="header_num">1</td>
                <td class="header_category">교환/환불</td>
                <td class="header_title">홍길동</td>
                <td class="header_title">환불언제되나요?</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate"></td>
            </tr>
            
        </table>
        <div class="paging-area progressing_paging_area" align="center">
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>&gt;</button>
        </div>


        <table class="done_table">
            <h3 class="table_title">처리완료</h3>
            
            <tr class="table_header">
                <th class="header_num">글번호</th>
                <th class="header_category">문의유형</th>
                <th class="header_writer">작성자</th>
                <th class="header_title">제목</th>
                <th class="header_enrolldate">등록일자</th>
                <th class="header_status">진행상황</th>
                <th class="header_enddate">처리날짜</th>
            </tr>
            <tr>
                <td class="header_num">5</td>
                <td class="header_category">결제관련</td>
                <td class="header_writer">홍길동</td>
                <td class="header_title">결제가 안되는데요?</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate">2021-10-22</td>
            </tr>
            <tr>
                <td class="header_num">4</td>
                <td class="header_category">홈페이지이용</td>
                <td class="header_title">홍길동</td>
                <td class="header_title">홈페이지가 자주 렉걸려요</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate">2021-10-22</td>
            </tr>
            <tr>
                <td class="header_num">3</td>
                <td class="header_category">배송</td>
                <td class="header_title">홍길동</td>
                <td class="header_title">배송지 변경 요청</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate">2021-10-22</td>
            </tr>
            <tr>
                <td class="header_num">2</td>
                <td class="header_category">상품</td>
                <td class="header_title">홍길동</td>
                <td class="header_title">잘못된 상품이 온 것 같은데 확인해주세요</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate">2021-10-22</td>
            </tr>
            <tr>
                <td class="header_num">1</td>
                <td class="header_category">교환/환불</td>
                <td class="header_title">홍길동</td>
                <td class="header_title">환불언제되나요?</td>
                <td class="header_enrolldate">2021-10-21</td>
                <td class="header_status">처리중</td>
                <td class="header_enddate">2021-10-22</td>
            </tr>
            
        </table>
        <div class="paging-area done_paging_area" align="center">
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>&gt;</button>
        </div>

        <div class="search_box" align="center">
            <form action="" method="get" class="search_form">
                <select name="search_category" id="search_category">
                    <option value="">제목</option>
                    <option value="">글번호</option>
                </select>
                <input type="text" placeholder="검색하실 내용을 입력해주세요" name="search_category_input" id="search_category_input">
                <button id="search_btn">검색</button>
            </form>
        </div>


    </div>





</body>
</html>