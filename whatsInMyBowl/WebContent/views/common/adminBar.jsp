<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.wimb.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인한 관리자 회원의 정보가 담겨있는 Member 객체
	String alertMsg = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
</head>
<style>
    body{
        margin: 0px;
        width: 100%;
        height: 100%;
    }
    html, body{height: 100%;}

    img{
        width: 130px;
        padding-left: 50px;
    }

    #menubar-top{
        width: 100%;
        border-bottom: 1px solid grey;
        height: 100px;
    }
    
    #menubar-top a{
    	text-decoration: none;
    	color: black;
    	
    }
    
    #adminWithIcon{position: relative;}
    
    #adminIcon{
        position: absolute;
        color:gray;
        left: -33px;
        top: 35px;
        font-size: 30px;
    }

    #menubar-left{
        height: 100vh;
        width: 190px;   
        float: left;
        background-color: lightgrey;
        
    }

    ul{
        list-style-type: none;
        margin: 0;
        padding: 20px;
        text-align: center;
    }

    li a{
        display: block;
        text-decoration: none;
        color: grey;
    }

    li a:hover{
        color: black;
        text-decoration: none;
        font-weight: bold;
    }

    .menubar-left-title{
        font-size: 20px;
        border-bottom: 1px solid;
        padding: 10px;
        font-weight: 600;
    }

    .menubar-left-text{
        font-size: 13px;
        margin: 5px;
    }
	.lastul{		
		background-color: lightgrey;
	}
   
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<body>
    <% if(alertMsg != null){ %>
		<script>
			alert("<%= alertMsg %>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
    
    <table id="menubar-top">
        <tr>
            <td style="width: 10%;">
                <img src="<%= contextPath %>/resources/images/LOGO.png">
            </td>
            <td style="width: 68%;">
                <h1 style="font-weight:700;">Admin</h1>
            </td>
            <td style="width: 8%;" id="adminWithIcon">
                <i class="fas fa-user-circle" id="adminIcon"></i>
                <span><b style="font-size: 20px;">관리자</b>님</span>
            </td>
            <td style="width: 7%;">
                <a href=""><b style="font-size: 20px;">로그아웃</b></a>
            </td>
            <td style="width: 7%;">
                <a href=""><b style="font-size: 20px;">홈페이지</b></a>
            </td>
        </tr>
    </table>
	
    <div id="menubar-left">

        <ul>
            <li class="menubar-left-title">회원관리</li>
            <li class="menubar-left-text left_link"><a href="">회원 정보 관리</a></li>
            <li class="menubar-left-text left_link"><a href="">신고내역</a></li>
            <li class="menubar-left-text left_link"><a href="">블랙리스트</a></li>
            <li class="menubar-left-text left_link"><a href="">적립금 관리</a></li>
        </ul>
    
        <ul>
            <li class="menubar-left-title">상품관리</li>
            <li class="menubar-left-text left_link"><a href="<%= contextPath %>/list.apr?cpage=1">상품 등록</a></li>
            <li class="menubar-left-text left_link"><a href="<%= contextPath %>/updateDeleteList.apr?cpage=1">상품 수정 / 삭제</a></li>
            <li class="menubar-left-text left_link"><a href="">상품 배송관리</a></li>
            <li class="menubar-left-text left_link"><a href="">리뷰 관리</a></li>
            <li class="menubar-left-text left_link"><a href="">상품문의 관리</a></li>
        </ul>
    
        <ul>
            <li class="menubar-left-title">홈페이지관리</li>
            <li class="menubar-left-text left_link"><a href="<%= contextPath %>/list.terms">이용약관</a></li>
            <li class="menubar-left-text left_link"><a href="<%= contextPath %>/main.banner">배너</a></li>
        </ul>
    
        <ul>
            <li class="menubar-left-title">고객센터관리</li>
            <li class="menubar-left-text left_link"><a href="">공지사항</a></li>
            <li class="menubar-left-text left_link"><a href="">1:1 문의</a></li>
            <li class="menubar-left-text left_link"><a href="">자주묻는 질문</a></li>
        </ul>
    
        <ul class="lastul">
            <li class="menubar-left-title">통계</li>
            <li class="menubar-left-text left_link"><a href="">회원 수 통계</a></li>
            <li class="menubar-left-text left_link"><a href="">상품 수 통계</a></li>
            <li class="menubar-left-text left_link"><a href="">판매량 통계</a></li>
        </ul>
    </div>
	<script>
		$(".left_link a").on("click", function () {
			  $(".left_link a").css('color', 'inherit');
			  $(this).css('color', 'black');
			});

	</script>

</body>
</html>