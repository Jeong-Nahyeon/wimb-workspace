<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계 - 판매량 통계</title>
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
        width: 1300px;
        padding: 50px;
    }
    .sttt_top{
        display: inline-block;
        border: 1px solid lightgray; 
        padding: 30px 50px;
        width: 800px;
        margin-bottom: 70px;
    }
    .sttt_top p{
        font-size: 23px;
        width: 100%;    
        text-align: left;    
        border-bottom: 1px solid #757575;
        padding-bottom: 10px;
        font-weight: bold;
    }
    .sttt_top_table table{
        width: 250px;
        border: 1px solid #757575;
    }
    .table_header{background: #D6D6D6;}
    .sttt_top table th, .sttt_top table td{
        width: 125px;
        border: 1px solid #757575;
        padding: 10px 0;
    }
    .sttt_bottom_period p{
        text-align: left;
        font-weight: bold;
        font-size: 20px;
    }
    .sttt_datebtn{
        background-color: none;
        border: 2px solid gray;
    }
    .sttt_bottom_period_datebox{margin-bottom: 30px;}
    .sttt_datebtn:hover{background-color: rgb(155, 213 , 189);}
    .sttt_datebtn:focus{outline: none;}
    .sttt_top_table_left{margin-right: 100px;}
    .sttt_bottom_period, .sttt_bottom_period_datebox{display: inline-block;}
    .sttt_bottom_period_datebox{padding-left: 30px;}
    .sttt_top p, .sttt_top_table_left, .sttt_top_table_right{display: inline-block;}
    .sttt_table_left, .sttt_table_right{
        display: inline-block;
        padding: 30px;
    }
    .sttt_table_right{
        margin-bottom: 180px;
    }
    .sttt_bottom table tr{border-bottom: 1px solid lightgray;}
    .sttt_bottom table th{
        border-bottom: 2px solid #757575;
        padding-bottom: 5px;
    }
    .sttt_bottom table td{padding: 10px 8px;}
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
            <h2>> 판매량 통계</h2>
        </div>

        <div class="sttt">

            <div class="sttt_top">
                
                <p>오늘의 판매량</p>
                <div class="sttt_top_table">
                    <table class="sttt_top_table_left">
                        <tr>
                            <th class="table_header">커스텀</th>
                            <td>00</td>
                        </tr>
                        <tr>
                            <th class="table_header">완제품</th>
                            <td>00</td>
                        </tr>
                    </table>
    
                    <table class="sttt_top_table_right">
                        <tr>
                            <th class="table_header">회원</th>
                            <td>00</td>
                        </tr>
                        <tr>
                            <th class="table_header">비회원</th>
                            <td>00</td>
                        </tr>
                    </table>
                </div>
            </div>
    
            <div class="sttt_bottom">
                <div class="sttt_bottom_period">
                    <p>조회기간</p>
                    <button type="button" class="sttt_datebtn">일간</button>
                    <button type="button" class="sttt_datebtn">주간</button>
                    <button type="button" class="sttt_datebtn">월간</button>
                    
                    <div class="sttt_bottom_period_datebox">
                        <input type="date"> ~
                        <input type="date"> 
                    </div>
                </div>

                <div>
                    <table class="sttt_table_left">
                        <tr>
                            <th>날짜</th>
                            <th>총 판매액(원)</th>
                            <th>커스텀</th>
                            <th>완제품</th>
                            <th>회원</th>
                            <th>비회원</th>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                    
                    </table>
    
                    <table class="sttt_table_right">
                        <tr>
                            <th>날짜</th>
                            <th>총 판매액(원)</th>
                            <th>커스텀</th>
                            <th>완제품</th>
                            <th>회원</th>
                            <th>비회원</th>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>2021-12-14</td>
                            <td>1,000,000</td>
                            <td>500,000</td>
                            <td>500,000</td>
                            <td>900,000</td>
                            <td>100,000</td>
                        </tr>
    
    
    
    
                    </table>

                </div>
    
    
    
            </div>



        </div>



    </div>
</body>
</html>