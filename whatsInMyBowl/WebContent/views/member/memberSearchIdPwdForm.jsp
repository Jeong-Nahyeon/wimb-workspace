<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common/menubar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box;}
    .infoInputTable{      
        width: 400px;
        height: 250px;
    }
    .outer{border: 1px solid lightgrey; width: 500px; height:400px; margin: auto; margin-top: 50px;}
        
    .findtap>ul>li{
        list-style: none;
        float: left;      
        width: 40%; 
        margin-left:-5px;
    }
    #searchId, #searchPwd{
        text-decoration: none;
        color: black;
        font-weight: bold;
    } 
    #searchId:hover, #searchPwd:hover{
        color: rgb(155, 213, 189);
        cursor: pointer;
    }
     
    .optiontap *{
        border: none;
        background: white;
        font-size: small;
        float: left;
    }
    .optiontap>label{margin-top:-4px; margin-left:4px;}
    .methodOption{margin-left: 50px;}
    
    .methodOption:hover{
        background-color: rgb(155, 213, 189);
    }
    .infoInputTable input{
        width:100%;
        height:90%;
        border: 1px solid lightgrey;    
    }
    .loginbtn, .confirmbtn{
        width:100%; 
        height:90%; 
        border-radius: 1.05ex; 
        border: 1px solid rgb(155, 213, 189);
        color: rgb(155, 213, 189);
        background-color: white;
        font-weight: bold;
        }
    #loginbtn:hover, #confirmbtn:hover{
        background-color: rgb(155, 213, 189);
        color: white;
        }
  
    
