<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.wimb.mypage.model.vo.MyOrders, java.util.ArrayList"
%>
<%
	ArrayList<MyOrders> hlist = (ArrayList<MyOrders>)request.getAttribute("hlist");
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
    .heart {
        width: 600px;
    	height: 800px;
    	margin: auto;
    }
    .listForm {
        width:600px;
        text-align: center;
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 2px solid rgba(133, 136, 139, 0.548);
        margin-bottom: 15px;
    }
    .listForm th {
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        padding: 10px 0px 10px 0px;
        font-size: 12px;
        background-color: rgba(240, 239, 233, 0.445);
        height: 50px;
    }
    .listForm td {
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        padding: 10px 0px 10px 0px;
        font-size: 13px;
        height: 100px;
    }
    .delete {
        display: block;
        margin:auto;
        background-color: white;
        border: 1px solid lightgrey;
        height: 25px;
        width: 70px;
    }
    .cart {
        background-color: rgba(0, 0, 0, 0.76);
        border: 1px solid lightgrey;
        color: rgba(253, 253, 253, 0.87);
        margin-bottom: 2px;
        height: 25px;
        width: 70px;
    }
    .listForm button:hover{
        background-color: #ebebeb;
        color: black;
    }
    #checkedDelete, #checkedCart {
        background-color: white;
        border: 0px;
        height: 18px;
        font-size: smaller;
        margin-right:10px;
    }
    img {
        width:70px;
        height: 60px;
        float: right;
    }
</style>

