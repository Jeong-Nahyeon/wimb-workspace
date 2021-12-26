<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.wimb.customerService.model.vo.*, com.wimb.common.model.vo.PageInfo" %>
<%	
	/*처리완료*/
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
	
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
<style>
    .outer{
        margin-top: 100px;
        margin-left: 25%;
        width: 1000px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    #mainTitle, #sort_box, #sort_box div{display: inline-block;}
    #sort_box{float: right;}
    #sort_box div{
        font-size: 18px;
        margin: 0 10px;
        font-weight: bold;
    }
    #sort_box select{padding: 5px 5px;}
    .progressing_table, .done_table{
        width: 1000px;
        border: 2px solid gray;
        text-align: center;
    }
    .progressing_table tr, .done_table tr{
        border: 1px solid lightgray;
    }
    .progressing_paging_area{margin-bottom: 100px;}
    .paging-area{margin-top: 30px;}
    .table_title{
        font-weight: bold;
        border-bottom: 2px solid lightgray;
        padding-bottom: 10px;
        margin-bottom: 50px;
    }
    .table_header{
        background-color: lightgray;
    }
    .paging-area{
        width: 100%;
        text-align: center;
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .paging-area>button{
        width: 20px;
        height: 20px;
        font-size: 10px;
        border: none;
        border-radius: 5%;
    }
	.notice_Box table tr:hover{
    	background: lightgray;
    	cursor: pointer;
    }
    .search_box input{width: 400px;}
    .search_box input:focus{outline: none;}
    .search_box button:focus{outline: none;}
    .search_box button:hover{background-color: #fdd835;}
    .search_box button{
        border: none;
        background-color: #ffee58;
        padding: 4px 20px;
        border-radius: 5px;
    }
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="../common/adminBar.jsp" %>

    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">고객센터관리</h2>
            <h2>> 1:1 문의</h2>
        </div>

        <div id="sort_box" align="right">
            <div>정렬</div>
            <select name="" id="" onchange="window.open(value,'_self');">
                <option value="<%= contextPath %>/adminProcessingListView.inq?cpage=1">처리중</option>
                <option value="<%= contextPath %>/adminCompletionListView.inq?cpage=1" selected>처리완료</option>
            </select>
        </div>

        <table class="progressing_table">
            <h3 class="table_title">처리완료</h3>
            
            <tr class="table_header">
                <th class="header_num">글번호</th>
                <th class="header_category">문의유형</th>
                <th class="header_writer">작성자</th>
                <th class="header_title">제목</th>
                <th class="header_enrolldate">등록일자</th>
                <th class="header_status">진행상황</th>
                <th class="header_enddate">처리날짜</th>
            </tr>
            <% for (Inquiry inq : list) { %>
	            <tr>
	                <td class="header_num"><%= inq.getiCode() %></td>
	                <td class="header_category"><%= inq.getiCategory() %></td>
	                <td class="header_writer"><%= inq.getmName() %></td>
	                <td class="header_title"><a><%= inq.getiTitle() %></a></td>
	                <td class="header_enrolldate"><%= inq.getiDate() %></td>
	                <td class="header_status"><%= inq.getiAnswer() %></td>
	                <td class="header_enddate"><%= inq.getaDate() %></td>
	            </tr>
	         <% } %>
        </table>
        
        
	        <div class="paging-area" align="center">
	            <% if(currentPage != 1) { %>
	            	<button onclick="location.href='<%= contextPath %>/adminCompletionListView.inq?cpage=<%=currentPage-1%>';">&lt;</button>
	            <% } %>
	            
	            <% for(int p=startPage; p<=endPage; p++) { %>
	            	<% if(p == currentPage) { %>
	            		<button disabled><%= p %></button>
	            	<% } else { %>
	            		<button onclick="location.href='<%= contextPath %>/adminCompletionListView.inq?cpage=<%= p %>';"><%= p %></button>
	            	<% } %>
	            <% } %>
	            
	            <% if(currentPage != maxPage) { %>
	            <button onclick="location.href='<%= contextPath %>/adminCompletionListView.inq?cpage=<%=currentPage+1%>';">&gt;</button>
	        	<% } %>
	        </div>


        <div class="search_box" align="center">
            <form action="" method="get" class="search_form">
                <select name="search_category" id="search_category">
                    <option value="">제목</option>
                    <option value="">글번호</option>
                </select>
                <input type="text" placeholder="검색하실 내용을 입력해주세요" name="search_category_input" id="search_category_input">
                <button id="search_btn">검색</button>
            </form>
        </div>


    </div>





</body>
</html>