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
    .outer{
        width: 1000px;
        height: 0px;
        margin: auto;
        margin-top: 90px;
    }
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
    .nearestOrder, .mypageSidebar {
        display: inline-block;
    }
    a {
        text-decoration: none;
        color:black;
    }
    .userImg{
            vertical-align: middle;
            width: 50px;
            height: 50px;
            border-radius: 50%;
    }
    #point{
        border-right: 2px solid lightgray;
        border-left: 2px solid lightgray;
        text-align: center;
    }
    #usertable{
        border: 1px solid gray;
        margin-left: 230px;
        border-top: 2px solid black ;
    }
    a { text-decoration:none}
    #like{text-align: center;}
    #userImage #userName{
        display: inline-block;
    }
    #userImage{
        width: 50px;
        height: 50px;
        float: left;
        margin-left: 100px;
    }
    #userName{
        width: 100px;
        margin-top: 10px;
        float: left;
    }
</style>

</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    
    <div class="outer">

        <!-- 사용자 적립금/찜하기 테이블 시작-->
        <table id="usertable"  width="700" height="100">
            <tr>
                <td rowspan="2" colspan="2" align="right" width="200">
                   <div id="userImage"><img src="https://www.w3schools.com/howto/img_avatar.png" alt="userImg" class="userImg"></div>
                    <div id="userName"><h5><a href="">홍길동</a>님</h5></div>
                </td>
                <td colspan="2" rowspan="2" width="80px" >
                    <div id="point">적립금<br><br>
                        <a href="">0</a>원
                    </div>
                </td>
                
                <td colspan="2"  rowspan="2" width="80px">
                    <div id="like">찜하기<br><br>
                        <a href="">0</a>원
                    </div>
                </td>
            </tr>
         </table>
        <!-- 사용자 적립금/찜하기 테이블 끝-->
         
        <!-- 마이페이지 사이드바 시작-->
        <div class="mypageSidebar">
            <div class="title"><h3>마이페이지</h3></div>
            <div class="menu">
            <table>
                <tr>
                    <th>회원정보</th>
                </tr>
                <tr>
                    <td><a href="">회원정보변경</a></td>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="">회원탈퇴</a></td>
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
                    <td><a href="">주문목록/배송조회</a></td>
                </tr>
                <tr>
                    <td><a href="">취소/환불내역</a></td>
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
         

    <%@ include file="../common/footer.jsp" %>
 
  </div>     
</body>
</html>