<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #mypageNav{
        width:1000px;
        height:50px;
        margin:auto;
        position: relative;
    }
    .mypageSidebar{
        width: 200px;
        height: 600px;
        position: absolute;
        top:50px;
        left:-70px;
        float:left;
    }
    .title{
        margin: 5px;
        display: block;
    }
    .menu{
        /* border: 3px solid lightgray; */
        border-top: 2px solid black;
        padding: 10px;
        background-color: rgba(240, 238, 238, 0.267);
    }
    .menu th{
        color: black;
        text-align: left;
        padding-bottom: 8px;
        font-size: 15px;
        border-bottom: 1px solid grey;
    }
    .menu td{
        padding-bottom: 8px;
    }
    .menu a {
        text-decoration: none;
        color:black;
        font-size: small;
    }
    #pointA{cursor:pointer}
    .menu a:hover, #pointA:hover {
    	text-decoration:none;
    	color:lightgrey;
    }
</style>

</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <% int userNoCode = loginUser.getmCode(); %>
    
    <!-- 마이페이지 사이드바 시작-->
    <div id="mypageNav">
        <div class="mypageSidebar">
            <div class="title">
                <h3>마이페이지</h3>
            </div>
            <div class="menu">
                <table>
                    <tr>
                        <th>회원정보</th>
                    </tr>
                    <tr>
                        <td>
                            <a href="<%=contextPath%>/memberUpdate.me">회원정보변경</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-bottom: 45px;">
                            <a href="<%=contextPath%>/memberDelete.me">회원탈퇴</a>
                        </td>
                    </tr> 
                    <tr>
                        <th>혜택관리</th>
                    </tr>
                    <tr>
                        <td style="padding-bottom: 45px;">
                        	<form action="<%=contextPath%>/pointClick.me" id="pointUserForm" method="post">
                            	<a id="pointA" onclick="submit();">
                            	<input type="hidden" id="userNo" name="userNo" value="<%=userNoCode%>">
                            	적립금
                            	</a>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <th>쇼핑정보</th>
                    </tr>
                    <tr>
                        <td>
                            <a href="<%=contextPath%>/orderList.my">주문목록/배송조회</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="<%=contextPath%>/cancelList.my">취소/환불내역</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-bottom: 45px;">
                            <a href="<%=contextPath%>/heartList.my">찜리스트</a>
                        </td>
                    </tr>
                    <tr>
                        <th>나의 게시글관리</th>
                    </tr>
                    <tr>
                        <td>
                            <a href="<%=contextPath%>/inquiryList.my?cpage=1">1:1문의</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="">상품문의</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-bottom: 45px;">
                            <a href="">내가 작성한 리뷰</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>  
    <!-- 마이페이지 사이드바 끝-->
     
    <script>
        function submit(){
            $("#pointUserForm").submit();
        }
    </script>
   
</body>
</html>