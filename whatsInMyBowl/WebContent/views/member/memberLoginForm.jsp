<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wimb.member.model.vo.Member" %>


<%@ include file="../common/menubar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box;}
    #loginFormTable{    
        width: 400px;
        height: 300px;
    }
    .loginWrap{border: 1px solid lightgrey; width: 500px; height:400px; margin: auto; margin-top: 100px;}
        
    .logintap>ul>li{
        list-style: none;
        float: left;      
        width: 40%; 
        margin-left:-5px;
    }
    .logintap li>a{
        text-decoration: none;
        color: black;
        font-weight: bold;
    }
    .logintap li>a:hover{
        color: rgb(155, 213, 189);
    }
    #idInputForm>th{width:90px; } 
    #pwdInputForm>th{width:90px;}
    #loginbtn, #enrollbtn{
        width:100%; 
        height:90%; 
        border-radius: 1.05ex; 
        border: 1px solid rgb(155, 213, 189);
        color: rgb(155, 213, 189);
        background-color: white;
        font-weight: bold;
        }
    #loginbtn:hover, #enrollbtn:hover{
        background-color: rgb(155, 213, 189);
        color: white;
        }
    #saveId{font-size: small;}
  
    .findIdPwd>a{
        text-decoration: none;
        font-size: small;
        color: grey;
    }
    .findIdPwd>a:hover{
        text-decoration: none;
        font-size: small;
        color: rgb(155, 213, 189);
    }
    .userIdPwdInput{ 
        position: relative; 
        width: 100%; 
        height: 90%; 
        padding-left: 70px;
        border: 1px solid lightgrey; 
    }
    #idInputForm i, #pwdInputForm i{
        color:rgb(155, 213, 189);
        position: absolute;
        margin-left:-380px;
        margin-top: 10px;
    } 
 
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
</head>
<body>
	 <div class="loginWrap" align="center">

        <div class="logintap">
            <ul align="center">
                <li><a href="" style="color:rgb(155, 213, 189)">로그인</a></li>
                <li style="width:15%">&#124;</li>
                <li><a href="">비회원 주문 조회</a></li>
            </ul>
        </div>
        
        <br>
        <br>
        <form action="<%=contextPath %>/login.me" method="post" id="loginForm">            

            <table id="loginFormTable" align="center">             
               
                <tr id="idInputForm">
                    
                    <td colspan="2">
                        <input type="text" class="userIdPwdInput" name="userId" required>
                        <i class="fas fa-user fa-2x"></i>
                    </td>
                </tr>
                <tr id="pwdInputForm">
                    
                    <td colspan="2">
                        <input type="password" class="userIdPwdInput" name="userPwd" required >
                        <i class="fas fa-key fa-2x"></i>
                    </td>
                </tr>
                <tr>
                    <td  style="vertical-align:top">                         
                       
                    </td>
                    <td align="right" style="vertical-align: top">
                        <div class="findIdPwd">
                            <a href="<%=contextPath%>/searchIdClick.me">아이디 | 비밀번호 찾기</a>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <th colspan="2">
                        <button type="submit" id="loginbtn">로그인</button>
                        
                    </th>
                </tr>
                <tr align="center">
                    <th colspan="2">
                        <button type="button" id="enrollbtn" onclick="enrollPage();">회원가입</button>
                    </th>
                </tr>
            </table>
            <script>
                function enrollPage(){
                   
                    location.href = "<%=contextPath%>/memberEnrollForm.me";
                }
            </script>            
        </form>
        
    </div>
    <footer>
    	<%@ include file="../common/footer.jsp" %>
    </footer>
</body>
</html>
