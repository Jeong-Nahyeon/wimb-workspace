<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.wimb.mypage.model.vo.MyOrders, java.util.ArrayList"%>
<%
	ArrayList<MyOrders> list1 = (ArrayList<MyOrders>)request.getAttribute("orderlist");
	MyOrders od1 = (MyOrders)request.getAttribute("od1");
	MyOrders od2 = (MyOrders)request.getAttribute("od2");
	MyOrders od3 = (MyOrders)request.getAttribute("od3");
	MyOrders od4 = (MyOrders)request.getAttribute("od4");
	MyOrders od5 = (MyOrders)request.getAttribute("od5");
	
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
        width: 600px;
        height: 800px;
        margin: auto;
    }
    #usertable a, #plus a{
        text-decoration: none;
        color:black;
    }
    .userImg{
            vertical-align: middle;
            width: 50px;
            height: 50px;
            border-radius: 50%;
    }
    #like{
        border-left: 2px solid lightgray;
        text-align: center;
    }
    #usertable{
        border: 1px solid gray;
       
        border-top: 2px solid black ;
    }
    #usertable a:hover, #plus a:hover { 
    	text-decoration:none;
    	color:lightgrey;
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

	<%@ include file="../common/myPage.jsp" %>

    <div class="outer">
		
        <!-- 사용자 적립금/찜하기 테이블 시작-->
        <table id="usertable"  width="700" height="100">
            <tr>
                <td rowspan="2" colspan="2" align="right" width="150">
                   <div id="userImage"><img src="https://www.w3schools.com/howto/img_avatar.png" alt="userImg" class="userImg"></div>
                    <div id="userName"><h5><a href=""><b><%= loginUser.getmName() %>님</b></a></h5></div>
                </td>
               
                <td colspan="2"  rowspan="2" width="80px">
                    <div id="like">찜하기<br><br>
                        <a href=""><b>0원</b></a>
                    </div>
                </td>
            </tr>
         </table>
        <!-- 사용자 적립금/찜하기 테이블 끝-->
      
		<!-- 사용자 최근 주문목록 시작 -->
        <div class="nearestOrder">
            <div style="margin-bottom: 8px; width: 700px;">
                <span style="font-size: 12pt;"><b>최근 주문 정보</b></span>
                <span style="font-size: 8pt; color: gray;"> 최근 30일 내에 주문하신 내역입니다.</span>
                <!--더보기 클릭시 주문목록/배송조회페이지 이동-->
                <span id="plus"><a href="<%= contextPath %>/orderList.my"><i class="fas fa-plus-square">&nbsp;더보기</i></a></span>
            </div>
            

            
            <table class="orderStatus">
                <tr>
                		
           			 <th rowspan="2"><%= od1.getStatusCount() %></th>
           			 <th rowspan="2"></th>
           			 <th rowspan="2"><%= od2.getStatusCount() %></th>
           			 <th rowspan="2"></th>
           			 <th rowspan="2"><%= od3.getStatusCount() %></th>
           			 <th rowspan="2"></th>
           			 <th rowspan="2"><%= od4.getStatusCount() %></th>
           			 <th rowspan="2"></th>
           			 <th rowspan="2"><%= od5.getStatusCount() %></th>
                		
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
            <table class="orderList">
                <thead>
                <tr>
                    <th style="width:110px;">주문일자/주문번호</th>
                    <th>상품명</th>
                    <th style="width:110px;">상품금액/수량</th>
                    <th style="width:80px;">주문상태</th>
                </tr>
                </thead>
				
				<% if(list1.isEmpty()) { %>
	                <!--case1. 최근 주문내역이 없을 때-->
	                <tbody>
	                    <tr>
	                        <td colspan="4" height="200">최근 30일 내에 주문 정보가 없습니다.</td>
	                    </tr>
	                </tbody>
                <% } else { %>
                		
                		<% for(MyOrders mo : list1) { %>
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
		<!-- 사용자 최근 주문목록 끝 -->
    
     </div>
   </div>

</body>
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
</html>