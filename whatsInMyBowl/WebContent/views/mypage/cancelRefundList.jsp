<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.wimb.mypage.model.vo.MyOrders, java.util.ArrayList"
%>
<%
	ArrayList<MyOrders> clist = (ArrayList<MyOrders>)session.getAttribute("clist");
 %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/10f565a9d5.js" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    /* 교환|환불조회 전체영역 */
    .cancelList {
        margin-left: 18px;
        margin-top: 50px;
    }
    /* 주문|배송조회 기간 선택 영역 */
    .selectDate {
        width:700px;
        padding: 35px 20px 35px 20px;
        border: 1px solid #ebebeb;
        box-sizing: border-box;
        margin-bottom: 50px;
        font-size: smaller;
    }
    .selectDate button {
        background-color: white;
        border: 1px solid lightgrey;
        height: 35px;
        width: 55px;
    }
    button:hover {
        cursor: pointer;
        background-color: rgb(155, 213, 189);
    }
    input {
        height: 35px;
        width: 120px;
        margin-left: 5px;
    }
    input:hover {cursor: pointer;}
    #submit {
        background-color: rgb(155, 213, 189);
        border: 0px;
        color: white;
        width: 90px;
        float: right;
    }
    /* 교환|환불 내역 리스트 영역 */
    .orderList th {
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        padding: 10px 0px 10px 0px;
        font-size: 12px;
        background-color: rgba(240, 239, 233, 0.445);
    }
    .orderList td {
        border-bottom: 2px solid rgba(133, 136, 139, 0.548);
        padding: 18px 0px 18px 0px;
        font-size: 13px;
    }
    .orderList {
        width: 700px;
        text-align: center;
        border-spacing: 0px;
        box-sizing: border-box;
        margin-bottom:30px;
    }
    .orderList button {
        display: block;
        margin:auto;
        background-color: white;
        border: 1px solid lightgrey;
        height: 25px;
    }
    .orderList button:hover{
        cursor: pointer; 
        background-color: rgb(155, 213, 189);

    }
    a {
        text-decoration: none;
        color:black;
    }
    img {
    	widt: 80px;
    	height: 80px;
    	margin-right: 20px;
    }

</style>

