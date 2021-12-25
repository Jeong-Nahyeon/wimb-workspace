<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.wimb.common.model.vo.PageInfo, java.util.ArrayList, com.wimb.member.model.vo.Member" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	int listCount = (Integer)request.getAttribute("listCount");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

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
    .outer{
        margin-top: 100px;
        margin-left: 18%;
        width: 800px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .paging-area button{
        width:20px;
        height:25px;
        padding:0;
        margin:0;
        font-size: 12px;
        border:none;
    }
    #memberListTable{
        width: 800px;
        font-size: 12px;
    }
    #updateBtn, #deleteBtn, #selectDeleteBtn{
        background-color: rgb(250, 223, 76);
        border:none;
        margin: 1px;
        font-size: 12px;
    }
    #modalHeader{
    	width:500px;
    	padding: 25px;
    	
    }
    .atag:hover{cursor: pointer;}
    <!--모달창 스크롤-->
    .modal-content{
        overflow-y: initial !important
    }
    .modal-body{
       
        overflow-y: auto;
    }
    #updateBtnModal, #deleteBtnModal{
        background-color: rgb(250, 223, 76);
        border:none;
        margin: 1px;
        font-size: 14px;
        width: 100px;
        height:30px;
        margin: 20px 10px;
    }
    #infoTable input{
        width:100%;
        font-size: 12px;
        border-style:none;
        border-bottom-style: 1px solid lightgrey;
    }
    #infoTable th, #infoTable td{border-bottom: 1px solid rgb(224, 224, 224);}
</style>
</head>
<body>
    <%@ include file="../common/adminBar.jsp"%>
    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">회원관리</h2>
            <h2>> 회원 정보 관리</h2>
        </div>
        <div width="800">
            <p>
                총 회원 수 <b style="color: rgb(250, 209, 76);"><%=listCount%></b>명
            </p>
            <div width="800" align="right">
                <button id="selectDeleteBtn">
                    선택삭제
                </button>
            </div>
        </div>
        <table id="memberListTable" border style="font-size:12px; text-align: center;">
        	<thead>
	            <tr style="background-color:rgba(231, 231, 231, 0.438);" >
	                <th width="20" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
	                <th width="50">번호</th>
	                <th width="80">ID</th>
	                <th width="60">회원명</th>
	                <th width="100">연락처</th>
	                <th width="55">구매횟수</th>
	                <th width="70">구매누적액</th>
	                <th width="60">적립금</th>
	                <th width="90">가입일</th>
                    <th width="30">회원상태</th>
	                <th width="50">삭제</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<% if(list.isEmpty()){ %>
	        	<tr>
	        		<td colspan="10">조회된 회원이 없습니다.</td>
	        	</tr>
	        	<%}else { %>
	        		<% for(Member m : list){ %>
			            <tr>
			                <td><input type="checkbox"></td>
			                <td><%= m.getmCode() %></td>
			                <td  >
			                    <a class="atag" data-toggle="modal" data-target="#updateModal"><%= m.getmId() %></a>
			                    <input type="hidden"  name="userId" value="<%= m.getmId()%>">
			                </td>
			                <td><%= m.getmName() %></td>
			                <td><%= m.getmPhone() %></td>
			                <td><%= m.getCount() %></td>
			                <td><%= m.getSum() %></td>
			                <td>
			                    <a href=""><%= m.getmPoint() %></a>
			                </td>
			                <td><%= m.getEnrollDate() %></td>
                            <th>
                            	<%= m.getStatus() %>
                            	<input type="hidden"  name="userStatus" value="<%= m.getStatus()%>">
                            </th>
			                <td>
			                    <button id="deleteBtn">삭제</button>
			                </td>
			            </tr>
			    	<% } %>
	            <%} %>
            </tbody>
        </table>

        <div class="paging-area" align="center">
        
            <% if(currentPage != 1){ %>
                <button onclick="location.href='<%=contextPath%>/infoAdminClick.me?cpage=<%= currentPage - 1%>';"> &lt; </button>
            <% } %>
            <% for(int p=startPage; p<=endPage; p++){ %>
                <% if(p == currentPage) {%>
                    <button disabled><%= p %></button>
                <% } else{ %>
                    <button onclick="location.href='<%=contextPath%>/infoAdminClick.me?cpage=<%= p %>';"><%= p %></button>
                <% } %>
            <% } %>
            <% if(currentPage != maxPage){ %>
                    <button onclick="location.href='<%=contextPath%>/infoAdminClick.me?cpage=<%= currentPage + 1%>';"> &gt; </button>
            <% } %>
        </div>
        
    </div>
    
    
    
    <!-- 회원정보 수정용 모달-->
    <div class="modal " id="updateModal" height="500">
     
        <div class="modal-dialog">
            <div class="modal-content">
        
            <!-- Modal Header -->
            <div id="modalHeader">
                	<h5 class="modal-title" align="center">회원 상세 정보</h5>
               
            </div>
        
            <!-- Modal body -->
            <div class="modal-body" align="center" id="infoModalBody">
                <form action="<%=contextPath%>/updateMemAdmin.me" method="post">
                    <table width="470" id="infoTable">
                    
                        <tr>
                            <th width="80">아이디</i>
                                
                            </th>
                            <td align="left" colspan="2">
                                <input type="text" id="userIdM" name="userIdM" value="" readonly>                       
                            </td>
                            <th width="80">회원상태</i>
                                
                            </th>
                            <td align="left" colspan="2">
                                <input type="text" id="userStatusM" name="userStatusM" value="" >                       
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td colspan="4"><input type="text" name="userNameM" id="userNameM" class="req" value=""required><br>
                                <div id="checkName">
        
                                </div></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td colspan="4"><input type="tel" name="userPhoneM" id="userPhoneM" class="req" value="" required><br>
                                <div id="checkPhone">
        
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td colspan="4"><input type="email" name="userEmailM" id="userEmailM" class="req" value="" ><br>
                                <div id="checkEmail">
        
                                </div></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td colspan="4"><input type="text" name="userAddress1" id="userAddress1" class="req" value="" autocomplete="off"></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td colspan="2"><input type="text" name="userAddress2" id="userAddress2" class="req" value="" required></td>
                            <td colspan="2"><input type="text" name="postcode" id="postcode" style="width:100px" value=""></td>
                        </tr>
                    </table>
                    <button type="submit" id="updateBtnModal">수정</button>
                    <button id="deleteBtnModal">삭제</button>
                </form>
                <br><br>
            </div>
        </div>
        
    </div>
    <script>

        

        $(document).on('click', ".atag", function(){

            var userId = $(this).text();
	       
            $.ajax({
                url:"memberInfoAdmin.me",
                data:{
                    userId:userId
                },
                success:function(m){
                    
                    console.log(m);

                    $("#userIdM").attr('value', m.mId);
                    $("#userNameM").attr('value', m.mName);
                    $("#userPhoneM").attr('value', m.mPhone);
                    $("#userEmailM").attr('value', m.mEmail);
                    $("#userAddress1").attr('value', m.mAddress);
                    $("#userAddress2").attr('value', m.subAddress);
                    $("#postcode").attr('value', m.postcode);
                    $("#userStatusM").attr('value', m.status);

                },
                error:function(){
                    console.log("ajax 통신 실패");
                }
            });
	    });
	    

	 
	
	  
   
    </script>
</div>
</body>
</html>