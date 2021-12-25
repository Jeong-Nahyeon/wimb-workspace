<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.wimb.mypage.model.vo.Orders, com.wimb.common.model.vo.PageInfo" %>
<%
	ArrayList<Orders> olist = (ArrayList<Orders>)request.getAttribute("olist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소내역 리스트</title>
<script src="https://kit.fontawesome.com/10f565a9d5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

    main{
        margin-top: 100px;
        margin-left: 25%;
        width: 1500px;
    }
    #mainTitle>h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}

    .menus > button {
        width: 329px;
        height: 55px;
        border: 1px solid rgba(182, 178, 178, 0.719);
        border-bottom: none;
        color: rgba(119, 110, 110, 0.829);
        background-color: rgba(240, 239, 233, 0.445);;
    }
    .menus {
        height: 60px; 
        width: 1000px;
        font-size: large;
        margin-bottom: 5px;
    }
    .list th {
        font-size: 13px;
        text-align: center;
        padding: 8px 2px;
        background-color: rgba(204, 204, 204, 0.486);
        border: 1px solid lightgray;
    }
    .list td {
        font-size: 13px;
        text-align: center;
        padding: 8px 2px;
        border: 1px solid lightgray;
    }
    .list {border:1px solid lightgray;}
    div > label{
        margin: 0px; 
        font-size: 15px;
        color: rgba(94, 93, 93, 0.87);
    }
    .list {margin: 5px 0px 15px 0px;}
    #countNo {  color: orange; }
    #cancel {
        float: right;
        border: none;
        background-color: #ffee58;
        color: rgba(94, 93, 93, 0.87);
        font-weight: bold;
        font-size: 14px;
        width: 80px;
        height: 25px;
        border-radius: 2px;
    }
    .paging-area > button {
        padding: 0px;
        font-size: small;
        height: 23px;
        width: 23px;
        border-radius: 4px;
        border: 0px;
        background-color: lightgray;
    }
    button:disabled {background-color: #ffee58; color: black;}
    .search-area button {
        height: 27px;
        width: 70px;
        border: 1px solid black;
        border-radius: 2px;
        background-color: white;
        font-size: smaller;
        margin-left: 20px;
        background-color: lightgray;
    }
    label {margin: 0px;}
    .atag:hover {cursor: pointer;}
	.atag {text-decoration: underline;}
    .modal-body th {
        width: 120px;
        font-size: 15px;
        padding: 8px 0px;
    }
    .modal-body td {
        font-size: 15px;
    }
    .modal-footer {
        height: 0px;
        margin: 0px 100px 60px 0px;
    }
    .modal-footer button {
        border: 0px;
        border-radius: 4px;
        width: 70px;
        height: 30px;
        margin-right: 40px;
    }
    li {
     	list-style:none;
    }
</style>
</head>
<body>
    <%@ include file="../common/adminBar.jsp"%>

    <main>

        <div id="mainTitle">
            <h2 id="mainTitle1">상품관리 </h2>
            <h2>> 상품 배송관리</h2>
        </div>

        <div class="menus">
            <button type="button" id="orderLIst"><b>주문내역</b></button>
            <button type="button" id="refundLIst"><b>환불내역</b></button>
            <button type="button" id="cancelList"><b>취소내역</b></button>
        </div>
        
        <div>
            <div style="width:1000px">
                <label><b>총</b></label>
                <label id="countNo"><b>87</b></label>
                <label><b>건</b></label>
                <button type="button" id="cancel">주문 취소</button>
            </div>
            <table class="list" width="1000">
                <thead>
                    <tr>
                        <th width="25">/</th>
                        <th width="35">번호</th>
                        <th width="110">주문번호</th>
                        <th width="75">주문자</th>
                        <th width="225">상품명</th>
                        <th width="70">상품금액</th>
                        <th width="70">결제금액</th>
                        <th width="50">배송비</th>
                        <th width="60">결제유형</th>
                        <th width="70">택배사</th>
                        <th width="135">운송장번호</th>
                        <th width="75">배송상태</th>
                    </tr>
                </thead>
                <tbody>
                <% if(olist == null) { %>
                	<tr>
                        <td colspan="12" style="height:300px;">조회내역이 없습니다.</td>
                    </tr>
                
                
                <% }else { %>
                	<% for(Orders od : olist) { %>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <td><%= od.getrNum() %></td>
	                        <td class="oCode"><%= od.getOrderCode() %></td>
	                        <td><%= od.getmName() %></td>
	                        <% if(od.getCuCode() == null) { %>
	                        	<td class="atag"><a data-toggle="modal" data-target="#myModal"><%= od.getpName() %></a></td>
	                        <% }else { %>
	                        	<td class="atag"><a data-toggle="modal" data-target="#myModal"><%= od.getCuName() %></a></td>
	                        <% } %>
	                        <td><%= od.getTotalCost() %></td>
	                        <td><%= od.getFinalCost() %></td>
	                        <td>3000원</td>
	                        <td><%= od.getPmMethod() %></td>
	                        <td><%= od.getCompany() %></td>
	                        <td><%= od.getInvoice() %></td>
	                        <td><%= od.getStatus() %></td>
	                    </tr>
                    <% } %>
                <% } %>
                </tbody>    
            </table>

            <div class="paging-area" style="width:1000px; padding-bottom:40px;" align="center">
			
				<% if (currentPage != 1) { %>
                <button onclick="location.href='<%= contextPath %>/orderList.admin?cpage=<%= currentPage -1 %>';"> &lt; </button>
                <% } %>
					
				<% for(int p=startPage; p<=endPage; p++) { %>
                    <% if(p == currentPage) { %>
                    <button disabled><%= p %></button>
                    <% }else { %>
                    <button onclick="location.href='<%= contextPath %>/orderList.admin?cpage=<%= p %>';"><%= p %></button>
                	<% } %>
                <% } %>
                
                <% if(currentPage != maxPage) { %>
                <button onclick="location.href='<%= contextPath %>/orderList.admin?cpage=<%= currentPage +1%>';"> &gt; </button>
            	<% } %>
            </div>

            <div style="width:1000px" align="center">
                    <table class="search-area">
                        <tr>
                            <td>
                                <select name="searchType" style="height: 30px; width: 95px;">
                                    <option value="ORDER_NAME">주문자명</option>
                                    <option value="ORDER_CODE">주문번호</option>
                                    <option value="PM_METHOD">결제유형</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="search" placeholder="내용을 입력해주세요">
                            </td>
                            <td>
                                <button type="button" id="searchGo"><i class="fas fa-search">조회</i></button>
                            </td>
                        </tr>
                    </table>
            </div>


        </div>
        
        <script>
        
	        $("#searchGo").click(function(){
				location.href = "<%= contextPath %>/orderList.admin?option=" + $('#searchType option:selected').val() + "&keyword=" + $('input[name=search]');   			
	   		})
        
        </script>
        
        <!-- 검색키워드 넘기기 -->
        <script>
       		$("#searchGo").click(function(){
       			
       			var keyword = $("#search").val();
       			var option = $('#searchType option:selected').val();
       			console.log(keyword);
       			console.log(option);
       			
       			$.ajax({
       				
       				url:"orderList.admin",
       				data:{
       					kword:keyword,
    					option:option
       				},
       				type:"post",
       				success:function(){
       					
       				}, error:function(){
       					console.log("통신실패");
       				}
       				
       			})
       			
       		})
        </script>


        <!-- 주문상세정보 -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header" style="font-size:large; background-color: rgba(240, 239, 233, 0.445);">
                        <div>
                            <b>주문 상세 정보</b>
                        </div>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                            <table class="modal-body">
                                <tr>
                                    <th>주문일자</th>
                                    <td id="detail1"></td>
                                </tr>
                                <tr>
                                    <th>주문번호</th>
                                    <td id="detail2">5</td>
                                </tr>
                                <tr>
                                    <th>주문자</th>
                                    <td id="detail3"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td id="detail4"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td id="detail5"></td>
                                </tr>
                                <tr>
                                    <th style="vertical-align: top;">배송지 정보</th>
                                    <td>
                                    	<li id="detail6"></li>
                                        <li id="detail7"></li>
                                        <li id="detail8"></li>
                                    </td>
                                </tr>
                                <tr>
                                    <th>배송요청사항</th>
                                    <td id="detail9"></td>
                                </tr>
                                <tr>
                                    <th>적립포인트</th>
                                    <td id="detail10"></td>
                                </tr>
                                <tr>
                                    <th style="vertical-align: top;">주문내역</th>
                                    <td>
                                        <li id="detail11"></li>
                                    <td>
                                </tr>
                            </table>
                    </div>
                    <!-- Modal Header -->
                    <div class="modal-header" style="font-size:large; background-color: rgba(240, 239, 233, 0.445);">
                        <div>
                            <b>배송 정보 등록</b>
                        </div>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
	                        <table>
	                            <tr id="detail12">
	                            </tr>
	                            <tr id="detail13">
	                            </tr>
	                        </table>
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer" style="border:0px;">
                    	
                        	<button type="button" id="submit" style="background-color: #ffee58;">등록</button>
                        	<button type="reset" data-dismiss="modal">취소</button>
                    	
                    </div>

                </div>
            </div>
        </div>
	
	<!-- 주문 상세보기 ajax -->
	<script>
		$(document).on('click', ".atag", function(){
			
			var oCode = $(this).siblings(".oCode").text();
			
			$.ajax({
				url:"orderDetail.admin",
				type:"post",
				data:{oCode:oCode},
				success:function(od){
					
					// 첫번째 td
					var result1 = "";
					
					result1 +=
						       "<td>" + od.orderDate + "</td>";
			        $("#detail1").html(result1);
			        
			        // 두번째 td
			        var result2 = "";
			        result2 +=
					       "<td class='orderCode'>" + od.orderCode + "</td>";
		        	$("#detail2").html(result2);
		        	
		        	// 세번째td
		        	var result3 = "";
			        result3 +=
					       "<td>" + od.mName + "</td>";
		        	$("#detail3").html(result3);
		        	
		        	// 네번째td
		        	var result4 = "";
			        result4 +=
					       "<td>" + od.phone + "</td>";
		        	$("#detail4").html(result4);
		        	
		        	// 다섯번째td
		        	var result5 = "";
			        result5 +=
					       "<td>" + od.email + "</td>";
		        	$("#detail5").html(result5);
		        	
		        	// 여섯번째td
		        	var result6 = "";
			        result6 +=
					       "<li>[" + od.zipCode + "]</li>";
		        	$("#detail6").html(result6);
		        	
		        	// 일곱번째td
		        	var result7 = "";
			        result7 +=
					       "<li>" + od.address + "</li>";
		        	$("#detail7").html(result7);
		        	
		        	// 여덟번째td
		        	var result8 = "";
			        result8 +=
					       "<li>" + od.mName + "</li>";
		        	$("#detail8").html(result8);
		        	
		        	// 아홉번째td
		        	var result9 = "";
			        result9 +=
					       "<td>" + od.request + "</td>";
		        	$("#detail9").html(result9);
		        	
		        	// 열번째td
		        	var result10 = "";
			        result10 +=
					       "<td>" + od.point + "P" + "</td>";
		        	$("#detail10").html(result10);
		        	
		        	// 열한번째td
		        	var result11 = "";
		        	if(od.pCode == null) {
		        		result11 +=
						       "<td>" + od.cuName + "</td>";
		        	}else {
		        		result11 +=
						       "<td>" + od.pName + "</td>";
		        	}
			        
		        	$("#detail11").html(result11);
					
		        	//택배사
		        	var result12 = "";
		        	if(od.company === '-') {
		        		result12 +=
		        				"<th>" + "택배사" + "</td>"
		        			  + "<td><input type='text' class='company' placeholder='택배사 입력'></td>";
		        	}else {
		        		result12 +=
	        				"<th>" + "택배사" + "</td>"
	        			  + "<td><input type='text' value='" + od.company + "' readonly></td>";
		        	}
		        	$("#detail12").html(result12);
		        	
		        	// 송장번호
		        	var result13 = "";
		        	if(od.invoice === '-') {
		        		result13 +=
		        				"<th>" + "운송장번호" + "</td>"
		        			  + "<td><input type='text' class='invoice' placeholder='운송장번호 입력'></td>";
		        	}else {
		        		result13 +=
	        				"<th>" + "운송장번호" + "</td>"
	        			  + "<td><input type='text' value='" + od.invoice + "' readonly></td>";
		        	}
		        	$("#detail13").html(result13);
				},error:function(){
					console.log("상세정보 불러오기 통신 실패");
				}
			})
			
		})
		
	</script>
	
	<script>
		$('#submit').on('click', function(){
			
			var oCode = $('.orderCode').text();
			var com = $('.company').val();
			var inv = $('.invoice').val();
			
			$.ajax({
				
				url:"insertPost.admin",
				type:"post",
				data:{
					oCode:oCode,
					com:com,
					inv:inv
				}
				, success:function(result) {
					console.log(result);
					if(result > 0) {
						alert("배송정보를 입력하였습니다.");						
					}else{
						alert("요청에 실패하였습니다.\n관리자에게 문의하세요.")
					}
				}, error:function() {
					console.log("통신에러")
				}
			
				
			})
		})
	</script>
	




        
    </main>


</body>
</html>