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
    
   
    .outer-delete{
        width: 600px;
        height:800px;
        margin: auto;
    }
    #title-area{
        border-bottom: 1px solid black; 
        text-align: left; 
        width:600px;
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
        margin-top:50px; 
        border:1px solid lightgrey;
        width: 650px;
    
    }
    #input-area input[type="password"]{
        width:170px;
        height: 30px;
    }
    #input-area input[type="checkbox"]{
        height:10px;
    }
    #input-area label{font-size: small;}
    #input-area th{padding-left:30px; width:100px;}
    #input-area td{text-align:justify; width:170px}
    #agree-area{width:700px; height:50px;}
    #agree-area label{font-size:small; text-align: left;}
</style>
</head>
<body style="height:100%">

	<%@ include file="../common/myPage.jsp" %>
	<% 
		String userId = loginUser.getmId();
		
	%>
	
    <div class="outer-delete">

        <div class="main">
            <form action="<%=contextPath %>/delete.me" id="inputPwd-area" method="post" align="center" >
            	<input type="hidden" id="userId" name="userId" value="<%=userId%>">
                <div id="title-area" >
                    <p>
                        <h4> 회원 탈퇴</h4>
                    </p>
                </div>
                <table id="input-area" align="center">   
                    <tr align="left" height="100">
                        <th>
                            비밀번호
                        </th>
                        <td colspan="2">
                            <input type="password" id="userPwd" name="userPwd" required>
                            <div id="checkPwd">

                            </div></td>
                        </td>
                    </tr>    
                    <tr align="left">
                        <th rowspan="5" align="center" height="200">
                            탈퇴사유
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="reason1" name="reason" class="reason" value="고객서비스(상담,포장 등)불만">
                            <label for="reason1">고객서비스(상담,포장 등)불만</label>
                        </td>
                        <td>
                            <input type="checkbox" id="reason2" name="reason" class="reason" value="배송불만">
                            <label for="reason2">배송불만</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="reason3" name="reason" class="reason" value="교환/환불/취소/반품 불만">
                            <label for="reason3">교환/환불/취소/반품 불만</label> 
                        </td>
                        <td>
                            <input type="checkbox" id="reason4" name="reason" class="reason" value="방문 빈도 낮음">
                            <label for="reason4">방문 빈도 낮음</label> 
                        </td>
                    </tr>
                    <tr>
                        <td>    
                            <input type="checkbox" id="reason5" name="reason" class="reason" value="상품가격 불만">
                            <label for="reason5">상품가격 불만</label>
                        </td>
                        <td>    
                            <input type="checkbox" id="reason6" name="reason" class="reason" value="기타">
                            <label for="reason6">기타</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="140" style="vertical-align: top;">
                            <textarea name="reason" id="detail" class="reason" cols="80" rows="3" style="resize: none; font-size:x-small;" ></textarea>
                        </td>
                    </tr>
                </table>
                <div id="agree-area">
                    <input type="checkbox" id="agreeCheck" name="agreeCheck" value="Y">
                        <label for="agreeCheck">
                            탈퇴 후에는 동일한 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다. <br>
                            안내 사항을 모두 확인하였으며, 이에 동의합니다.
                        </label>
                </div>
                <div id="button-area">
                    <button type="button" id="cancelBtn" onclick="back();">취소</button>
                    <button type="submit" id="confirmBtn" onclick="return update();">회원탈퇴</button>
                </div>
            </form>
        </div>
   </div> 

   <script>
       function back(){
           location.href="<%=contextPath%>/myPage.my"
       }

       $("#userPwd").blur(function(){
            //1. ajax 통한 비밀번호 체크

            const userid = $("#userId").val();
            $.ajax({
                url:"pwdCheck.me",
                data:{
                    userId:userid,
                    userPwd:$("#userPwd").val()
                },
                type:"post",
                success:function(result){

                    if(result == 'NNNNN'){
                        console.log("비밀번호 확인실패");
                        $('#checkPwd').text("비밀번호를 확인해주세요");
                        $('#checkPwd').css('color', 'red');
                        $("#userPwd").focus();
                    }else{
                        console.log("비밀번호 확인성공");
                        $('#checkPwd').text("비밀번호 확인완료");
                        $('#checkPwd').css('color', 'rgb(155, 213, 189)');
                        $('#userPwd').attr("readonly", true);
					    
                    }
                },error:function(){
                        console.log("ajax 통신 실패");
                     
                    }
            });
        });

        $("#reason6").click(function(){
        
            alert("사유를 작성해주세요");
            $("#detail").focus();
        });

        function update(){          
        	
        if((($("userPwd").val() != "")) && $(".reason").is(":checked") && $("#agreeCheck").is(":checked")){
            
            if(confirm("정말 탈퇴하시겠습니까?")){
                $("inputPwd-area").submit();
            }else{
                return false;
            }

        }else{
            if(!($(".reason").is(":checked"))){
                alert("탈퇴사유를 체크해주세요");
                return false;
            }
            if(!($("#agreeCheck").is(":checked"))){
                alert("안내사항 확인에 체크해주세요");
                return false;
            }
        }
        return;
        }

                    
            
           

    </script>
   <footer>
    <%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>