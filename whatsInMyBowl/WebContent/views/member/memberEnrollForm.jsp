<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp"%>
<%
	String[] adCheckArr = (String[])request.getAttribute("adCheckArr");
	//String adCheck = String.join(",", adCheckArr);
%>

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
<!--다음 주소API-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  



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
		width: 110px;
		font-size: small;
	}
	#enrollFormTable i, #titlearea i{
		font-size: xx-small;
		color: rgb(248, 126, 126);
		vertical-align: top;
	}
	#enrollFormTable input[type="button"]{
		width: 100px;
		font-size: small;
		border: 1px solid rgb(155, 213, 189);
		background-color: white;
		border-radius: 1.05ex;
		color: rgb(155, 213, 189);
		font-weight: 900;
	}
	#enrollFormTable input[type="button"]:hover{background-color:rgb(155, 213, 189); color: white;}
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
		border: 1px solid rgb(155, 213, 189);
		background-color: rgb(155, 213, 189);
		border-radius: 1.05ex;
		color: white;
		font-weight: 900;
	}
	#submitBtn:hover{background-color: white; color:rgb(155, 213, 189);}
	#enrollFormTable input[type="checkbox"]{
		width: 70px;
		height: 15px;
		font-size: small;
		margin-left: -20px;
		margin-right: -20px;
	}
