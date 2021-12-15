<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        width: 200px;
        height: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .reported{color:red;}

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


    /* 리뷰신고 상세 조회 모달창 */
    #report-detail-modal{

    }


</style>
</head>
<body>

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
                    총 <span style="color:orange; font-weight:bold;">20</span> 건
                </div>
                <!-- 블랙리스트 추가 및 신고내역 삭제 버튼 -->
                <div align="right">
                    <!-- [고려사항]
                        체크박스로 블랙리스트 추가용이랑 삭제용을 둘 다 쓸 수 없을 것 같음...?
                        블랙리스트 등록 시 로그인 안되게 해야 함
                    -->
                    <button type="button" id="insert-blackList-btn" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);" data-toggle="modal" data-target="#insert-modal" data-backdrop="static" data-keyboard="false">블랙리스트추가</button>
                    <button type="button" id="delete-report-btn" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);">선택삭제</button>
                </div>
            </div>

            <!-- 신고내역 목록 -->
            <table id="report-list" height="500px" class="table table-hover">
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
                    <tr>
                        <td colspan="8">등록된 신고내역이 없습니다.</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="user01">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content" id="report-detail">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
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

            <!-- 회원아이디로 신고내역 검색 -->
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
    <button id="insert-success-btn">블랙리스트 등록 성공창 테스트</button>
    <button id="delete-success-btn">리뷰신고 삭제 성공창 테스트</button>

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
						<button type="submit" class="btn" style="border:1px solid lightgray; margin:0px 5px;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:rgb(255, 225, 90); margin:0px 5px;">등록</button>
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


    <!-- 블랙리스트 등록 성공 모달창 -->

	<div class="modal fade" id="insert-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content success-insert-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
					<div class="insert-success-img" align="center" style=" height:60%; line-height:150px;">
                        <i class="fas fa-check fa-4x" style="color:rgb(255, 225, 90);"></i>
                    </div>

                    <div align="center" style="height:40%; line-height:60px;">
                        <b>성공적으로 등록되었습니다.</b>
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
			$("#insert-success-btn").click(function(){
			$("#insert-success-modal").modal({backdrop: "static"});
			});
		});
	</script>


    <!-- 리뷰신고 삭제 모달창 -->

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
						<button type="submit" class="btn" style="border:1px solid lightgray; margin:0px 5px;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:rgb(255, 225, 90); margin:0px 5px;">삭제</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#delete-report-btn").click(function(){
			$("#delete-report-modal").modal({backdrop: "static"});
			});
		});
	</script>


    <!-- 리뷰신고 삭제 성공 모달창 -->

	<div class="modal fade" id="delete-success-modal">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content success-delete-modal" style="width:500px; height:200px; border-radius: 0;">
				
				<!-- Modal body -->
				<div class="modal-body content-area" style="height:100%;">
					<div class="delete-success-img" align="center" style=" height:60%; line-height:150px;">
                        <i class="fas fa-check fa-4x" style="color:rgb(255, 225, 90);"></i>
                    </div>

                    <div align="center" style="height:40%; line-height:60px;">
                        <b>성공적으로 삭제를 완료했습니다.</b>
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
                        <td colspan="3">user02</td>
                    </tr>
                    <tr>
                        <th>회원명</th>
                        <td colspan="3">김신고</td>
                    </tr>
                    <tr>
                        <th>신고시간</th>
                        <td>2021-12-12 18:25</td>
                        <th>신고사유</th>
                        <td>욕설</td>
                    </tr>
                    <tr>
                        <th colspan="4">신고내용</th>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div style="border:1px solid lightgray; width:100%; height:200px; padding:5px;">
                                신고된리뷰내용 <br>
                                신고된리뷰내용 <br>
                                신고된리뷰내용 <br>
                                신고된리뷰내용 <br>
                                신고된리뷰내용 <br>
                            </div>
                        </td>
                    </tr>
                </table>
                <hr>

                <h5 style="color:orange; font-weight:bolder;">신고대상회원 정보</h5>
                <table style="width:100%; height:280px; margin:10px;">
                    <tr>
                        <th>아이디</th>
                        <td>user10</td>
                        <th>회원명</th>
                        <td>김트롤</td>
                        <th>작성시간</th>
                        <td>2021-12-12 15:24</td>
                    </tr>
                    <tr>
                        <th colspan="6">리뷰내용</th>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <div style="border:1px solid lightgray; width:100%; height:200px; padding:5px;">
                                신고된리뷰내용 <br>
                                신고된리뷰내용 <br>
                                신고된리뷰내용 <br>
                                신고된리뷰내용 <br>
                                신고된리뷰내용 <br>
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
	<script>
		$(document).ready(function(){
			$("#report-detail").click(function(){
			$("#report-detail-modal").modal({backdrop: "static"});
			});
		});
	</script>
</body>
</html>