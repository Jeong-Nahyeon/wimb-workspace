<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@
	page import="com.wimb.mypage.model.vo.MyOrders, java.util.ArrayList"
%>
    
<%
	ArrayList<MyOrders> list = (ArrayList<MyOrders>)request.getAttribute("list");
	System.out.println(list);	
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
    /* 주문|배송조회 전체영역 */
    .orderPostList {
    	margin-top: 40px;
        margin-left: 500px;
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
        width: 55px
    }
    button:hover {background-color: rgb(155, 213, 189);}
    input {
        height: 35px;
        width:130px;
        margin-left: 5px;
    }
    input:hover {cursor: pointer;}
    #submit {
        background-color : rgb(155, 213, 189); 
        border:0px;
        color: white;
        width: 90px;
        float: right;
        margin-left: 10px;
    }
    /* 주문|배송 내역 리스트 영역 */
    .orderList th {
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        padding: 8px 0px 8px 0px;
        font-size: 12px;
        background-color: rgba(240, 239, 233, 0.445);
        
    }
    .orderList td {
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        padding: 18px 0px 18px 0px;
        font-size: 13px;;
        height: 100px;
    }
    .orderList {
        width: 700px;
        text-align: center;
        border-spacing: 0px;
        box-sizing: border-box;
        margin-bottom:15px;
        border-bottom: 2px solid rgba(133, 136, 139, 0.548);
    }
    .orderList button {
        display: block;
        margin:auto;
        margin-bottom: 5px;
        background-color: white;
        border: 1px solid lightgrey;
        height: 25px;
    }
    .orderList button:hover{background-color: rgb(155, 213, 189);}
    a {
        text-decoration: none;
        color:black;
    }
    .cancelList th {
        width: 160px;
        text-align: center;
        font-size: 13px;
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
    }
    .cancelList td {
        text-align: center;
        font-size: 13px;
        padding: 14px 0px;
        border-bottom: 2px solid rgba(133, 136, 139, 0.548);
    }
    .cancelReason button {
        width: 210px;
        border: 1px solid rgba(133, 136, 139, 0.548);
        background-color: white;
        padding: 8px;
        border-radius: 5px;
    }
    .cancelReason td {padding: 8px;}
    .cancelReason button:hover {background-color: rgb(155, 213, 189);}
    .modal-footer {
        height: 80px;
        margin-right: 100px;
    }
    .modal-footer button {
        border: 0px;
        width: 120px;
        height: 40px;
        margin-right: 10px;
        font-size: smaller;
    }
    .modal-body p {
        font-size: 13px; 
        text-align: center;
        color: red;
    }
    a:link { 
    	text-decoration:none;
    	color:black;
    }
    .selectBtn button:focus {
    	background-color: lightgrey;
    }
    img {
    	widt: 80px;
    	height: 80px;
    	margin-right: 20px;
    }
