<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="com.wimb.common.model.vo.PageInfo, java.util.ArrayList, com.wimb.product.model.vo.Product" %>
    
<%	

// 요청처리 완료 모달창 메시지
	String productMsg = (String)(session.getAttribute("productMsg"));

	// 페이징바 처리
	PageInfo pi = (PageInfo)(request.getAttribute("pi"));
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	// 완제품 전체 조회
	ArrayList<Product> totalList = (ArrayList<Product>)(request.getAttribute("totalList"));
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
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

    #product-custom-button{
        box-sizing: border-box;
        /* border:1px solid red;  */
        width:1500px;
        height:50px;
        margin:auto;
        margin-top:20px;
    }

    #left, #right{
        box-sizing: border-box;
        /* border:1px solid red;  */
        width:50%;
        height:100%;
        float:left;
    }

    #product-button, #custom-button{
        box-sizing: border-box;
        width:99%;
        height:100%;
        border:1px solid lightgray;
        border-bottom:none;
        background-color:rgb(245, 245, 245);
        line-height:50px;
        text-align: center;
    }

    #product-button>a, #custom-button>a{
        display: block;
        /* border:1px solid red; */
        width:100%;
        height:100%;
        color:black;
        text-decoration-line:none;
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
    }

    #list-2{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:100%;
        height:30px;
        line-height:30px;
        margin-bottom: 10px;
    }

    #list-2 div{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:50%;
        height:100%;
        float:left;
    }

    #product-list{
        text-align: center;
        border-bottom: 2px solid lightgray;
    }

    #product-list>thead th{
        background:lightgray;
        font-size:15px;
    }

    #product-list>tbody td{
        font-size:13px;
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

    /* 상품등록 모달창 */

    .product-insert-modal{
        border-radius: 0;
        box-sizing: border-box;
        width: 800px;
        height:1000px;
    }

    .title-area, .content-area, .button-area{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:100%;
    }

    .button-area{
        padding:0;
    }

    #main, #main table, #detail, #detail table,
    #insert-form, #insert-form input, #insert-form textarea {
        box-sizing: border-box;
        width:100%;

    }

    .content-area table *{
        margin-top: 5px;
    }

    .content-area table th{
        text-align: center;
        font-size: 15px;
    }

    #main-img-area, #detail-img-area{
        width:100% !important;
        /* height:100% !important; */
        margin:0 !important;
        padding:0 !important;
    }

    #button-left-area, #button-right-area{
        box-sizing: border-box;
        margin:0;
        padding:15px;
        /* border:1px solid red; */
        width:50%;
    }

    #button-right-area {
        text-align: right;
    }

    

    /* 상품 상세 정보 모달창 */

    .detail-product-modal{
        border-radius: 0;
        box-sizing: border-box;
        width: 800px;
        height:1000px;
    }

    .modal-body table *{
        margin-top: 5px;
    }

    .modal-body table th{
        text-align: center;
        font-size: 15px;
    }

    #detail-main-img{
        border:1px solid lightgray;
        width:300px;
        height:300px;
        text-align:center;
        line-height:300px;
    }

