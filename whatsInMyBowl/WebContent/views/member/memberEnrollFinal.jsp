<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
  
<style>
	*{box-sizing: border-box;}
	#enrollStatus{
		text-align: center;
		margin-top: 50px;
	}
	#level1, #level2{text-decoration: none; color: black; font-size: small; font-weight: 900; margin: 20px;}
	#level3{text-decoration: none; color:rgb(155, 213, 189); font-size: small; font-weight: 900; margin: 20px}
	#p-box{
		width: 600px;
		height: 500px;
		text-align: center;
		border: 1px solid lightgrey;
		margin: auto;
       
	}
    #img-area{height:60px; width:100px; margin:auto; margin-top:80px;}
    #img-area img{height: 50px; width:60px;}
    #p-area{
        height: 200px; 
        width: 300px; 
        margin:auto;
        font-size: small;
        font-weight: 800;
    }
	#nextBtn{
		width: 200px;
		border: 1px solid rgb(155, 213, 189);
		background-color: white;
		border-radius: 1.05ex;
		color: rgb(155, 213, 189);
		font-weight: 900;
	}
	#nextBtn:hover{
		background-color: rgb(155, 213, 189);
		color: white;
	}
   
</style>
</head>
<body>
	<div id="enrollStatus">
		<p style="font-weight: 900; font-size: x-large;">
			이용약관
		</p>
		<p>
			<a id="level1">01|이용약관</a> >><a id="level2">02|정보입력 및 이메일 인증</a>>><a id="level3">03|가입완료</a>
		</p>
	</div>
	<div id="p-box" align="center">
		
			<div id="img-area">
                <img src="<%= contextPath %>/resources/images/LOGO.png">
            </div>
            <div id="p-area">
                <p>
                    <h3><b>회원가입 완료!</b></h3> <br><br>
                    What's In My Ball 에 <br>
                    가입해주셔서 감사합니다 <br>
                    지금 신선한 샐러드를 확인해보세요! 
                </p>	
            </div>
			
			<input type="button" value="샐러드 둘러보기" id="nextBtn" onclick="home();">
	
	</div>
	
	<script>
		
        function home(){

            location.href="<%= contextPath %>";
        }
		
	
	</script>

	<br clear="both">
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
</body>
</html>