</style>
</head>
<body>
	
	
	<%@ include file="../common/myPage.jsp" %>
	
    <div class="orderPostList">

        <label style="font-size: 18px;"><b>주문목록/배송조회</b></label>
        <div>
            <form action="<%= contextPath %>/orderList.my" method="get" class="selectDate">
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
		
            <label style="font-size: 13px;"><b>주문/배송내역 조회 총 <%= list.size() %>건</b></label>
            <div class="listView">
            
                    <!--case1. 최근 주문내역이 없을 때-->
            		<% if(list.isEmpty()) { %>
            		
                   		<table class="orderList">
	                        <tr>
	                            <th width="130">주문일자<br>[주문번호]</th>
	                            <th>상품명</th>
	                            <th width="100">상품금액/수량</th>
	                            <th width="80">주문상태</th>
	                            <th width="80">확인/리뷰</th>
	                        </tr>
	                        <tr>
	                            <td colspan="5" height="180">최근 주문 정보가 없습니다.</td>
	                        </tr>
	                        
                    	</table>
                    <% }else { %>
                    	<!--case2. 최근 주문내역이 있을 때 -->
                    	<table class="orderList">
	                        <tr>
	                            <th width="130">주문일자<br>[주문번호]</th>
	                            <th>상품명</th>
	                            <th width="100">상품금액/수량</th>
	                            <th width="80">주문상태</th>
	                            <th width="80">확인/리뷰</th>
	                        </tr>
	                        
	                        <% for(MyOrders od : list) { %>
                        		<tr>
                        			<td id="pmCode" style="display:none;"><label><%= od.getPmCode() %></label></td>
                    				<td><%= od.getOrderDate() %><br>[<index id="orderCode"><%= od.getOrderCode() %></index>]</td>
                    				<% if(od.getpName() == null) { %>
                    					<td><a href="상품상세페이지"><img src="<%= contextPath %>/<%= od.getCuMainImg() %>"><%= od.getCuName() %></a></td>
                   					<% }else { %>
                   						<td><a href="상품상세페이지"><img src="<%= contextPath %>/<%= od.getFilePath() + od.getpMainImg() %>"><%= od.getpName() %></a></td>
                 					<% } %>
                 					<td><%= od.getPmTotalCost() %>원/<%= od.getOrderAmount() %>개</td> 
                 					<td><a href="주문목록/배송조회 이동"><%= od.getOrderStatus() %></a></td> 
                   					<td>
                   						<% if(od.getOrderStatus().equals("결제대기") || od.getOrderStatus().equals("결제완료") || od.getOrderStatus().equals("배송준비")) { %>
		                                	
		                                	<!--주문상태가 결제완료, 상품준비중일 때만 가능-->
		                                	<button type="button" id="cancelDo">즉시취소</button>
	                                	
	                                	<% }else if(od.getOrderStatus().equals("배송중")) { %>
	                                		
	                                		<!--주문상태가 배송중일 때만 가능-->
	                                		<button>배송조회</button>
                                		
                                		<% }else if(od.getOrderStatus().equals("배송완료")){ %>
                                			
                                			<!--주문상태가 배송완료일 때만 가능-->
                                			<button type="button"  onclick="location.href='리뷰작성페이지이동'">리뷰작성</button>
                                			<button id="refundDo" type="button" data-toggle="modal" data-target="#refundModal">환불요청</button>
                                		
                                		<% }else { %>
                                			
                                			<!--주문상태가 환불/취소일 때만 가능-->
                                			<button type="button"  onclick="location.href='<%= contextPath %>/cancelList.my'">상세보기</button>
                                			
                                		<% } %>	
		                            </td>
	                        	</tr>
                        	<% } %>	
                    <% } %>
                    	</table>
                   
        </div>

    </div>
    
    
    <!-- 취소요청 -->
    <script>
    	$("#cancelDo").on('click', function(){
    		
    		const result = confirm("해당 상품을 취소하시겠습니까?");
    		
    		if(result) {
    			
    			var orderCode = $("#orderCode").text();
        		console.log(orderCode);
        		
        		$.ajax({
        			url:"cancelInsert.my",
        			type:"post",
        			data:{orderCode:orderCode},
        			success:function(){
        				alert("상품이 취소되었습니다.");
        			}, error:function(){
        				console.log("ajax통신실패");
        			}
        		})
        		
    			
    		}else {
    			alert("요청에 실패했습니다.");
    		}
    		
    	})
    
    </script>
    
    
    
    
    
    
    
    
    
    
	
	<script>
		
		$("#refundDo").click(function(){
			
			var orderCode = $("#orderCode").text();
			console.log(orderCode);
			
			$.ajax({
				url:"crDetail.my",
				type:"post",
				data:{orderCode:orderCode},
				success:function(mo){
					console.log(mo)
				},error:finction(){
					console.log("ajax 통신 실패")
				};
			
		})
		
		
	</script>
    
    <!-- 환불요청 모달창 -->
    <div class="modal" id="refundModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header" style="font-size:large; background-color: rgba(240, 239, 233, 0.445);">
                    <div>
                        <b>환불 요청</b>
                    </div>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" style="height: 330px;">
                   
                    <table class="cancelList" style="margin-bottom: 20px;"> 
                        <tr>
                            <th>주문일자<br>주문번호</th>
                            <th>상품명</th>
                            <th>주문수량</th>
                        </tr>
                        <tr>
                            <td>2021-11-15<br>[20211115131234]</td>
                            <td>닭가슴살 샐러드</td>
                            <td>1개</td>
                        </tr>
                    </table>

                    <div>
                        <table class="cancelReason">
                            <tr>
                                <td><button type="button" value="단순변심" name="cancelReason">단순변심</button></td>
                                <td><button type="button" value="상품불량" name="cancelReason">상품불량</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" value="상품오배송" name="cancelReason">상품오배송</button></td>
                                <td><button type="button" value="사이트불만족" name="cancelReason">사이트 불만족</button></td>
                            </tr>
                        </table>
                    </div>
                    <hr>
                    <p>* 환불요청 후에는 철회가 불가능합니다.</p>
                </div>
                
        
                <!-- Modal footer -->
                <div class="modal-footer" style="border:0px;">
                    <button type="submit" data-dismiss="modal">환불요청</button>
                    <button type="reset" data-dismiss="modal">취소</button>
                </div>

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