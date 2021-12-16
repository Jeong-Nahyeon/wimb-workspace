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
	#level2, #level3{text-decoration: none; color: black; font-size: small; font-weight: 900; margin: 20px;}
	#level1{text-decoration: none; color:rgb(155, 213, 189); font-size: small; font-weight: 900; margin: 20px}
	#termsFormBox{
		width: 800px;
		height: 900px;
		text-align: center;
		border: 1px solid lightgrey;
		margin-top: 100px;
		margin: auto;
	}
	#termsFormBox div{margin: auto; margin-left: 20px; margin-top: 30px;}
	#titlearea{margin-left: 50px;}
	#memberTermsBox{margin: auto;}
	#memberTermsBox p{text-align: left;}
	.memberTermsContent{
		overflow-x: hidden;
		width: 700px;
		height: 200px;
	}
	.memberTermsContent>p{font-size: small;}
	.memberTermsTitle{
		text-align: left;
		font-size:medium;
		font-weight: 900;
		margin-left: 120px;
		margin-bottom: 10px;
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
	<div id="termsFormBox" align="center">
		<form action="<%=contextPath %>/enrollForm.me" align="center" id="termsForm" method="post">
			<div id="titlearea">
				<p style="font-size: x-large; font-weight: 900; margin-top:20px; margin-left:30px;" align="left">
					이용약관안내
				</p>
			</div>
			<div id="memberTermsBox">
				<div id="memberTerms1" class="memberTerms">
					<div class="memberTermsTitle">
						[필수] 이용약관 동의
					</div>
					<div class="memberTermsContent">
						<P>
							1. 개인정보 수집목적 및 이용목적 <br>
												
							가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 <br>

							콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스, 구매 및 배송 등 서비스 이용 안내 <br>

							나. 회원 관리<br>

							회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달<br>

							2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 주소, 14세미만 가입자의 경우 법정대리인의 정보<br>

							3. 개인정보의 보유기간 및 이용기간<br>

							원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br>

							가. 회사 내부 방침에 의한 정보 보유 사유<br>

							o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 5년<br>

							나. 관련 법령에 의한 정보보유 사유<br>

							o 계약 또는 청약철회 등에 관한 기록<br>

							-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>

							-보존기간 : 5년<br>
						
							o 대금 결제 및 재화 등의 공급에 관한 기록<br>

							-보존이유: 전자상거래등에서의소비자보호에관한법률<br>

							-보존기간 : 5년<br>

							o 소비자 불만 또는 분쟁처리에 관한 기록<br>

							-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>

							-보존기간 : 3년<br>

							o 로그 기록<br>

							-보존이유: 통신비밀보호법<br>

							-보존기간 : 3개월<br><br>



							※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.<br>
						</p>
					</div>
					<div>
						<input type="checkbox" id="agreeTerms" name="agreeTerms">
						<label for="agreeTerms">동의합니다</label>
					</div>
				</div>
				<div id="memberTerms2" class="memberTerms">
					<div class="memberTermsTitle">
						[필수] 개인정보 수집 및 이용 동의
					</div>
					<div class="memberTermsContent">
						<p>
							1. 개인정보 수집목적 및 이용목적 <br>

							가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>

							콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스, 구매 및 배송 등 서비스 이용 안내<br>

							나. 회원 관리<br>

							회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달<br>

							2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보<br>

							3. 개인정보의 보유기간 및 이용기간<br>

							원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br>

							가. 회사 내부 방침에 의한 정보 보유 사유<br>

							o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 5년<br>

							나. 관련 법령에 의한 정보보유 사유<br>

							o 계약 또는 청약철회 등에 관한 기록<br>

							-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>

							-보존기간 : 5년<br>

							o 대금 결제 및 재화 등의 공급에 관한 기록<br>

							-보존이유: 전자상거래등에서의소비자보호에관한법률<br>

							-보존기간 : 5년<br>

							o 소비자 불만 또는 분쟁처리에 관한 기록<br>

							-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>

							-보존기간 : 3년<br>
							
							o 로그 기록<br>

							-보존이유: 통신비밀보호법<br>

							-보존기간 : 3개월<br><br>



							※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.<br>

						</p>
					</div>
					<div>
						<input type="checkbox" id="agreePersonal" name="agreePersonal">
						<label for="agreePersonal">동의합니다</label>
					</div>
				</div>
			
				<div align="center">
					<input type="button" value="가입 하기" id="nextBtn">
				</div>
			</div>
			
		</form>
	</div>
	
	<script>
		
		$(document).ready(function(e){
			$("#nextBtn").click(function(){
				if($("#agreeTerms").is(":checked") && $("#personalAgree").is(":checked") ){
					$("#termsForm").submit();
				}else{
					if(!($("#agreeTerms").is(":checked"))){
						alert("이용약관에 동의해주십시오");
						return;
					}
					if(!($("#agreePersonal").is(":checked"))){
						alert("개인정보 수집 및 이용에 동의해주십시오");
						return;
					}
					
					$("#termsForm").submit();
				}
			});

			

			
		});

	
		
		
	
	</script>

	<br clear="both">
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
</body>
</html>