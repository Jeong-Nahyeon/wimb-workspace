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
    #searchForm{    
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
    #forgetNo a{
        color:black; 
        text-decoration: underline;
    }
    #forgetNo a:hover{color:rgb(155, 213, 189); font-weight: 900;}
    #searchbtn, #enrollbtn{
        width:100%; 
        height:90%; 
        border-radius: 1.05ex; 
        border: 1px solid rgb(155, 213, 189);
        color: rgb(155, 213, 189);
        background-color: white;
        font-weight: bold;
        }
    #searchbtn:hover, #enrollbtn:hover{
        background-color: rgb(155, 213, 189);
        color: white;
        }
   
    .orderInput{ 
        position: relative; 
        width: 100%; 
        height: 90%; 
        padding-left: 20px;
        border: 1px solid lightgrey; 
    }
    
    #searchForm p{
        font-size: small;
        text-align: center;
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
                <li><a href="<%=contextPath%>/loginInput.me">로그인</a></li>
                <li style="width:15%">&#124;</li>
                <li><a href="" style="color:rgb(155, 213, 189)">비회원 주문 조회</a></li>
            </ul>
        </div>
        
        <br>
        <br>
        <form action="" method="post">            

            <table id="searchForm" align="center">             
               
                <tr>
                    
                    <td colspan="2">
                        <input type="text" class="orderInput" name="userId" required placeholder="주문자명">
                    </td>
                </tr>
                <tr>
                    
                    <td colspan="2">
                        <input type="text" class="orderInput" name="userPwd" required placeholder="주문번호">
                        
                    </td>
                </tr>
                <tr>
                    <td  style="vertical-align:top">                         
                        <p id="forgetNo">
                            <i class="fas fa-exclamation-circle"></i>
                            주문번호를 잊으신 경우 
                            <a href="" >고객센터</a>
                            로 문의 주시기 바랍니다.
                        </p>
                    </td>
                    
                </tr>
                <tr align="center">
                    <th colspan="2">
                        <button type="submit" id="searchbtn">주문조회</button>
                        
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
                   
                    location.href = "<%=contextPath%>/enrollForm.me";
                }
            </script>            
        </form>
        
    </div>
    <footer>
    	<%@ include file="../common/footer.jsp" %>
    </footer>
</body>
</html>
