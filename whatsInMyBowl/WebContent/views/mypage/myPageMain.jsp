<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/10f565a9d5.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    /* 윤지 */
    /*mainPage menubar*/
    .wrap{
        width: 1000px; 
        height:300px; 
        box-sizing: border-box; 
        margin:auto; 
        min-height:100%;
        z-index: 10000;}
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
            z-index: 10000;
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
            width: 170px;
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
            margin-top:-5px;
            margin-bottom:7px;
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
    /* 지은 */
    /*마이페이지 메인 > 최근주문정보 전체 영역*/
    .nearestOrder {
        margin-top: 50px;
    }
    /*최근주문정보 배송상태 영역*/
    .orderStatus {
        width:700px; 
        height: 130px;
        background-color: rgb(155, 213, 189);
        color: rgba(19, 19, 19, 0.753);
        margin-bottom: 20px;
        text-align: center;
        border: 1px solid #ebebeb;
    }
    #plus {
        float: right;
    }
    #plus :hover {
        cursor: pointer;
    }
    /*최근주문정보 리스트 영역*/
    .orderList th {
        border-bottom: 1px solid rgba(182, 178, 178, 0.719);
        font-size: 12px;
        background-color: rgba(240, 239, 233, 0.445);
        padding: 10px 3px;
    }
    .orderList td {
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        font-size: 13px;
        padding: 15px 5px 15px 5px;
    }
    .orderList {
        width: 700px;
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 2px solid rgba(133, 136, 139, 0.548);
        text-align: center;
        border-spacing: 0px;
    }

    /* 은지 */
    .outer{
        width: 1000px;
        height: 550px;
        margin: auto;
        margin-top: 200px;
    }
   
    .mypageSidebar{
        width: 200px;
        height: 600px;
        margin-right: 30px;
    }
    .mypageSidebar .title{
        margin: 5px;
        display: block;
    }
    .mypageSidebar .menu{
        border: 3px solid lightgray;
        border-top: 3px solid black;
        padding: 10px;
    }
    .mypageSidebar .menu th{
        color: black;
        text-align: left;
        padding-bottom: 8px;
        font-size: 15px;
        border-bottom: 1px solid grey;
    }
    .mypageSidebar .menu td{
        padding-bottom: 8px;
    }
    #sidebarmenu{
        padding-bottom: 45px;
    }
    .nearestOrder, .mypageSidebar {
        display: inline-block;
    }
    a {
        text-decoration: none;
        color:black;
    }
    .userImg{
            vertical-align: middle;
            width: 50px;
            height: 50px;
            border-radius: 50%;
    }
    #point{
        border-right: 2px solid lightgray;
        border-left: 2px solid lightgray;
        text-align: center;
    }
    #usertable{
        border: 1px solid gray;
        margin-left: 230px;
        border-top: 2px solid black ;
    }
    a { text-decoration:none}
    #like{text-align: center;}
    #userImage #userName{
        display: inline-block;
    }
    #userImage{
        width: 50px;
        height: 50px;
        float: left;
        margin-left: 100px;
    }
    #userName{
        width: 100px;
        margin-top: 10px;
        float: left;
    }
    /* 윤지 */
    /* footer */
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
<body style="height:100%">

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <div class="wrap" id="wrap" align="center">
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
                    <a href="<%= contextPath %>/views/member/loginForm.jsp">로그인</a>
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
                        <a href="#wrap"><i class="fas fa-chevron-up"></i></a>
                    </div>
                    <div>
                        <a href="#footer"><i class="fas fa-chevron-down"></i></a>
                    </div>
                </div>
            </div>     
        </div>
        
        
        <script>      
            $("#whole, #wholeMenu").mouseover(function(e){
                e.preventDefault();
                $("#wholeMenu").slideDown("slow");
                $('.wrap').css('margin-bottom','300px');
            });
            $("#wholeMenu").mouseleave(function(e){
                e.preventDefault();
                $("#wholeMenu").slideUp();
                $('.wrap').css('margin-bottom','0');
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

        <!-- 사용자 적립금/찜하기 테이블 시작-->
        <table id="usertable"  width="700" height="100">
            <tr>
                <td rowspan="2" colspan="2" align="right" width="200">
                   <div id="userImage"><img src="https://www.w3schools.com/howto/img_avatar.png" alt="userImg" class="userImg"></div>
                    <div id="userName"><h5><a href="">홍길동</a>님</h5></div>
                </td>
                <td colspan="2" rowspan="2" width="80px" >
                    <div id="point">적립금<br><br>
                        <a href="">0</a>원
                    </div>
                </td>
                
                <td colspan="2"  rowspan="2" width="80px">
                    <div id="like">찜하기<br><br>
                        <a href="">0</a>원
                    </div>
                </td>
            </tr>
         </table>
        <!-- 사용자 적립금/찜하기 테이블 끝-->
         
        <!-- 마이페이지 사이드바 시작-->
        <div class="mypageSidebar">
            <div class="title"><h3>마이페이지</h3></div>
            <div class="menu">
            <table>
                <tr>
                    <th>회원정보</th>
                </tr>
                <tr>
                    <td><a href="">회원정보변경</a></td>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="">회원탈퇴</a></td>
                </tr> 
                <tr>
                    <th>혜택관리</th>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="">적립금</a></td>
                </tr>
                <tr>
                    <th>쇼핑정보</th>
                </tr>
                <tr>
                    <td><a href="">주문목록/배송조회</a></td>
                </tr>
                <tr>
                    <td><a href="">취소/환불내역</a></td>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="">찜리스트</a></td>
                </tr>
                <tr>
                    <th>나의 게시글관리</th>
                </tr>
                <tr>
                    <td><a href="">1:1문의</a></td>
                </tr>
                <tr>
                    <td><a href="">상품문의</a></td>
                </tr>
                <tr>
                    <td><a href="">내가 작성한 리뷰</a></td>
                </tr>
            </table>
            </div>
        </div>
        <!-- 마이페이지 사이드바 끝-->

        <div class="nearestOrder">
            <div style="margin-bottom: 8px; width: 700px;">
                <span style="font-size: 12pt;"><b>최근 주문 정보</b></span>
                <span style="font-size: 8pt; color: gray;"> 최근 30일 내에 주문하신 내역입니다.</span>
                <!--더보기 클릭시 주문목록/배송조회페이지 이동-->
                <span id="plus"><a href="<%= contextPath %>/orderList.my"><i class="fas fa-plus-square">&nbsp;더보기</i></a></span>
            </div>

            
            <table class="orderStatus" align="center">
                <tr >
                    <th rowspan="2">0</th>
                    <th rowspan="2"></th>
                    <th rowspan="2">0</th>
                    <th rowspan="2"></th>
                    <th rowspan="2">0</th>
                    <th rowspan="2"></th>
                    <th rowspan="2">1</th>
                    <th rowspan="2"></th>
                    <th rowspan="2">0</th>
                </tr>
                <tr>
                </tr>
                <tr>
                    <th>결제대기</th>
                    <th>></th>
                    <th>결제완료</th>
                    <th>></th>
                    <th>배송준비</th>
                    <th>></th>
                    <th width="110">배송중</th>
                    <th>></th>
                    <th>배송완료</th>
                </tr>
            </table>
            <table class="orderList" align="center">
                <thead>
                <tr>
                    <th style="width:110px;">주문일자/주문번호</th>
                    <th>상품명</th>
                    <th style="width:110px;">상품금액/수량</th>
                    <th style="width:80px;">주문상태</th>
                </tr>
                </thead>

                <!--case1. 최근 주문내역이 없을 때-->
                <tbody>
                    <tr>
                        <td colspan="4" height="200">최근 주문 정보가 없습니다.</td>
                    </tr>
                </tbody>
                <!--case2. 최근 주문내역이 있을 때 (if(sysdate-30일))-->
                <tbody>
                    <tr>
                        <td>2021-11-15<br>[20211115131234]</td>
                        <td><a href="상품상세페이지"><img src="">닭가슴살 샐러드</a></td>
                        <td>7,900원/1개</td>
                        <td><a href="주문목록/배송조회 이동">배송중</a></td>
                    </tr>
                    <tr>
                        <td>2021-11-15<br>[20211115131234]</td>
                        <td><a href="상품상세페이지"><img src="">닭가슴살 샐러드</a></td>
                        <td>7,900원/1개</td>
                        <td><a href="주문목록/배송조회 이동">배송중</a></td>
                    </tr>
                    <tr>
                        <td>2021-11-15<br>[20211115131234]</td>
                        <td><a href="상품상세페이지"><img src="">닭가슴살 샐러드</a></td>
                        <td>7,900원/1개</td>
                        <td><a href="주문목록/배송조회 이동">배송중</a></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- footer 시작-->
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
        <!-- footer 끝-->
    </div>     

    
 
       
</body>
</html>