</style>
</head>
<body>

	<div class="outer" align="center">
    
        <div class="findtap" id="findTap">
            <ul align="center">
                <li><a  id="searchId">아이디 찾기</a></li>
                <li style="width:15%">&#124;</li>
                <li><a  id="searchPwd">비밀번호 찾기</a></li>
            </ul>
        </div>
        
        <br clear="both">
        <br>
        <div id="searchIdWrap">
            
            <div class="optiontap" id="optionTap">
            
                <input type="radio" class="methodOption" id="radioEmail" value="email" name="radio" checked="checked">
                <label for="radioEmail">이메일</label>
                <input type="radio" class="methodOption" id="radioPhone" value="phone" name="radio">
                <label for="radioPhone">전화번호</label>
            </div>
            <br clear="both">
                 <!-- 이메일 선택시-->
                <form  method="post" class="infoForm" id="emailForm"  >
                <div  id="clickemail" class="checked">
                    <table class="infoInputTable"  align="center">
                        <tr>
                            <td colspan="2">
                                <input type="text"  name="userName" class="userName" placeholder="이름">
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <input type="text" name="userEmail" class="userEmail"  placeholder="가입메일주소">
                            </td>
                            
                        </tr>
                        <tr></tr> 
                        <tr>
                            <td colspan="2">
                                <button type="button" class="confirmbtn" onclick="return searchIdEmail();">확인</button>
                            </td>
                        </tr>                        
                        <tr>
                            <td colspan="2">
                                <button type="button" class="loginbtn" onclick="loginPage();">로그인</button>
                            </td>
                        </tr>           
                    </table>
                </div>
                </form>

                <!--전화번호 선택시-->
                <form  method="post" class="infoForm" id="phoneForm">
                <div id="clickphone" class="checked" style="display:none"> 
                    <table class="infoInputTable" align="center" id="clickPhone">
                        <tr>
                            <td colspan="2">
                                <input type="text"  name="userName" class="userName" required placeholder="이름">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" class="userPhoneInput" name="userPhone" id="userPhone" required placeholder="휴대폰 번호(-제외)">
                            
                            </td>
                        </tr>
                        <tr></tr> 
                        <tr>
                            <td colspan="2">
                                <button type="button" class="confirmbtn" onclick="return searchIdPhone();">확인</button>
                            </td>
                        </tr>     
                        <tr>
                            <td colspan="2">
                                <button type="button" class="loginbtn" onclick="loginPage();">로그인</button>
                            </td>
                        </tr>
                    </table>
                </div>

                </form>
        </div>
        <!-- 비밀번호 찾기 화면 -->
        <div id="searchPwdWrap" style="display:none" >
            <form action="" id="searchPwdForm" onsubmit="return searchPwd();">
                <div  id="clickemail" class="checked">
                    <table class="infoInputTable"  align="center">
                        <tr>
                            <td colspan="2">
                                <input type="text" class="userNameInput" name="userId" id="userId" required placeholder="아이디">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text"  name="userName" class="userName" required placeholder="이름">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="userEmail" class="userEmail" required placeholder="가입메일주소">
                            </td>
                            
                        </tr>
                        <tr height="30"></tr> 
                        <tr>
                            <td colspan="2">
                                <button type="button" class="confirmbtn" onclick="searchPwd();">확인</button>
                            </td>
                        </tr>                        
                        <tr>
                            <td colspan="2">
                                <button type="button" class="loginbtn" onclick="loginPage();">로그인</button>
                            </td>
                        </tr>           
                    </table>
                </div>
            </form>
        </div>
        
        <!-- 비밀번호 변경 화면 -->
        <div id="changePwdWrap" style="display:none;" >
            <form action="<%=contextPath %>/changePwd.me" method="post" id="changePwdForm" onsubmit="return changePwd()" >
            	<input type="hidden" id="userIdforPwd" name="userIdforPwd" >
                <div id="changePwd-area" >
                    <table class="infoInputTable"  align="center">
                        <tr>
                            <td height="25" style="font-size: 12px; font-weight: 900;">
                                새 비밀번호 등록
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="password" name="userPwd" id="userPwd" placeholder="영문자와 숫자, 6~16글자내로 입력" required><br>
                                <input type="hidden" name ="userPwdValue" id="userPwdValue" value="NN">
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <div id="checkPwd" style="font-size: 12px;">
            						
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" style="font-size: 12px; font-weight: 900;">
                                새 비밀번호 확인
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="password" name="userPwdChk" id="userPwdChk" required><br>
                                <input type="hidden" name="userPwdChkValue" id="userPwdChkValue" value="NN">
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <div id="checkPwdchk" style="font-size: 12px">
									
                                </div>
                            </td>
                        </tr>
                        <tr></tr> 
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="confirmbtn" value="확인">
                            </td>
                        </tr>    
                    </table>
                </div>
            </form>
        </div>
    </div>
   

    <script>

        $('#searchId').click(function(){
            $("#searchPwdWrap").attr("style", "display:none");
            $("#searchIdWrap").removeAttr("style", "display:none");
            $("#optionTap").removeAttr("style", "display:none");
        });

        $('#searchPwd').click(function(){
            $("#searchIdWrap").attr("style", "display:none");
            $("#optionTap").attr("style", "display:none");
            $("#searchPwdWrap").removeAttr("style", "display:none");
        });


        function loginPage(){
            
            location.href = "<%=contextPath%>/loginForm.me";
        }

    
        $('input[type=radio][name=radio]').on('click',function(){
            
            var chkValue = $('input[type=radio][name=radio]:checked').val();

            if(chkValue == 'email'){
                $('#clickemail').css('display', 'block');
                $('#clickphone').css('display', 'none');
            }else{
                $('#clickemail').css('display', 'none');
                $('#clickphone').css('display', 'block');
            }
                
        }); 
        
        function searchIdEmail(){
           
            const $userEmail = $("#emailForm input[name=userEmail]");
            const $userName = $("#emailForm input[name=userName]");

            if(($userEmail.val() != "") && ($userName.val() != "")){

                $.ajax({
                    url:"idSearch.me",
                    data:{
                        userEmail:$userEmail.val(),
                        userName:$userName.val()
                    },
                    type:"post",
                    success:function(userId){


                        console.log("ajax통신성공");
                            if(userId == 'NNNNN'){
                                alert("아이디를 찾을 수 없습니다. 다시 입력해주세요");   
                            }else{
                                
                                userId2 = userId.substr(0, userId.length-3)
                                       + '**';
                                alert("요청하신 아이디는 "  + userId2  + " 입니다.");
                            }
                       
                            
                    },error:function(){
                        console.log("ajax통신실패");
                        alert("아이디를 찾을 수 없습니다.");
                    }
                });

            } else{
                if($userName.val() == ""){
                    
                    alert("이름을 입력해주세요");
                    return;
                }

                if($userEmail.val() == ""){
                    
                    alert("이메일을 입력해주세요");
                    return;
                }
            }

        }

        function searchIdPhone(){
           
            const $userPhone = $("#phoneForm input[name=userPhone]");
            const $userName = $("#phoneForm input[name=userName]");

            if(($userPhone.val() != "") && ($userName.val() != "")){

                $.ajax({
                    url:"idSearch.me",
                    data:{
                        userPhone:$userPhone.val(),
                        userName:$userName.val()
                    },
                    type:"post",
                    success:function(userId){

                        console.log("ajax통신성공");
                            if(userId == 'NNNNN'){
                                alert("아이디를 찾을 수 없습니다. 다시 입력해주세요");   
                            }else{
                                userId2 = userId.substr(0, userId.length-3)
                                       + '**';
                                alert("요청하신 아이디는 "  + userId2  + " 입니다.");
                            }
                            
                    },error:function(){
                        console.log("ajax통신실패");
                        alert("아이디를 찾을 수 없습니다.");
                    }
                });

            } else{

                if($userName.val() == ""){
                    
                    alert("이름을 입력해주세요");
                    return;
                }

                if($userPhone.val() == ""){
                    
                    alert("전화번호를 입력해주세요");
                    return;
                }
            }


       }

       	// 비밀번호 정규식
		let pwdExp = (/^(?=.*[a-z])(?=.*[0-9]).{6,16}$/);

        // 비밀번호 유효성 체크
        $("#userPwd").blur(function(){
            if(pwdExp.test($(this).val())){
                console.log(pwdExp.test($(this).val()));
                $("#checkPwd").text("사용 가능한 비밀번호 입니다");
                $('#checkPwd').css('color', 'rgb(155, 213, 189)');
                $("#userPwdValue").attr('value', 'YY');
                
            }else{
                console.log(pwdExp.test($(this).val()));
                $('#checkPwd').text("비밀번호를 확인해주세요");
                $('#checkPwd').css('color', 'red');
            }
        });
        $("#userPwdChk").blur(function(){
            if($("#userPwd").val() == $("#userPwdChk").val()){
                console.log($("#userPwd").val() == $("#userPwdChk").val());
                $("#checkPwdchk").text("비밀번호가 일치합니다");
                $('#checkPwdchk').css('color', 'rgb(155, 213, 189)');
                $("#userPwdChkValue").attr('value', 'YY');
                
            }else{
                console.log($("#userPwd").val() == $("#userPwdChk").val());
                $('#checkPwdchk').text("비밀번호가 일치하지 않습니다.");
                $('#checkPwdchk').css('color', 'red');
            }
        });


        function searchPwd(){

            const $userId = $("#searchPwdForm input[name=userId]");
            const $userName = $("#searchPwdForm input[name=userName]");
            const $userEmail = $("#searchPwdForm input[name=userEmail]");

            if(($userId.val() != "") && ($userName.val() != "") && ($userEmail.val() != "")){

                $.ajax({
                    url:"pwdSearch.me",
                    data:{
                        userId:$userId.val(),                        
                        userName:$userName.val(),
                        userEmail:$userEmail.val()
                    },
                    type:"post",

                    success:function(result){

                    	if(result == 'NNNNN'){ //아이디 확인OK
                    
                    		alert("비밀번호 변경창으로 이동합니다.");
                    	
                    		$("#changePwdWrap").removeAttr("style", "display:none");
                    		$("#searchPwdWrap").attr("style", "display:none");
                    		$("#userIdforPwd").attr("value", $userId.val());
                    		
						}else{
							
							alert("잘못입력하셨습니다. 다시 입력해주세요");
						}
                        	console.log("ajax통신성공");
                            
                    },error:function(){
                        console.log("ajax통신실패");
                        alert("회원를 찾을 수 없습니다.");
                    }
                });

            } else{

                if($userId.val() == ""){
                    
                    alert("아이디를 입력해주세요");
                    return;
                }

                if($userName.val() == ""){
                    
                    alert("이름을 입력해주세요");
                    return;
                }

                if($userEmail.val() == ""){
                    
                    alert("이메일 주소를 입력해주세요");
                    return;
                }
            }

        }
        
        function changePwd(){
        	
            const $userPwd = $("#changePwdForm input[name=userPwdValue]");
        	const $userPwdChk = $("#changePwdForm input[name=userPwdChkValue]");
        	
        	if($userPwd.val() == 'YY' && $userPwdChk.val() == 'YY'){
        		$("#changePwdForm").submit();

        	}else{
                if($userPwd.val() != 'YY'){
                    alert("비밀번호를 잘못 입력하셨습니다.");
                    return false;
                }
                if($userPwdChk.val() != 'YY'){
                    alert("비밀번호 확인을 다시 입력해주세요");
                    return false;
                }

        		
        	}
        	
        	return false;
        }

    </script>  

    <footer>
        <%@ include file="../common/footer.jsp"%>
    </footer>
</body>
</html>