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
<title>홈페이지에서 보는 이용약관</title>
<style>

    main{
        margin-top: 20px;
        margin-left: 25%;
        width: 950px

    }

    #mainTitle{margin-bottom: 60px;}
    table{
        border-collapse: collapse;
        margin-top: 100px;
    }

    h2{
        width: 950px;
        border-bottom: 1px solid black;
        padding-bottom: 15px;
    }

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
	
	<%@ include file="../common/menubar.jsp" %>
	
    <main>
        <div id="content">
            <h2 style="font-size: 23px; font-weight: 600; padding-top: 100px;" >이용약관</h2>

            <table>
				<% if(list.isEmpty()) { %>
					<tr>
                		<td colspan="2">존재하는 이용약관이 없습니다.</td>
                	</tr>
                <% } else {%>
                	<% for(Terms t : list) { %>
		                <tr>
		                    <td colspan="2" class="termsContent">
		                    <%= t.getTermsContent() %>
		                    </td>
		                </tr>
    				<% } %>    
       			<% } %>
          
            </table>
        </div>
    </main>
    
    <%@ include file="../common/footer.jsp" %>
	

</body>
</html>