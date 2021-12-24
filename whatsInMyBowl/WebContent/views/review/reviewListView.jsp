<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.wimb.member.model.vo.Member, com.wimb.review.model.vo.Review,
				 com.wimb.product.model.vo.Product, com.wimb.payment.model.vo.Order, com.wimb.common.model.vo.PageInfo,
				 com.wimb.common.model.vo.File" %>
    
<%	
	String contextPath = request.getContextPath();
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	
	// 리뷰 전체 조회
	ArrayList<Review> reviewList = (ArrayList<Review>)(request.getAttribute("reviewList"));
	
	// 리뷰 상품 정보
	Product product = (Product)(request.getAttribute("product"));
		
	// 주문 정보
	Order orderInfo = (Order)(request.getAttribute("orderInfo"));
	
	// 수정용 상세 리뷰 정보
	//Review review = (Review)(session.getAttribute("review"));
	
	// 수정용 첨부파일 => null 가능
	//ArrayList<File> fileList = (ArrayList<File>)(session.getAttribute("fileList"));
	
	// 페이징용
    PageInfo pi = (PageInfo)(request.getAttribute("pi"));
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	// 성공 알림용
	String detailMsg = (String)(session.getAttribute("detailMsg"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	
	.review{
		/* border:1px solid red; */
		box-sizing: border-box;
		margin:auto;
		margin-bottom: 20px;
		width:900px;
		/* height:800px; */
        height:auto;
	}

	.review-title, .review-btn1, .review-content, .review-btn2{
		/* border:1px solid red; */
		box-sizing: border-box;
		width:100%;
        height:auto;
	}

	.review-title{
        border-bottom: 2px solid lightgray;
		height:40px;
		margin-bottom:10px;
	}

	.review-btn1, .review-btn2{
		height:40px;
		margin-bottom:20px;
	}

	.review-btn1-left, .review-btn1-right{
		/* border:1px solid red; */
		box-sizing: border-box;
		width:50%;
		height:100%;
		float:left;
	}

    .review-btn1 a{
        box-sizing: border-box;
		border:1px solid lightgray;
        display:block;
        width:100%;
        height:100%;
        color:black;
        text-align: center;
        line-height: 35px;
        text-decoration: none !important;
        font-size:12px;
    }
	
	.review-content{
        /* border:1px solid red; */
		height:650px;
		margin-bottom:20px;
	}

	.review-content-left{
		/* border:1px solid red; */
		box-sizing: border-box;
		border:1px solid lightgray;
		width:20%;
		height:180px;
		float:left;
		margin-bottom:10px;
		text-align:center;
    }

    .review-content-left>img{
        box-sizing: border-box;
        width:100%;
        height:100%;
    }

	.review-content-right{
		/* border:1px solid red; */
		box-sizing: border-box;
		width:80%;
		height:180px;
		float:left;
        padding:10px;
        margin-bottom:10px;
	}

    /* 상품후기 수정, 삭제, 신고 버튼 */
	
    .review-content-right a{
        color:black;
        text-align: center;
        text-decoration: none !important;
        cursor: pointer;
    }

    .review-btn2-left, .review-btn2-center, .review-btn2-right{
		/* border:1px solid red; */
		box-sizing: border-box;
		height:40px;
		float:left;
	}

    .review-btn2-center{
        width:60%;
        text-align: center;
        line-height: 35px;
    }

    .review-btn2-right{
        width:20%;
        text-align: right;
    }

    .review-btn2-right>button{
        box-sizing: border-box;
        background:#9BD5BD;
        color:white;
        font-weight: bolder;
    }

    /* 모달창 스타일 */


	/* 리뷰 등록 및 수정 모달창 */

    .review-product{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:100%;
        height:120px;
    }

    .review-product-img{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:20%;
        height:100%;
        line-height: 110px;
        float: left;
    }

    .review-product-name{
        /* border:1px solid red; */
        box-sizing:border-box;
        width:80%;
        height:100%;
        float: left;
        text-align: left;
    }

    .review-form-content{
        box-sizing:border-box;
        width:100%;
        height:500px;
        text-align: center;
    }  

    .review-form-content input, .review-form-content textarea{
        border:1px solid lightgray;
        width:100%;
    }


    /* 리뷰 신고 창  */

    .report-review{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:100%;
        height:120px;
    }

    .report-review-img{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:20%;
        height:100%;
        line-height: 110px;
        float: left;
    }

    .report-review-title{
        /* border:1px solid red; */
        box-sizing:border-box;
        width:80%;
        height:100%;
        float: left;
    }

    .report-form-content{
        box-sizing:border-box;
        width:100%;
        height:500px;
        text-align: center;
    }  

    .report-form-content input, .report-form-content textarea, .report-form-content select{
        border:1px solid lightgray;
        width:100%;
    }


    
</style>
</head>
<body>
    <!-- 요청처리 성공 알림 -->
    <% if(detailMsg != null) { %>
        <script>
            
            $(function(){
                
                $("#review-success-modal b").text("<%= detailMsg %>");
                $("#review-success-modal").modal({backdrop: false});
                
                <% session.removeAttribute("detailMsg"); %>
	            
            });

            
        </script>
            
	<% } %>

    <div id="review" class="review">
        <div class="review-title">
            <h4 style="font-weight: bolder;">상품후기</h4>
        </div>

        <div class="review-btn1">
            <div class="review-btn1-left">
                <a href="<%= contextPath %>/reviewList.rev?cpage=1&pcode=<%= product.getpCode() %>&pname=<%= product.getpName() %>#review">전체후기</a> 
            </div>
            <div class="review-btn1-right">
                <a href="">포토후기</a>
            </div>
        </div>

        <div class="review-content">
        	<% if(reviewList.isEmpty()) { %>
	            <!-- case1. 리뷰 없을 경우 -->
	            <div class="no-review" align="center">
	                <p>등록된 리뷰가 없습니다.</p>
	            </div>
            <% } else { %>
	            <!-- case2. 리뷰 있을 경우 -->
	           	<% for(Review r : reviewList) { %>
                    
                    <div class="review-content-left">
                        <input type="hidden" name="rCode" value="<%= r.getrCode() %>">
                        	<% if(r.getMainImg() != null) { %>
                        <img src="<%= r.getMainImg() %>">
                        <% } else { %>
                        	<i class="far fa-images fa-4x" style="margin-top:55px; color:lightgray;"></i>
                        <% } %>
                    </div>
                    <div class="review-content-right">
                        <b><%= r.getmName() %></b> <span>&nbsp;&#124;&nbsp;</span><span> <%= r.getrDate() %></span>
                        <span style="margin-left:20px;">
							<% if(loginUser != null) { %>
							<% if( r.getmCode() == loginUser.getmCode()) { %>                        
                                <a class="review-update-btn">수정</a>
                                <span>&nbsp;&#124;&nbsp;</span>
                                <a class="review-delete-btn">삭제</a>
                            <% } else { %>
                                <a class="review-report-btn">신고</a>
                            <% } %>
                            <% } %>
                        </span>
                        <p>
                            <br>
                            <%= r.getrContent() %>
                        </p> 
                    </div>
                    
	            <% } %>
            <% } %>
        </div>
        
        <!-- 
            리뷰 수정버튼 클릭 시
             => 리뷰 정보 조회 후 리뷰수정 모달창 열어서 데이터 뿌려주기
        -->
        <script>
            
            $(function(){

                $(".review-content-right").on("click", ".review-update-btn", function(){
					
					$.ajax({
						url:"updateForm.rev",
						data:{rcode:$(this).parent().parent().prev().children().eq(0).val()},
						success:function(updateFormList){
							console.log(updateFormList);
							
                            // 리뷰내용
							const $updateModal = $("#review-update-modal");

		        			const $review = updateFormList[0];
                           console.log(updateFormList[0]);
		        			
		        			const $fileList = updateFormList[1];
                            console.log(updateFormList[1]);
		        			
                            $updateModal.find("input[name=rcode]").val($review.rCode);
                            $updateModal.find("textarea").text($review.rContent);
		        			
                            // 첨부파일

                            $("#existingFile").html("");
                            
                            if($fileList.length != 0){ // 기존의 첨부파일이 있을 경우
                                
                                let file = "";

                                for(let i=0; i<$fileList.length; i++){
                                    
                                    if($fileList[i] != null){
                                        file += "<p style='margin:0'>" + $fileList[i].fPath + $fileList[i].fRename + "</p> <br>"
                                              + "<input type='hidden' name='originfCode' value='" + $fileList[i].fCode + "'>" ;
                                    }
                                    
                                }

                                $("#existingFile").html(file);

                            }
		        			
		        			$updateModal.modal({backdrop:false});
							
						}, error:function(){
							console.log("ajax 통신 실패");
						}
						
					});
                });
            
            
            
                // 삭제버튼 클릭 시
                $(".review-content-right").on("click", ".review-delete-btn", function(){
                    
                    const $rCode = $(this).parent().parent().prev().children().eq(0).val();

                    $("#review-delete-modal").modal({backdrop:false});

                    $("#delete-btn").click(function(){
                        
                        $.ajax({
                            url:"delete.rev",
                            data:{rcode:$rCode},
                            success:function(result){
                                
                                if(result > 0){
                                    
                                    $("#review-delete-success-modal b").text("상품후기가 삭제되었습니다.");
                                    $("#review-delete-success-modal").modal({backdrop:false});
                                    $("#review-delete-success-modal button").click(function(){
                                        location.reload();
                                    });
    
                                }else {
    
                                    alert("상품후기 삭제를 실패했습니다.");
    
                                }
                                
                                
                            }, error:function(){
                                console.log("ajax 통신 실패");
                            }
                            
                        });

                    });

                });
            

                // 신고버튼 클릭 시
                $(".review-content-right").on("click", ".review-report-btn", function(){

                    const $rCode = $(this).parent().parent().prev().children().eq(0).val();
					
                    console.log($rCode);

                    $("#report-review-modal").modal({backdrop:false});
                    $("#report-review-form input[name=rcode]").val($rCode);
                    
                    console.log($("#report-review-form input[name=rcode]").val($rCode));

                });



            });    

    </script>
        
        
        

        <div class="review-btn2">
            <div class="review-btn2-left" style="width:20%"></div>
            <!-- 페이징바 -->
            <div class="review-btn2-center"> 
	            	<% if(currentPage != 1 && reviewList.size() != 0) { %>
	                	<a href="<%= request.getContextPath() %>/reviewList.rev?cpage=<%= currentPage - 1 %>&pcode=<%= product.getpCode() %>">&lt;</a>
	                <% } %>
	                <% for(int p=startPage; p<=endPage; p++) { %>
	                	<% if(p == currentPage) { %>
	               			<a href="#"><%= p %></a>
	               		<% } else { %>
	               			<a href="<%= request.getContextPath() %>/reviewList.rev?cpage=<%= p %>&pcode=<%= product.getpCode() %>"><%= p %></a>
	               		<% } %>
	                <% } %>
	                <% if(currentPage != maxPage && reviewList.size() != 0) { %>
	               	 <a href="<%= request.getContextPath() %>/reviewList.rev?cpage=<%= currentPage + 1 %>&pcode=<%= product.getpCode() %>">&gt;</a>
	                <% } %>
            </div>
            <% if(loginUser != null) { %>
	            <div class="review-btn2-right">
	                <button class="btn" id="review-insert-btn">후기등록</button>
	            </div>
            <% } %>
        </div>
    </div>

    <!-- 리뷰등록 모달창 열기 기능 -->
    	<% if(orderInfo != null && orderInfo.getoCode() != null) { %>
            <%for(Review r : reviewList) { %>
                <%if(r.getmCode() != loginUser.getmCode()) {  %>
	                <script>
	                    $(function(){
	                            $("#review-insert-btn").click(function(){
	                                
	                                $("#review-insert-modal").modal({backdrop:false});
	                                $(".review-product input[name=ocode]").val("<%= orderInfo.getoCode() %>");
	                                $(".review-product input[name=mcode]").val("<%= orderInfo.getmCode() %>");

	                            });
	                    });
	                
	                </script>
                <% } else { %>
                	<script>
	                    $(function(){
	                            $("#review-insert-btn").click(function(){
	                                
	                                alert("이미 작성한 후기가 존재합니다.");
	                                
	                            });
	                    });
	                </script>
                <% } %>
            <% } %>
    	<% } else { %>
            <script>
                $(function(){
                        $("#review-insert-btn").click(function(){
                            
                           alert("해당 상품 구매 후 배송완료 단계 시 등록 가능합니다.");
                            
                        });
                });
            
            </script>
        <% } %>    


    <!-- 리뷰등록 모달창 -->

    <div class="modal fade" id="review-insert-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content insert-review-modal">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기등록</h6>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area" align="center">

                    <form action="<%= contextPath %>/insert.rev" id="review-insert-form" method="post" enctype="multipart/form-data">
                       <div class="review-insert-content" style="box-sizing:border-box; width:750px;">

                           <div class="review-product">
                               <input type="hidden" name="ocode">
                               <input type="hidden" name="mcode">
                               <input type="hidden" name="pcode" value="<%= product.getpCode() %>">
                               <div class="review-product-img">
                                    <img src="<%= product.getFilePath() %><%= product.getpMainImg() %>" width="100px" height="100px">
                               </div>
                               <div class="review-product-name">
                                    <h4 name="pname" style="margin-top: 40px;"><%= product.getpName() %></h4>
                               </div>
                           </div>

                           <hr>

                           <table class="review-form-content" id="reviewInsertForm">
                                <tr><th>내용</th></tr>
                                <tr>
                                    <td><textarea name="reviewContent" rows="15" style="resize:none;"></textarea></td>
                                </tr>
                                <tr><th>파일첨부</th></tr>
                                <tr>
                                    <td class="file-area">
                                        <input type="file" name="file1" id="file1">
                                        <input type="file" name="file2" id="file2">
                                        <input type="file" name="file3" id="file3">
                                    </td>
                                </tr>
                           </table>

                       </div>

                    </form>
                </div>

				<!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div class="btns" align="center" style="width:100%;">
						<button type="reset" class="btn" style="border:1px solid lightgray;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:#9BD5BD; margin-left:10px;" form="review-insert-form">등록</button>
					</div>
                </div>

			</div>	
		</div>	
	</div>


	<!-- 리뷰수정 모달창 -->

    <div class="modal fade" id="review-update-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content update-review-modal">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기수정</h6>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area" align="center">

                    <form action="<%= contextPath %>/update.rev" id="review-update-form" method="post" enctype="multipart/form-data">
                       <div class="review-update-content" style="box-sizing:border-box; width:750px;">

                           <div class="review-product">
                               <input type="hidden" name="rcode">
                               <input type="hidden" name="ocode">
                               <input type="hidden" name="mcode">
                               <input type="hidden" name="pcode" value ="<%= product.getpCode() %>">
                               <div class="review-product-img">
                                    <img src="<%= product.getFilePath() %><%= product.getpMainImg() %>" width="100px" height="100px">
                               </div>
                               <div class="review-product-name">
                                    <h4 name="pname" style="margin-top: 40px;"><%= product.getpName() %></h4>
                               </div>
                           </div>

                           <hr>

                           <table class="review-form-content" id="reviewUpdateForm">
                                <tr><th>내용</th></tr>
                                <tr>
                                    <td><textarea name="reviewContent" rows="15" style="resize:none;"></textarea></td>
                                </tr>
                                <tr><th>파일첨부</th></tr>
                                <tr>
                                    <td id="existingFile">
                                        <!-- 기존에 존재하는 파일명 -->
                                    </td>
                                </tr>
                                <tr>
                                    <td class="file-area">
                                        <input type="file" name="file1" id="file1">
                                        <input type="file" name="file2" id="file2">
                                        <input type="file" name="file3" id="file3">
                                    </td>
                                </tr>
                           </table>

                       </div>

                    </form>
                </div>

				<!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div class="btns" align="center" style="width:100%;">
						<button type="reset" class="btn" style="border:1px solid lightgray;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:#9BD5BD; margin-left:10px;" form="review-update-form">수정</button>
					</div>
                </div>

			</div>	
		</div>	
	</div>



	<!-- 리뷰등록/수정 성공 모달창 -->

	<div class="modal fade" id="review-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px; height:350px;">
			<div class="modal-content success-review-modal">
				
				<!-- Modal Header -->
				<div class="modal-header title-area">
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body content-area">
					<div class="review-success-img" align="center" style=" height:40%;">
                        <i class="fas fa-check fa-4x" style="color:#9BD5BD;"></i>
                    </div>

                    <div class="review-success-content" align="center" style=" height:60%;">
                        <br>
                        <b></b>
                        <br>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area">
					<div class="cart-success-btns" align="center" style="width:100%;">
						<button type="submit" id="my-page-btn" class="btn" style="background:#9BD5BD;" data-dismiss="modal">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		


	<!-- 리뷰 삭제 모달창 -->

	<div class="modal fade" id="review-delete-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px; height:350px;">
			<div class="modal-content delete-review-modal">
				
				<!-- Modal Header -->
				<div class="modal-header title-area">
					<h6 class="modal-title">후기삭제</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body content-area">

                    <div class="delete-content" align="center" style=" height:60%;">
                        <br>
                        <b>해당 후기를 삭제하시겠습니까?</b>
                        <br>
                    </div>

				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area">
					<div class="btns" align="center" style="width:100%;">
                        <button class="btn btn-sm" style="border:1px solid lightgray;" data-dismiss="modal">취소</button>
						<button type="submit" id="delete-btn" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
    
    

	<!-- 리뷰 삭제 성공 모달창 -->

	<div class="modal fade" id="review-delete-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px; height:350px;">
			<div class="modal-content success-delete-review-modal">
				
				<!-- Modal Header -->
				<div class="modal-header title-area">
					<h6 class="modal-title">후기삭제 완료</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body content-area">
					<div class="delete-success-img" align="center" style=" height:40%;">
                        <i class="fas fa-check fa-4x" style="color:#9BD5BD;"></i>
                    </div>

                    <div class="delete-success-content" align="center" style=" height:60%;">
                        <br>
                        <b><!-- 삭제 완료 문구 --></b>
                        <br>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area">
					<div class="cart-success-btns" align="center" style="width:100%;">
						<button type="submit" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		



    <!-- 리뷰신고 모달창 -->

    <div class="modal fade" id="report-review-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content review-report-modal">
                <input type="hidden" name="rcode">
                <input type="hidden" name="pcode" value="<%= product.getpCode() %>">
                <input type="hidden" name="pname" value="<%= product.getpName() %>">
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기신고</h6>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area">
                    <form action="<%= contextPath %>/report.rev" id="report-review-form" method="post">
					   <input type="hidden" name="rcode">
                       <div class="report-review-content" style="box-sizing:border-box; width:750px;">

                           <br>

                           <table class="report-form-content" id="reportReviewForm" align="center">
                               <tr>
                                    <th>신고사유</th>
                                    <td>
                                        <input type="text" name="reportCategory" placeholder="직접입력" list="report-category">
                                        <datalist id="report-category">
                                            <option>욕설</option>
                                            <option>도배</option>
                                            <option>음란/청소년 유해</option>
                                            <option>티회원 비방</option>
                                            <option>타사 홍보</option>
                                        </datalist>
                                    </td>
                               </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><textarea name="reportContent" rows="15" style="resize:none;"></textarea></td>
                                </tr>
                           </table>

                       </div>
                    </form>

                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div class="btns" align="center" style="width:100%;">
						<button type="reset" class="btn" style="border:1px solid lightgray;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:#9BD5BD; margin-left:10px;" form="report-review-form">등록</button>
					</div>
                </div>
            
            </div>
        </div>
    </div>



    <!-- 리뷰신고 성공 모달창 -->

	<div class="modal fade" id="report-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px; height:350px;">
			<div class="modal-content success-report-modal">
				
				<!-- Modal Header -->
				<div class="modal-header title-area">
					<h6 class="modal-title">후기신고 완료</h6>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body content-area">
					<div class="report-success-img" align="center" style=" height:40%;">
                        <i class="fas fa-check fa-4x" style="color:#9BD5BD;"></i>
                    </div>

                    <div class="report-success-content" align="center" style=" height:60%;">
                        <br>
                        <b>성공적으로 신고되었습니다.</b>
                        <br>
                    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer button-area">
					<div class="report-success-btns" align="center" style="width:100%;">
						<button type="submit" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;">확인</button>
					</div>
				</div>

			</div>
		</div>
	</div>		

</body>
</html>