<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.wimb.common.model.vo.PageInfo, java.util.ArrayList, com.wimb.member.model.vo.Member" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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
        width: 1500px;
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
    .paging-area button:target{
        background-color: rgb(236, 214, 12);
    }
</style>
</head>
<body>
    <%@ include file="../common/adminBar.jsp"%>
    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">회원관리</h2>
            <h2>> 회원 정보 관리</h2>
        </div>
        <div>

        </div>
        <table border style="font-size:12px">
        	<thead>
	            <tr>
	                <th width="40" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
	                <th width="50">번호</th>
	                <th width="80">ID</th>
	                <th width="60">회원명</th>
	                <th width="100">연락처</th>
	                <th width="55">구매횟수</th>
	                <th width="70">구매누적액</th>
	                <th width="60">적립금</th>
	                <th width="90">가입일</th>
                    <th width="90">회원상태</th>
	                <th width="100">수정/삭제</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<% if(list.isEmpty()){ %>
	        	<tr>
	        		<td colspan="10">조회된 회원이 없습니다.</td>
	        	</tr>
	        	<%}else { %>
	        		<% for(Member m : list){ %>
			            <tr>
			                <td><input type="checkbox"></td>
			                <td><%= m.getmCode() %></td>
			                <td>
			                    <a href=""><%= m.getmId() %></a>
			                </td>
			                <td><%= m.getmName() %></td>
			                <td><%= m.getmPhone() %></td>
			                <td></td>
			                <td></td>
			                <td>
			                    <a href=""><%= m.getmPoint() %></a>
			                </td>
			                <td><%= m.getEnrollDate() %></td>
                            <th><%= m.getStatus() %></th>
			                <td>
			                    <button id="updateBtn">수정</button>
			                    <button id="deleteBtn">삭제</button>
			                </td>
			            </tr>
			    	<% } %>
	            <%} %>
            </tbody>
        </table>

        <div class="paging-area" align="center">
        
            <% if(currentPage != 1){ %>
                <button onclick="location.href='<%=contextPath%>/infoAdminClick.me?cpage=<%= currentPage - 1%>';"> &lt; </button>
            <% } %>
            <% for(int p=startPage; p<=endPage; p++){ %>
                <% if(p == currentPage) {%>
                    <button disabled><%= p %></button>
                <% } else{ %>
                    <button onclick="location.href='<%=contextPath%>/infoAdminClick.me?cpage=<%= p %>';"><%= p %></button>
                <% } %>
            <% } %>
            <% if(currentPage != maxPage){ %>
                    <button onclick="location.href='<%=contextPath%>/infoAdminClick.me?cpage=<%= currentPage + 1%>';"> &gt; </button>
            <% } %>
        </div>
        
    </div>
    
</div>
</body>
</html>