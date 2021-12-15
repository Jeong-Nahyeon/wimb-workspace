<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        margin:auto;
        margin-top:100px;
        width:800px;
        height:1000px;
    }
    #menu-title h2{
        display:inline;
        font-size:25px;
    }

    #list{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:790px;
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

    /* 리뷰 상세조회 모달창 */
    #mainStatus-update-form th{
        font-weight:bolder;
        text-align: center;
    }

</style>
</head>
<body>

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
                        <th>리뷰 제목</th>
                        <th>적립금 지급</th>
                        <th>메인노출여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="8">등록된 리뷰가 없습니다.</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td><a id="review-detail-btn">맛있어요</a></td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                </tbody>
            </table>

            <!-- 페이징바 -->
            <div id="paging-bar">
                <a href="">&lt;</a>
                <a href="">1</a>
                <a href="">&gt;</a>
            </div>
            <br>

            <!-- 회원아이디로 리뷰 검색 -->
            <form id="select-form" action="" method="get">
                <table id="product-search">
                    <tr>
                        <td>
                            <span>회원ID</span>
                        </td>
                        <td>
                            <input type="search">
                        </td>
                        <td>
                            <button type="submit" class="btn btn-sm btn-warning" style="background-color:rgb(255, 225, 90); margin-left:5px;">조회</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>    
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
                <form id="mainStatus-update-form" action="">
                    <table style="width:700px;">
                        <thead>
                            <tr>
                                <th width="175">최종등록일</th>
                                <td width="175">2021.11.11</td>
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
                                <td colspan="3">user01</td>
                            </tr>
                            <tr>
                                <th>구매상품</th>
                                <td colspan="3"></td>
                            </tr>
                            <tr>
                                <th>리뷰제목</th>
                                <td colspan="3">
                                    회원이작성한리뷰제목
                                </td>
                            </tr>
                            <tr>
                                <th colspan="4">리뷰내용</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">
                                    <div style=" box-sizing: border-box; width:100%; height:200px; border:1px solid lightgray; padding:5px;">
                                        회원이작성한리뷰내용 <br>
                                        회원이작성한리뷰내용 <br>
                                        회원이작성한리뷰내용 <br>
                                        회원이작성한리뷰내용 <br>
                                        회원이작성한리뷰내용 <br>
                                        회원이작성한리뷰내용 <br>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div style="width:100%; padding:5px;">
                                        회원이작성한리뷰사진중첫번째만
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