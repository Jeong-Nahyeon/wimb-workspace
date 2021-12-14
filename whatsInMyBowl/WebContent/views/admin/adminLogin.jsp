<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.wimb.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인한 관리자 회원의 정보가 담겨있는 Member 객체
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 로그인창</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>

    table{
        margin-top: 100px;
        border-spacing: 0 5px;
    }

    img{width: 100px;}

    
    button{
        width: 320px;
        height: 30px; 
        background-color: rgb(155,213,189);
        border-style: none;
        border-radius: 3px;
    }
    
    .input{
        width: 260px;
        height: 30px;
        background-image: ;
        text-align: 10px;
        padding-left: 50px;
    }

    .inputWithIcon{
       position: relative;
   }

   i{
       color: gray;
        position: absolute;
        left: 20px;
        top: 11px;
   }

   span{
       font-size: 10px;
   }

</style>
</head>
<body>
    <form action="<%= contextPath %>/adminlogin.me" method="post"> 
        <table align="center">
            <tr>
                <td><img src="image/logo.png"></td>
                <td><h1>관리자 로그인</h1></td>
            </tr>
    
            <tr>
                <td colspan="2"  class="inputWithIcon">
                    <input type="text" id="userId" class="input" required>
                    <i class="fas fa-user"></i>
                </td>
            </tr>
        
            <tr>
                <td colspan="2"  class="inputWithIcon">
                    <input type="password" id="userPwd" class="input" required>
                    <i class="fas fa-key"></i>
                </td>
        
            </tr>

            <tr>
                <td><input type="checkbox"><span>아이디저장</span></td>
                <td></td>
            </tr>

            <tr>
                <td colspan="2"><button type="submit">로그인</button></td>
            </tr>
        </table>
        

    </form>

</body>
</html>