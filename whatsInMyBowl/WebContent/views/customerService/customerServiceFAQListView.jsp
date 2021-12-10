<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
    }

    .outer{
        width: 1000px;
        box-sizing: border-box;
        margin: auto;
        margin-top: 130px;
    }

    .noticeSideBar{
        position: fixed;
        width: 200px;
    }

    .noticeSideBar-Top>h2{
        text-align: center;
        font-size: 25px;
        font-weight: 600;
    }

    .noticeSideBar ul li{
        text-align:center;
        margin: 25px 0;
        list-style: none;
        padding: 12px;
    }
    .noticeSideBar ul li a{
        color: black;
        text-decoration: none;
        font-weight: bold;
    }

    .noticeSideBar-Top ul li:hover{
        background-color: rgb(155, 213, 189);
        text-decoration-line: none;
    }

    .FAQ{
        margin-left: 230px;
        text-align: center;
    }
    input[id*="answer"]{
        display: none;
    }
    input[id*="answer"] + label {
        display: block;
        padding: 20px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        border-bottom: 0;
        color: black;
        font-weight: 900;
        background-color: white;
        cursor: pointer;
    }
    input[id*="answer"] + label + div {
        max-height: 0;
        transition: all .35s;
        overflow: hidden;
        background-color: white;
        font-size: 15px;
    }
    input[id*="answer"] + label + div p{
        display: inline-block;
        padding: 20px;
    }
    input[id*="answer"]:checked + label + div{max-height: 100px;}


</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <div class="noticeSideBar">

            <div class="noticeSideBar-Top">
                <h2>고객센터</h2>
                <ul>
                    <li>
                        <a href="">공지사항</a>
                    </li>
                    <li>
                        <a href="">자주묻는 질문</a>
                    </li>
                    <li style="margin-bottom: 80px;">
                        <a href="">1:1문의</a>
                    </li>
                </ul>
            </div>

            <div class="noticeSidebar-Bottom" align="center" style="border-top: 1px solid black; padding-top: 30px;">
                <p style="font-weight: bold;">고객상담센터</p>
                <p style="font-size: 28px; font-weight: 600; color: rgb(155, 213, 189);">1234-1234</p>
                <p style="font-size: 12px; font-weight: bold;">
                    월 ~ 금 : 오전 9시 오후 4시<br>
                    점심시간 : 오후 12시 30분<br>
                    ~ 오후 1시 30분<br>
                    토요일/일요일/공휴일 휴무<br>
                </p>
            </div>

        </div>

        <div class="FAQ">
            <h1>자주 묻는 질문</h1>

            <div class="research_question_box">
                <div class="research_question_box_left">
                    <h3>질문검색</h3>
                    <input type="text">
                    <button type="submit"></button>
                </div>

                <div class="research_question_box_right">
                    <h6>찾는 질문이 없다면?</h6>
                    <button type="submit">1:1문의</button>
                </div>
            </div>

            <div class="FAQ_Category">
                <h6>전체</h6>
                <h6>배송</h6>
                <h6>적립금</h6>
                <h6>주문/결제</h6>
                <h6>취소/환불</h6>
                <h6>상품</h6>
                <h6>이용 및 기타</h6>
            </div>

            <div class="accordion">
                <input type="checkbox" id="answer01">
                <label for="answer01">질문입니다.</label>
                <div><p>내용입니다.</p></div>

                <input type="checkbox" id="answer02">
                <label for="answer02">질문입니다.</label>
                <div><p>내용입니다.</p></div>

                <input type="checkbox" id="answer03">
                <label for="answer03">질문입니다.</label>
                <div><p>내용입니다.</p></div>

                <input type="checkbox" id="answer04">
                <label for="answer04">질문입니다.</label>
                <div><p>내용입니다.</p></div>
            </div>



        </div>


    </div>

</body>
</html>