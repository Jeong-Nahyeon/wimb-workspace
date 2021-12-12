<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .wrap{width: 1000px; height:800px; box-sizing: border-box; margin:auto; margin-bottom: -200px;}
        .wrap>div{box-sizing: border-box; float:left;}
        .search-area{width: 350px; height:200px;}
        .search-area>*{margin-top: 160px;}
        .logo-area{width: 300px; height: 200px;}
        .logo-area img{width:140px; height:60%; margin-top:50px;}
        .mypage-area{width: 350px; height:200px;}
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
        #outer{
            width: 1000px; 
            height: 50px;
            text-align: center; 
            border-top: 1px solid grey;
            border-bottom: 1px solid grey;  
        }
        #navi-area{
            list-style-type: none;
            padding:0;
            margin:0;
            height:100%;
        }
        #navi-area>li{
            float: left;
            font-size: medium;            
            margin-left: 55px;
            margin-right: 40px;
            line-height: 100%;
            text-align: center;
            width: 100px;
        }
        #navi-area a, #navi-detail a{
            text-decoration: none;
            color: black;
            font-weight: bold; 
            display:block;
            width:100%;
            height:100%;
            line-height:50px;
        }
        #navi-detail>li {
            font-size: small;
            float: left;
            margin-left: 30px;
            margin-right: 30px;
            line-height: 100%;
            text-align: center;
            width: 100px;
            display: inline;
        }
        #navi-area a:hover, #navi-detail a:hover{
            color: rgb(155, 213, 189);
            font-weight: bold;            
        }
        #navi-area>li>ul{
            list-style: none;
            display: none;
            font-size: small; 
            text-align: center;
            padding:0;  
        }
        #navi-detail>li{font-size: medium; margin-left: 50px;}
        #navi-detail>li>ul{
            list-style: none;
            text-align: center;
            padding:0;  
            font-weight: lighter;
            font-size: small;
        }
        #navi>li>ul a{font-size:small;}
        #navi-area>li>a:hover+ul{display:block;}
        #navi-area>li>ul:hover{display:block;}
        #wholeMenu{
            border: 1px solid lightgrey;
            width: 1000px;
            text-align: center;
            display: none;
        }
         
        #searchBtn{
            color: rgb(155, 213, 189);
            background: white;
            border: none;
            font-weight: bold;
            border-radius: 0.5ex;
        }
        #searchBtn i:hover{
            font-size: larger;
        }
        #search{
            border: none;
            border-bottom: 1px solid black;
            outline-style: none;
        }
        #user-area{letter-spacing: 1px; font-size:x-large;}
        
        .sidebar{
            border: 1px solid lightgrey;
            width: 40px;
            height: 200px;
            border-radius: 5ex;
            position: absolute;
            top: 280px;
            left: 1000px;
        }
        .sidebarWrap{
            position: absolute;
            z-index: 99999;
        }
        .sidebar>div{
            position: relative;
            width: 30px;
            height: 40px;   
            top: 20px;
            text-align: center;
        }
        .sidebar a{
            color: rgb(155, 213, 189);
            font-size: x-large;
            line-height: 2em;
        }
        .sidebar a:hover{
            color: rgb(189, 216, 205);
        }
        #footer{
            width: 1000px;
            height: 200px;
            bottom: 0;
            margin: auto;
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
        }
        
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
        <div id="outer">
            <div class="navi" align="center">
                <ul id="navi-area">
                    <li><a href="#" id="whole"><i class="fas fa-bars"></i></a></li>
                    <li><a href="">Best메뉴</a></li>
                    <li><a href="">세일</a></li>
                    <li><a href="">커스텀</a></li>
                    <li><a href="">샐러드</a>
                        <ul>
                            <li><a href="">비건샐러드</a></li>
                            <li><a href="">육류샐러드</a></li>
                            <li><a href="">해산물샐러드</a></li>
                        </ul>                
                    </li>
                </ul>            
            </div>
        </div>
        <div id="wholeMenu">
            <ul id="navi-detail">
                <li><a href="">Best 메뉴</a></li>
                <li><a href="">세일</a></li>
                <li><a href="">커스텀</a></li>
                <li><a href="">샐러드</a>
                    <ul>
                        <li><a href="">비건샐러드</a></li>
                        <li><a href="">육류샐러드</a></li>
                        <li><a href="">해산물샐러드</a></li>
                    </ul>
                </li>
                <li><a href="">고객센터</a>
                    <ul>
                        <li><a href="">FAQ</a></li>
                        <li><a href="">Q&A</a></li>
                        <li><a href="">공지사항</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="sidebarWrap">
            <div class="sidebar">
                <div style="border-bottom:1px solid lightgrey">
                    <a href=""><i class="fas fa-heart"></i></a>
                </div>
                <div style="border-bottom:1px solid lightgrey">
                    <a href=""><i class="fas fa-cart-plus"></i></a>
                </div>
                <div style="border-bottom:1px solid lightgrey">
                    <a href=""><i class="fas fa-chevron-up"></i></a>
                </div>
                <div>
                    <a href=""><i class="fas fa-chevron-down"></i></a>
                </div>
            </div>
        </div>
    </div>
    
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
    <script>      
        $("#whole, #wholeMenu").mouseover(function(e){
            e.preventDefault();
            $("#wholeMenu").slideDown("slow");
        });
        $("#wholeMenu").mouseleave(function(e){
            e.preventDefault();
            $("#wholeMenu").slideUp();
        });

        var floatPosition = parseInt($(".sidebarWrap").css('top'));
        $(window).scroll(function(){
            var currentTop = $(window).scrollTop();
            var bannerTop = currentTop + floatPosition + "px";

            $(".sidebarWrap").stop().animate({
                "top" : bannerTop
            }, 1200);
        }).scroll();
    </script>
</body>
</html>


