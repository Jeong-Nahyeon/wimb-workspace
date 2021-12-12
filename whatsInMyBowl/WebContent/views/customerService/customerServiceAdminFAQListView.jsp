<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 자주묻는 질문 리스트</title>
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
    .FAQ_Box_top{text-align: end;}
    .FAQ_Box_top button{
        border: none;
        background-color: #ffee58;
        border-radius: 4px;
        font-size: 15px;
        padding: 3px 10px;
        margin-bottom: 10px;
    }
    .FAQ_Box_top button:focus{outline: none;}
    .FAQ_Box_top button:hover{background-color: #fdd835;}
    .FAQ_Category{
        width: 1000px;
        margin: 20px 0px;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 15px;
        font-weight: bold;
    }
    .FAQ_Category_box{
        display: inline-block;
        padding: 5px 40px;
    }
    .FAQ_Box table{
        width: 1000px;
        border-collapse: collapse;
    }
    .FAQ_Box table .check1{width: 3%;}
    .FAQ_Box table .FAQ_title{
        width: 90%;
        font-weight: bold;
        border-bottom: 1px solid gray;
    }
    .FAQ_Box table .FAQ_Update_btn{
        border-bottom: 1px solid gray;
        text-align: end;
    }
    .FAQ_Update_btn button{
        border-radius: 3px;
        border: none;
        background-color: #ffee58;
        margin-bottom: 3px;
        padding: 2px 8px;
        font-size: 14px;
    }
    .FAQ_Update_btn button:focus{outline: none;}
    .FAQ_Update_btn button:hover{background-color: #fdd835;}
    .FAQ_answer{margin-bottom: 1100px;}
    .FAQ_title, .FAQ_answer{
        padding: 10px 0;
    }
    .FAQ_answer{padding-bottom: 80px}
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
            <h2>> 자주묻는 질문</h2>
        </div>
        
        <div class="FAQ_Box">

            <div class="FAQ_Box_top">
                <button class="notice_Box_top_left" type="button">새 글 등록</button>
                <button class="notice_Box_top_bottom">선택삭제</button>
            </div>
            
            <div class="FAQ_Category" align="center">
                <div class="FAQ_Category_box">전체</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">배송</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">적립금</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">주문/결제</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">취소/환불</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">상품</div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;">이용/기타</div>
            </div>

            <table>
                <tr>
                    <td class="check1"><input type="checkbox" name="check1"></td>
                    <td class="FAQ_title">적립금은 어떻게 사용하나요?</td>
                    <td class="FAQ_Update_btn"><button type="button">수정</button></td>
                </tr>
                <tr>
                    <td class="check1"></td>
                    <td colspan="2" class="FAQ_answer">2만원 이상 주문 시 결제시에 사용 가능합니다.</td>
                </tr>

                <tr>
                    <td class="check1"><input type="checkbox" name="check1"></td>
                    <td class="FAQ_title">적립금은 어떻게 사용하나요?</td>
                    <td class="FAQ_Update_btn"><button type="button">수정</button></td>
                </tr>
                <tr>
                    <td class="check1"></td>
                    <td colspan="2" class="FAQ_answer">2만원 이상 주문 시 결제시에 사용 가능합니다.</td>
                </tr>

                <tr>
                    <td class="check1"><input type="checkbox" name="check1"></td>
                    <td class="FAQ_title">적립금은 어떻게 사용하나요?</td>
                    <td class="FAQ_Update_btn"><button type="button">수정</button></td>
                </tr>
                <tr>
                    <td class="check1"></td>
                    <td colspan="2" class="FAQ_answer">2만원 이상 주문 시 결제시에 사용 가능합니다.</td>
                </tr>





            </table>




        </div>












    </div>

</body>
</html>