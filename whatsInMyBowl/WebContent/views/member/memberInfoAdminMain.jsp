<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.wimb.common.model.vo.PageInfo, 
java.util.ArrayList, com.wimb.member.model.vo.Member" 
%>
<%@ include file="../common/adminBar.jsp" %>
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
    #updateBtn, #deleteBtn, #selectDeleteBtn, .smallBtn{
        background-color: rgb(250, 223, 76);
        border:none;
        margin: 1px;
        font-size: 12px;
    }
    #modalHeader{
    	width:500px;
    	padding: 25px;
    }
    #memberListTable>tbody a{
        text-decoration: none;
        color:rgb(226, 181, 32);
        font-weight: 900;
    }
    #memberListTable>tbody a:hover{
        cursor: pointer;
        opacity: 0.5;
    }
    <!--모달창 스크롤-->
    .modal-content{
        overflow-y: initial !important
    }
    .modal-body, .modal-footer{
       
        overflow-y: auto;
    }
    .btnModal{
        background-color: rgb(250, 223, 76);
        border:none;
        margin: 1px;
        font-size: 14px;
        width: 100px;
        height:30px;
        margin: 20px 10px;
    }
    #infoTable input, #pointListTable input{
        width:100%;
        font-size: 12px;
        border-style:none;
        border-bottom-style: 1px solid lightgrey;
    }
    #infoTable th, #infoTable td, #pointListTable th, #pointListTable td {
        border-bottom: 1px solid rgb(224, 224, 224);
        font-size: 12px;
    }
    #pointListTable{
        width:90%;
        border-bottom: 1px solid rgb(224, 224, 224);
        font-size: 12px;
    }
    <!--회원 삭제 모달-->
    .delete_text{
        text-align: center;
    }
    .delete_text span{
        display: block;
        margin: 10px 0;
    }   
    .modal-body{
        overflow-x: hidden;
    }
