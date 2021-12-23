<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.wimb.customerService.model.vo.Notice, com.wimb.common.model.vo.PageInfo"%>
<%
	
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	// 검색된 공지사항 리스트가 담겨있는 list
	
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
<title>Insert title here</title>
<style>
    .outer{
        margin-top: 100px;
        margin-left: 25%;
        height: auto;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .notice_Box{
        margin-top: 130px;
        width: 1000px;
    }
    .notice_Box_top{text-align: end;}
    .notice_Box_top button{
        border: none;
        background-color: #ffee58;
        border-radius: 4px;
        font-size: 15px;
        padding: 3px 10px;
        margin-bottom: 10px;
    }
    .notice_Box_top button:focus{outline: none;}
    .notice_Box_top button:hover{background-color: #fdd835;}
    .notice_Box table{width: 100%;}
    .noticeList_checkbox_main{width: 3%;}
    .noticeList_num{width: 5%;}
    .noticeList_title{width: 60%;}
    .noticeList_update_delete{
        width: 10%;
    }
    .noticeList_enroll_date{width: 10%;}
    .noticeList_count{width: 6%;}
    .noticeList_checkbox_main, .noticeList_num, 
    .noticeList_title, .noticeList_update_delete, 
    .noticeList_enroll_date, .noticeList_count{
        padding: 4px 0;
        text-align: center;
        border-bottom: 1px solid gray;
    }
    .noticeList_header{
        background-color: lightgray;
        border-top: 1px solid gray;
    }
    .two_btn{display: inline-block;}
    .two_btn button{
        border: none;
        background-color: #ffee58;
        border-radius: 5px;
        font-size: 13px;
        padding: 3px 8px;
    }
    .two_btn button:focus{outline: none;}
    .two_btn button:hover{background-color: #fdd835;}
    .paging-area button{
        border: 0;
        margin: 30px 0 20px 0;
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
 	/*공지사항 삭제 모달*/

     .delete_text{
         text-align: center;
      }
     .delete_text span{
         display: block;
         margin: 10px 0;
     }
     .delete_btn{
         margin: 40px 5px 5px 5px;
         text-align: center;
     }
     .delete_btn button{
         margin: 0 10px;
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
	<%@ include file="../common/adminBar.jsp" %>
    
    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">고객센터관리</h2>
            <h2>> 공지사항 검색</h2>
        </div>

        <div class="notice_Box">
            <div class="notice_Box_top">
                <button class="notice_Box_top_left" onclick="location.href='<%= contextPath %>/adminEnrollForm.no';">새 글 등록</button>
                <button class="notice_Box_top_bottom" data-toggle="modal" data-target="#banner_delete_Modal">선택삭제</button>
            </div>
            <table>
            	<thead>
	                <tr class="noticeList_header" style="background-color: rgb(234, 234, 234);">
	                    <th class="noticeList_checkbox_main"></th>
	                    <th class="noticeList_num">글번호</th>
	                    <th class="noticeList_title">제목</th>
	                    <th class="noticeList_update_delete">수정 / 삭제</th>
	                    <th class="noticeList_enroll_date">작성일</th>
	                    <th class="noticeList_count">조회수</th>
	                </tr>
            	</thead>
            	<tbody>
	                <% for(Notice n : list) { %>
	                <tr class="noticeList_header2">
	                    <td class="noticeList_checkbox_main"><input type="checkbox" id="notice1" name="check"></td>
	                    <td class="noticeList_num"><%= n.getNoticeCode() %></td>
	                    <td class="noticeList_title"><%= n.getNoticeTitle() %></td>
	                    <td class="noticeList_update_delete">
	                        <div class="two_btn">
	                            <button type="button" onclick="location.href='<%=contextPath %>/adminUpdateForm.no?num=<%= n.getNoticeCode() %>'">수정</button>
	                            <button type="button" onclick="location.href='<%=contextPath %>/deleteOne.no?num=<%= n.getNoticeCode() %>'">삭제</button>
	                        </div>
	                    </td>
	                    <td class="noticeList_enroll_date"><%= n.getNoticeDate() %></td>
	                    <td  class="noticeList_count"><%= n.getNoticeView() %></td>
	                </tr>
					<% } %>
            	
            	</tbody>
            </table>
            
	        <div class="paging-area">
	            <% if(currentPage != 1) { %>
	            	<button onclick="location.href='<%= contextPath %>/search.no?cpage=<%=currentPage-1%>';">&lt;</button>
	            <% } %>
	            
	            <% for(int p=startPage; p<=endPage; p++) { %>
	            	<% if(p == currentPage) { %>
	            		<button disabled><%= p %></button>
	            	<% } else { %>
	            		<button onclick="location.href='<%= contextPath %>/search.no?cpage=<%= p %>';"><%= p %></button>
	            	<% } %>
	            <% } %>
	            
	            <% if(currentPage != maxPage) { %>
	            <button onclick="location.href='<%= contextPath %>/search.no?cpage=<%=currentPage+1%>';">&gt;</button>
	        	<% } %>
	        </div>	
	        		
			<!-- 검색창 -->
			<form action="<%= contextPath %>/search.no?cpage=1" method="post">
	            <div class="search_box" align="center">
	                <form action="" method="get" class="search_form">
	                    <span style="border: 1px solid gray; padding: 3px 7px;">제목</span>
	                    <input type="text" placeholder="검색하실 제목을 입력해주세요" name="search_title" id="search_title">
	                    <button type="submit" id="search_btn">검색</button>
	                </form>
	            </div>
			</form>
            
         	<!-- 공지사항 삭제 관련 모달-->
            <!-- The Modal -->
            <div class="modal" id="banner_delete_Modal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <!-- <form action="" >  -->
                            <div class="delete_text">
                                <span>선택하신 공지사항을 삭제합니다.</span>
                                <span>정말 삭제하시겠습니까?</span>
                                <span>(삭제 후 복구불가)</span>
                            </div>
                            <div class="delete_btn">
                                <button class="btn btn-sm btn btn-outline-warning" data-toggle="modal" onclick="deletecheck();">삭제</button>
                                <button type="reset" class="btn btn-sm btn-outline-secondary" data-dismiss="modal">취소</button>
                            </div>
                        <!-- </form>  -->
                    </div>
                </div>
                </div>
            </div>

            <script>
            
    		// 상세보기 시 필요한 게시판 번호를 넘기는 함수 ------------------------------------------
        	$(function(){
        		$(".notice_Box tbody td:nth-child(3)").click(function(){
        			location.href="<%= contextPath %>/adminDetailView.no?num=" + $(this).siblings('.noticeList_num').text();
        			
        		})
        	})       	
        	// ----------------------------------------------------------------------		
	        
        	
        	
        	// 선택 삭제 ------------------------------------------------------------------
	        function deletecheck(){
	    		promise1()
	    		.then(successCheck)
	    		.catch(failCheck);
	    	}
	    	
	    	function promise1(){
	    		var count = $("input[name='check']:checked").length;
	    		var checkArr = new Array();
	    		 $("input[name='check']:checked").each(function(){
	                 checkArr.push($(this).parent().siblings(".noticeList_num").text())
	             });
	    		 
	             return new Promise(function(resolve, reject){
	                 $.ajax({
	                     url:"delete.no",
	                     dataType:"json",
	                     traditional:true,
	                     data:{
	                         count:count,
	                         checkArr:checkArr
	                     },
	                     success:function(result){
	                         console.log("프로미스1 성공")
	                         resolve(result);
	                     },
	                     error:function(){
	                         console.log("ajax 통신 실패");
	                     }
	                 })
	             })
	    	}
	    	  function successCheck(){
	              alert("공지사항 삭제 완료")
	              location.reload();
	          }
	
	          function failCheck(){
	              alert("삭제에 실패하였습니다.")
	          }    	
	    	  // ------------------------------------------------------------------------            
	            
            </script>

        </div>

 </div>
    
    
    
</body>
</html>