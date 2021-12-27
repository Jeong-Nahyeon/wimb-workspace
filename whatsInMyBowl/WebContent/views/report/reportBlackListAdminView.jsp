<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.wimb.common.model.vo.PageInfo, java.util.ArrayList, com.wimb.member.model.vo.Member" %>   
    
<%

	// 페이징바 처리
	PageInfo pi = (PageInfo)(request.getAttribute("pi"));
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	// 블랙리스트 전체 조회
	ArrayList<Member> blackList = (ArrayList<Member>)(request.getAttribute("blackList"));


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 관리</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .outer{
        /* border:1px solid red; */
        margin-left: 150px;
        margin-top:100px;
        width:1800px;
        height:1000px;
    }

    #menu-title{
        margin-left:150px;
    }

    #menu-title h2{
        display:inline;
        font-size:25px;
    }
    #list{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:1500px;
        margin:auto; 
    }

    #list-1{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:100%;
        height:30px;
        line-height:30px;
        margin-bottom: 10px;
    }

    #list-1 div{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:50%;
        height:100%;
        float:left;
    }

    #black-list{
        text-align: center;
        border-bottom: 2px solid lightgray;
    }

    #black-list>thead th{
        background:lightgray;
        font-size:13px;
    }

    #black-list>tbody td{
        font-size:12px;
    }

    #select-form span{
        border:1px solid lightgray;
        border-radius:3px;
        padding:4px 15px;
    }

    #select-form input{
        border:1px solid lightgray;
        border-radius:3px;
        width:250px;
        height:30px;
    }

    #select-form button{
        /* border-radius:3px; */
        padding:5px 15px;
    }

    /* 페이징바, 리뷰검색 */
    #paging-bar, #black-search-area{
        /* border:1px solid red; */
        width:1500px;
        text-align:center !important;
    }

    #black-search-area label{
        border:1px solid lightgray;
        border-radius:3px;
        padding:3px 15px;
        margin:0;
    }

    #black-search-area input{
        border:1px solid lightgray;
        border-radius:3px;
        width:250px;
        height:30px;
        margin:0;
    }

    #black-search-area button{
        background:rgb(255, 225, 90);
        padding:4px 15px;
        margin:0;
    }


