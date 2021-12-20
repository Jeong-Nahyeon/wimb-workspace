<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.wimb.admin.model.vo.Banner, com.wimb.common.model.vo.PageInfo" %>
<%
	//전체보기 시 필요한 데이터 (배너번호, 배너명, 게시일, 게시여부, 배너위치)
	ArrayList<Banner> Postinglist = (ArrayList<Banner>)request.getAttribute("Postinglist");
	
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
    .updatebtn{
        border: none;
        background-color: #ffee58;
        border-radius: 4px;
        padding: 2px 13px;
        margin-left: 10px;
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
        height: 1200px;
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
        <button type="button" onclick="location.href='<%= contextPath %>/main.banner;'">뒤로가기</button>
    </div>
    <!-- 하단의 배너목록 테이블 -->
    <div class="bannerList">

        <div class="selectList">
            <select name="sorting_banner" id="sorting_banner" onchange="window.open(value,'_self');">
                <option value="<%= contextPath %>/list.banner?cpage=1">전체보기</option>
                <option value="<%= contextPath %>/Postinglist.banner?cpage=1" selected>게시중</option>
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
            <% for(Banner b : Postinglist) { %>
	            <tr>
	                <td><input type="checkbox"></td>
	                <td class="bannerCode"><%= b.getbCode() %></td>
	                <td><%= b.getbName() %></td>
	                <td><%= b.getStartDate() %></td>
	                <td class="bannerStatus"><%= b.getStatus() %></td>
                    <td><button type="button" class="statusChangebtn" style="border: none; border-radius: 5px; font-size: 13px; margin-top: 5px; background-color: #ffee58; outline: none;">변경</button></td>
	            </tr>
	            </tr>
            <% } %>
        </table>

        <div class="paging-area">
            
            <% if(currentPage != 1) { %>
            	<button onclick="location.href='<%= contextPath %>/Postinglist.banner?cpage=<%=currentPage-1%>';">&lt;</button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++) { %>
            	<% if(p == currentPage) { %>
            		<button disabled><%= p %></button>
            	<% } else { %>
            		<button onclick="location.href='<%= contextPath %>/Postinglist.banner?cpage=<%= p %>';"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) { %>
            <button onclick="location.href='<%= contextPath %>/Postinglist.banner?cpage=<%=currentPage+1%>';">&gt;</button>
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
                    <button type="button" style="background-color:lightgray; margin-right: 10px;">취소</button>
                    <button type="submit">등록</button>
                </div>

            </form>

        </div>
    </div>



    <script>
 	// 등록 버튼 클릭 시 띄워지는 화면 등록 모달창----------------------------------
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
	//--------------------------------------------------------------
	
	
	// 등록 화면에서 사진 등록 시 썸네일을 띄워주는 함수 ------------------------------
    function loadImg(inputFile){
        // inputFile : 현재 변화가 생긴 input type=file 요소
        
        if(inputFile.files.length == 1){
            // 파일을 읽어들이는 FileReader 객체 생성
            const reader = new FileReader()

            // 파일 읽어들이는 메소드
            reader.readAsDataURL(inputFile.files[0]);
            // 해당 파일을 읽어들이는 순간 해당 이 파일만의 고유한 url 부여

            // 파일 읽어들이기가 완료됐을 때 알아서 실행할 함수
            reader.onload = function(e){
                // e.target.result => 읽어들인 파일의 고유한 url
                $(".inputImg").attr("src", e.target.result);
            }
        } else {
            $(".inputImg").attr("src", null);
        }

    }
	// -----------------------------------------------------------------------
	
	// 상태 '변경' 버튼 클릭 시 호출되는 상태변경 ajax --------------------------------------
    $(document).on('click', ".statusChangebtn", function(){
    	
    	
    	var bannerCode = $(this).parent().siblings('.bannerCode').text();
    	var bannerStatus = $(this).parent().siblings('.bannerStatus').text();
    	console.log(bannerCode);
    	console.log(bannerStatus);
    	
    	$.ajax({
    		url:"StatusChange.banner",
    		data:{bCode:bannerCode, 
    			  bStatus:bannerStatus
    		},
    		success:function(result){
    			alert("상태변경 성공");
    			location.reload();
    		}, error:function(){
    			console.log("통신 실패");
    		}
    	});
    
    })
    //-------------------------------------------------------------------------
        
        
    </script>
    
    

</body>
</html>