</head>
<body>

   <%@ include file="../common/myPage.jsp" %>

   <div class="heart">

        <label style="font-size: 18px;"><b>찜리스트</b></label>
        <div class="heartList">

            <table class="listForm">
                <tbody>
                    <tr>
                    	<th width="20"></th>
                        <th width="30"><input type="checkbox" id="ckAll"></th>
                        <th colspan="2">상품명</th>
                        <th width="100">상품금액</th>
                        <th width="100">선택</th>
                    	<th width="20"></th>
                    </tr>
                </tbody>
                <tbody>
                	<% if(hlist.isEmpty()) { %>
               		<tr>
                        <td colspan="7" style="height:200px;">찜리스트가 비어있습니다.</td>
                    </tr>
                	<% }else { %>
                		<% for(MyOrders mo : hlist) { %>
		                    <tr>
		                    	<td style="display:none;" class="pCode"><%= mo.getpCode() %></td>
		                    	<td></td>
		                        <td><input type="checkbox" class="ck"></td>
		                        <td width="130"><img src="<%=contextPath%>/<%=mo.getFilePath()%>/<%=mo.getpMainImg()%>"></td>
		                        <td style="text-align:left; padding-left:10px;"><%= mo.getpName() %></td>
		                        <td><%= mo.getpPrice() %></td>
		                        <td>
		                            <button type="button" class="cart">장바구니</button>
		                            <button type="button" class="delete">삭제</button>
		                        </td>
		                        <td></td>
		                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
            
        </div>
        
        <div class="buttons">
            <button type="button" id="checkedDelete">선택 상품 삭제</button>
            |
            <button type="button" id="checkedCart">선택 상품 장바구니</button>
        </div>

   </div>
   
   
   <!-- 전체선택|전체해제 기능 -->
   <script>
   		
   		// 전체선택 클릭시 전부 선택
   		$("#ckAll").on('click', function(){
   			
   			if($("#ckAll").is(':checked')) {
   				$("input[type=checkbox]").prop("checked", true);
   			}else {
   				$("input[type=checkbox]").prop("checked", false);
   			}
   			
   		})
   		
   		// 전부 선택시 전체선택 checked
		$("input[type=checkbox]").on('click', function(){
			var total = $(".ck").length;
			var checked = $(".ck:checked").length;
			
			if(total != checked) {
				$("#ckAll").prop("checked", false);
			}else {
				$("#ckAll").prop("checked", true);
			}
		})   
   </script>
   
   <!-- 찜리스트 선택 삭제 -->
   <script>
   $("#checkedDelete").on('click', function(){
	   promise1()
		.then(successCheck)
		.catch(failCheck);
   })
   			
	function promise1(){
				
		var result = confirm("해당 상품을 삭제하시겠습니까?");
				
			if(result) {
				
				var count = $(".ck:checked").length;
				var pCodes = new Array();
				$(".ck:checked").each(function(){
		   			pCodes.push($(this).parent().siblings(".pCode").text())
				}); // checked 담기
		   			//console.log(pCodes);
		   			//console.log(count);
				return new Promise(function(resolve, reject){
 	   					
 		   			$.ajax({
 		   				url:"deleteHeart.my",
 		   				datatype:"json",
 		   				traditional:true,
 		   				type:"post",
 		   				data: {
							count:count,		   				
 		   					pArr:pCodes
 		   				},
 		   				success:function(result){
 		   					console.log("프로미스1 성공")
 	                    	resolve(result);
 		   				}, error:function(){
 		   					console.log("ajax통신실패")
 		   				}
 		   					
 		   			}) //ajax
 	   			})
					
			}
				
	} // delete
			
	function successCheck(){
		alert("상품이 삭제되었습니다.");
		location.reload();
	}

	function failCheck(){
	    alert("삭제에 실패하였습니다.")
	} 
 				
   </script>
   
   <!-- 찜리스트 개별 삭제 -->
   <script>
   		$(".delete").on('click', function(){
   			
   			if(confirm("해당상품을 삭제하시겠습니까?")) {
   				
   				var pCode = $(this).parent().siblings(".pCode").text();
   				//console.log(pCode)
   				
   				$.ajax ({
   					url:"deleteHeartOne.my",
   					type:"post",
   					data: {pCode:pCode},
   					success:function(){
   						alert("상품이 삭제되었습니다.");
   						location.reload();
   					},error:function(){
   						alert("삭제에 실패했습니다.");
   					}
   				
   				})
   				
   			}
   			
   		})
   </script>
   
    <!-- 장바구니 선택담기 -->
	<script>
		$("#checkedCart").on('click', function(){
		  promise2()
			.then(successCheck2)
			.catch(failCheck2);
		})
					
		function promise2(){
					
			var result = confirm("선택한 상품을 장바구니로 이동하시겠습니까?");
					
				if(result) {
					
					var count = $(".ck:checked").length;
					var pCodes = new Array();
					$(".ck:checked").each(function(){
			   			pCodes.push($(this).parent().siblings(".pCode").text())
					}); // checked 담기
			   			console.log(pCodes);
			   			console.log(count);
					return new Promise(function(resolve, reject){
		   					
			   			$.ajax({
			   				url:"heartToCart.my",
			   				datatype:"json",
			   				traditional:true,
			   				type:"post",
			   				data: {
								count:count,		   				
			   					pArr:pCodes
			   				},
			   				success:function(result){
			   					console.log("프로미스1 성공")
		                    	resolve(result);
			   				}, error:function(){
			   					console.log("ajax통신실패")
			   				}
			   					
			   			}) //ajax
		   			})
						
				}
					
		} // delete
				
		function successCheck2(){
			alert("상품이 장바구니에 담겼습니다.");
			location.reload();
		}
		
		function failCheck2(){
		   alert("장바구니 담기에 실패하였습니다.")
		} 
   </script>
   
   <!-- 장바구니 개별 담기 -->
   <script>
   		$(".cart").on('click', function(){
			
			if(confirm("상품을 장바구니로 이동하시겠습니까?")) {
				
				var pCode = $(this).parent().siblings(".pCode").text();
				//console.log(pCode)
				
				$.ajax ({
					url:"heartToCartOne.my",
					type:"post",
					data: {pCode:pCode},
					success:function(){
						alert("상품이 장바구니에 담겼습니다.");
						location.reload();
					},error:function(){
						alert("장바구니 담기에 실패하였습니다.");
					}
				
				})
				
			}
			
		})
   </script>
   
   


	
  
</body>
</html>