</style>
</head>
<body>
   
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
                <button id="selectDeleteBtn" class="smallBtn" data-toggle="modal" data-target="#deleteMemberModal">
                    선택삭제
                </button>
            </div>
        </div>
        <table id="memberListTable" border style="font-size:12px; text-align: center;">
        	<thead>
	            <tr style="background-color:rgba(231, 231, 231, 0.438);" >
	                <th width="20" height="30"><input type="checkbox" id="checkAll" name="check"></th>
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
			                <td class="checkArea"><input type="checkbox" class="checkOne" name="check"></td>
			                <td class="userNo"><%= m.getmCode() %></td>
			                <td class="idTag">
			                    <a class="atag" data-toggle="modal" data-target="#updateModal"><%= m.getmId() %></a>
			                    <input type="hidden"  name="userId" value="<%= m.getmId()%>">
			                </td>
			                <td><%= m.getmName() %></td>
			                <td><%= m.getmPhone() %></td>
			                <td><%= m.getCount() %></td>
			                <td><%= m.getSum() %></td>
			                <td>
			                    <a class="pointTag"data-toggle="modal" data-target="#pointModal"><%= m.getmPoint() %></a>
			                </td>
			                <td><%= m.getEnrollDate() %></td>
                            <th>
                            	<%= m.getStatus() %>
                            	<input type="hidden"  name="userStatus" value="<%= m.getStatus()%>">
                            </th>
			                <td>
			                    <button id="deleteBtn" data-toggle="modal" data-target="#adminPwdChkModal">삭제</button>
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
                                    <input type="text" id="userStatusM" name="userStatusM" value="" readonly>                       
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
                        <button type="submit" class="btnModal" id="updateBtnModal">수정</button>
                        <button class="btnModal" id="deleteBtnModal" data-toggle="modal" data-dismiss="modal">취소</button>
                    </form>
                    <br><br>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 회원 삭제 모달-->
    <!-- The Modal -->
    <div class="modal" id="deleteMemberModal" height="300">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal body -->
                <div class="modal-body">
                    <!-- <form action="" >  -->
                        <div class="delete_text" align="center">
                            <span>선택하신 회원을 삭제합니다.</span>
                            <span>정말 삭제하시겠습니까?</span>
                            <span>(삭제 후 복구불가)</span>
                        </div>
                        <div align="center">
                            <button class="btnModal" id="memberDeleteBtn" data-toggle="modal" data-target="#adminPwdChkModal">삭제</button>
                            <button type="reset" class="btnModal" data-dismiss="modal">취소</button>
                        </div>
                    <!-- </form>  -->
                </div>
            </div>
        </div>
    </div>

    <!-- 관리자 비밀번호 입력 모달 -->
    <div class="modal" id="adminPwdChkModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal body -->
                <div class="modal-body">
                    <!--<form action="" > -->
                        <div class="delete_text" align="center">
                            <span>관리자 비밀번호 입력</span>
                            <input type="password" id="adminPassword" placeholder="비밀번호 입력">
                        </div>
                        <div class="delete_btn" align="center">
                            <button class="btnModal" onclick="pwdcheck();">삭제</button>
                            <button type="reset" class="btnModal" data-dismiss="modal">취소</button>
                        </div>
                    <!--</form>-->
                </div>
            </div>
        </div>
    </div>

    <!-- 적립금 관리 모달-->
    <div class="modal " id="pointModal" height="500">
     
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div id="pointModalHeader">
                        <h5 class="modal-title" align="center">적립금 상세 내역</h5>
                
                </div>
            
                <!-- Modal body -->
                <div class="modal-body" align="center" id="pointModalBody">
                  
                        
                            
                                <div id="pointListTable" height="300">
                                    
                                    <table id="pointListTable" >
                                        <thead>
                                            <tr style="background-color:rgba(231, 231, 231, 0.438);" height="30" align="center">
                                                <th width="20%">날짜</td>
                                                <th width="50%" colspan="2">내용</th>
                                                <th width="20%">포인트내역</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody id="nonListTbody">
                                            <tr align="center">
                                                   <td colspan="5" width="600" height="250" style="border-bottom: 1px solid lightgrey;">
                                                       조회된 포인트 내역이 없습니다.
                                                   </td>
                                              </tr>
                                        </tbody>
                                        <tbody id="listTbody">
                                                    
                                        </tbody>
                                       
                                       
                                    </table>
                                </div>
                       
                        
                     
                   
                    <br><br>
                </div>

                <!-- Modal footer 구현못할듯 ㅎ
                <div class="modal-footer" >
                    <form action="<%=contextPath%>/updatePointAdmin.me" method="post">

                        <button type="submit" class="smallBtn" id="updatePointBtn">수정</button>
                        <button class="smallBtn" data-dismiss="modal">취소</button>
                    </form>
                </div> -->
            </div>
        </div>
    </div>
    
    <script>
        //모달창 스크롤
        $(document).ready(function () {
             $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .5) 
                + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
        });

        // 개별 삭제버튼 클릭시 자동으로 체크박스 선택
        $(document).on('click', "#deleteBtn", function(){
            
            $(this).parent().siblings(".checkArea").children().prop("checked", true);
        });

        // 전체 체크버튼 클릭시 전체 체크박스 선택
	    // 전체선택 클릭시 전부 선택
        $("#checkAll").on('click', function(){
   			
   			if($("#checkAll").is(':checked')) {
   				$("input[type=checkbox]").prop("checked", true);
   			}else {
   				$("input[type=checkbox]").prop("checked", false);
   			}
   			
   		})
   		
   		// 전부 선택시 전체선택 checked
		$("input[type=checkbox]").on('click', function(){
			var total = $(".checkArea").length;
			var checked = $(".checkArea:checked").length;
			
			if(total != checked) {
				$("#checkAll").prop("checked", false);
			}else {
				$("#checkAll").prop("checked", true);
			}
		})   

        /*
        $(function(){
            $("#checkAll").click(function(){
                var chk = $(this).is(":checked");

                if(chk){
                    $(".checkArea input").attr('checked', true);
                }else{
                    $(".checkArea input").attr('checked', false);
                }
            })

        });
        */
        // 회원 id클릭시 정보 및 수정창 뜨도록
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
	    
        // 회원 삭제시
        $("#adminPwdChkModal").on('show.bs.modal', function(e){
            $("#deleteMemberModal").modal("hide")
        })
        
            function pwdcheck(){
                promise1()
                .then(promise2)
                .then(successCheck)
                .catch(pwdcheckFail);
            }

            function promise1(){
                return new Promise(function(resolve, reject){
                	
                    var userId = '<%=loginUser.getmId()%>';
                    console.log(userId);
                    $.ajax({
                        url:"pwdCheck.me",
                        data:{
                            userId:userId,
                            userPwd:$("#adminPassword").val()
                        },
                        success:function(result){
                            if(result == 'NNNNY'){
                                console.log("일치");
                                resolve(result);
                            }else{
                                console.log("불일치");
                                reject(result);
                            }
                        },
                        error:function(){
                            console.log("ajax 통신 실패");
                        }
                    })
                })
            }

            function promise2(){
                var count = $("input[name='check']:checked").length;
                var checkArr = new Array();
                $("input[name='check']:checked").each(function(){
                    checkArr.push($(this).parent().siblings(".userNo").text())
                    
                }); 
                console.log(checkArr);
                console.log(count);
                return new Promise(function(resolve, reject){
                    $.ajax({
                        url:"selectDelete.me",
                        dataType:"json",
                        traditional:true,
                        data:{
                            count:count,
                            checkArr:checkArr
                         
                        },
                        success:function(result){
                            console.log("프로미스2 성공")
                            resolve(result);
                        },
                        error:function(){
                            console.log("ajax 통신 실패");
                        }
                    })
                })
            }

            function successCheck(){
                alert("회원 탈퇴처리 완료되었습니다.");
                $("#deleteBtn").attr('style', 'color:lightgrey;')
                location.reload();
            }

            function pwdcheckFail(){
                alert("비밀번호가 일치하지 않습니다.")
                $("#adminPassword").val("")
                $("#adminPassword").focus();
            }
    
        // 적립금 상세 보기 
        
        $(document).on('click', ".pointTag", function(){
			

           
            let userId = $(this).parent().siblings(".idTag").children(".atag").text();
           // let userId = 'user01';
            let $startDate = '1900-01-01';
            
            let today = new Date();
		
			let edYear = today.getFullYear();
			let edMonth = ('0' + (today.getMonth() + 1)).slice(-2);
			let edDay = ('0' + today.getDate()).slice(-2);
			
			let $endDate = edYear + '-' + edMonth + '-' + edDay;

            console.log(userId);
            console.log($startDate);
            console.log($endDate);
             
           	var list = [];
           	
			$.ajax({
				url:"pointCheck.me",
				data:{
                    userId:userId,
                    startDate:$startDate,
                    endDate:$endDate 
                },
				type:"post",
				success:function(list){
                    var content = "";

                   
                        for(var i = 0; i<list.length; i++){
                           
                            	
                           		content += "<tr align='center'>" +
		                                    "<td>" + list[i].modifyDate + "</td>" + 
		                                    "<td colspan='2'>" + list[i].pointName + "</td>" +
		                                    "<td>" + list[i].point + "</td>" + 
		                                "</tr>";
		                
		
				                $("#nonListTbody").attr("style", "display:none");
				                $("#listTbody").html(content);

                    	}
	
				},error:function(){
					console.log("ajax 통신 실패");
				}
	
			})
		});    
    </script>
    
</body>
</html>