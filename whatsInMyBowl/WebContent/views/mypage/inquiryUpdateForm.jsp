<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.wimb.mypage.model.vo.Inquiry, com.wimb.common.model.vo.PageInfo"%>
<%
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
  .outer{
  width: 850px;
  height: 550px;
  margin: auto;
  margin-top: 50px;
  }
    #InqueryForm{
        margin-left: 150px;
        text-align: center;
        width: 700px;
    }
    #InqueryForm h3{
        font-size: 26px;
        font-weight: 600;
        margin-bottom: 15px;

    }
    #InqueryForm table{
        width: 700px;
        border-top: 2px solid gray;
        border-bottom: 2px solid gray;
    }
    #InqueryForm tr{
        padding: 30px 0;
    }
    .titleInput input{
        width: 300px;
    }
    textarea{
        color: gray;
        padding: 10px;
        font-size: 10px;
        border-radius: 3px;
    }
    .fileBox{position: relative;}
    .fileBox .fileName {
        display:inline-block;
        width:190px;
        height:30px;
        padding-left:10px;
        margin-right:5px;
        line-height:30px;
        border:1px solid #aaa;
        background-color:#fff;
        vertical-align:middle
    }
    .fileBox .btn_file {
        display:inline-block;
        position: absolute;
        background-color: gray;
        color: white;
        width:50px;
        height:30px;
        font-size:8px;
        line-height:30px;
        border-radius: 3px;
        text-align:center;
        vertical-align:middle
    }
    .fileBox input[type="file"] {
        position:absolute;
        width:1px;
        height:1px;
        padding:0;
        margin:-1px;
        overflow:hidden;
        clip:rect(0,0,0,0);
        border:0
    }
    #btn-reset, #btn-insert{
        border-radius: 5px;
        margin-top: 30px;
        border: 2px solid rgb(155, 213, 189);
        padding: 3px 30px;
        color: rgb(155, 213, 189);
        font-weight: 800;
        font-size: 10px;
    }
    #btn-reset{
        background-color: white;
    }
    #btn-insert{
       background-color: rgb(155, 213, 189);
       color: white;
    }
</style>
</head>
<body>
	<%@ include file="../common/myPage.jsp" %>
	
	<div class="outer">
    			<% if (loginUser == null){ %>
		<!-- 로그인이 안되어있을 경우 -->
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
	                        <input type="checkbox" name="saveId" id="saveId" style="font-size:small;">
	                        <label for="saveId" style="font-size:small">아이디저장</label>
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
		<% } else {%>
		<!-- 로그인이 되어있을 경우 -->
        <div id="InqueryForm">
            <form action="<%= contextPath %>/userInsert.inq" method="post" id="enroll-form" enctype="multipart/form-data">
    		<input type="hidden" name="userNo" value="<%= loginUser.getmCode() %>">
                <h3>1:1 문의  수정</h3>
                <table>
                    <tr style="border-bottom: 1px solid lightgray;">
                        <th style="padding: 10px 0; width: 100px;">작성자</th>
                        <td style="width: 300px; text-align: left;"><%= loginUser.getmName() %>님</td>
                        <th>말머리</th>
                        <td>
                            <select name="inquiry_category">
                                <option value="결제관련">결제관련</option>
                                <option value="홈페이지이용">홈페이지이용</option>
                                <option value="배송">배송</option>
                                <option value="상품">상품</option>
                                <option value="취소/환불">취소/환불</option>
                                <option value="기타">기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="border-bottom: 1px solid lightgray;" class="titleInput">
                        <th style="padding: 10px 0;">제목</th>
                        <td colspan="3" style="text-align: left;"><input type="text" name="title" required></td>
                    </tr>
                    <tr>
                        <th style="padding: 10px 0;">내용</th>
                        <td colspan="3" style="text-align: left;">자동으로 비밀글로 작성됩니다.</td>
                    </tr>
                    <tr>
                        <td colspan="4"><textarea name="content" id="" cols="90" rows="10" required style="resize: none;">내용을 입력해주세요.</textarea></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="font-size: 13px; text-align: left; padding-left:10px; font-weight: bold; padding-bottom: 5px;">
                            
                            <div class="fileBox" style="display: inline-block;">
                                
                                <div class="fileBox_first" style="margin-bottom: 10px;">
                                    <div style="padding: 0px 30px; display: inline-block; text-align: start;">첨부파일</div>
                                    <input type="text" class="fileName" readonly="readonly">
                                    <label for="uploadBtn" class="btn_file" style="vertical-align: middle;">추가</label>
                                    <input type="file" id="uploadBtn" class="uploadBtn" name="file1">
                                </div>

                                <div class="fileBox_second" style="padding-left: 116px;">
                                    <input type="text" class="fileName" readonly="readonly">
                                    <label for="uploadBtn2" class="btn_file" style="vertical-align: middle;">추가</label>
                                    <input type="file" id="uploadBtn2" class="uploadBtn" name="file2">
                                </div>

                            </div>

                        </td>
                    </tr>
                </table>

                <div align="center">
                    <button type="reset" id="btn-reset">취소</button>
                    <button type="submit" id="btn-insert">등록</button>
                </div>
    
            </form>


        </div>
		<% } %>  


	</div> 
      
      
      
      
      
	<script>
		function modify(){
			location.href = "<%= contextPath %>/myPage.my" // 고객센터 1:1문의로 이동하는 링크걸기
		}
		
	    $(document).ready(function(){
	        $(".answerTr .answer").hide(); 
	        $(".answerTr tr:first-child").show(); //열머리글 보여주기
	        $(".answerTr").click(function(){
	            $(this).siblings(".answer").toggle();
	        });
	    });
	
	</script>      
	        
    
</body>
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
	
	
</html>