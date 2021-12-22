<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/10f565a9d5.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .main{
        width:600px;
        height: 800px;
        margin:auto;
    }
    #title-area{border-bottom: 1px solid black; text-align: left;}
    #currentPoint-area>div{
        display: inline-block;
        width: 200px;
        margin-top: 30px;
        margin-left: 30px;
        margin-right: 30px;
    }
    #currentPoint-area{
        border: 1px solid black;
        width: 100%;
        height: 100px;
        margin-top: 50px;
    }
    #lookupPeriod{border: 1px solid black; margin-bottom:50px;}
    #lookupPeriod ul{padding:0; margin-top:20px;}
    #lookupPeriod li{
        list-style-type: none;
        display:inline;
        font-size: 12px;
        margin:5px;
    }
    #lookupPeriod button{
        width:45px;
        font-size: 11px;
        background-color:rgb(155, 213, 189);
        color: white;   
        border:none; 
    }
    #lookupPeriod button:hover{opacity:0.5;}
    #lookupPeriod input{
        width: 100px;
        font-size: 12px;
    }
    #pointListTable{width:100%; font-size: 12px;}
    #pointListTable td{width: 100px;}
</style>
</head>
<body style="height:100%">

	<%@ include file="../common/myPage.jsp" %>
    <% 
		String userId = loginUser.getmId();
		String userPwd = loginUser.getmPwd();
        int point = loginUser.getmPoint();
	%>
	

    <div class="main">
        <form action="<%=contextPath %>/" id="point-wrap" align="center" method="post">
            <div id="title-area" >
                <p>
                    <h4>적립금조회</h4>
                </p>
            </div>
            <div id="currentPoint-area">
                <div>
                    현재 적립금
                </div>
                <div style="color:rgb(155, 213, 189); font-weight: 900; font-size: 24px;">
                    <%= point %>원
                </div>
            </div>
            <br clear="both">
            <div id="lookupPeriod" width="600">
                <ul>
                    <li>
                        조회기간
                    </li>
                    <li>
                        <button>7일</button>
                        <button>1개월</button>
                        <button>3개월</button>
                        <button>1년</button>
                    </li>
                    <li>
                        <input type="date">
                    </li>
                    <li>
                        <input type="date">
                    </li>
                    <li>
                        <button>조회</button>
                    </li>
                </ul>
            </div>
            <div id="pointListTable">
                <p align="left" style="margin:0; font-size:13px; border-bottom:1px solid black;">
                    2021/11/30 ~ 2021/12/24 까지의 적립금 조회내역
                </p>
                <table id="pointListTable">
                    <tr style="background-color:rgba(231, 231, 231, 0.438);">
                        <td>날짜</td>
                        <td colspan="2">내용</td>
                        <td>포인트내역</td>
                        <td>잔여포인트</td>
                    </tr>
                    <tr style="border-bottom: 1px solid lightgrey;">
                        <td>날짜</td>
                        <td colspan="2">내용</td>
                        <td>포인트내역</td>
                        <td>잔여포인트</td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
   

   <script>
       function back(){
           location.href="<%=contextPath%>/myPage.my"
       }
       function update(){
    	   $("#inputPwd-area").submit();
       }
   </script>
   <footer>
    <%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>