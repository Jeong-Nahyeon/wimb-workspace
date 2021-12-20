<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.wimb.admin.model.vo.Banner, com.wimb.common.model.vo.PageInfo" %>
<%
	//전체보기 시 필요한 데이터 (배너번호, 배너명, 게시일, 게시여부, 배너위치)
	ArrayList<Banner> listAll = (ArrayList<Banner>)request.getAttribute("listAll");
	
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
    .list-area{
        width: 1500px;
        margin: auto;
    }
    .banner{
        margin-top: 130px;
        width: 1500px;
        margin: 14px;
    }
    .banner img{
        width: 390px;
        height: 150px;
    }
    .banner table{
        width: 100%;
        margin: 50px 30px 20px 0px;
        border: 1px solid gray;
    }
    .banner_box{display: inline-block;}
    .checkboxandbtn button{
        border: none;
        background-color: #ffee58;
        border-radius: 4px;
        padding: 2px 13px;
        margin-left: 3px;
    }
    .mainName{
        font-size: 17px;
        font-weight: bold;
    }
    .banner_box table{
        width: 400px;
        text-align: center;
    }
    .banner_box table td{
        border: 1px solid gray;
    }
    .tableheader{
        font-weight: bold;
        background-color: lightgray;
    }
    .checkboxandbtn{margin-top: 20px;}
    .bannerList{
        margin-top: 100px;
        width: 100%;
    }
    .bannerList table{
        width: 600px;
        height: 100%;
        margin-top: 10px;
        text-align: center;
    }
    .bannerList table td{border: 1px solid gray;}
    .bannerList_header{
        font-weight: bold;
        background-color: lightgray;
    }
    .two_btn button{
        border: none;
        border-radius: 5px;
        background-color: #ffee58;
        padding: 2px 11px;
        font-size: 13px;
    }
    #deletebanner{
    	background-color: lightgray;
    	margin-right: 10px;
    }
    .paging-area{
        text-align: center;
        margin-left: auto; 
        margin-right: auto; 
        width: 800px
    }
    .paging-area button{
        margin-top: 20px;
        border: 0;
    }
    .selectList{margin-bottom: 5px;}
    .selectList, .two_btn, .back{
        width: 1400px;
        text-align: right;
    }
    .back button{
        border: none;
        background-color: #bdbdbd;
        border-radius: 5px;
        padding: 3px 10px;
    }
    .back button:focus{outline: none;}
    /*모달창 만드는 css*/
    .insert_banner_area{
        display: none;
        width: 540px;
        height: 600px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:white;
        z-index: 2;
        align-items: center;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 2000px;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    .titleImg img{padding: 0px;}

    /*모달창에 속한 테이블 css*/
    .insert_banner_area table{
        text-align: center;
        width: 520px;
        height: 500px;
    }
    .insert_banner_area table tr, .insert_banner_area table th{border: 1px solid gray;}
    .insert_banner_area table td{
        text-align: left;
        padding-left: 20px;
    }
    .insert_banner_area table input{border: none;}
    .inputImg{
        width: 430px;
        padding: 0;
        margin-right: 10px;
    }
    
    /*메인1 변경하기 클릭 시 생성되는 모달창 내부 css*/
     .mainBanner_Outer{
        border: 1px solid black;
        width: 970px;
        height: auto;
        padding: 30px;
    }
    .inputMainImg{
        border: 1px solid black;
        width: 300px;
        padding: 0px;
    }
    .mainBanner_box table{
        width: 300px;
        height: 230px;
        display: inline-block;
        text-align: center;
        border: 1px solid black;
        margin: 30px 10px;
    }
    .mainBanner_btn{text-align: right;}
    .mainBanner_btn button{
        border: none;
        padding: 4px 16px;
        border-radius: 5px;
        font-size: 15px;
    }
    .mainBanner_btn button:focus{outline: none;}
    .mainBanner_btn_right{
        margin-left: 10px;
        background-color: #fdd835;
    }
    .mainBanner_btn_left{background-color: #8e8e8e;}
    
    /*메인1 변경하기 클릭 시 생성하는 모달창 css*/
    .mainmodal_wrap{
        display: none;
        width: 1040px;
        height: auto;
        position: absolute;
        top:50%;
        left: 40%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
        padding: 30px
    }
    .mainblack_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 2000px;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .mainmodal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .mainmodal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
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
            <h2 id="mainTitle1">홈페이지관리 > 배너</h2>
            <h2>> 배너관리</h2>
        </div>

   
        
    </div>
    <div class="back">
        <button type="button">뒤로가기</button>
    </div>
    <!-- 하단의 배너목록 테이블 -->
    <div class="bannerList">
        <div class="selectList">
            <select name="sorting_banner" id="sorting_banner" onchange="window.open(value,'_self');">
                <option value="<%= contextPath %>/list.banner?cpage=1" selected>전체보기</option>
                <option value="<%= contextPath %>/Postinglist.banner?cpage=1">게시중</option>
                <option value="<%= contextPath %>/EndOfPostinglist.banner?cpage=1">게시종료</option>
            </select>
        </div>
        
        <div class="two_btn">
            <button type=submit id="deletebanner">선택삭제</button>
            <button type="button" id="insertbannerbtn">등록하기</button>
        </div>
        
        <table style="margin-left: 600px; margin-right: auto; width: 800px;" >

            <tr>
                <td class="bannerList_header" style="position: relative;"></td>
                <td class="bannerList_header">배너번호</td>
                <td class="bannerList_header">배너명</td>
                <td class="bannerList_header">게시일</td>
                <td colspan="2" class="bannerList_header">상태</td>
            </tr>
            <% for(Banner b : listAll) { %>
	         	<input type="hidden" value="<%= b.getbCode() %>" name="bCode">
	            <tr>
	                <td><input type="checkbox" name="reportChkBxRow"></td>
	                <td><label class="bannerCode" name="bannerCode"><%= b.getbCode() %></label></td>
	                <td><%= b.getbName() %></td>
	                <td><%= b.getStartDate() %></td>
	                <td><%= b.getStatus() %></td>
                    <td><button type="button" class="statusChangebtn" style="border: none; border-radius: 5px; font-size: 13px; margin-top: 5px; background-color: #ffee58; outline: none;">변경</button></td>
	            </tr>
            <% } %>
        </table>

        <div class="paging-area">
            
            <% if(currentPage != 1) { %>
            	<button onclick="location.href='<%= contextPath %>/list.banner?cpage=<%=currentPage-1%>';">&lt;</button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++) { %>
            	<% if(p == currentPage) { %>
            		<button disabled><%= p %></button>
            	<% } else { %>
            		<button onclick="location.href='<%= contextPath %>/list.banner?cpage=<%= p %>';"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) { %>
            <button onclick="location.href='<%= contextPath %>/list.banner?cpage=<%=currentPage+1%>';">&gt;</button>
        	<% } %>
        </div>
    

        
    </div>

    <!-- 등록하기 버튼 클릭 시 생성되는 '배너 등록' 모달창 -->
    <div class="black_bg"></div>
    <div class="insert_banner_area">
        <div class="modal_close"><a href="#">close</a></div>
        <div align="center" style="margin-top: 30px;">
            <form action="<%= contextPath %>/insert.banner" id="enroll-form" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <th>배너명</th>
                        <td><input type="text" name="bannerTitle" id="bannerTitle" placeholder="배너명 입력" required style="width: 90%;"></td>
                    </tr>
                    <tr>
                        <th>이미지</th>
                        <td>
                        	<input type="file" name="bannerFile" id="bannerFile" onchange="loadImg(this);" required>
                        	<img class="inputImg" height="280" style="display: block;">
                        </td>
                    </tr>
                </table>
                <div class="two_btn" align="center" style="margin-top: 20px;">
                    <button type="button" style="background-color:gray; margin-right: 10px;">취소</button>
                    <button type="submit">등록</button>
                </div>

            </form>

        </div>
    </div>
    






    <script>
    	// 등록 버튼 클릭 시 띄워지는 화면 등록 모달창
        window.onload = function() {
     
        function onClick() {
            document.querySelector('.insert_banner_area').style.display ='block';
            document.querySelector('.black_bg').style.display ='block';
        }   
        function offClick() {
            document.querySelector('.insert_banner_area').style.display ='none';
            document.querySelector('.black_bg').style.display ='none';
        }
     
        document.getElementById('insertbannerbtn').addEventListener('click', onClick);
        document.querySelector('.modal_close').addEventListener('click', offClick); 
        
    	}
		
    	
    	// 상태 '변경' 버튼 클릭 시 호출되는 상태변경 ajax 
        $(document).on('click', ".statusChangebtn", function(){
        	
        	
        	var bannerCode = $(this).parent().siblings().children('.bannerCode').text();
        	console.log(bannerCode);
        	
        	$.ajax({
        		url:"StatusChange.banner",
        		data:{bCode:bannerCode},
        		success:function(result){
        			location.href = location.href;
        		}, error:function(){
        			console.log("통신 실패");
        		}
        	});
        
        })
        
    </script>
    
    

</body>
</html>