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
    
    
    .main{
        width:600px;
        height: 800px;
        margin:auto;
        
    }
    #title-area{border-bottom: 1px solid black; text-align: left;}
    #main-area{
        margin-top:130px;
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
    #input-area{
        background-color: rgba(241, 238, 238, 0.432);
        width: 500px;
        height: 50px;
        line-height: 50px;
        margin:auto;
    }
    #input-area>div{
        float:left;
        margin:auto;
        width: 200px;
        margin-left:20px
    }
    #input-area input[type="password"]{
        width:100px;
        height: 30px;
    }
</style>
</head>
<body style="height:100%">

	<%@ include file="../common/myPage.jsp" %>
    <% 
		String userId = loginUser.getmId();
		String userPwd = loginUser.getmPwd();
	%>
	

    <div class="main">
        <form action="<%=contextPath %>/update.me" id="inputPwd-area" align="center" method="post">
            <div id="title-area" >
                <p>
                    <h4> 회원정보 변경</h4>
                </p>
            </div>
            <div id="main-area">
                <p>
                    회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력해주세요
                </p>
                <div id="input-area">
                    <div>
                        아이디 <b><%=userId%></b>
            <input type="hidden" id="userId" name="userId" value="<%=userId%>"> 
                    </div>
                    <div>
                        비밀번호 <input type="password" id="userPwd" name="userPwd" required>
                    </div>
                </div>
            </div>
            <div id="button-area">
                <button type="button" id="cancelBtn" onclick="back();">취소</button>
                <button type="submit" id="confirmBtn" onclick="update();">확인</button>
            </div>
        </form>
    </div>
   

   <script>
       function back(){
           location.href="<%=contextPath%>/myPage.my"
       }
       function update(){
    	   $("#inputPwd-area").submit();
       }
   </script>
   <footer>
    <%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>