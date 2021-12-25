<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.wimb.common.model.vo.PageInfo, java.util.ArrayList, com.wimb.review.model.vo.Review" %>   

<%	
    // 완제품 페이지 요청처리 알람창용
    String reviewMsg = (String)(session.getAttribute("reviewMsg"));

	// 페이징바 처리
	PageInfo pi = (PageInfo)(request.getAttribute("pi"));
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	// 리뷰 전체 조회
	ArrayList<Review> reviewList = (ArrayList<Review>)(request.getAttribute("reviewList"));
	// 리뷰번호, 상품명, 리뷰내용, 최종등록일, 메인게시여부, 글게시여부, 포인트적립여부, 회원아이디
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰관리</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .outer{
        /* border:1px solid red; */
        margin-left:150px;
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
        height:auto;
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

    #review-list{
        text-align: center;
        border-bottom: 2px solid lightgray;
    }

    #review-list>thead th{
        background:lightgray;
        font-size:13px;
    }

    #review-list>tbody td{
        font-size:12px;
    }

    #review-list>tbody tr{
        height:50px !important;
    }
    
    /* 내용 텍스트 길 경우 뒷부분 생략 되는 스타일 */
    .review-content{
        /* border:1px solid red; */
        width: 400px;
        height: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .review-detail{
        color:black;
        text-decoration:none;
        cursor: pointer;
    }

    #paging-bar, #review-search-area{
        /* border:1px solid red; */
        width:1500px;
        margin-left: 150px;
        text-align:center !important;
    }

    #review-search-area label{
        border:1px solid lightgray;
        border-radius:3px;
        padding:3px 15px;
        margin:0;
    }

    #review-search-area input{
        border:1px solid lightgray;
        border-radius:3px;
        width:250px;
        height:30px;
        margin:0;
    }

    #review-search-area button{
        background:rgb(255, 225, 90);
        padding:4px 15px;
        margin:0;
    }


    /* 리뷰 상세조회 모달창 */
    #mainStatus-update-form th{
        font-weight:bolder;
        text-align: center;
    }

