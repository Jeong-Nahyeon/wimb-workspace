<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
-->   
<style>
	*{box-sizing: border-box;}
	#enrollStatus{
		text-align: center;
		margin-top: 50px;
	}
	#level1, #level3{text-decoration: none; color: black; font-size: small; font-weight: 900; margin: 20px;}
	#level2{text-decoration: none; color:rgb(155, 213, 189); font-size: small; font-weight: 900; margin: 20px}
	#titlearea{margin-left: 50px;}
	#enrollFormBox th{
		text-align: right;
		width: 100px;
		font-size: small;
	}
	#enrollFormTable i, #titlearea i{
		font-size: xx-small;
		color: rgb(248, 126, 126);
		vertical-align: top;
	}
	#enrollFormTable button{
		width: 100px;
		font-size: small;
		border: 1px solid rgb(155, 213, 189);
		background-color: white;
		border-radius: 1.05ex;
		color: rgb(155, 213, 189);
		font-weight: 900;
	}
	#enrollFormTable button:hover{background-color:rgb(155, 213, 189); color: white;}
	#enrollFormBox{
		width: 800px;
		height: 800px;
		text-align: center;
		margin: auto;
		border: 1px solid lightgrey;
	}
	#enrollFormTable{
		width: 500px;
		height: 600px
	}
	#enrollFormTable td{font-size: small;}
	#enrollFormTable input{width:100%; height: 30px;}
	#enrollFormTable input[type="radio"]{
		width: 70px;
		height: 15px;
		margin-left: -15px;
		margin-right: -15px;
		font-size: small;
	}
	#enrollFormTable div{text-align: left; font-size: x-small;}
	#submitBox{width:500px; margin:auto;}
	#submitBtn{
		width:60%;
		height: 45px;
		border: 1px solid rgb(155, 213, 189);;
		background-color: rgb(155, 213, 189);
		border-radius: 1.05ex;
		color: white;
		font-weight: 900;
	}
	#submitBtn:hover{background-color: white; color:rgb(155, 213, 189);}
</style>
</head>
<body>
	<div id="enrollStatus">
		<p style="font-weight: 900; font-size: x-large;">
			회원가입
		</p>
		<p>
			<a href="memberEnrollTerms.jsp" id="level1">01|이용약관</a> >><a id="level2">02|정보입력 및 이메일 인증</a>>><a id="level3">03|가입완료</a>
		</p>
	</div>
	<div id="enrollFormBox" align="center">
		
		<div id="titlearea">
			<p style="font-size: x-large; font-weight: 900; margin-top:20px;" align="left">
				정보입력
			</p>
			<p style="font-size: small;" align="left">
				<i class="fas fa-star-of-life"></i> 필수입력사항
			</p>
		</div>
		<form action="" align="center">
			<table id="enrollFormTable" align="center">
				<tr>
					<th>아이디<i class="fas fa-star-of-life"></i></th>
					<td>
						<input type="text" name="userId" id="userId" placeholder="영문자와 숫자, 5~15글자내로 입력"><br>
						<div id="checkId">

						</div>
					</td>
					<td><button style="width:100px;">중복확인</button></td>
				</tr>
				<tr>
					<th>비밀번호<i class="fas fa-star-of-life"></i></th>
					<td><input type="password" name="userPwd" id="userPwd" placeholder="영문자와 숫자, 5~15글자내로 입력"><br>
						<div id="checkPwd">

						</div></td>
				</tr>
				<tr>
					<th>비밀번호 확인<i class="fas fa-star-of-life"></i></th>
					<td><input type="password" name="checkPwd" id="checkPwd"><br>
						<div id="checkPwdchk">

						</div></td>
				</tr>
				<tr>
					<th>이름<i class="fas fa-star-of-life"></i></th>
					<td><input type="text" name="userName" id="userName"><br>
						<div id="checkName">

						</div></td>
				</tr>
				<tr>
					<th>전화번호<i class="fas fa-star-of-life"></i></th>
					<td><input type="tel" name="userPhone" id="userPhone" placeholder="숫자만 입력"><br>
						<div id="checkPhone">

						</div>
					</td>
				</tr>
				<tr>
					<th>이메일<i class="fas fa-star-of-life"></i></th>
					<td><input type="email" name="userEmail" id="userEmail"><br>
						<div id="checkEmail">

						</div></td>
					<td><button style="width:100px;">중복확인</button></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="userEmailCheck" id="userEmailCheck"></td>
					<td><button style="width:100px;">인증번호</button></td>
				</tr>
				<tr>
					<th>주소<i class="fas fa-star-of-life"></i></th>
					<td><input type="text" name="userAddress1" id="userAddress1"></td>
					<td><button style="width:100px;">주소찾기</button></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="userAddress2" id="userAddress2"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="gender" id="genderX" > 
						<label for="genderX" style="font-size: small;">여자</label>
						<input type="radio" name="gender" id="genderY" > 
						<label for="genderY" style="font-size: small;">남자</label>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="birth" id="birth" placeholder="YYYYMMDD 8글자"><br>
						<div id="checkBirth">

						</div>
					</td>
				</tr>
				<tr>
					<th>추천인</th>
					<td><input type="text" name="introducer" id="introducer"></td>
				</tr>
			</table>
			<div id="submitBox" align="center">
				<input type="submit" value="가입 하기" id="submitBtn">
			</div>
		</form>
		<script>
			// 아이디 정규식
			let idExp = /^[a-z][a-z0-9]{5,15}$/;
			// 비밀번호 정규식
			let pwdExp = /^[A-Za-z0-9]{5,15}$/;
			// 이름 정규식
			let nameExp = /^[가-힣]{2,6}$/;
			// 이메일 정규식
			let emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			// 휴대폰 정규식
			let phoneExp = /^(010)([0-9]{4})([0-9]{4})$/;

			$("#userId").blur(function(){
				if(idExp.test($(this).val())){
					console.log(idExp.test($(this).val()));
					$("#checkId").text('');
				}else{
					console.log(idExp.test($(this).val()));
					$('#checkId').text("아이디를 확인해주세요");
					$('#checkId').css('color', 'red');
				}
			})
			$("#userPwd").blur(function(){
				if(pwdExp.test($(this).val())){
					console.log(pwdExp.test($(this).val()));
					$("#checkPwd").text('');
				}else{
					console.log(pwdExp.test($(this).val()));
					$('#checkPwd').text("비밀번호를 확인해주세요");
					$('#checkPwd').css('color', 'red');
				}
			})
			$("#userName").blur(function(){
				if(nameExp.test($(this).val())){
					console.log(nameExp.test($(this).val()));
					$("#checkName").text('');
				}else{
					console.log(nameExp.test($(this).val()));
					$('#checkName').text("이름을 확인해주세요");
					$('#checkName').css('color', 'red');
				}
			})
			$("#userPhone").blur(function(){
				if(phoneExp.test($(this).val())){
					console.log(phoneExp.test($(this).val()));
					$("#checkPhone").text('');
				}else{
					console.log(phoneExp.test($(this).val()));
					$('#checkPhone').text("전화번호를 확인해주세요");
					$('#checkPhone').css('color', 'red');
				}
			})
			$("#userEmail").blur(function(){
				if(emailExp.test($(this).val())){
					console.log(emailExp.test($(this).val()));
					$("#checkEmail").text('');
				}else{
					console.log(emailExp.test($(this).val()));
					$('#checkEmail').text("이메일 주소를 확인해주세요");
					$('#checkEmail').css('color', 'red');
				}
			})
		

		</script>
	</div>

	<br clear="both">
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
</body>
</html>