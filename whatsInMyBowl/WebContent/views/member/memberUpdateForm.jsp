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
<!--다음 주소API-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<style>
    .main{
        width:600px;
        margin:auto;
    }
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
        color: rgb(248, 126, 126)
    }
    .main i {font-size:x-small; color:rgb(248, 126, 126);}
    #info-area th{
        text-align: left;
        font-size: small;
        width:130px
    }
    #info-area td, #info-area label{font-size: small; text-align: left;}
    #info-area input{width:250px; font-size: small;}
    #info-area{
        width: 550px;
        height: 400px;
    }
    #info-area input[type="checkbox"]{
		width: 70px;
		height: 15px;
		font-size: small;
		margin-left: -20px;
		margin-right: -20px;
	}
    #info-area div{font-size:x-small;}
    #info-area input[type="button"]{
		width: 100px;
		font-size: small;
		border: 1px solid rgb(155, 213, 189);
		background-color: white;
		border-radius: 1.05ex;
		color: rgb(155, 213, 189);
		font-weight: 900;
	}
    #info-area input[type="button"]:hover{background-color:rgb(155, 213, 189); color: white;}
</style>
</head>
<body style="height:100%">

	<%@ include file="../common/myPage.jsp" %>
    <% 
		String userId = loginUser.getmId();
		String userPwd = loginUser.getmPwd();
        String userName = loginUser.getmName();
        String phone = loginUser.getmPhone();
        String email = loginUser.getmEmail();
        String address = loginUser.getmAddress();
        String subAddress = loginUser.getSubAddress();
        String postcode = loginUser.getPostcode();
        String ad = loginUser.getmAd();
	%>
		
    <div class="main">
        <form action="<%=contextPath%>/updateForm.me" id="input-area" align="center" method="post" onsubmit="return update();">
            <div id="title-area" >
                <p>
                    <h4> 회원정보 변경</h4>
                </p>
                <div align="right">
                    <span>*표시는 반드시 입력해야하는 항목입니다.</span>
                </div>
            </div>
            <div id="main-area">
                <table id="info-area" class="table" align="center">
                    <tr>
                        <th>아이디<i class="fas fa-star-of-life"></i>
                            <input type="hidden" id="userId" name="userId" value="<%=userId%>">
                        </th>
                        <td align="left" colspan="2">
                            <span>
                                <%=userId%>
                            </span>
                            
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호<i class="fas fa-star-of-life"></i></th>
                        <td colspan="2"><input type="password" name="userPwd" id="userPwd" class="req" value="<%=userPwd %>"><br>
                            <div id="checkPwd">
    
                            </div></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인<i class="fas fa-star-of-life"></i></th>
                        <td colspan="2"><input type="password" name="userPwdChk" id="userPwdChk" value="<%=userPwd %>" class="req"><br>
                            <div id="checkPwdchk">
    
                            </div></td>
                    </tr>
                    <tr>
                        <th>이름<i class="fas fa-star-of-life"></i></th>
                        <td colspan="2"><input type="text" name="userName" id="userName" class="req" value="<%=userName%>"required><br>
                            <div id="checkName">
    
                            </div></td>
                    </tr>
                    <tr>
                        <th>전화번호<i class="fas fa-star-of-life"></i></th>
                        <td colspan="2"><input type="tel" name="userPhone" id="userPhone" class="req" value="<%=phone%>" required><br>
                            <div id="checkPhone">
    
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일<i class="fas fa-star-of-life"></i></th>
                        <td><input type="email" name="userEmail" id="userEmail" class="req" value="<%=email%>" ><br>
                            <div id="checkEmail">
    
                            </div></td>
                        <td>
                            <input type="button" style="width:100px;" value="중복확인" onclick="doubleEmailChk();">
                            <input type="hidden" id="emailDupleChk" name="emailDupleChk" value="emailY">
                        </td>
                    </tr>
                    <tr>
                        <th>주소<i class="fas fa-star-of-life"></i></th>
                        <td><input type="text" name="userAddress1" id="userAddress1" class="req" value="<%=address%>" autocomplete="off"></td>
                        <td><input type="button" style="width:100px;" value="주소찾기" onclick="Postcode();"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td><input type="text" name="userAddress2" id="userAddress2" class="req" value="<%=subAddress%>" required></td>
                        <td><input type="text" name="postcode" id="postcode" style="width:100px" value="<%=postcode%>"></td>
                    </tr>
                    <tr>
                        <th>마케팅수신동의<i class="fas fa-star-of-life"></i></th>
                        <td colspan="2">
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
                <button type="submit" id="confirmBtn">확인</button>
            </div>
        </form>
    </div>
  

   <script>
      
        // 비밀번호 정규식
        let pwdExp = (/^(?=.*[a-z])(?=.*[0-9]).{6,16}$/);
        // 이름 정규식
        let nameExp = /^[가-힣]{2,6}$/;
        // 이메일 정규식
        let emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        //let emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        // 휴대폰 정규식
        let phoneExp = /^01[0179]([0-9]{7,8}$)/;

        $("#userPwd").blur(function(){
            if(pwdExp.test($(this).val())){
                console.log(pwdExp.test($(this).val()));
                $("#checkPwd").text('');
            }else{
                console.log(pwdExp.test($(this).val()));
                $('#checkPwd').text("비밀번호를 확인해주세요");
                $('#checkPwd').css('color', 'red');
            }
        });
        $("#userPwdChk").blur(function(){
            if($("#userPwd").val() == $("#userPwdChk").val()){
                console.log($("#userPwd").val() == $("#userPwdChk").val());
                $("#checkPwdchk").text('');
            }else{
                console.log($("#userPwd").val() == $("#userPwdChk").val());
                $('#checkPwdchk').text("비밀번호가 일치하지 않습니다.");
                $('#checkPwdchk').css('color', 'red');
            }
        });
        $("#userName").blur(function(){
            if(nameExp.test($(this).val())){
                console.log(nameExp.test($(this).val()));
            
            }else{
                console.log(nameExp.test($(this).val()));
                $('#checkName').text("이름을 확인해주세요");
                $('#checkName').css('color', 'red');
            }
        });
        $("#userPhone").blur(function(){
            if(phoneExp.test($(this).val())){
                console.log(phoneExp.test($(this).val()));
                $("#checkPhone").text('');
            }else{
                console.log(phoneExp.test($(this).val()));
                $('#checkPhone').text("전화번호를 확인해주세요");
                $('#checkPhone').css('color', 'red');
            }
        });
        $("#userEmail").blur(function(){
            if(emailExp.test($(this).val())){
                console.log(emailExp.test($(this).val()));
                $("#checkEmail").text('');
            }else{
                console.log(emailExp.test($(this).val()));
                $('#checkEmail').text("이메일 주소를 확인해주세요");
                $('#checkEmail').css('color', 'red');
            }
        });

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
        
        // email 변경여부 확인
        $("#userEmail").change(function(){
            $("#emailDupleChk").attr("value", "emailN");
        })

        // email 중복 체크
        function doubleEmailChk(){
            
            const $emailInput = $("#input-area input[name=userEmail]");

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

        // 체크박스 선택안함 선택시 기존 체크 해제 기능(반대도)
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

        // 마케팅수신동의 체크박스 기존값 갖고오기
        $(function(){
            const ad = '<%=ad%>';

            $("input[type=checkbox]").each(function(){
                if(ad.search($(this).val()) != -1){
                    $(this).attr("checked", true);
                }
            })
        })

        function back(){
           location.href="<%=contextPath%>/myPage.my"
        }
        function update(){

            const $emaildup = $("#emailDupleChk");

            if($emaildup.val() == 'emailY' && $(".agree").is(":checked")){
                $("#input-area").submit();

            }else{
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
   <footer>
    <%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>