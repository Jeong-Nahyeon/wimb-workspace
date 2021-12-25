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
    .inqueryBox table{
        width: 1000px;
        text-align: center;
    }
    .inquieryquestion_tr{border-bottom: 1px solid lightgray;}
    .inqueryBox h3{
        font-size: 23px;
        font-weight: bold;
        border-bottom: 1px solid gray;
        padding-bottom: 10px;
    }
    .inqueryBox table textarea{
        margin-bottom: 80px;
        margin-top: 10px;
    }
    textarea{
        padding: 10px;
        border-radius: 5px;
    }
    .inqeryWriter, .inqeryCatogory{width: 10%;}
    .taletextalignleft{text-align: left;}
    .inqeryWriter, .inqeryWriter_name, .inqeryCatogory, .inqeryCatogory_detail, .inqueryEnrolldate, 
    .inqueryEnrolldate_detail, .inqueryFile, .inqueryFile_detail, .inqueryTitle, .inqueryTitle_detail{padding: 4px 0;}
    .two_btn button{
        border: none;
        background-color: #ffee58;
        border-radius: 5px;
        font-size: 13px;
        padding: 3px 10px;
        margin-top: 30px;
    }
    .two_btn button:focus{outline: none;}
    #back{background-color: lightgray;}
    #insert{margin-left: 10px;}
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
</style>
<title>관리자 - 1:1문의 답변 확인</title>
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
            <h2 id="mainTitle1">고객센터관리 > 1:1문의</h2>
            <h2>> 1:1문의 상세보기</h2>
        </div>

        <div class="inqueryBox">

            <table>
                <h3>1:1문의 내역</h3>
                <tr class="inquieryquestion_tr">
                    <th class="inqeryWriter">작성자</th>
                    <td class="inqeryWriter_name taletextalignleft">홍길동</td>
                    <th class="inqeryCatogory">말머리</th>
                    <td class="inqeryCatogory_detail taletextalignleft">결제관련</td>
                </tr>
                <tr class="inquieryquestion_tr">
                    <th class="inqueryEnrolldate">작성날짜</th>
                    <td class="inqueryEnrolldate_detail taletextalignleft">2021-10-21 17:25:23</td>
                    <th class="inqueryFile">첨부파일</th>
                    <td class="inqueryFile_detail taletextalignleft">캡쳐.jpg</td>
                </tr>
                <tr class="inquieryquestion_tr">
                    <th class="inqueryTitle">제목</th>
                    <td colspan="3" class="taletextalignleft inqueryTitle_detail">결제가 안되는데요?</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <textarea name="inquery_question_content" id="inquery_question_content" cols="133" rows="10" style="resize: none;" readonly></textarea>
                    </td>
                </tr>

            </table>

            <form action="" method="post">
                <h3>답변 내역</h3>
                <textarea name="inquery_question_answer" id="" cols="133" rows="10" style="resize: none;" required readonly>안녕하세요 홍길동 고객님</textarea>

                <div class="fileBox" style="display: inline-block;">
                    <div class="fileBox_first" style="margin-bottom: 10px;">
                        <div style="padding: 0px 30px; display: inline-block; text-align: start;">첨부파일</div>
                        <input type="text" class="fileName" readonly="readonly">
                        <label for="uploadBtn" class="btn_file" style="vertical-align: middle;">추가</label>
                        <input type="file" id="uploadBtn" class="uploadBtn">
                    </div>
                </div>

                <div class="two_btn" align="center">
                    <button type="button" id="back">목록으로</button>
                    <button type="submit" id="insert">수정하기</button>
                </div>
            </form>

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
















        </div>





    </div>
</body>
</html>