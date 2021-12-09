<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
	<style>
        .wrap{width: 1000px; height:200px; box-sizing: border-box; margin:auto;}
        .wrap>div{box-sizing: border-box; float:left;}
        .search-area{width: 350px; height:100%;}
        .search-area>*{margin-top: 160px;}
        .logo-area{width: 300px; height: 100%;}
        .logo-area img{width:140px; height:60%; margin-top:50px;}
        .mypage-area{width: 350px; height:100%;}
        .login-area{
           text-align: right;
           line-height: 50px;           
           margin-top: 150px;
           margin-right: 10px;   
           font-size:small;      
        }
        .logined-area{
           text-align: right;
           line-height: 44px;           
           margin-top: 100px;
           margin-right: 20px;
           font-size:small;         
        }
        .logined-area a, .login-area a{
            text-decoration: none;
            color: grey;
            padding: 5px;
        }
        .logined-area a:hover, .login-area a:hover{
            text-decoration: none;
            color: black;
            font-weight: bolder;
        }
        .navi{
            width: 1000px; 
            height: 50px;
            text-align: center;
            margin: auto;
            float: left;  
            border-top: 1px solid grey;
            border-bottom: 1px solid grey;  
        }
        .navi li{
            list-style: none;
            display: inline;
            font-size: medium;            
            margin-left: 50px;
            margin-right: 50px;    
        }
        #navi-area a{
            text-decoration: none;
            color: black;
            font-weight: bold;            
        }
        #navi-area a:hover{
            text-decoration: none;
            color: rgb(155, 213, 189);
            font-weight: bold;            
        }
        #searchBtn{
            color: rgb(155, 213, 189);
            background: white;
            border: none;
            font-weight: bold;
            border-radius: 0.5ex;
        }
        #search{
            border: none;
            border-bottom: 1px solid black;
            outline-style: none;
        }
        #user-area{letter-spacing: 1px; font-size:x-large;}
	</style>
</head>
<body>
	    <div class="wrap" align="center">
        <div class="search-area">           
            <input type="text" name="search" id="search">  
            <button id="searchBtn" onclick=""><i class="fas fa-search"></i></button>  
        </div>
        <div class="logo-area">
            <a href=""><img src="<%= contextPath %>/resources/images/LOGO.png"></a>
        </div>
        <div class="mypage-area">
            <!-- 로그인 전 -->
            <div class="login-area"> 
                <a href="">회원가입</a> 
                <a href="">로그인</a>
                <a href="">마이페이지</a>
                <a href="">고객센터</a>
                <a href="">장바구니</a>
            </div> 
            
            <!-- 로그인 후
            <div class="logined-area">
                <div id="user-area">
                    <a href="">
                        <i class="fas fa-user fa-2x" style="color:rgb(155, 213, 189)"></i>
                        <b>홍길동</b>님
                    </a>
                </div>
                <div id="logout-area">
                    <a href="">로그아웃</a>
                    <a href="">마이페이지</a>
                    <a href="">고객센터</a>
                    <a href="">장바구니</a>
                </div>                
            </div>  -->
             
            
                
                    
        </div>
    
        <div class="navi" align="center">
            <ul id="navi-area">
                <li><a href=""><i class="fas fa-bars"></i></a></li>
                <li><a href="">Best메뉴</a></li>
                <li><a href="">세일</a></li>
                <li><a href="">커스텀</a></li>
                <li><a href="">완제품</a></li>
                <li><a href="">정기배송</a></li>               
            </ul>            
        </div>
    </div>


</body>
</html>