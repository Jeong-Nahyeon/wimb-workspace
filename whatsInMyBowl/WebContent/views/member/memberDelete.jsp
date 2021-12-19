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
    
    /* 은지 */
    .outer{
        width: 1000px;
        height: 600px;
        margin: auto;
        margin-top: 90px;
    }
    .outer>div{float:left;}
    .mypageSidebar{
        width: 200px;
        height: 600px;
        margin-right: 30px;
    }
    .mypageSidebar .title{
        margin: 5px;
        display: block;
    }
    .mypageSidebar .menu{
        border: 3px solid lightgray;
        border-top: 3px solid black;
        padding: 10px;
    }
    .mypageSidebar .menu th{
        color: black;
        text-align: left;
        padding-bottom: 8px;
        font-size: 15px;
        border-bottom: 1px solid grey;
    }
    .mypageSidebar .menu td{
        padding-bottom: 8px;
    }
    #sidebarmenu{
        padding-bottom: 45px;
    }
    a {
        text-decoration: none;
        color:black;
    }
    a:link { 
    	text-decoration:none;
    	color:black;
    }
    .main{
        width:600px;
        height: 600px;
        margin-left: 50px;
    }
    #title-area{border-bottom: 1px solid black; text-align: left;}
    #main-area{
        margin-top:130px;
        text-align: center;    
    }
    #button-area{margin: 50px;}
    #cancelBtn, #confirmBtn{
        width: 80px;
        height: 30px;
        border: 1px solid lightgrey;
        background-color: white;
        border-radius: 1.05ex;
        margin-left:30px;
        margin-right:30px
    }
    #cancelBtn:hover, #confirmBtn:hover{
        border: 1px solid rgb(155, 213, 189);
        background-color: rgb(155, 213, 189);
        color:white;
    }
    #input-area{
        background-color: rgba(241, 238, 238, 0.432);
        width: 500px;
        height: 50px;
        line-height: 50px;
        margin:auto;
    }
    #input-area>div{
        float:left;
        margin:auto;
        width: 200px;
        margin-left:20px
    }
    #input-area input[type="password"]{
        width:100px;
        height: 30px;
    }
</style>
</head>
<body style="height:100%">

	<%@ include file="../common/menubar.jsp" %>
		
    <div class="outer">
 
         
        <!-- 마이페이지 사이드바 시작-->
        <div class="mypageSidebar">
            <div class="title"><h3>마이페이지</h3></div>
            <div class="menu">
            <table>
                <tr>
                    <th>회원정보</th>
                </tr>
                <tr>
                    <td><a href="<%=contextPath%>/memberUpdate.me">회원정보변경</a></td>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="<%=contextPath%>/memberDelete.me">회원탈퇴</a></td>
                </tr> 
                <tr>
                    <th>혜택관리</th>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="">적립금</a></td>
                </tr>
                <tr>
                    <th>쇼핑정보</th>
                </tr>
                <tr>
                    <td><a href="<%=contextPath%>/orderList.my">주문목록/배송조회</a></td>
                </tr>
                <tr>
                    <td><a href="<%=contextPath%>/cancelList.my">취소/환불내역</a></td>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="">찜리스트</a></td>
                </tr>
                <tr>
                    <th>나의 게시글관리</th>
                </tr>
                <tr>
                    <td><a href="<%=contextPath%>/inquiryList.my">1:1문의</a></td>
                </tr>
                <tr>
                    <td><a href="">상품문의</a></td>
                </tr>
                <tr>
                    <td><a href="">내가 작성한 리뷰</a></td>
                </tr>
            </table>
            </div>
        </div>
        <!-- 마이페이지 사이드바 끝-->

        <div class="main">
            <form id="inputPwd-area" align="center" >
                <div id="title-area" >
                    <p>
                        <h4> 회원 탈퇴</h4>
                    </p>
                </div>
                <div id="main-area">
                    <p>
                        회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력해주세요
                    </p>
                    <div id="input-area">
                        <div>
                            비밀번호 <input type="password" name="userPwd" required>
                        </div>
                    </div>
                </div>
                <div id="button-area">
                    <button type="button" id="cancelBtn" onclick="back();">취소</button>
                    <button type="submit" id="confirmBtn" onclick="update();">확인</button>
                </div>
            </form>
        </div>
   </div> 

   <script>
       function back(){
           location.href="<%=contextPath%>/myPage.my"
       }
       function update(){
    	   location.href="<%=contextPath%>/update.me"
       }
   </script>
   <footer>
    <%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>