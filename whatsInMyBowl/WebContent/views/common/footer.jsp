<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
	#footer{
        	clear: both;
            width: 1000px;
            height: 200px;
			   
			margin: auto;
			margin-top: 20%;
			
            background: rgb(245, 243, 243);
        }
        #footerUpside{
            width:100%;
            height: 50px;
        }
        #footer ul>li{
            float: left;
            list-style-type: none;
            margin-left: 5px;
            margin-right: 10px;
            line-height: 50px;
        }
        #footerUpside li>a{
            color: black;
            text-decoration: none;
            font-weight: bold;
        }
        #footerUpside li>a:hover{
            color: grey;
        }
        #footerDownside{
            width: 100%;
            height: 150px;
            margin: auto;
            padding: 15px 35px;
        }
        #footerDownside p{
            font-size: small;
            line-height: 20px;
            text-align: left;
        }
	</style>
	
</head>
<body>

   <div id="footer">
	        <div id="footerUpside">
	            <ul>
	                <li><a href="">고객센터</a></li>
	                <li>|</li>
	                <li><a href="">이용약관</a></li>
	                <li>|</li>
	                <li><a href="">이용안내</a></li>
	                <li>|</li>
	                <li><a href="">개인정보 처리방침</a></li>
	            </ul>
	        </div>
	        <div id="footerDownside" >
	            <p>법인명(상호): (주)왓츠인마이볼 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 대표: 홍길동<br>
	            	주소: 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2층<br>
	            	전화번호: 02-1111-2222 <br>
	            	fax: 02-3333-4444<br>
	            	email: whatsinmybowlTeam@gmail.com<br>
	            	사업자 등록번호: 2021-0000-1111
	            </p>
	        </div>
	    </div>

</body>
</html>