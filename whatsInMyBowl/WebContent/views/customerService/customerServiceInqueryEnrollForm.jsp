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
    #InqueryForm{
        margin-left: 230px;
        text-align: center;
        width: 700px;
    }
    #InqueryForm h3{
        font-size: 26px;
        font-weight: 600;
        margin-bottom: 15px;

    }
    #InqueryForm table{
        width: 700px;
        border-top: 2px solid gray;
        border-bottom: 2px solid gray;
    }
    #InqueryForm tr{
        padding: 30px 0;
    }
    input{
        width: 300px;
    }
    textarea{
        color: gray;
        padding: 10px;
        font-size: 10px;
        border-radius: 3px;
    }
    .fileBox{position: relative;}
    .fileBox .fileName {
        display:inline-block;
        width:190px;
        height:30px;
        padding-left:10px;
        margin-right:5px;
        line-height:30px;
        border:1px solid #aaa;
        background-color:#fff;
        vertical-align:middle
    }
    .fileBox .btn_file {
        display:inline-block;
        position: absolute;
        background-color: gray;
        color: white;
        width:50px;
        height:30px;
        font-size:8px;
        line-height:30px;
        border-radius: 3px;
        text-align:center;
        vertical-align:middle
    }
    .fileBox input[type="file"] {
        position:absolute;
        width:1px;
        height:1px;
        padding:0;
        margin:-1px;
        overflow:hidden;
        clip:rect(0,0,0,0);
        border:0
    }
    #btn-reset, #btn-insert{
        border-radius: 5px;
        margin-top: 30px;
        border: 2px solid rgb(155, 213, 189);
        padding: 3px 30px;
        color: rgb(155, 213, 189);
        font-weight: 800;
        font-size: 10px;
    }
    #btn-reset{
        background-color: white;
    }
    #btn-insert{
       background-color: rgb(155, 213, 189);
       color: white;
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

        <div id="InqueryForm">
            <form action="" method="post">
    
                <h3>1:1 문의</h3>
                <table>
                    <tr style="border-bottom: 1px solid lightgray;">
                        <th style="padding: 10px 0; width: 100px;">작성자</th>
                        <td style="width: 300px; text-align: left;">홍길동</td>
                        <th>말머리</th>
                        <td>
                            <select name="inquiry_category">
                                <option value="">문의내용</option>
                                <option value="">결제관련</option>
                                <option value="">홈페이지이용</option>
                                <option value="">배송</option>
                                <option value="">상품</option>
                                <option value="">취소/환불</option>
                                <option value="">기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="border-bottom: 1px solid lightgray;">
                        <th style="padding: 10px 0;">제목</th>
                        <td colspan="3" style="text-align: left;"><input type="text" name="title" required></td>
                    </tr>
                    <tr>
                        <th style="padding: 10px 0;">내용</th>
                        <td colspan="3" style="text-align: left;">자동으로 비밀글로 작성됩니다.</td>
                    </tr>
                    <tr>
                        <td colspan="4"><textarea name="content" id="" cols="90" rows="10" required style="resize: none;">내용을 입력해주세요.</textarea></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="font-size: 13px; text-align: left; padding-left:10px; font-weight: bold; padding-bottom: 5px;">
                            
                            <div class="fileBox" style="display: inline-block;">
                                
                                <div class="fileBox_first" style="margin-bottom: 10px;">
                                    <div style="padding: 0px 30px; display: inline-block; text-align: start;">첨부파일</div>
                                    <input type="text" class="fileName" readonly="readonly">
                                    <label for="uploadBtn" class="btn_file" style="vertical-align: middle;">추가</label>
                                    <input type="file" id="uploadBtn" class="uploadBtn">
                                </div>

                                <div class="fileBox_second" style="padding-left: 116px;">
                                    <input type="text" class="fileName" readonly="readonly">
                                    <label for="uploadBtn2" class="btn_file" style="vertical-align: middle;">추가</label>
                                    <input type="file" id="uploadBtn2" class="uploadBtn">
                                </div>

                            </div>

                        </td>
                    </tr>
                </table>

                <div align="center">
                    <button type="reset" id="btn-reset">취소</button>
                    <button type="submit" id="btn-insert">등록</button>
                </div>
    
            </form>


        </div>


    </div>

    <script>
        var uploadFile = $('.fileBox .uploadBtn');
        uploadFile.on('change', function(){
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $(this).siblings('.fileName').val(filename);
        });

        var uploadFile = $('.fileBox .uploadBtn2');
        uploadFile.on('change', function(){
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $(this).siblings('.fileName').val(filename);
        });
    </script>

</body>
</html>