<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.wimb.member.model.vo.PointCategory" %>
<%
	ArrayList<PointCategory> list = (ArrayList<PointCategory>)request.getAttribute("list");
	int count = (Integer)request.getAttribute("count");

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
    .outer{
        margin-top: 100px;
        margin-left: 18%;
        width: 800px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .paging-area button{
        width:20px;
        height:25px;
        padding:0;
        margin:0;
        font-size: 12px;
        border:none;
    }
    #memberListTable{
        width: 800px;
        font-size: 12px;
    }
    #addBtn, #deleteBtn, #addPointBtn{
        background-color: rgb(250, 223, 76);
        border:none;
        margin: 1px;
        font-size: 12px;
    }
	#cancelBtn{
        background-color: rgb(214, 213, 207);
        border:none;
        margin: 1px;
        font-size: 12px;
    }
	#addPointBtn, #cancelBtn{
		width:60px;
		height:30px;
	}
    #modalHeader{
    	width:500px;
    	padding: 25px;
    	
    }
    .orderList-area{
        overflow-y: scroll;
    }
</style>
</head>
<body>
    <%@ include file="../common/adminBar.jsp"%>
    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">회원관리</h2>
            <h2>> 적립금 관리</h2>
        </div>
        <div width="800">
            <p>
                총 <b style="color: rgb(250, 209, 76);"><%=count%></b> 건
            </p>
            <div width="800" align="right">
				<button id="addBtn" data-toggle="modal" data-target="#updateModal">
					적립금 추가
				</button>
                <button id="deleteBtn">
               		 적립금 삭제
                </button>
            </div>
        </div>
        <table id="memberListTable" border style="font-size:12px; text-align: center;">
        	<thead>
	            <tr style="background-color:rgba(231, 231, 231, 0.438);" align="center" >
	                <th width="5%" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
	                <th width="10%">번호</th>
	                <th width="65%">적립금명</th>
	                <th width="20%">적립액</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<% if(list.isEmpty()){ %>
	        	<tr>
	        		<td colspan="10">조회된 적립금이 없습니다.</td>
	        	</tr>
	        	<%}else { %>
	        		<% for(PointCategory pc : list){ %>
			            <tr align="center">
			                <td width="5%" height="30"><input type="checkbox"></td>
			                <td width="10%"><%= pc.getPointTypeCode() %></td>
			                <td width="65%"><%= pc.getPointName() %></td>
							<td width="20%"><%= pc.getPointAmount() %></td>
			            </tr>
			    	<% } %>
	            <%} %>
            </tbody>
        </table>
    </div>
    
    <!-- 적립금 추가용 모달-->
    <div class="modal" id="updateModal">
     
        <div class="modal-dialog">
            <div class="modal-content">
        
            <!-- Modal Header -->
            <div id="modalHeader">
                	<h5 class="modal-title" align="center"><b>적립금추가</b></h5>
               
            </div>
        
            <!-- Modal body -->
            <div class="modal-body" align="center">
				<form action="" id="pointAddForm" onsubmit="addPointCategory()">
					<table width="370" height="100" >
						
						
						<tr>
							<th width="100">적립금명</th>
							<td width="150">
								<input type="text" id="pointName" name="pointName">
							</td>
						</tr>
						<tr>
							<th>적립액</th>
							<td>
								<input type="number" id="pointAmount" name="pointAmount">
							</td>
						</tr>
						<tr height="30"></tr>
					</table>
					<input type="submit" value="추가" id="addPointBtn">
					<button type="button" id="cancelBtn">취소</button>
                </form>
            </div>
        
            
        
            </div>
        </div>
        
    </div>
    <script>
		function addPointCategory(){
			
	    	const $pointName = $("#pointAddForm input[name=pointName]");
			const $pointAmount = $("#pointAddForm input[name=pointAmount]");
          
           	
			$.ajax({
				url:"pointCategoryAdd.me",
				data:{
                   pointName:$pointName.val(),
				   pointAmount:$pointAmount.val()
                },
				type:"post",
				success:function(updateList){
					console.log("ajax 통신 성공");
					alert("카테고리 추가 성공!");
	
				},error:function(){
					console.log("ajax 통신 실패");
					alert("카테고리 추가 실패!");
				}
	
			})
		}
    </script>
</div>
</body>
</html>