</style>
</head>
<body>

	<!-- 상품 등록 테스트용 alert -->
	<% if(productMsg != null) { %>
	<script>
		
		alert("<%= productMsg %>");
		
		<% session.removeAttribute("productMsg"); %>
	
	</script>
	<% } %>

	<%@ include file="../common/adminBar.jsp" %>

	
   
    
    <div class="outer">

        <div id="menu-title">
            <h2 style="color:gray; font-weight: bold;">상품관리</h2>
            <h2 style="font-weight: bold;">&gt; 상품등록</h2>
        </div>

        <!-- 완제품/커스텀 버튼 -->
        <div id="product-custom-button">
            <div id="left">
                <div id="product-button">
                    <a href="<%= contextPath%>/list.apr?cpage=1"><b>완제품</b></a>
                </div>
            </div>
            <div id="right" align="right">
                <div id="custom-button">
                    <a href=""><b>커스텀</b></a>
                </div>
            </div>
        </div>

        <div id="list" align="center">
            <!-- 카테고리 -->
            <div id="list-1" align="left" style="margin-top:10px; margin-bottom:5px;">
                <select name="productCategory">
                    <option>카테고리 선택</option>
                    <option>비건</option>
                    <option>육류</option>
                    <option>해산물</option>
                </select>
            </div>

            <div id="list-2">
                <!-- 등록 개수 -->
                <div align="left">
                    총 <span style="color:orange; font-weight:bold;">20</span> 건
                </div>
                <!-- 상품등록 버튼 -->
                <div align="right">
                    <button type="button" id="insert-product-btn" class="btn btn-sm" style="background:rgb(255, 225, 90);">상품등록</button>
                </div>
            </div>
            <script>
					$(document).ready(function(){
						$("#insert-product-btn").click(function(){
						$("#insert-product-modal").modal({backdrop: "static"});
						});
					});
				</script>


            <!-- 완제품 목록 -->
            <table id="product-list" height="500px" class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th width="15%">상품번호</th>
                        <th width="20%">상품명</th>
                        <th width="20%">업체명</th>
                        <th width="10%">공급가(원)</th>
                        <th width="10%">판매가(원)</th>
                        <th width="10%">재고</th>
                        <th width="10%">노출여부</th>
                    </tr>
                </thead>
                <tbody >
                	<% if(totalList == null) { %>
	                    <tr>
	                        <td colspan="9"> 등록된 상품이 없습니다.</td>
	                    </tr>
                    <% } else { %>
                    	<% for(int i=0; i<totalList.size(); i++) { %>
	                    <tr>
	                        <!-- 노출여부 수정 창 => 기본 안 보이게 설정 -->
	                        <%-- >
	                        <div class="extra-fee" style="border:1px solid black; background:white; width:100px; height:130px; padding:5px; position:relative; z-index:2; top:260px; left:330px; display: none;">
	                            <h6 style="font-weight: bolder; margin-top: 10px;">노출여부</h6>
	                            <select name="productStatus" style="width:65px; margin-top:5px; margin-bottom:10px;">
	                                <option>Y</option>
	                                <option>N</option>
	                            </select>
	                            <button class="btn btn-sm" style="background:rgb(255, 225, 90); width:65px;">수정</button>
	                        </div>
	                        --%>
	                        <td>
	                            <input type="checkbox" name="" id="" disabled>
	                        </td>
	                        <td><%= totalList.get(i).getpCode() %></td>
	                        <td><a class="product-name"><%= totalList.get(i).getpName() %></a></td>
	                        <td><%= totalList.get(i).getpProvider() %></td>
	                        <td><%= totalList.get(i).getpProvidePrice() %></td>
	                        <td><%= totalList.get(i).getpPrice() %></td>
	                        <td><%= totalList.get(i).getpStock() %></td>
	                        <td><%= totalList.get(i).getpShow() %></td>
	                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
             <!-- [고려사항]
                상품명 클릭 시 모달창으로 수정 폼 뜨도록.... 해야하는데 어떻게 해야할지....??????
                게시글번호 데이터 넘기면서 요청해서 데이터 받아와야하는데............. AJAX로 해야하는 것 같음...?
            -->
            <script>
                $(function(){
                    $("#product-list>tbody>tr>a").click(function(){
                        href=""
                    });
                });
            </script>

            <!-- 페이징바 -->
            <div id="paging-bar" align="center">
            	<ul class="pagination">
            		<% if(currentPage != 1) { %>
				   		 <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.apr?cpage=<%= currentPage - 1 %>">&lt;</a></li>
				    <% } %>
				    
				    <% for(int p=startPage; p<=endPage; p++ ) { %>
				    	<% if(p == currentPage) { %>
					    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
					    <% } else { %>
					  		 <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.apr?cpage=<%= p %>"><%= p %></a></li>
					    <% } %>
				    <% } %>
				    
				    <% if(currentPage != maxPage) { %>
				 		   <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.apr?cpage=<%= currentPage + 1 %>">&gt;</a></li>
				    <% } %>
			    </ul>
            </div>
             
            <br>

            <!-- 상품 검색 -->
            <form id="select-form" action="" method="get">
                <table id="product-search">
                    <tr>
                        <td>
                            <span>상품명</span>
                        </td>
                        <td>
                            <input type="search">
                        </td>
                        <td>
                            <button type="submit" class="btn btn-sm" style="background-color:rgb(255, 225, 90); margin-left:5px;">조회</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    
	<button id="insert-success-btn">상품등록 성공 창 테스트</button>


        <!-- 상품 등록 모달창 -->

        <div class="modal fade" id="insert-product-modal">
            <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                <div class="modal-content product-insert-modal">
                    
                    <!-- Modal Header -->
                    <div class="modal-header title-area">
                        <h3 class="modal-title">상품 등록</h3>
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body content-area">
                        <form action="<%= contextPath %>/insert.pr" id="insert-form" method="post" enctype="multipart/form-data">
                            <!-- 상품 설명 영역 -->
                                <div id="main">
                                    <table class="table-borderless">
                                            <tr style="background: rgb(245, 245, 245);">
                                                <th style="font-size: 20px;">상품 설명</th>
                                                <td colspan="2" style="font-size:12px;">회원이 상품 클릭 시 맨 위에 보여지는 화면입니다.</td>
                                            </tr>
                                            <tr>
                                                <th>카테고리</th>
                                                <td colspan="2">
                                                    <select name="productCategory"  required>
                                                        <option>카테고리 선택</option>
                                                        <option>비건</option>
                                                        <option>육류</option>
                                                        <option>해산물</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>사진등록</th>
                                                <td colspan="2">
                                                    <input type="file" name="mainImg" onchange="loadImg(this, 1);" required>
                                                </td>
                                            </tr>
                                    </table>
                                    
                                    <br>

                                    <table class="table-borderless">       
                                            <tr>
                                                <td rowspan="8" style="width:300px; height:300px; padding:0; border:1px solid lightgray;">
                                                    <img id="main-img-area">
                                                </td>
                                                <th>제품명</th>
                                                <td><input type="text" name="productName" placeholder="ex) 닭가슴살샐러드" required></td>
                                            </tr>
                                            <tr>
                                                <th>판매가격</th>
                                                <td><input type="number" name="productPrice" placeholder="ex) 3000" required></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="font-size:12px; text-align: center; color:salmon;">
                                                    -- 아래 영역은 실제 회원에게 보여지지 않는 부분입니다 --
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>공급업체</th>
                                                <td><input type="text" name="provider" placeholder="ex) (주)OO식품" required></td>
                                            </tr>
                                            <tr>
                                                <th>공급가격</th>
                                                <td><input type="number" name="supplyPrice" placeholder="ex) 2000" required></td>
                                            </tr>
                                            <tr>
                                                <th>입고수량</th>
                                                <td><input type="number" name="productAmount" placeholder="ex) 30" required></td>
                                            </tr>
                                            <tr>
                                                <th>키워드</th>
                                                <td><input type="text" name="productKeyword" placeholder="ex) 비건,채소" required></td>
                                            </tr>
                                            <tr>
                                                <th>노출여부</th>
                                                <td>
                                                    <select name="productStatus" required>
                                                        <option>Y</option>
                                                        <option>N</option>
                                                    </select>
                                                </td>
                                            </tr>
                                    </table>
                                    
                                </div>
                                <br><br>
        
                                <!-- 상품 상세 설명 영역 -->
                                <div id="detail">
                                    <table id="detail-1" class="table-borderless">
                                        <tr style="background: rgb(245, 245, 245);">
                                            <th style="font-size: 20px;">상품 상세 설명</th>
                                            <td style="font-size:12px;">상품에 대한 상세 설명을 작성하는 화면입니다.</td>
                                        </tr>
                                        <tr>
                                            <th>사진등록</th>
                                            <td><input type="file" name="detailImg" onchange="loadImg(this, 2);"></td>
                                        </tr>
                                    </table>
                                    <br>
                                    <table id="detail-2" class="table-borderless">
                                        <tr>
                                            <td>
                                                <textarea name="detailContent" rows="10" style="resize:none; overflow-y:scroll; overflow-x:hidden;" required>상세내용을 입력해주세요</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-size:12px; text-align: center; color:gray;">
                                                <p>-- 상세이미지 등록 시 아래에 미리보기 화면이 보여집니다 --</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="width:100%; padding:0; border:1px solid lightgray;">
                                                <img id="detail-img-area">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                        </form>
                    </div>

                    <script>

                        function loadImg(inputFile, num){
                            if(inputFile.files.length == 1){ // 파일 선택된 경우 => 파일 읽어들여서 미리보기

                                const reader = new FileReader();

                                reader.readAsDataURL(inputFile.files[0]);

                                reader.onload = function(e){ // 읽어들인 파일 => 매개변수 e

                                    switch(num){
                                        case 1 : $("#main-img-area").attr("src", e.target.result); break;
                                        case 2 : $("#detail-img-area").attr("src", e.target.result); break;
                                    }
        
                                }
        
                            } else { // 선택된 파일이 취소된 경우 => 미리보기된 것도 사라지게
        
                                switch(num){
                                    case 1 : $("#main-img-area").attr("src", null); break;
                                    case 2 : $("#detail-img-area").attr("src", null); break;
                                }
        
                            }
        
                        }

                    </script>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer button-area">
                        <div id="button-left-area">
                            <button type="reset" class="btn btn-sm btn-outline-dark" form="insert-form">취소</button>
                        </div>
                        <div id="button-right-area">
                            <button type="submit" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);" form="insert-form">등록</button>
                        </div>
                    </div>
                
                </div>
            </div>
    </div>
    


    <!-- 상품등록 성공 모달창 -->

	<div class="modal fade" id="insert-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content success-insert-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
					<div class="insert-success-img" align="center" style=" height:60%; line-height:150px;">
                        <i class="fas fa-check fa-4x" style="color:rgb(255, 225, 90);"></i>
                    </div>

                    <div class="insert-success-content" align="center" style="height:40%; line-height:60px;">
                        <b>상품등록성공</b>
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
	<!--  
	<script>
		$(document).ready(function(){
			$("#insert-success-btn").click(function(){
				$("#insert-success-modal").modal({backdrop: "static"});
			});
		});
	</script>
	-->

    <!-- 상품 상세정보 모달창 -->

    <div class="modal fade" id="product-detail-modal">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
          <div class="modal-content detail-product-modal">
          
            <!-- Modal Header -->
            <div class="modal-header">
                <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">상품 상세</h6>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">

                <!-- 상품 메인 -->
               <div class="detail-main" style="width: 100%;">
                    <table class="table-borderless" style="width: 100%;">
                        <tr style="background: rgb(245, 245, 245);">
                            <th style="font-size: 20px;">상품 설명</th>
                            <td style="font-size:12px;">회원이 상품 클릭 시 맨 위에 보여지는 화면입니다.</td>
                        </tr>
                    </table>
                    <br>
                    <table class="table-borderless" style="width: 100%;">       
                        <tr>
                            <td rowspan="8" width="300">
                                <div id="detail-main-img">
                                    대표이미지
                                </div>
                            </td>
                            <th>제품명</th>
                            <td>닭가슴살샐러드</td>
                        </tr>
                        <tr>
                            <th>판매가격</th>
                            <td>4900원</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="font-size:12px; text-align: center; color:salmon;">-- 아래 영역은 실제 회원에게 보여지지 않는 부분입니다 --</td>
                        </tr>
                        <tr>
                            <th>공급업체</th>
                            <td>ㅇㅇ식품</td>
                        </tr>
                        <tr>
                            <th>공급가격</th>
                            <td>3900원</td>
                        </tr>
                        <tr>
                            <th>재고수량</th>
                            <td>33개</td>
                        </tr>
                        <tr>
                            <th>키워드</th>
                            <td>육류,닭가슴살</td>
                        </tr>
                        <tr>
                            <th>노출여부</th>
                            <td>Y</td>
                        </tr>
                    </table>

               </div>

               <br><br>

               <!-- 상품 상세 -->
               <div class="detail-sub" style="width: 100%;">
                    <table class="table-borderless" style="width: 100%;">
                        <tr style="background: rgb(245, 245, 245);">
                            <th style="font-size: 20px;">상품 상세 설명</th>
                            <td style="font-size:12px;">상품에 대한 상세 설명을 작성하는 화면입니다.</td>
                        </tr>
                    </table>
                    <br>
                    <table class="table-borderless" style="width: 100%;">
                        <tr>
                            <td>
                                <p style="text-align: center;">
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                    상품 상세 내용 <br>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size:12px; text-align: center; color:gray;">
                                <p>-- 상세이미지 미리보기 --</p>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div id="detail-main-img" style="width: 100%;">
                                    상세이미지
                                </div>
                            </td>
                        </tr>
                    </table>

               </div>


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
	<script>
		$(document).ready(function(){
			$(".product-name").click(function(){
			$("#product-detail-modal").modal({backdrop: "static"});
			});
		});
	</script>



</body>
</html>