</style>
</head>
<body>

	<%@ include file="../common/adminBar.jsp" %>
	
	<div class="outer">
        <div id="menu-title">
            <h2 style="color:gray; font-weight: bold;">회원관리</h2>
            <h2 style="font-weight: bold;">&gt; 블랙리스트 관리</h2>
        </div>

        <div id="list" align="center">    
            <div id="list-1">
                <!-- 등록 개수 -->
                <div align="left">
                    총 <span style="color:orange; font-weight:bold;"><%= pi.getListCount() %></span> 건
                </div>
                <!-- 블랙리스트 삭제 버튼 -->
                <div align="right">
                    <button type="button" id="delete-blackList-btn" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);">블랙리스트 삭제</button>
                </div>
            </div>

            <!-- 블랙리스트 목록 -->
            <table id="black-list" class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>회원번호</th>
                        <th>아이디</th>
                        <th>회원명</th>
                        <th>연락처</th>
                        <th>등록일</th>
                        <th>사유</th>
                        <th>누적신고</th>
                    </tr>
                </thead>
                <tbody>
                	<% if(blackList.isEmpty()) { %>
	                    <tr>
	                        <td colspan="8">등록된 블랙리스트가 없습니다.</td>
	                    </tr>
                    <% } else { %>
                   		<% for(Member m : blackList) {%>
	                    <tr>
	                        <td>
	                            <input type="checkbox" class="check-delete" name="mcode" value="<%= m.getmCode() %>">
	                        </td>
	                        <td><%= m.getmCode() %></td>
	                        <td><%= m.getmId() %></td>
	                        <td><%= m.getmName() %></td>
	                        <td><%= m.getmPhone() %></td>
	                        <td><%= m.getmBlackDate() %></td>
	                        <td><%= m.getmBlackReason() %></td>
	                        <td><%= m.getmReportCount() %>회</td>
	                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>

            <script>
                
                $(function(){
                    
                    // 블랙리스트 삭제용 ajax

                    $("#list").on("click", "#delete-blackList-btn", function(){

                        let checkboxArr = [];
    
                        $(".check-delete:checked").each(function(){
                            checkboxArr.push($(this).val());
                        });
                        
                        const mCodeArr = checkboxArr.join(",");

                        console.log(mCodeArr);

                    	if(checkboxArr.length == 0){ // 체크 안 하고 클릭했을 경우 => 경고 알람창

                    		alert("블랙리스트에서 삭제할 회원이 선택되지 않았습니다");

                    	} else{ // 체크 후 클릭했을 경우 => 블랙리스트 삭제 모달창 

                            
                            // 블랙리스트 삭제 모달창 열기
                    		$("#delete-blackList-modal").modal("show");
                            
                            // 블랙리스트 삭제 모달창  => 취소 버튼 클릭 시
                            $("#delete-cancel-btn").click(function(){
                                location.reload();
                            });
                            
                            // 블랙리스트 삭제 모달창  => 삭제 버튼 클릭 시
                            $("#delete-btn").click(function(){
                                
                                $.ajax({

                                    url:"delete.black",
                                    data:{mCodeArr:mCodeArr},
                                    success:function(result){ // 매개변수 result로 처리된 행수를 담은 응답 데이터 받아주기
                                    
                                    if(result > 0){ // 삭제 성공
                                        console.log(result);
                                        // 블랙리스트 삭제 모달창 모달창 닫기
                                        $("#delete-blackList-modal").modal("hide");

                                        // 블랙리스트 삭제 성공 모달창 열기
                                        $("#delete-success-modal").modal("show");

                                        $("#success-btn").click(function(){
                                            location.reload();
                                        });
                                        
                                    } else{ // 삭제 실패
                                        alert("블랙리스트에서 해당 회원 삭제 실패");
                                        location.reload();
                                    }

                                    }, error:function(){
                                        console.log("ajax 통신 실패");
                                    } 

                                });

                            });

                    	}   

                    });


            	});
            
            </script>

            
            <!-- 페이징바  -->
            <div id="paging-bar">
                <% if(currentPage != 1) { %>
                        <a class ="btn btn-sm" href="<%= contextPath %>/list.black?cpage=<%= currentPage - 1 %>">&lt;</a>
                <% } %>
                
                <% for(int p=startPage; p<=endPage; p++ ) { %>
                    <% if(p == currentPage) { %>
                        <a  class ="btn btn-sm" disabled><%= p %></a>
                    <% } else { %>
                        <a class ="btn btn-sm" href="<%= contextPath %>/list.black?cpage=<%= p %>"><%= p %></a>
                    <% } %>
                <% } %>
                
                <% if(currentPage != maxPage) { %>
                        <a class ="btn btn-sm" href="<%= contextPath %>/list.black?cpage=<%= currentPage + 1 %>">&gt;</a>
                <% } %>
            </div>
            
            <br>

            <!-- 블랙리스트 회원 아이디로 검색 -->
            <div id="black-search-area">
                <label for="black-search">회원 ID</label>
                <input type="search" id="black-search" name="searchKeyword">
                <button id="black-search-btn" class="btn btn-sm">조회</button>
            </div>

            <!-- 블랙리스트 검색용 ajax -->
            <script>
                $(function(){

                    $("#black-search-btn").click(function(){

                        if($("#black-search").val() == ""){
                            alert("검색할 회원 ID를 입력해 주세요");
                        } else {

                            $.ajax({
                                url:"search.black",
                                data:{searchKeyword:$("#black-search").val()},
                                success:function(list){

                                    $("#black-list tbody").html("");

                                        let result = "";
                                        
                                        for(let i=0; i<list.length; i++){
                                            
                                            result += "<tr>"
                                                        + "<td>"
                                                            + "<input type='checkbox' class='check-delete' name='mcode' value='" + list[i].mCode + "'>"
                                                        +"</td>"
                                                        + "<td>" + list[i].mCode + "</td>"
                                                        + "<td>" + list[i].mId + "</td>"
                                                        + "<td>" + list[i].mName + "</td>"
                                                        + "<td>" + list[i].mPhone + "</td>"
                                                        + "<td>" + list[i].mBlackDate + "</td>"
                                                        + "<td>" + list[i].mBlackReason + "</td>"
                                                        + "<td>" + list[i].mReportCount + "</td>"
                                                    + "</tr>";

                                        }

                                        $("#list-1 span").text(list.length);
                                        $("#black-list tbody").html(result);
                                        $("#paging-bar").text("");


                                }, error:function(){
                                    console.log("ajax 통신 실패");
                                }

                            });

                        }

                    });

                });
            </script>


        </div>    
    </div>


    <!-- 블랙리스트 삭제 모달창 -->

    <div class="modal fade" id="delete-blackList-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content blackList-delete-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
                    <div align="center" style="height:100%; line-height:200px;">
                        <b>선택한 회원을 블랙리스트에서 삭제하시겠습니까?</b>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area" style="border:none; background: white; border-radius: 0;">
					<div align="center" style="width:100%;">
						<button type="submit" id="delete-cancel-btn" class="btn" style="border:1px solid lightgray; margin:0px 5px;">취소</button>
						<button type="submit" id="delete-btn" class="btn" style="background:rgb(255, 225, 90); margin:0px 5px;">삭제</button>
					</div>
				</div>

			</div>
		</div>
	</div>		


    <!-- 블랙리스트 삭제 성공 모달창 -->

	<div class="modal fade" id="delete-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content success-delete-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
					<div class="delete-success-img" align="center" style=" height:60%; line-height:150px;">
                        <i class="fas fa-check fa-4x" style="color:rgb(255, 225, 90);"></i>
                    </div>

                    <div align="center" style="height:40%; line-height:60px;">
                        <b>성공적으로 블랙리스트에서 삭제했습니다.</b>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area" style="border:none; background: white; border-radius: 0;">
					<div align="center" style="width:100%;">
						<button type="submit" id="success-btn" class="btn" style="background:rgb(255, 225, 90); margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		

</body>
</html>