<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.wimb.admin.model.vo.Terms"%>
<%
	
	ArrayList<Terms> list = (ArrayList<Terms>)request.getAttribute("list");
	// 조회된 이용약관 리스트가 담겨있는 list
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 - 개인정보처리방침</title>
<style>

    main{
        margin-top: 100px;
        margin-left: 25%;
        width: 1200px;
    }
    #mainTitle>h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }

    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    table{border-collapse: collapse;}

    .title-btn>td{
        border-bottom: 1px solid black;
        padding-bottom: 10px;
    }

    .termsTitle{
        font-weight: 600;
        width: 1000px;
    }

    .termsContent{
        width: 1000px;
        padding-bottom: 80px;
    }

    #addTerms{margin-left: 35%;}

    .btnColor{
        background-color: #ffee58;
        border: none;
        border-radius: 3px;
        margin-bottom: 100px;
    }
    .terms_twobtn{
        text-align: end;
        margin-bottom: 100px;
    }
    .terms_twobtn_right button:hover{background-color: #ffee58;}
    .terms_twobtn button:focus{outline: none;}
    .terms_twobtn .terms_twobtn_right{
        margin-left: 10px;
        background-color: #ffee58;
    }
    .terms_twobtn button{
        border:none;
        padding: 2px 10px;
        background-color: lightgray;
        border-radius: 4px;
    }
    .terms_twobtn_update_delete_td{
        text-align: end;
    }
    .terms_twobtn_update_delete{margin-right: 10px;}
    .terms_twobtn_update_delete_td button{
        border:none;
        padding: 2px 10px;
        background-color: lightgray;
        border-radius: 4px;
    }
    .terms_twobtn_update_delete_td button:hover{background-color: #ffee58;}
    .terms_twobtn_update_delete_td button:focus{outline: none;}
    .termsContent{padding-bottom: 100px;}
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
    <%@ include file="../common/adminBar.jsp"%>

    <main>

        <div id="mainTitle">
            <h2 id="mainTitle1">홈페이지관리 </h2>
            <h2>> 이용약관 > 개인정보처리방침</h2>
        </div>

        <div id="content">
            <form action="" method="post">
                <div class="terms_twobtn">
                    <button type="button" class="terms_twobtn_left" onclick="location.href='<%= contextPath %>/list.terms';">이용약관</button>
                    <button type="button" class="terms_twobtn_right" onclick="location.href='<%= contextPath %>/listPersonalInformation.terms';">개인정보처리방침</button>
                </div>
                
                <table>
                	<% if(list.isEmpty()) { %>
                		<tr>
                			<td colspan="2">존재하는 이용약관이 없습니다.</td>
                		</tr>
                	<% } else {%>
                		<% for(Terms t : list) { %>
		                    <tr class="title-btn">
		                        <div class="terms_twobtn_update_delete">
		                            <td class="terms_twobtn_update_delete_td">
		                                <button type="button" class="terms_twobtn_update_delete_left" onclick="location.href='<%= contextPath %>/PersonalInformationupdateForm.terms?num=<%= t.getTermsCode() %>';">수정</button>
		                                <button type="button" onclick="location.href='<%= contextPath %>/deletePersonalInformation.terms?num=<%= t.getTermsCode() %>';">삭제</button>
		                            </td>
		                        </div>
		                    </tr>
		                    <tr>
		                        <td colspan="2" class="termsContent">
								<%= t.getTermsContent() %>
		                        </td>
		                    </tr>
	                	<% } %>    
       				<% } %>
                </table>
    
                <div>
                    <button id="addTerms" class="btnColor" type="button" onclick="location.href='<%= contextPath %>/PersonalInformationenrollForm.terms';">등록하기</button>
                </div>
            </form>
        </div>

    </main>
    
    <script>
	
	    
    </script>


</body>
</html>