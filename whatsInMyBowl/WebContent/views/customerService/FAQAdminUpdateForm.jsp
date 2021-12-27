<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.wimb.customerService.model.vo.FAQ"%>
<%
  FAQ faq = (FAQ)request.getAttribute("faq");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 자주묻는 질문 수정</title>
<style>
    .outer{
        margin-top: 100px;
        margin-left: 25%;
        width: 1000px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .outer table{margin-top: 130px;}
    .FAQ_Box table{
        width: 1000px;
        border-collapse: collapse;
    }
    .FAQ_Box_question_title input{
        border: none;
        padding: 3px;
        font-weight: bold;
        color: black;
        width:750px;
    }
    .FAQ_Box_question_title input:focus{outline: none;}
    .FAQ_Box_question_title{
        border-bottom: 2px solid gray;
        width: 60px;
    }
    .FAQ_category{
        border-bottom: 2px solid gray;
        width: 5%;
    }
    .FAQ_category_option{
        border-bottom: 2px solid gray;
        width: 3%;
    }
    .FAQ_category, .FAQ_category_option{text-align: end;}
    .FAQ_Box_header{
        width: 8%;
        font-weight: bold;
    }
    .FAQ_Box_question, .FAQ_Box_question_title, .FAQ_category, .FAQ_category_option{padding: 3px 5px;}
    #FAQ_Box_question_answer{
        padding: 5px;
        margin-top: 10px;
    }
    #FAQ_Box_question_answer:focus{outline: none;}
    .FAQ_Box_question_answer_header{
        vertical-align: top;
        padding-top: 10px;
    }
    .two_btn button{
        border: none;
        background-color: #ffee58;
        border-radius: 5px;
        font-size: 13px;
        padding: 3px 10px;
        margin-top: 50px;
    }
    .two_btn button:focus{outline: none;}
    #back{background-color: lightgray;}
    #insert{margin-left: 10px;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="../common/adminBar.jsp" %>

    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">고객센터관리 > 자주묻는 질문</h2>
            <h2>> 자주묻는 질문 수정</h2>
        </div>

        <div class="FAQ_Box">
			
			<form action="<%= contextPath %>/update.faq" method="post">
				<input type="hidden" value="<%= faq.getFaqCode()%>" name="fCode">
	            <table>
	                <tr>
	                    <td class="FAQ_Box_header">질문</td>
	                    <td class="FAQ_Box_question_title"><input type="text" name="title" value="<%= faq.getFaqTitle() %>" required></td>
	                    <td class="FAQ_category">분류</td>
	                    <td class="FAQ_category_option">
	                        <select name="FAQ_category_option" id="">
	                            <option value="<%= faq.getFaqCategory() %>"><%= faq.getFaqCategory() %></option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="FAQ_Box_header FAQ_Box_question_answer_header">답변</td>
	                    <td colspan="3">
	                        <textarea name="FAQ_Box_question_answer" id="FAQ_Box_question_answer" cols="123" rows="15" required><%= faq.getFaqContent() %></textarea>
	                    </td>
	                </tr>
	            </table>
	
	            <div class="two_btn" align="center">
	                <button type="button" id="back" onclick="history.back();">목록으로</button>
	                <button type="submit" id="insert">수정하기</button>
	            </div>
					
			</form>            
        </div>





    </div>







</body>
</html>