</style>
</head>
<body>
	<div id="enrollStatus">
		<p style="font-weight: 900; font-size: x-large;">
			회원가입
		</p>
		<p>
			<a href="<%=contextPath%>/enrollTerms.me" id="level1">01|이용약관</a> >><a id="level2">02|정보입력 및 이메일 인증</a>>><a id="level3">03|가입완료</a>
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
		<form action="<%=contextPath %>/enroll.me" align="center" id="enrollForm" onsubmit="return enroll()" >
		
			<table id="enrollFormTable" align="center">
				<tr>
					<th>아이디<i class="fas fa-star-of-life"></i></th>
					<td>
						<input type="text" name="userId" id="userId"  class="req" placeholder="영문자와 숫자, 8~16글자내로 입력" required><br>
						<div id="checkId">

						</div>
					</td>
					<td>
						<input type="button" style="width:100px;" value="중복확인" onclick="doubleIdChk();">
						<input type="hidden" id="idDupleChk" name="idDupleChk" value="idN">
					</td>
				</tr>
				<tr>
					<th>비밀번호<i class="fas fa-star-of-life"></i></th>
					<td><input type="password" name="userPwd" id="userPwd" class="req" placeholder="영문자와 숫자, 8~16글자내로 입력" required><br>
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
					<th></th>
					<td><input type="text" name="userEmailCheck" class="req" id="userEmailCheck" required></td>
					<td><input type="button" style="width:100px" value="인증번호"></td>
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
					<th>성별<i class="fas fa-star-of-life"></i></th>
					<td><input type="radio" name="gender" value="F" id="genderX" checked> 
						<label for="genderX" style="font-size: small;">여자</label>
						<input type="radio" name="gender" value="M" id="genderY" > 
						<label for="genderY" style="font-size: small;">남자</label>
					</td>
				</tr>
				<tr>
					<th>생년월일<i class="fas fa-star-of-life"></i></th>
					<td>
						<input type="text" name="userBirth" id="userBirth" class="req" placeholder="YYYYMMDD 8글자" required><br>
						<div id="checkBirth">

						</div>
					</td>
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
			let idExp = /^[A-Za-z0-9_|-]{8,16}$/;
			// 비밀번호 정규식
			let pwdExp = (/^(?=.*[a-z])(?=.*[0-9]).{8,16}$/);
			// 이름 정규식
			let nameExp = /^[가-힣]{2,6}$/;
			// 이메일 정규식
			let emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			//let emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			// 휴대폰 정규식
			let phoneExp = /^01[0179]([0-9]{7,8}$)/;
			// 생년월일 정규식
			let birthExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

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
			$("#userPwdChk").blur(function(){
				if($("#userPwd").val() == $("#userPwdChk").val()){
					console.log($("#userPwd").val() == $("#userPwdChk").val());
					$("#checkPwdchk").text('');
				}else{
					console.log($("#userPwd").val() == $("#userPwdChk").val());
					$('#checkPwdchk').text("비밀번호가 일치하지 않습니다.");
					$('#checkPwdchk').css('color', 'red');
				}
			})
			$("#userName").blur(function(){
				if(nameExp.test($(this).val())){
					console.log(nameExp.test($(this).val()));
				
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
			$("#userBirth").blur(function(){
				if(birthExp.test($(this).val())){
					console.log(birthExp.test($(this).val()));
					$("#checkBirth").text('');
				}else{
					console.log(birthExp.test($(this).val()));
					$('#checkBirth').text("생년월일을 확인해주세요");
					$('#checkBirth').css('color', 'red');
				}
			})
		
		
			// 아이디 중복 체크
			function doubleIdChk(){
				
				const $idInput = $("#enrollForm input[name=userId]");

				$.ajax({
					url:"idCheck.me",
					data:{checkId:$idInput.val()},
					type:"post",
					success:function(result){

						if(idExp.test($idInput.val()) == false){
							alert("아이디를 입력해주세요.");
							$idInput.focus();
						}else{
							if(result == 'NNNNN'){
								
								alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
								$idInput.focus();
							}else{
								if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
									//$("#submitBtn").removeAttr("disabled");
									$idInput.attr("readonly", true);
									$("#idDupleChk").attr("value", "idY");
								}else{
									$idInput.focus();
								}
								
							}
						}

					},error:function(){
						console.log("ajax 통신 실패");
					}

				})
			}

			
			// email 중복 체크
			function doubleEmailChk(){
				
				const $emailInput = $("#enrollForm input[name=userEmail]");

				$.ajax({
					url:"emailCheck.me",
					data:{checkEmail:$emailInput.val()},
					type:"post",
					success:function(result){

						if(emailExp.test($emailInput.val()) == false){
							alert("이메일을 입력해주세요.");
							$emailInput.focus();
							
						}else{
							if(result == 'NNNNN'){
								
								alert("이미 존재하거나 탈퇴한 회원의 이메일입니다.");
								$emailInput.focus();
							}else{
								if(confirm("사용가능한 이메일입니다. 사용하시겠습니까?")){
									//$("#submitBtn").removeAttr("disabled");
									$emailInput.attr("readonly", true);
									$("#emailDupleChk").attr("value", "emailY");
								}else{
									$emailInput.focus();
								}
							}
						}

					},error:function(){
						console.log("ajax 통신 실패");
					}

				})
			}
			
			// 주소 API
		    function Postcode() {
		        new daum.Postcode({
					popupKey: 'popup1',
					submitMode: false,
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    //document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } 

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("userAddress1").value = addr + extraAddr;
						
						
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("userAddress2").focus();
		            }
		        }).open();
		    }

			

			$("#disagree").click(function(){
				if($("#disagree").prop("checked")){
					$("#agreeEmail").prop("checked", false);
					$("#agreeSms").prop("checked", false);
				}
			});

			$("#agreeEmail").click(function(){
				if($("#agreeEmail").prop("checked")){
					$("#disagree").prop("checked", false);
				}
			});

			$("#agreeSms").click(function(){
				if($("#agreeSms").prop("checked")){
					$("#disagree").prop("checked", false);
				}
			});


			function enroll(){

				const $iddup = $("#idDupleChk");
				const $emaildup = $("#emailDupleChk");

				if($iddup.val() == 'idY' && $emaildup.val() == 'emailY' && $(".agree").is(":checked")){
					$("#enrollForm").submit();

				}else{
					if($iddup.val() == 'idN'){
						alert("아이디 중복체크를 해주세요");
						$iddup.focus()
						return false;
					}
					if($emaildup.val() == 'emailN'){
						alert("이메일 중복체크를 해주세요");
						$emaildup.focus();
						return false;
					}
					if(!($(".agree").is(":checked"))){
						alert("마케팅 수신 동의에 체크해주세오");
						return false;
					}
				}
				return false;
			}


				

		</script>
	</div>

	<br clear="both">
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
</body>
</html>