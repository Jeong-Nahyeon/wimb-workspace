<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
    .outer{
        margin-top: 100px;
        margin-left: 18%;
        width: 1500px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}


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
            <h2 id="mainTitle1">통계</h2>
            <h2>> 회원 수 통계</h2>
        </div>

        <div class="sttt_top">
            <span><i class="fas fa-chart-bar"></i></span>
            <div class="sttt_top_period">
                <p>조회기간</p>
                <button type="button">일간</button>
                <button type="button">주간</button>
                <button type="button">월간</button>

                <input type="date"> ~
                <input type="date">
                
                <button type="button">조회</button>

            </div>

        </div>

        <div class="sttt_bottom">
            <table border="1px">
                <tr>
                    <th>연령별</th>
                    <th>성별</th>
                    <th>순방문자수</th>
                    <th>비율</th>
                </tr>
                <tr>
                    <td rowspan="2">전체</td>
                    <td>남</td>
                    <td>방문자수0<td>
                    <td>비율<td>
                    
                </tr>
                <tr>
                    
                    <td>남</td>
                    <td>방문자수0<td>
                    <td>방문자수0<td>
                </tr>
            </table>

        </div>



    </div>




</body>
</html>