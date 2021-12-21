<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계 - 회원 수 통계</title>
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
    .stttTable_gender{background-color: #eeeeee;}
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
            <h2>> 회원 수 통계</h2>
        </div>

        <div class="sttt">

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
                        <th>연령별</th>
                        <th>성별</th>
                        <th>회원수</th>
                        <th>비율</th>
                    </tr>
    
                    <tr>
                        <td rowspan="2">전체</td>
                        <td class="stttTable_gender">남</td>
                        <td>0</td>
                        <td>0.0%</td>      
                    </tr>
                    <tr>
                        <td class="stttTable_gender">여</td>
                        <td>0</td>
                        <td>0.0%</td>
                    </tr>
                    <tr>
                        <td rowspan="2">10대</td>
                        <td class="stttTable_gender">남</td>
                        <td>0</td>
                        <td>0.0%</td>
                        
                    </tr>
                    <tr> 
                        <td class="stttTable_gender">여</td>
                        <td>0</td>
                        <td>0.0%</td>
                    </tr>
                    <tr>
                        <td rowspan="2">20대</td>
                        <td class="stttTable_gender">남</td>
                        <td>0</td>
                        <td>0.0%</td>
                        
                    </tr>
                    <tr>
                        <td class="stttTable_gender">여</td>
                        <td>0</td>
                        <td>0.0%</td>
                    </tr>
                    <tr>
                        <td rowspan="2">30대</td>
                        <td class="stttTable_gender">남</td>
                        <td>0</td>
                        <td>0.0%</td>
                        
                    </tr>
                    <tr>
                        <td class="stttTable_gender">여</td>
                        <td>0</td>
                        <td>0.0%</td>
                    </tr>
                    <tr>
                        <td rowspan="2">40대</td>
                        <td class="stttTable_gender">남</td>
                        <td>0</td>
                        <td>0.0%</td>
                        
                    </tr>
                    <tr>
                        <td class="stttTable_gender">여</td>
                        <td>0</td>
                        <td>0.0%</td>
                    </tr>
                    <tr>
                        <td rowspan="2">50대 이상</td>
                        <td class="stttTable_gender">남</td>
                        <td>0</td>
                        <td>0.0%</td>
                    </tr>
                    <tr>
                        <td class="stttTable_gender">여</td>
                        <td>0</td>
                        <td>0.0%</td>
                    </tr>
                </table>
    
            </div>




        </div>



    </div>




</body>
</html>