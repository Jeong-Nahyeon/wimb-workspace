<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin-top: 100px;
        margin-left: 25%;
    }
    button:focus{
        outline: 0;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .notice_Box{
        margin-top: 130px;
        width: 1000px;
    }
    .notice_Box_top{text-align: end;}
    .notice_Box_top button{
        border: none;
        background-color: #ffee58;
        border-radius: 4px;
        font-size: 15px;
        padding: 3px 10px;
        margin-bottom: 10px;
    }
    .notice_Box_top button:focus{outline: none;}
    .notice_Box_top button:hover{background-color: #fdd835;}
    .notice_Box table{width: 100%;}
    .noticeList_checkbox_main{width: 3%;}
    .noticeList_num{width: 5%;}
    .noticeList_title{width: 60%;}
    .noticeList_update_delete{
        width: 10%;
    }
    .noticeList_enroll_date{width: 10%;}
    .noticeList_count{width: 6%;}
    .noticeList_checkbox_main, .noticeList_num, 
    .noticeList_title, .noticeList_update_delete, 
    .noticeList_enroll_date, .noticeList_count{
        padding: 4px 0;
        text-align: center;
        border-bottom: 1px solid gray;
    }
    .noticeList_header{
        background-color: lightgray;
        border-top: 1px solid gray;
    }
    .two_btn{display: inline-block;}
    .two_btn button{
        border: none;
        background-color: #ffee58;
        border-radius: 5px;
        font-size: 13px;
        padding: 3px 8px;
    }
    .two_btn button:focus{outline: none;}
    .two_btn button:hover{background-color: #fdd835;}
    .paging-area button{
        border: 0;
        margin: 30px 0 80px 0;
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
            <h2>> 공지사항</h2>
        </div>

        <div class="notice_Box">
            <div class="notice_Box_top">
                <button class="notice_Box_top_left">새 글 등록</button>
                <button class="notice_Box_top_bottom">선택삭제</button>
            </div>
            <table>
                <tr class="noticeList_header">
                    <th class="noticeList_checkbox_main"></th>
                    <th class="noticeList_num">글번호</th>
                    <th class="noticeList_title">제목</th>
                    <th class="noticeList_update_delete">수정 / 삭제</th>
                    <th class="noticeList_enroll_date">작성일</th>
                    <th class="noticeList_count">조회수</th>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>
                <tr>
                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1"></td>
                    <td class="noticeList_num">33</td>
                    <td class="noticeList_title">글제목입니다33</td>
                    <td class="noticeList_update_delete">
                        <div class="two_btn">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </td>
                    <td class="noticeList_enroll_date">21-12-12</td>
                    <td  class="noticeList_count">100</td>
                </tr>

            </table>

            <div class="paging-area" align="center">
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

            <script>
                const search_Form = document.querySelector('.search_Form')
                const searchBox = document.querySelector('.search_category_input')
                const searchHistory = document.querySelector('search_btn')

                function createSearchHistoryList(){
                    if(searchHistoryListIndex < searchHistoryList.length){
                        var a = document.createElement('a');
                        const aText = searchHistoryList[searchHistoryListIndex];
                        searchHistory.appendChild(a);
                        a.outerHTML = '<a href="http://google.com/search?q=${aText}">${aText}</a><br>'
                        searchHistoryListIndex++;
                        createSearchHistoryList();
                    }
                }
                function handleSearch(event){
                    event.preventDefault();
                    const sValue = searchBox.value;
                    searchOnInput(sValue);
                }
                function search(){
                    search_Form.addEventListener("submit", handleSearch)
                }
                function searchOnInput(sValue){
                    loaction.href='http://google.com/search?q=${sValue}';
                }
                function init(){
                    search()
                    createSearchHistoryList()
                }
                init()


                $(document).ready(function(){
                    $(":button")
                });
            </script>

        </div>

 </div>
    
    
    
</body>
</html>