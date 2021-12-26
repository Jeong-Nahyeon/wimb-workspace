<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wimb.common.model.vo.PageInfo, java.util.ArrayList, com.wimb.report.model.vo.Report" %>   
    
<%
	// 신고내역 요청처리 알람창용
	String reportMsg = (String)(session.getAttribute("reportMsg"));
	
	// 페이징바 처리
	PageInfo pi = (PageInfo)(request.getAttribute("pi"));
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	// 신고글 전체 조회
	ArrayList<Report> reportList = (ArrayList<Report>)(request.getAttribute("reportList"));


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고내역</title>
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

    #report-list{
        text-align: center;
        border-bottom: 2px solid lightgray;
    }

    #report-list>thead th{
        background:lightgray;
        font-size:13px;
    }

    #report-list>tbody td{
        font-size:12px;
    }

    /* 내용 텍스트 길 경우 뒷부분 생략 되는 스타일 */
    .report-content{
        /* border:1px solid red; */
        width: 400px;
        height: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        cursor:pointer;
    }

    .reported{color:salmon;}

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
    #paging-bar, #report-search-area{
        /* border:1px solid red; */
        width:1500px;
        text-align:center !important;
    }

    #report-search-area label{
        border:1px solid lightgray;
        border-radius:3px;
        padding:3px 15px;
        margin:0;
    }

    #report-search-area input{
        border:1px solid lightgray;
        border-radius:3px;
        width:250px;
        height:30px;
        margin:0;
    }

    #report-search-area button{
        background:rgb(255, 225, 90);
        padding:4px 15px;
        margin:0;
    }


