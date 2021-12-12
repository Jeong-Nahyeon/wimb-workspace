<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-고객센터 등록</title>
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
    .outer table{margin-top: 130px;}
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .insertNotice_title{width: 15%}
    .insertNotice_title_input{width: 100%;}
    .insertNotice_title_input:focus{outline: none;}
    .insertNotice_content{vertical-align: top;}
    .insertNotice_content_textarea:focus{outline: none;}
    .insertNotice_title_input, .insertNotice_file_input, .insertNotice_content_textarea{
        margin: 5px 0;
        padding: 3px;
    }
    .two_btn button{
        border: none;
        background-color: #ffee58;
        border-radius: 5px;
        font-size: 13px;
        padding: 3px 10px;
        margin-top: 50px;
    }
    .two_btn button:focus{outline: none;}
    #insert{
        margin-left: 10px;
        padding:3px 23px;
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
            <h2 id="mainTitle1">고객센터관리 > 공지사항</h2>
            <h2>> 공지사항 등록</h2>
        </div>

        <table>
            <tr>
                <td class="insertNotice_title">제목</td>
                <td><input type="text" name="title" id="title" class="insertNotice_title_input" placeholder="제목을 입력해주세요" required></td>
            </tr>
            <tr>
                <td class="insertNotice_file">첨부파일</td>
                <td><input type="file" name="FileInsertNotice" id="FileInsertNotice" class="insertNotice_file_input"></td>
            </tr>
            <tr>
                <td class="insertNotice_content">내용</td>
                <td><textarea name="" id="" cols="100" rows="20"  class="insertNotice_content_textarea" required>내용을 입력해주세요</textarea></td>
            </tr>
        </table>

        <div class="two_btn" align="center">
            <button type="button">목록으로</button>
            <button type="submit" id="insert">등록</button>
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
</body>
</html>