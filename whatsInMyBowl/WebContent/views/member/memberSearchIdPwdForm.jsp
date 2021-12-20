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
    .findtap li>a{
        text-decoration: none;
        color: black;
        font-weight: bold;
    } 
    .findtap li>a:hover{
        color: rgb(155, 213, 189);
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
    #loginbtn, #confirmbtn{
        width:100%; 
        height:80%; 
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
    
        <div class="findtap">
            <ul align="center">
                <li><a href="#findwrap">아이디 찾기</a></li>
                <li style="width:15%">&#124;</li>
                <li><a href="">비밀번호 찾기</a></li>
            </ul>
        </div>
        
        <br clear="both">
        <br>
        <div id="findwrap" style="display:none">
            <form action="<%=contextPath%>/searchIdClick.me" method="post" class="infoForm" id="infoForm" onsubmit="return searchId();">
            <div class="optiontap">
            
                <input type="radio" class="methodOption" id="radioEmail" value="email" name="radio" checked="checked">
                <label for="radioEmail">이메일</label>
                <input type="radio" class="methodOption" id="radioPhone" value="phone" name="radio">
                <label for="radioPhone">전화번호</label>
            </div>
            <br clear="both">
            
                <!-- 이메일 선택시-->
                <div  id="clickemail" class="checked">
                    <table class="infoInputTable"  align="center">
                        <tr>
                            <td colspan="2">
                                <input type="text" class="userNameInput" name="userName" id="userName" required placeholder="이름">
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <input type="text" class="userEmailInput" name="userEmail" id="userEmail" required placeholder="가입메일주소">
                            </td>
                            
                        </tr>
                        <tr></tr> 
                        <tr>
                            <td colspan="2">
                                <button type="submit" id="confirmbtn" onclick="searchId();">확인</button>
                            </td>
                        </tr>                        
                        <tr>
                            <td colspan="2">
                                <button type="button" id="loginbtn" onclick="loginPage();">로그인</button>
                            </td>
                        </tr>           
                    </table>
                </div>
                <!--전화번호 선택시-->
                <div id="clickphone" class="checked" style="display:none"> 
                    <table class="infoInputTable" align="center" id="clickPhone">
                        <tr>
                            <td colspan="2">
                                <input type="text" class="userNameInput" name="userName" id="userName" required placeholder="이름">
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
                                <button type="submit" id="confirmbtn">확인</button>
                            </td>
                        </tr>     
                        <tr>
                            <td colspan="2">
                                <button type="button" id="loginbtn" onclick="loginPage();">로그인</button>
                            </td>
                        </tr>
                    </table>
                </div>
            

            </form>
        </div>
        
        <div>
            <form action="" id="searchPwd">
                <div  id="clickemail" class="checked">
                    <table class="infoInputTable"  align="center">
                        <tr>
                            <td colspan="2">
                                <input type="text" class="userNameInput" name="userId" id="userId" required placeholder="이름">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" class="userNameInput" name="userName" id="userName" required placeholder="이름">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="userEmailInput" name="userEmail" id="userEmail" required placeholder="가입메일주소">
                            </td>
                            
                        </tr>
                        <tr></tr> 
                        <tr>
                            <td colspan="2">
                                <button type="submit" id="confirmbtn" onclick="searchId();">확인</button>
                            </td>
                        </tr>                        
                        <tr>
                            <td colspan="2">
                                <button type="button" id="loginbtn" onclick="loginPage();">로그인</button>
                            </td>
                        </tr>           
                    </table>
                </div>
            </form>
        </div>
    
    </div>

    <script>
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
        
        function searchId(){
            $("#loginbtn").submit();
        }
    </script>  

    <footer>
        <%@ include file="../common/footer.jsp"%>
    </footer>
</body>
</html>