</style>
</head>
<body>

	<!-- 요청처리 성공 알림 -->
	<% if(reportMsg != null) { %>
	<script>
		
		$(function(){
			
			$("#request-success-modal b").text("<%= reportMsg %>");
			$("#request-success-modal").modal({backdrop: "static"});
			
		});
		
		<% session.removeAttribute("reportMsg"); %>
	
	</script>
	<% } %>

	<%@ include file="../common/adminBar.jsp" %>

    <div class="outer">

        <div id="menu-title">
            <h2 style="color:gray; font-weight: bold;">회원관리</h2>
            <h2 style="font-weight: bold;">&gt; 신고내역</h2>
        </div>

        <div id="list" align="center">    
            <div id="list-1">
                <!-- 등록 개수 -->
                <div align="left">
                    총 <span style="color:orange; font-weight:bold;"><%= pi.getListCount() %></span> 건
                </div>
                <!-- 블랙리스트 추가 및 신고내역 삭제 버튼 -->
                <div align="right">
                    <!-- [고려사항]
                        체크박스로 블랙리스트 추가용이랑 삭제용을 둘 다 쓸 수 없을 것 같음...?
                        블랙리스트 등록 시 로그인 안되게 해야 함
                    -->
                    <button type="button" id="insert-blackList-btn" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);">블랙리스트추가</button>
                    <button type="button" id="delete-report-btn" class="btn btn-sm btn-warning" style="background:salmon;">완전삭제</button>
                </div>
            </div>

            <!-- 신고내역 목록 -->
            <table id="report-list" class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>신고시간</th>
                        <th>신고사유</th>
                        <th>신고내용</th>
                        <th>신고작성회원</th>
                        <th>신고대상회원</th>
                        <th>누적신고</th>
                    </tr>
                </thead>
                <tbody>
                	<% if(reportList == null) { %>
	                    <tr>
	                        <td colspan="8">등록된 신고내역이 없습니다.</td>
	                    </tr>
                    <% } else { %>
	                    <% for(Report r : reportList) {%>
		                    <tr>
		                        <td>
		                            <input type="checkbox" class="check-report">
		                        </td>
		                        <td class="reportCode"><%= r.getReportCode() %></td>
		                        <td class="reportDate"><%= r.getReportDate() %></td>
		                        <td class="reportCategory"><%= r.getReportCategory() %></td>
		                        <td align="center">
		                        	<input type="hidden" name="rCode" value="<%= r.getrCode() %>">
		                        	<div class="report-content"><%= r.getReportContent() %></div>
		                        </td>
		                        <td class="reportmCode"><%= r.getmCode() %></td>
		                        <td class="reviewmCode"><%= r.getReportedMemberCode() %></td>
		                        <td class="reportCount"><%= r.getmReportCount() %>회</td>
		                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>

            
            <script>
                
                $(function(){
                    
                    //  신고글 상세 조회용 ajax

            		$("#report-list").on("click", ".report-content", function(){
					
                        $.ajax({
                            url:"detail.arep",
                            data:{
                                rcode:$(this).prev().val(),
                                reportCode:$(this).parent().parent().find(".reportCode").text()
                            },
                            success:function(detailList){

                                const $review = detailList[0];
                                const $report = detailList[1];

                                // 신고작성회원
                                $("#reportId").text($report.mId);
                                $("#reportName").text($report.mName);
                                $("#reportDate").text($report.reportDate);
                                $("#reportCategory").text($report.reportCategory);
                                $("#reportContent").text($report.reportContent);


                                // 신고대상회원
                                $("#reviewId").text($review.mId);
                                $("#reviewName").text($review.mName);
                                $("#reviewDate").text($review.rDate);
                                $("#reviewContent").text($review.rContent);
                                
                                $("#report-detail-modal").modal("show");

                                
                            }, error:function(){
                                console.log("ajax 통신 실패");
                            }
                            
                        });
                    });
            		


                    // 블랙리스트 등록용 ajax

                    $("#list").on("click", "#insert-blackList-btn", function(){

                        let checkboxArr = [];
    
                        $(".check-report:checked").each(function(){
                            checkboxArr.push($(this).parent().parent().find(".reviewmCode").text());
                        });
                        
                        const reviewmCodeArr = checkboxArr.join(",");

                        console.log(reviewmCodeArr);

                    	if(checkboxArr.length == 0){ // 체크 안 하고 클릭했을 경우 => 경고 알람창

                    		alert("삭제할 신고글이 선택되지 않았습니다");

                    	} else{ // 체크 후 클릭했을 경우 => 블랙리스트 등록 모달창 모달창 

                            
                            // 블랙리스트 등록 모달창 열기
                    		$("#insert-blackList-modal").modal("show");
                            
                            // 블랙리스트 등록 모달창 모달창  => 취소 버튼 클릭 시
                            $("#insert-cancel-btn").click(function(){
                                location.reload();
                            });
                            
                            // 블랙리스트 등록 모달창 모달창  => 등록 버튼 클릭 시
                            $("#insert-btn").click(function(){
                                
                                $.ajax({

                                    url:"insertBlackList.arep",
                                    data:{
                                        reviewmCodeArr:reviewmCodeArr,
                                        blackReason:$("#insert-blackList-modal input[name=blackListCategory]").val()
                                    },
                                    success:function(result){ // 매개변수 result로 처리된 행수를 담은 응답 데이터 받아주기
                                    
                                    if(result > 0){ // 등록 성공
                                        console.log(result);
                                        // 블랙리스트 등록 모달창 모달창 모달창 닫기
                                        $("#insert-blackList-modal").modal("hide");

                                        // 요청처리 성공 모달창 열기
                                        $("#request-success-modal").modal("show");
                                        $("#request-success-modal b").text("성공적으로 등록되었습니다");

                                        $("#success-btn").click(function(){
                                            location.reload();
                                        });
                                        
                                    } else{ // 등록 실패
                                        alert("블랙리스트 등록 실패");
                                        location.reload();
                                    }

                                    }, error:function(){
                                        console.log("ajax 통신 실패");
                                    } 

                                });

                            });

                    	}   

                    });




                    // 신고글 삭제용 ajax

                    $("#list").on("click", "#delete-report-btn", function(){

                        let checkboxArr = [];
    
                        $(".check-report:checked").each(function(){
                            checkboxArr.push($(this).parent().next().text());
                        });
                        
                        const reportCodeArr = checkboxArr.join(",");

                        console.log(reportCodeArr);

                    	if(checkboxArr.length == 0){ // 체크 안 하고 클릭했을 경우 => 경고 알람창

                    		alert("삭제할 신고글이 선택되지 않았습니다");

                    	} else{ // 체크 후 클릭했을 경우 => 신고글 삭제 모달창 

                            
                            // 신고글 삭제 모달창 열기
                    		$("#delete-report-modal").modal("show");
                            
                            // 신고글 삭제 모달창  => 취소 버튼 클릭 시
                            $("#delete-cancel-btn").click(function(){
                                location.reload();
                            });
                            
                            // 신고글 삭제 모달창  => 삭제 버튼 클릭 시
                            $("#delete-btn").click(function(){
                                
                                $.ajax({

                                    url:"delete.arep",
                                    data:{reportCodeArr:reportCodeArr},
                                    success:function(result){ // 매개변수 result로 처리된 행수를 담은 응답 데이터 받아주기
                                    
                                    if(result > 0){ // 삭제 성공
                                        console.log(result);
                                        // 신고글 삭제 모달창 모달창 닫기
                                        $("#delete-report-modal").modal("hide");

                                        // 요청처리 성공 모달창 열기
                                        $("#request-success-modal").modal("show");
                                        $("#request-success-modal b").text("성공적으로 삭제되었습니다");

                                        $("#success-btn").click(function(){
                                            location.reload();
                                        });
                                        
                                    } else{ // 삭제 실패
                                        alert("신고글 삭제 실패");
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
                        <a class ="btn btn-sm" href="<%= contextPath %>/list.arep?cpage=<%= currentPage - 1 %>">&lt;</a>
                <% } %>
                
                <% for(int p=startPage; p<=endPage; p++ ) { %>
                    <% if(p == currentPage) { %>
                        <a  class ="btn btn-sm" disabled><%= p %></a>
                    <% } else { %>
                        <a class ="btn btn-sm" href="<%= contextPath %>/list.arep?cpage=<%= p %>"><%= p %></a>
                    <% } %>
                <% } %>
                
                <% if(currentPage != maxPage) { %>
                        <a class ="btn btn-sm" href="<%= contextPath %>/list.arep?cpage=<%= currentPage + 1 %>">&gt;</a>
                <% } %>
            </div>
           
            <br>

            <!-- 신고작성회원으로 신고글 검색 -->
            <div id="report-search-area">
                <label for="report-search">신고대상회원번호</label>
                <input type="search" id="report-search" name="searchKeyword">
                <button id="report-search-btn" class="btn btn-sm">조회</button>
            </div>

            <!-- 신고글 검색용 ajax -->
            <script>
                $(function(){

                    $("#report-search-btn").click(function(){

                        if($("#report-search").val() == ""){
                            alert("검색할 신고대상회원의 회원번호를 입력해 주세요");
                        } else {

                            $.ajax({
                                url:"search.arep",
                                data:{searchKeyword:$("#report-search").val()},
                                success:function(list){

                                    $("#report-list tbody").html("");

                                        let result = "";
                                        
                                        for(let i=0; i<list.length; i++){
                                            
                                            result += "<tr>"
                                                        + "<td><input type='checkbox' class='check-report'></td>"
                                                        + "<td class='reportCode'>" + list[i].reportCode + "</td>"
                                                        + "<td class='reportDate'>" + list[i].reportDate + "</td>"
                                                        + "<td class='reportCategory'>" + list[i].reportCategory + "</td>"
                                                        + "<td align='center'>"
                                                            + "<input type='hidden' name='rCode' value='" + list[i].rCode +"'>"
                                                            + "<div class='report-content'>" + list[i].reportContent + "</div>"
                                                        + "</td>"    
                                                        + "<td calss='reportmCode'>" + list[i].mCode + "</td>"
                                                        + "<td calss='reviewmCode'>" + list[i].reportedMemberCode + "</td>"
                                                        + "<td calss='reportCount'>" + list[i].mReportCount + "</td>"
                                                    + "</tr>";

                                        }

                                        $("#list-1 span").text(list.length);
                                        $("#report-list tbody").html(result);
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




    <!-- 리뷰신고 상세조회 모달창 -->

    <div class="modal fade" id="report-detail-modal">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
          <div class="modal-content detail-report-modal">
          
            <!-- Modal Header -->
            <div class="modal-header">
                <h6 class="modal-title" style="margin-left:330px; font-weight:bolder;">리뷰 상세 조회</h6>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body" style="width:100%; padding:30px;">
                
                <h5 style="color:orange; font-weight:bolder;">신고작성회원 정보</h5>
                <table style="width:100%; height:320px; margin:10px;">
                    <tr>
                        <th>아이디</th>
                        <td colspan="3" id="reportId"></td>
                    </tr>
                    <tr>
                        <th>회원명</th>
                        <td colspan="3" id="reportName"></td>
                    </tr>
                    <tr>
                        <th>신고시간</th>
                        <td id="reportDate"></td>
                        <th>신고사유</th>
                        <td id="reportCategory"></td>
                    </tr>
                    <tr>
                        <th colspan="4">신고내용</th>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div id="reportContent" style="border:1px solid lightgray; width:100%; height:200px; padding:5px;">
                            </div>
                        </td>
                    </tr>
                </table>
                <hr>

                <h5 style="color:orange; font-weight:bolder;">신고대상회원 정보</h5>
                <table style="width:100%; height:280px; margin:10px;">
                    <tr>
                        <th>아이디</th>
                        <td id="reviewId"></td>
                        <th>회원명</th>
                        <td id="reviewName"></td>
                        <th>작성시간</th>
                        <td id="reviewDate"></td>
                    </tr>
                    <tr>
                        <th colspan="6">리뷰내용</th>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <div id="reviewContent" style="border:1px solid lightgray; width:100%; height:200px; padding:5px;">
                            </div>
                        </td>
                    </tr>
                </table>

            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <div align="center" style="width:100%;">
                    <button type="submit" class="btn btn-sm" style="background:rgb(255, 225, 90); margin:0px 5px;" data-dismiss="modal">확인</button>
                </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>



    <!-- 블랙리스트 등록 모달창 -->

    <div class="modal fade" id="insert-blackList-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content blackList-insert-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
                    <div align="center" style="height:100%; padding-top:40px;">
                        <b>등록사유 : </b>
                        <input type="text" name="blackListCategory" placeholder="직접입력" list="blackList-category">
                        <datalist id="blackList-category">
                            <option>욕설</option>
                            <option>도배</option>
                            <option>음란/청소년 유해</option>
                            <option>티회원 비방</option>
                            <option>타사 홍보</option>
                        </datalist>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area" style="border:none; background: white; border-radius: 0;">
					<div align="center" style="width:100%;">
						<button type="submit" id="insert-cancel-btn" class="btn" style="border:1px solid lightgray; margin:0px 5px;">취소</button>
						<button type="submit" id="insert-btn" class="btn" style="background:rgb(255, 225, 90); margin:0px 5px;">등록</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#insert-blackList-btn").click(function(){
			$("#insert-blackList-modal").modal({backdrop: "static"});
			});
		});
	</script>


    <!-- 신고글 삭제 모달창 -->

    <div class="modal fade" id="delete-report-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content report-delete-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
                    <div align="center" style="height:100%; line-height:200px;">
                        <b>신고글을 삭제하시겠습니까?</b>
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



     <!-- 요청처리 성공 모달창 -->

	<div class="modal fade" id="request-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content success-request-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
					<div class="request-success-img" align="center" style=" height:60%; line-height:150px;">
                        <i class="fas fa-check fa-4x" style="color:rgb(255, 225, 90);"></i>
                    </div>

                    <div align="center" style="height:40%; line-height:60px;">
                        <b><!-- 요청처리 성공 메세지 --></b>
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