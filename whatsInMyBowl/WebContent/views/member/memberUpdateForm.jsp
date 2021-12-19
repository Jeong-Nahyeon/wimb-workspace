<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

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
    
    /* 은지 */
    .outer{
        width: 1000px;
        height: 600px;
        margin: auto;
        margin-top: 90px;
    }
    .outer>div{float:left;}
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
    a {
        text-decoration: none;
        color:black;
    }
    a:link { 
    	text-decoration:none;
    	color:black;
    }
    .main{
        width:600px;
        height: 600px;
        margin-left: 50px;
    }
    /*마이페이지 사이드바 끝*/
    #title-area{border-bottom: 1px solid black; text-align: left;}
    #main-area{
        margin-top:10px;
        text-align: center;    
    }
    #button-area{margin: 50px;}
    #cancelBtn, #confirmBtn{
        width: 80px;
        height: 30px;
        border: 1px solid lightgrey;
        background-color: white;
        border-radius: 1.05ex;
        margin-left:30px;
        margin-right:30px
    }
    #cancelBtn:hover, #confirmBtn:hover{
        border: 1px solid rgb(155, 213, 189);
        background-color: rgb(155, 213, 189);
        color:white;
    }
    #title-area span{
        font-size: x-small;
        color: rgb(214, 34, 34);
        width:200px;
        
    }
    i {font-size:x-small; color:rgb(214, 34, 34);}
    #info-area th{
        text-align: left;
        font-size: small;
    }
    #info-area td, #info-area label{font-size: small;}
    #info-area input{width:100%;}
    #info-area{
        width: 500px;
        height: 400px;
    }
    #info-area input[type="checkbox"]{
		width: 70px;
		height: 15px;
		font-size: small;
		margin-left: -20px;
		margin-right: -20px;
	}
</style>
</head>
<body style="height:100%">

	<%@ include file="../common/menubar.jsp" %>
    <% 
		String userId = loginUser.getmId();
		String userPwd = loginUser.getmPwd();
	%>
		
    <div class="outer">
 
         
        <!-- 마이페이지 사이드바 시작-->
        <div class="mypageSidebar">
            <div class="title"><h3>마이페이지</h3></div>
            <div class="menu">
            <table>
                <tr>
                    <th>회원정보</th>
                </tr>
                <tr>
                    <td><a href="<%=contextPath%>/memberUpdate.me">회원정보변경</a></td>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="<%=contextPath%>/memberDelete.me">회원탈퇴</a></td>
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
                    <td><a href="<%=contextPath%>/orderList.my">주문목록/배송조회</a></td>
                </tr>
                <tr>
                    <td><a href="<%=contextPath%>/cancelList.my">취소/환불내역</a></td>
                </tr>
                <tr>
                    <td id="sidebarmenu"><a href="">찜리스트</a></td>
                </tr>
                <tr>
                    <th>나의 게시글관리</th>
                </tr>
                <tr>
                    <td><a href="<%=contextPath%>/inquiryList.my">1:1문의</a></td>
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

        <div class="main">
            <form id="inputPwd-area" align="center" method="post">
                <div id="title-area" >
                    <p>
                        <h4> 회원정보 변경</h4>
                    </p>
                    <div align="right">
                        <span>*표시는 반드시 입력해야하는 항목입니다.</span>
                    </div>
                </div>
                <div id="main-area">
                    <table id="info-area" class="table-hover" align="center">
                        <tr>
                            <th>아이디<i class="fas fa-star-of-life"></i></th>
                            <td align="left">
                                <span>
                                    <%=userId%>
                                </span>
                                
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호<i class="fas fa-star-of-life"></i></th>
                            <td><input type="password" name="userPwd" id="userPwd" class="req" placeholder="영문자와 숫자, 6~16글자내로 입력" required><br>
                                <div id="checkPwd">
        
                                </div></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인<i class="fas fa-star-of-life"></i></th>
                            <td><input type="password" name="userPwdChk" id="userPwdChk" class="req" required><br>
                                <div id="checkPwdchk">
        
                                </div></td>
                        </tr>
                        <tr>
                            <th>이름<i class="fas fa-star-of-life"></i></th>
                            <td><input type="text" name="userName" id="userName" class="req" required><br>
                                <div id="checkName">
        
                                </div></td>
                        </tr>
                        <tr>
                            <th>전화번호<i class="fas fa-star-of-life"></i></th>
                            <td><input type="tel" name="userPhone" id="userPhone" class="req" placeholder="숫자만 입력" required><br>
                                <div id="checkPhone">
        
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일<i class="fas fa-star-of-life"></i></th>
                            <td><input type="email" name="userEmail" id="userEmail" class="req" required><br>
                                <div id="checkEmail">
        
                                </div></td>
                            <td>
                                <input type="button" style="width:100px;" value="중복확인" onclick="doubleEmailChk();">
                                <input type="hidden" id="emailDupleChk" name="emailDupleChk" value="emailN">
                            </td>
                        </tr>
                        <tr>
                            <th>주소<i class="fas fa-star-of-life"></i></th>
                            <td><input type="text" name="userAddress1" id="userAddress1" class="req" autocomplete="off"></td>
                            <td><input type="button" style="width:100px;" value="주소찾기" onclick="Postcode();"></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="text" name="userAddress2" id="userAddress2" class="req" placeholder="상세주소입력" required></td>
                            <td><input type="text" name="postcode" id="postcode" style="width:100px" placeholder="우편번호"></td>
                        </tr>
                        <tr>
                            <th>마케팅수신동의<i class="fas fa-star-of-life"></i></th>
                            <td>
                                <input type="checkbox" id="agreeSms" class="agree" name="ad" value="M">
                                <label for="agreeSms">SMS</label>
                                <input type="checkbox" id="agreeEmail" class="agree" name="ad" value="E">
                                <label for="agreeEmail">EMAIL</label>
                                <input type="checkbox" id="disagree" class="agree" name="ad" value="N">
                                <label for="disagree">선택안함</label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="button-area">
                    <button type="button" id="cancelBtn" onclick="back();">취소</button>
                    <button type="submit" id="confirmBtn" onclick="update();">확인</button>
                </div>
            </form>
        </div>
   </div> 

   <script>
       function back(){
           location.href="<%=contextPath%>/myPage.my"
       }
       function update(){
    	   location.href="<%=contextPath%>/update.me"
       }
   </script>
   <footer>
    <%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>