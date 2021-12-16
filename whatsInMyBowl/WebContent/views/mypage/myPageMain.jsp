<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.wimb.mypage.model.vo.MyOrders, java.util.ArrayList"%>
<%
	ArrayList<MyOrders> list = (ArrayList<MyOrders>)request.getAttribute("orderlist");
%>
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
    a:link { 
    	text-decoration:none;
    	color:black;
    }
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
<body style="height:100%">

	<%@ include file="../common/menubar.jsp" %>
		
    <div class="outer">
		
        <!-- 사용자 적립금/찜하기 테이블 시작-->
        <table id="usertable"  width="700" height="100">
            <tr>
                <td rowspan="2" colspan="2" align="right" width="200">
                   <div id="userImage"><img src="https://www.w3schools.com/howto/img_avatar.png" alt="userImg" class="userImg"></div>
                    <div id="userName"><h5><a href=""><%= loginUser.getmName() %></a>님</h5></div>
                </td>
                <td colspan="2" rowspan="2" width="80px" >
                    <div id="point">적립금<br><br>
                        <a href=""><%= loginUser.getmPoint() %></a>원
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

        <div class="nearestOrder">
            <div style="margin-bottom: 8px; width: 700px;">
                <span style="font-size: 12pt;"><b>최근 주문 정보</b></span>
                <span style="font-size: 8pt; color: gray;"> 최근 30일 내에 주문하신 내역입니다.</span>
                <!--더보기 클릭시 주문목록/배송조회페이지 이동-->
                <span id="plus"><a onclick="$(#plus-form).submit();"><i class="fas fa-plus-square">&nbsp;더보기</i></a></span>
            	<Form id="plus-form" action="<%= contextPath %>/orderList.my" method="post">
                    <input type="hidden" name="mCode" value="<%= loginUser.getmCode() %>">
                </Form>
            
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
				
				<% if(list.isEmpty()) { %>
	                <!--case1. 최근 주문내역이 없을 때-->
	                <tbody>
	                    <tr>
	                        <td colspan="4" height="200">최근 30일 내에 주문 정보가 없습니다.</td>
	                    </tr>
	                </tbody>
                <% } else { %>
                		
                		<% for(MyOrders mo : list) { %>
	                <!--case2. 최근 주문내역이 있을 때 (if(sysdate-30일))-->
	                <tbody>
	                    <tr>
	                        <td><%= mo.getOrderDate() %><br>[<%= mo.getOrderCode() %>]</td>
	                        <% if(mo.getpName() == null) { // 커스텀상품일시 %>
	                        	<td><a href="상품상세페이지"><img src=""><%= mo.getCuName() %></a></td>
	                        <% }else { // 완제품일시 %>
	                        	<td><a href="상품상세페이지"><img src=""><%= mo.getpName() %></a></td>
                        	<% } %>
	                        <td><%= mo.getPmTotalCost() %>/<%= mo.getOrderAmount() %></td>
	                        <td><a href="주문목록/배송조회 이동"><%= mo.getOrderStatus() %></a></td>
	                    </tr>
	                </tbody>
	                	<% } %>
                <% } %>
            </table>
        </div>

    
        

    
    <%@ include file="../common/footer.jsp" %>
 
   </div>    
</body>
</html>