<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.wimb.customerService.model.vo.Notice, com.wimb.common.model.vo.PageInfo"%>
<%
	
	ArrayList<Notice> noticeList = (ArrayList<Notice>)request.getAttribute("noticeList");
	// 조회된 공지사항 리스트가 담겨있는 list
	
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
<title>고객센터-공지사항리스트(고객센터메인)</title>
<style>
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
    }

    .outer{
        width: 1000px;
        box-sizing: border-box;
        margin: auto;
        margin-top: 100px;
    }

    .noticeSideBar{
        float: left;
        width: 200px;
    }

    .noticeSideBar-Top>h2{
        text-align: center;
        font-size: 25px;
        font-weight: 600;
    }

    .noticeSideBar ul li{
        text-align:center;
        margin: 25px 0;
        list-style: none;
        padding: 12px;
    }
    .noticeSideBar ul li a{
        color: black;
        text-decoration: none;
        font-weight: bold;
    }

    .noticeSideBar-Top ul li:hover{
        background-color: rgb(155, 213, 189);
        text-decoration-line: none;
    }

    .noticeList{
        margin-left: 230px;
        text-align: center;
    }

    .noticeList table tr td{
        padding: 10px;
    }

    .paging-area{
        /*border: 1px solid coral;*/
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
	.noticeList tr:hover{
    	background: lightgrey;
    	cursor: pointer;
    }
    
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <main>
        <%@ include file="../common/menubar.jsp" %>

        <div class="outer">

            <div class="noticeSideBar" style="margin-bottom:100px;">

                <div class="noticeSideBar-Top">
                    <h2>고객센터</h2>
                    <ul>
                        <li>
                            <a href="<%= contextPath %>/userView.no?cpage=1">공지사항</a>
                        </li>
                        <li>
                            <a href="<%= contextPath %>/listUserView.faq?cpage=1">자주묻는 질문</a>
                        </li>
                        <li style="margin-bottom: 80px;">
                            <a href="<%= contextPath %>/userEnrollForm.inq">1:1문의</a>
                        </li>
                    </ul>
                </div>

                <div class="noticeSidebar-Bottom" align="center" style="border-top: 1px solid black; padding-top: 30px;">
                    <p style="font-weight: bold;">고객상담센터</p>
                    <p style="font-size: 28px; font-weight: 600; color: rgb(155, 213, 189);">1234-1234</p>
                    <p style="font-size: 12px; font-weight: bold;">
                        월 ~ 금 : 오전 9시 오후 4시<br>
                        점심시간 : 오후 12시 30분<br>
                        ~ 오후 1시 30분<br>
                        토요일/일요일/공휴일 휴무<br>
                    </p>
                </div>
    
            </div>
            
            <div class="noticeList">
                <h3 style="font-weight: 800; margin-bottom: 30px;">공지사항</h3>
                <table style="padding: 10px;">
                    <tr style="background-color: rgb(234, 234, 234); border-top: 2px solid gray; border-bottom: 1px solid gray;">
                        <th class="tableNum" style="width: 70px; padding: 10px; border-bottom: 1px solid gray;">번호</th>
                        <th class="tableTitle" style="width: 450px; padding: 10px;">제목</th>
                        <th class="tableDate" style="width: 120px; padding: 10px;">날짜</th>
                        <th class="tableCount" style="width: 90px; padding: 10px;">조회수</th>
                    </tr>
                    <tbody>
                 	<% for(Notice n : noticeList) { %>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum"><%= n.getNoticeCode() %></td>
                        <td class="tableTitle"><%= n.getNoticeTitle() %></td>
                        <td class="tableDate"><%= n.getNoticeDate() %></td>
                        <td class="tableCount"><%= n.getNoticeView() %></td>
                    </tr>
                    <% } %>               
                    </tbody>
                </table>

        <div class="paging-area">
            
            <% if(currentPage != 1) { %>
            	<button onclick="location.href='<%= contextPath %>/userView.no?cpage=<%=currentPage-1%>';">&lt;</button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++) { %>
            	<% if(p == currentPage) { %>
            		<button disabled><%= p %></button>
            	<% } else { %>
            		<button onclick="location.href='<%= contextPath %>/userView.no?cpage=<%= p %>';"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) { %>
            <button onclick="location.href='<%= contextPath %>/userView.no?cpage=<%=currentPage+1%>';">&gt;</button>
        	<% } %>
        </div>
    



            </div>

        </div>
	    <footer>
	    	<%@ include file="../common/footer.jsp" %>
	    </footer>	
		<script>
		
		// 상세보기 시 필요한 게시판 번호를 넘기는 함수 ------------------------------------------
    	$(function(){
    		$(".noticeList table tr").click(function(){
    			
    			const num =  $(this).children().eq(0).text(); 			
    			location.href='<%= contextPath %>/detailUserView.no?num=' + num;
    	// ----------------------------------------------------------------------		
    			
    		})
    	})		
		
		</script>

    </main>
</body>
</html>