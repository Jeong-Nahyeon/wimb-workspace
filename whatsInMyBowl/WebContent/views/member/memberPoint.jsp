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
</style>
</head>
<body style="height:100%">

	<%@ include file="../common/myPage.jsp" %>
    <% 
		String userId = loginUser.getmId();
		String userPwd = loginUser.getmPwd();
        String point = loginUwer.getmPoint();
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
                <div style="color:rgb(155, 213, 189); font-weight: 900; font-size: 25px;">
                    <%= point %>
                </div>
            </div>
            <br clear="both">
            <div id="lookupPeriod">
                <ul>
                    <li>
                        조회기간
                    </li>
                    <li>
                        <button></button>
                        <button></button>
                        <button></button>
                        <button></button>
                    </li>
                    <li>
                        <input type="date">
                    </li>
                    <li>
                        <input type="date">
                    </li>
                    <li>
                        <button></button>
                    </li>
                </ul>
            </div>
            <div>
                <p align="left" style="margin:0;">
                    2021/11/30 ~ 2021/12/24 까지의 적립금 조회내역
                </p>
                <table border id="pointListTable">
                    <tr>
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