</head>
<body>

    <%@ include file="../mypage/myPageMain.jsp" %>

    <div class="cancelList">

        <label style="font-size: 18px;"><b>취소/환불내역</b></label>
        <div>
            <form action="" method="get" class="selectDate">
                <p style="margin-bottom: 5px; font-size: 15px;"><b>조회기간</b></p>
                <div class="selectBtn" style="display: inline-block;">
                    <div>
                        <button type="button" onclick="dateSub(7);" style="margin-right: -6px;">7일</button>
                        <button type="button" onclick="dateSub(15);" style="margin-right: -6px;">15일</button>
                        <button type="button" onclick="dateSub(30);" style="margin-right: -6px;">1개월</button>
                        <button type="button" onclick="dateSub(90);" style="margin-right: -6px;">3개월</button>
                        <button type="button" onclick="dateSub(365);">1년</button>
                    </div>
                </div>
                <div class="selectCalendar" style="display: inline-block;">
                    <input type="date" id="startDate" name="startDate">
                    <label>~</label>
                    <input type="date" id="endDate" name="endDate">
                    <button type="submit" id="submit" name="submit">조회&nbsp;<i class="fas fa-search"></i></button>
                </div>
            </form>

            <label style="font-size: 13px;"><b>취소/환불내역 조회 총 <%= clist.size() %>건</b></label>
            <div class="listView">
            
                    <!--case1. 최근 주문내역이 없을 때-->
            		<% if(list.isEmpty()) { %>
            		
                   		<table class="orderList">
	                        <tr>
	                            <th width="130">주문일자<br>[주문번호]</th>
	                            <th>상품명</th>
	                            <th width="80">상품금액/수량</th>
	                            <th width="80">처리일자</th>
	                            <th width="80">상세보기</th>
	                        </tr>
	                        <tr>
	                            <td colspan="5" height="180">최근 취소/환불 정보가 없습니다.</td>
	                        </tr>
	                        
                    	</table>
                    <% }else { %>	
                    	
                    <!--case2. 취소/환불내역이 있을 때 (if(취소상태 == 처리X))-->
                    <table class="orderList">
                        <tr>
                            <th width="130">주문일자<br>[주문번호]</th>
                            <th>상품명</th>
                            <th width="100">상품금액/수량</th>
                            <th width="80">진행상태</th>
                            <th width="80">처리일자</th>
                            <th width="80">상세보기</th>
                        </tr>
                        
                        <% for(MyOrders od : clist) { %>
                     
                        <tr>
                            <td><%= od.getOrderDate() %><br>[<%= od.getOrderCode() %>]</td>
                            
                            <% if(od.getpName() == null) {  // 커스텀상품%>
                            	<td><a href="상품상세페이지"><img src="<%= contextPath %>/<%= od.getCuMainImg() %>"><%= od.getCuName() %></a></td>
                            <% }else {  // 완제품%>
								<td><a href="상품상세페이지"><img src="<%= contextPath %>/<%= od.getFilePath() + od.getpMainImg() %>"><%= od.getpName() %></a></td>                            
                            <% } %>
                            
                            <td><%= od.getPmTotalCost() %>원/<%= od.getOrderAmount() %>개</td>
                            
                            <% if(od.getCancelCode() == null) { %>
                            	
                            	<!-- 환불일경우 -->
                            	<% if(od.getrStatus().equals("N")) { %>
                            		<td>환불<br>진행중</td>
                            	<% } else { %>
                            		<td>환불<br>처리완료</td>
                            		<td><%= od.getRcompDate() %></td>
                            		
                            	<% } %>
                            	
                            <% }else { %>
                            	
                            	<!-- 취소일경우 -->
                            	<% if(od.getCancelStatus().equals("N")) { %>
                            		<td>취소<br>진행중</td>
                            	<% }else { %>
                            		<td>취소<br>처리완료</td>
                            		<td><%= od.getCancelCompDate() %></td>
                            	<% } %>
                            
                            <% } %>
                            <td><button>상세보기</button></td>
                        </tr>
                        <% } %>
                    <% } %>
                   
                   
            </div>
        </div>
    </div>
    
    
    
     <!-- 조회기간 버튼  -->
    <script>
    	// 조회기간 1 구하기
    	
    	// 1. 버튼으로 기간 클릭시
    	function dateSub(day) {
    		
    		// 오늘날짜 
    		var today = new Date();
    		
    		// 선택한날짜 == startDay
    		var sday = today - day*24*60*60*1000; // n일 전
    		var startDay = new Date(sday);
    		
		    var stYear = startDay.getFullYear();
			var stMonth = ('0' + (startDay.getMonth() + 1)).slice(-2);
			var stDay = ('0' + startDay.getDate()).slice(-2);
			
			var startDateString = stYear + '-' + stMonth  + '-' + stDay;
    		$("#startDate").val(startDateString);
    		console.log($("#startDate").val());
    	}
    	
    	// 3. inputDate 시작날짜 미입력시! == 기본 7일
    	$('#startDate').ready(function(){
    		var today = new Date();
			var sevenDay = new Date(today - 7*24*60*60*1000);
			
			var svYear = sevenDay.getFullYear();
			var svMonth = ('0' + (sevenDay.getMonth() + 1)).slice(-2);
			var svDay = ('0' + sevenDay.getDate()).slice(-2);
			
			var startDateString = svYear + '-' + svMonth  + '-' + svDay;
			
    		$("#startDate").val(startDateString);
    		console.log($("#startDate").val());
		
		})
		
		
		// 3. inputDate 끝날짜 미입력시! == 오늘날짜
		$('#endDate').ready(function(){
		
			var today = new Date();
		
			var edYear = today.getFullYear();
			var edMonth = ('0' + (today.getMonth() + 1)).slice(-2);
			var edDay = ('0' + today.getDate()).slice(-2);
			
			var endDateString = edYear + '-' + edMonth + '-' + edDay;
			
			$("#endDate").val(endDateString);
    		console.log($("#endDate").val());
		
		})
		
		
    		
    </script>

  
</body>
</html>