</style>
</head>
<body>

	<!-- 요청처리 성공 알림 -->
	<% if(reviewMsg != null) { %>
	<script>
		
		$(function(){
			
			$("#success-modal b").text("<%= reviewMsg %>");
			$("#success-modal").modal({backdrop: "static"});
			
		});
		
		<% session.removeAttribute("reviewMsg"); %>
	
	</script>
	<% } %>

	<%@ include file="../common/adminBar.jsp" %>

    <div class="outer">

        <div id="menu-title">
            <h2 style="color:gray; font-weight: bold;">상품관리</h2>
            <h2 style="font-weight: bold;">&gt; 리뷰관리</h2>
        </div>

        <div id="list" align="center">    
            <div id="list-1">
                <!-- 등록 개수 -->
                <div align="left">
                    총 <span style="color:orange; font-weight:bold;">20</span> 건
                </div>
                <!-- 리뷰삭제 버튼 -->
                <div align="right">
                    <button type="button" id="delete-review-btn" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);">선택삭제</button>
                </div>
            </div>

            <!-- 상품 리뷰 목록 -->
            <table id="review-list" height="500px" class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>작성자</th>
                        <th>구매 상품</th>
                        <th>최종등록일</th>
                        <th width="300">리뷰 내용</th>
                        <th>적립금 지급</th>
                        <th>메인노출여부</th>
                        <th>노출여부</th>
                    </tr>
                </thead>
                <tbody>
                
                	<% if(reviewList == null) { %>
	                    <tr>
	                        <td colspan="8">등록된 리뷰가 없습니다.</td>
	                    </tr>
                    <% } else { %>
	                    <% for(Review r : reviewList) {%>
		                    <tr>
		                        <td>
		                            <input type="checkbox" class="check-delete" name="checkrCode" value="<%= r.getrCode() %>">
		                        </td>
		                        <td class="review-code"><%= r.getrCode() %></td>
		                        <td><%= r.getmName() %></td>
		                        <td><%= r.getpCode() %></td>
		                        <td><%= r.getrDate() %></td>
		                        <td>
		                        	<div class="review-content">
		                        	<a class="review-detail"><%= r.getrContent() %></a>
		                        	</div>
		                        </td>
		                        <td>
		                        	<% if(r.getPointStatus().equals("N")) { %>
                                        <!-- 적립금 지금 전 -->
                                        <a href="" class="btn btn-sm btn-warning">적립금지급</a>
		                            <% } else { %>
                                        <!-- 적립금 지급 후 -->
                                        지급완료
		                   		    <% } %>    
		                        </td>
		                        <td><%= r.getrMainstatus() %></td>
		                        <td><%= r.getrStatus() %></td>
		                    </tr>
	                    <% } %>
                    <% } %>
                    
                </tbody>
            </table>

            <!-- 리뷰 상세 조회용 ajax -->
            <script>
            
            	$(function(){
            		
            		// 카테고리 옵션별 조회 시 해당 요소가 동적으로 새로 만들어지기 때문에 on메소드 3번 방법으로 작성해야 함!!!
            		$("#review-list").on("click", ".review-detail", (function(){
            			$.ajax({
                            url:"detailAjax.arev",
                            data:{
                                rcode:$(this).parent().parent().parent().find("input[name=checkrCode]").val()
                            },
                            success:function(r){

                                console.log(r);

                                $("#rCode").val(r.rCode);

                                $("#rDate").text(r.rDate);
                                
                                $("#mainStatus-update-form select[name=mainStatus] option").each(function(){
                                        if($(this).text() == r.rMainstatus){
                                            $(this).attr("selected", true);
                                        }
                                });

                                $("#mId").text(r.mName);
                                $("#pName").text(r.pCode);
                                $("#rContent").text(r.rContent);
                                
                                if(r.mainImg != null){
                                    $("#mainImg").attr("src", r.mainImg);
                                }
                                $("#review-detail-modal").modal({backdrop: "static"});
    							
                            }, error:function(){
                                console.log("ajax 통신 실패");
                            }
                        });
            		}));
            		
            	});
            
            </script>
   
    </div>

    <!-- 페이징바  -->
    <div id="paging-bar">
        <% if(currentPage != 1) { %>
                <a class ="btn btn-sm" href="<%= contextPath %>/list.arev?cpage=<%= currentPage - 1 %>">&lt;</a>
        <% } %>
        
        <% for(int p=startPage; p<=endPage; p++ ) { %>
            <% if(p == currentPage) { %>
                <a  class ="btn btn-sm" disabled><%= p %></a>
            <% } else { %>
                <a class ="btn btn-sm" href="<%= contextPath %>/list.arev?cpage=<%= p %>"><%= p %></a>
            <% } %>
        <% } %>
        
        <% if(currentPage != maxPage) { %>
                <a class ="btn btn-sm" href="<%= contextPath %>/list.arev?cpage=<%= currentPage + 1 %>">&gt;</a>
        <% } %>
    </div>
    
    <br>

    <!-- 회원아이디로 리뷰 검색 -->
        <div id="review-search-area">
        <label for="review-search">상품명</label>
        <input type="search" id="review-search" name="searchKeyword">
        <button id="review-search-btn" class="btn btn-sm">조회</button>
        </div>

    <!-- 테스트용 -->
    <button id="delete-success-btn">리뷰 삭제 성공창 테스트</button>
	

    
	
    <!-- 리뷰 상세조회 모달창 -->
    <div class="modal fade" id="review-detail-modal">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
          <div class="modal-content detail-review-modal">
          
            <!-- Modal Header -->
            <div class="modal-header">
                <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">리뷰 상세 조회</h6>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body" align="center">
                <form id="mainStatus-update-form" action="<%= contextPath %>/updateMainStatus.arev">
                    <input id="rCode" type="hidden" name="rcode">
                    <table style="width:700px;">
                        <thead>
                            <tr>
                                <th width="175">최종등록일</th>
                                <td id="rDate" width="175"></td>
                                <th width="175">메인표시여부</th>
                                <td width="175">
                                    <select name="mainStatus" style="width: 100%;">
                                        <option>N</option>
                                        <option>Y</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td id="mId" colspan="3"></td>
                            </tr>
                            <tr>
                                <th>구매상품</th>
                                <td id="pName" colspan="3"></td>
                            </tr>
                            <tr>
                                <th colspan="4">리뷰내용</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">
                                    <div id="rContent" style=" box-sizing: border-box; width:100%; height:200px; border:1px solid lightgray; padding:5px;">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div style="width:100%; padding:5px;">
                                    	<img id="mainImg" src="" width="100%">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <div align="center" style="width:100%;">
                    <button type="submit" class="btn btn-sm" style="border:1px solid lightgray; margin:0px 5px;" data-dismiss="modal">확인</button>
                    <button type="submit" class="btn btn-sm" style="background:rgb(255, 225, 90); margin:0px 5px;" form="mainStatus-update-form">메인표시여부 수정</button>
                </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
	<script>
		$(document).ready(function(){
			$("#review-detail-btn").click(function(){
			$("#review-detail-modal").modal({backdrop: "static"});
			});
		});
	</script>


    <!-- 리뷰 삭제 모달창 -->

    <div class="modal fade" id="delete-review-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content review-delete-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
                    <div align="center" style="height:100%; line-height:200px;">
                        <b>선택한 리뷰를 삭제하시겠습니까? (삭제 후 복구 불가)</b>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area" style="border:none; background: white; border-radius: 0;">
					<div align="center" style="width:100%;">
						<button type="submit" class="btn" style="border:1px solid lightgray; margin:0px 5px;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:rgb(255, 225, 90); margin:0px 5px;">삭제</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#delete-review-btn").click(function(){
			$("#delete-review-modal").modal({backdrop: "static"});
			});
		});
	</script>


    <!-- 리뷰삭제 성공 모달창 -->

	<div class="modal fade" id="delete-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content success-delete-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
					<div class="delete-success-img" align="center" style=" height:60%; line-height:150px;">
                        <i class="fas fa-check fa-4x" style="color:rgb(255, 225, 90);"></i>
                    </div>

                    <div align="center" style="height:40%; line-height:60px;">
                        <b>리뷰 삭제를 완료했습니다.</b>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area" style="border:none; background: white; border-radius: 0;">
					<div align="center" style="width:100%;">
						<button type="submit" class="btn" style="background:rgb(255, 225, 90); margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#delete-success-btn").click(function(){
			$("#delete-success-modal").modal({backdrop: "static"});
			});
		});
	</script>


</body>
</html>