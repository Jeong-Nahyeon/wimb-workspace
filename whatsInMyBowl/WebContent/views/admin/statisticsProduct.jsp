<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계 - 상품 수 통계</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
    .outer{
        margin-top: 100px;
        margin-left: 25%;
        height: auto;
        text-align: center;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .sttt{
        background-color: #f5f5f5;
        width: 1200px;
        padding: 50px;
    }
    .sttt_top{
        display: inline-block;
        border: 1px solid lightgray; 
        padding: 30px 50px;
    }
    .sttt_top, .sttt_top_period, .sttt_top_period_datebox{display: inline-block;}
    .sttt_top_period p{
        text-align: left;
        font-weight: bold;
        font-size: 20px;
    }
    .sttt_datebtn{
        background-color: none;
        border: 2px solid gray;
    }
    .sttt_category_btn{
        text-align: end;
        margin-right: 165px;
        margin-bottom: 20px;
    }
    .sttt_category_btn button{
        border: none;
        border-radius: 4px;
        background-color: lightgray;
        padding: 2px 13px;
        width: 100px;
        margin-right: 10px;
    }
    .sttt_category_btn button:hover{background-color: #ffee58;}
    .sttt_datebtn:hover{background-color: rgb(155, 213 , 189);}
    .sttt_datebtn:focus{outline: none;}
    .sttt_top_period_datebox{padding-left: 30px;}
    .sttt_top i{
        font-size: 90px;
        margin-right: 30px;
        color: #757575;
    }
    .sttt_bottom table{
        margin-left:auto;
        margin-right:auto;
        margin-top: 100px;
        width: 700px;
        padding: 30px;
    }
    .sttt_bottom table tr{border-bottom: 1px solid lightgray;}
    .sttt_bottom table th{
        border-bottom: 2px solid #757575;
        padding-bottom: 5px;
    }
    .sttt_bottom table td{padding: 5px 0px;}
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
    <%@ include file="../common/adminBar.jsp" %>

    <div class="outer">
        <div id="mainTitle" align="left">
            <h2 id="mainTitle1">통계</h2>
            <h2>> 상품 수 통계</h2>
        </div>

        <div class="sttt">
            <div class="sttt_category_btn">
                <button type="button">전체보기</button>
                <button type="button">완제품</button>
                <button type="button">커스텀</button>
            </div>

            <div class="sttt_top">
                <span><i class="far fa-chart-bar"></i></span>
                <div class="sttt_top_period">
                    <p>조회기간</p>
                    <button type="button" class="sttt_datebtn">일간</button>
                    <button type="button" class="sttt_datebtn">주간</button>
                    <button type="button" class="sttt_datebtn">월간</button>
                        
                    <div class="sttt_top_period_datebox">
                        <input type="date"> ~
                        <input type="date"> 
                    </div>
                </div>

            </div>

            <div class="sttt_bottom">

                <table>
                    <tr>
                        <th></th>
                        <th>상품번호</th>
                        <th>상품명</th>
                        <th>입고량</th>
                        <th>출고량</th>
                        <th>재고</th>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
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






            </div>













        </div>








    </div>







</body>
</html>