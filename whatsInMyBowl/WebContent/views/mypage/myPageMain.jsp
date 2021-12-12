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
    /* 지은 */
    /*마이페이지 메인 > 최근주문정보 전체 영역*/
    .nearestOrder {
        margin-top: 50px;
    }
    /*최근주문정보 배송상태 영역*/
    .orderStatus {
        width:700px; 
        height: 130px;
        background-color: rgb(155, 213, 189);
        color: rgba(19, 19, 19, 0.753);
        margin-bottom: 20px;
        text-align: center;
        border: 1px solid #ebebeb;
    }
    #plus {
        float: right;
    }
    #plus :hover {
        cursor: pointer;
    }
    /*최근주문정보 리스트 영역*/
    .orderList th {
        border-bottom: 1px solid rgba(182, 178, 178, 0.719);
        font-size: 12px;
        background-color: rgba(240, 239, 233, 0.445);
        padding: 10px 3px;
    }
    .orderList td {
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        font-size: 13px;
        padding: 15px 5px 15px 5px;
    }
    .orderList {
        width: 700px;
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 2px solid rgba(133, 136, 139, 0.548);
        text-align: center;
        border-spacing: 0px;
    }

    /* 은지 */
    .outer{
        width: 1000px;
        height: 550px;
        margin: auto;
        margin-top: 200px;
    }
    .userbar{
        /*border: 1px solid black;*/
        /*color: black;*/
        margin-left: 250px;
        width: 500px;
    }
    .usertable{
        width: 500px;
        padding-bottom: 20px;
        border-top: 2px solid black;
        border-left: 2px solid lightgray;
        border-right: 2px solid lightgray;
        border-bottom: 2px solid lightgray;
    }
    .userbar .usertable .profile{
        display: inline;
        margin-left: 10px;
        margin-right: 30px;
    }
    .userbar .usertable .profile > div{
        margin-left: 10px;
    }
    .userbar .usertable .row{
        display: inline;
        margin-left: 30px;
        margin-right: 20px;
    }
    .userbar .usertable .row .rowitem{
        padding-left: 20px;
        margin-top:10px;
    }
    .userbar .usertable .row span{
        padding-left: 5px;
        font-weight: bold;
        padding-right: 30px;
        text-align: center;
    }
    .divider{
        display: inline;
        border-right: 2px solid darkgray;
    }
    #first, #second{
        border: white;
        color:cadetblue;
        padding: 10px;
    }
    .sidebar{
        width: 200px;
        height: 600px;
        margin-right: 30px;
    }
    .sidebar .title{
        margin: 5px;
        display: block;
    }
    .sidebar .menu{
        border: 3px solid lightgray;
        border-top: 3px solid grey;
        border-bottom: 3px solid grey;
        padding: 10px;
    }
    .sidebar .menu th{
        color: black;
        text-align: left;
        padding-bottom: 8px;
        font-size: 15px;
        border-bottom: 1px solid grey;
    }
    .sidebar .menu td{
        padding-bottom: 8px;
    }
    #sidebarmenu{
        padding-bottom: 45px;
    }
    .avatar {
        vertical-align: middle;
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }
    .nearestOrder, .sidebar {
        display: inline-block;
    }
    a {
        text-decoration: none;
        color:black;
    }
</style>
</head>
<body>

    <div class="outer">
        
        <div class="userbar">
            <div class="usertable">
                <div class="profile" id="user">
                    <div style="display: inline-block;">
                        <img src="https://www.w3schools.com/howto/img_avatar.png" alt="Avatar" class="avatar">
                        <div style="display:inline;"><span>홍길동님</span></div>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="row">
                    <div class="wrap" style="display: inline-block;">
                        <div class="rowitem"><span>적립금</span></div>
                        <div class="rowitem"><span><a href="">0</a>원</span></div>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="row">
                    <div class="wrap" style="display: inline-block;">
                        <div class="rowitem"><span>찜하기</span></div>
                        <div class="rowitem"><span><a href="">0</a>개</span></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- <table id="table1" border="1px">
            <tr>
                <td colspan="3" align="center" style="border-color: lightgray;">홍길동님</td>
                <td align="center" colspan="5">적립금</td>
            </tr>
            
            <td align="center">찜하기</td>
            </tr>

            <tr></tr>
                <td align="center">0원</td>
                <td></td>
                <td align="center">0개</td>
                </tr>

        </table> -->
     
        <div class="sidebar">
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
                    <td><a href="">1:1문의</a></td>
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

        <div class="nearestOrder">
            <div style="margin-bottom: 8px; width: 700px;">
                <span style="font-size: 12pt;"><b>최근 주문 정보</b></span>
                <span style="font-size: 8pt; color: gray;"> 최근 30일 내에 주문하신 내역입니다.</span>
                <!--더보기 클릭시 주문목록/배송조회페이지 이동-->
                <span id="plus"><a href="<%= contextPath %>/"><i class="fas fa-plus-square">&nbsp;더보기</i></a></span>
            </div>

            
            <table class="orderStatus" align="center">
                <tr >
                    <th rowspan="2">0</th>
                    <th rowspan="2"></th>
                    <th rowspan="2">0</th>
                    <th rowspan="2"></th>
                    <th rowspan="2">0</th>
                    <th rowspan="2"></th>
                    <th rowspan="2">1</th>
                    <th rowspan="2"></th>
                    <th rowspan="2">0</th>
                </tr>
                <tr>
                </tr>
                <tr>
                    <th>결제대기</th>
                    <th>></th>
                    <th>결제완료</th>
                    <th>></th>
                    <th>배송준비</th>
                    <th>></th>
                    <th width="110">배송중</th>
                    <th>></th>
                    <th>배송완료</th>
                </tr>
            </table>
            <table class="orderList" align="center">
                <thead>
                <tr>
                    <th style="width:110px;">주문일자/주문번호</th>
                    <th>상품명</th>
                    <th style="width:110px;">상품금액/수량</th>
                    <th style="width:80px;">주문상태</th>
                </tr>
                </thead>

                <!--case1. 최근 주문내역이 없을 때-->
                <tbody>
                    <tr>
                        <td colspan="4" height="200">최근 주문 정보가 없습니다.</td>
                    </tr>
                </tbody>
                <!--case2. 최근 주문내역이 있을 때 (if(sysdate-30일))-->
                <tbody>
                    <tr>
                        <td>2021-11-15<br>[20211115131234]</td>
                        <td><a href="상품상세페이지"><img src="">닭가슴살 샐러드</a></td>
                        <td>7,900원/1개</td>
                        <td><a href="주문목록/배송조회 이동">배송중</a></td>
                    </tr>
                    <tr>
                        <td>2021-11-15<br>[20211115131234]</td>
                        <td><a href="상품상세페이지"><img src="">닭가슴살 샐러드</a></td>
                        <td>7,900원/1개</td>
                        <td><a href="주문목록/배송조회 이동">배송중</a></td>
                    </tr>
                    <tr>
                        <td>2021-11-15<br>[20211115131234]</td>
                        <td><a href="상품상세페이지"><img src="">닭가슴살 샐러드</a></td>
                        <td>7,900원/1개</td>
                        <td><a href="주문목록/배송조회 이동">배송중</a></td>
                    </tr>
                </tbody>
            </table>
        </div>

        
    </div>     

    
 
       
</body>
</html>