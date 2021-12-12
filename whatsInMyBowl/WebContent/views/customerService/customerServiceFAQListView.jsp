<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
    }
    .outer{
        height: 800px;
        width: 1000px;
        box-sizing: border-box;
        margin: auto;
        margin-top: 130px;
    }
    .noticeSideBar{
        float: left;
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
    .FAQ>h1{
        text-align: center;
        font-size: 26px;
        font-weight: 600;
        margin-bottom: 15px;
    }
    .research_question_box{
        border: 1px solid gray;
        width: 700px;
        padding: 20px 0;
        flex: 100%;
    }
    .research_question_box_left{
        width: 70%;
        display: inline-block;
        text-align: left;
        float: left;
        padding: 8px 0 10px 0;
        margin-left: 20px;
    }
    .research_question_box_left h3,input,span{
        display: inline-block;
        margin: 0 6px;
    }
    .research_question_box_left span{
        width: 50px;
        border: none;
        background-color: rgb(155, 213, 189);
        padding: 3px;
        border-radius: 3px;
        text-align: center;
    }
    .research_question_box_left span i{
        font-size: 13px;
        color: white;
    }
    .research_question_box_right{
        width: 25%;
        position: absolute;
        right: 0;
        display: inline-block;
        text-align: right;

    }
    #research_question_box_right_bottom{
        border: none;
        width: 130px;
        background-color: gray;
        border-radius: 3px;
        display: inline-block;
    }
    .research_question_box_left h3{
        font-size: 17px;
        font-weight: 600;
    }
    input{width: 330px;}
    .FAQ_Category{
        width: 700px;
        margin: 20px 0px;
        margin-left: 230px;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 11px;
        font-weight: bold;
    }
    .FAQ_Category_box{
        display: inline-block;
        padding: 5px 29px;
    }
    #Accordion_wrap{
        margin-left: 230px;
        box-sizing: border-box;
        margin-left: 230px;
    }
    #FAQ_List{
        margin-left: 230px;
        width: 700px;
    }
    #FAQ_List_Title{
        background-color: lightgray;
        font-size: 12px;
        font-weight: bold;
        padding: 8px 0;
    }
    #FAQ_List_Title div, span{
        display: inline-block; 
    }
    #FAQ_List_anw_anw{
        background-color: rgb(155, 213, 189);
        padding: 5px 10px;
        font-size: 10px;
        border-radius: 20px;
        font-weight: bold;
        color: white;
    }

    .FAQ_List_que{
    position: relative;
    padding: 17px 0;
    cursor: pointer;
    font-size: 14px;
    border-bottom: 1px solid #dddddd;
    }
    
    .FAQ_List_que.on>span{
    font-weight: bold;
    color: #006633; 
    }
    
    .FAQ_List_anw {
    display: none;
    overflow: hidden;
    font-size: 14px;
    background-color: #f4f4f2;
    padding: 27px 0;
    }
    .paging-area button{
        margin-top: 20px;
        border: 0;
    }

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
            <form action="" method="">

                <div class="research_question_box">
                    <div class="research_question_box_left">
                        <h3 style="width: 70px;">질문검색</h3>
                        <input type="text" value="궁금한 내용을 입력하세요.">
                        <span><i class="fas fa-search"></i></span>
                    </div>
    
                    <div class="research_question_box_right" style="width: 300px;"></div>
                        <div id="research_question_box_right_top" style="font-size: 13px; font-weight: bold;">찾는 질문이 없다면?</div>
                        <div id="research_question_box_right_bottom" style="font-size: 14px;">1:1문의</div>
                    </div>
                </div>

            </form>

            <div class="FAQ_Category">
                <div class="FAQ_Category_box">전체</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">배송</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">적립금</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">주문/결제</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;"> 취소/환불</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">상품</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">이용/기타</div>
            </div>

            <div id="FAQ_List">
                <div id="FAQ_List_Title" style="text-align: center;">
                    <div style="width: 11%;">번호</div>
                    <div style="width: 12%;">분류</div>
                    <div style="width: 73%;">제목</div>
                </div>
                <div class="FAQ_List_que" align="center">
                    <span style="width: 10%;">41</span>
                    <span style="width: 10%;">배송</span>
                    <span style="width: 72%;">This is first question.</span>
                </div>
                <div class="FAQ_List_anw" align="center">
                    <span id="FAQ_List_anw_anw">답변</span>
                    <span style="width: 82%;">This is first answer.</span>
                </div>
                <div class="FAQ_List_que" align="center">
                    <span style="width: 10%;">41</span>
                    <span style="width: 10%;">배송</span>
                    <span style="width: 72%;">This is first question.</span>
                </div>
                <div class="FAQ_List_anw" align="center">
                    <span id="FAQ_List_anw_anw">답변</span>
                    <span style="width: 82%;">This is first answer.</span>
                </div>
                 <div class="FAQ_List_que" align="center">
                    <span style="width: 10%;">41</span>
                    <span style="width: 10%;">배송</span>
                    <span style="width: 72%;">This is first question.</span>
                </div>
                <div class="FAQ_List_anw" align="center">
                    <span id="FAQ_List_anw_anw">답변</span>
                    <span style="width: 82%;">This is first answer.</span>
                </div>
                <div class="FAQ_List_que" align="center">
                    <span style="width: 10%;">41</span>
                    <span style="width: 10%;">배송</span>
                    <span style="width: 72%;">This is first question.</span>
                </div>
                <div class="FAQ_List_anw" align="center">
                    <span id="FAQ_List_anw_anw">답변</span>
                    <span style="width: 82%;">This is first answer.</span>
                </div>
                <div class="FAQ_List_que" align="center">
                    <span style="width: 10%;">41</span>
                    <span style="width: 10%;">배송</span>
                    <span style="width: 72%;">This is first question.</span>
                </div>
                <div class="FAQ_List_anw" align="center">
                    <span id="FAQ_List_anw_anw">답변</span>
                    <span style="width: 82%;">This is first answer.</span>
                </div>


                <div class="paging-area" align="center">
                 <button>&lt;</button>
                 <button>1</button>
                 <button>2</button>
                 <button>3</button>
                 <button>4</button>
                 <button>5</button>
                 <button>&gt;</button>
                 </div>
           </div>

           <script>
               $(".FAQ_List_que").click(function() {
                    $(this).next(".FAQ_List_anw").stop().slideToggle(300);
                    $(this).toggleClass('on').siblings().removeClass('on');
                    $(this).next(".FAQ_List_anw").siblings(".FAQ_List_anw").slideUp(300); // 1개씩 펼치기
                });
           </script>

        </div>


    </div>

</body>
</html>