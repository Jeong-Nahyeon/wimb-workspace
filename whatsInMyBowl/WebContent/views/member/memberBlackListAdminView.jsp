<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    총 <span style="color:orange; font-weight:bold;">20</span> 건
                </div>
                <!-- 블랙리스트 삭제 버튼 -->
                <div align="right">
                    <button type="button" id="delete-blackList-btn" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);">블랙리스트 삭제</button>
                </div>
            </div>

            <!-- 블랙리스트 목록 -->
            <table id="black-list" height="500px" class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>회원명</th>
                        <th>연락처</th>
                        <th>등록일</th>
                        <th>사유</th>
                        <th>누적신고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="8">등록된 블랙리스트가 없습니다.</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>010-1234-1234</td>
                        <td>회원비방</td>
                        <td>15회</td>
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

            <!-- 회원아이디로 블랙리스트 검색 -->
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
    <button id="delete-success-btn">블랙리스트 삭제 성공창 테스트</button>


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
						<button type="submit" class="btn" style="border:1px solid lightgray; margin:0px 5px;" data-dismiss="modal">취소</button>
						<button type="submit" class="btn" style="background:rgb(255, 225, 90); margin:0px 5px;">삭제</button>
					</div>
				</div>

			</div>
		</div>
	</div>		
	<script>
		$(document).ready(function(){
			$("#delete-blackList-btn").click(function(){
			$("#delete-blackList-modal").modal({backdrop: "static"});
			});
		});
	</script>


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

</body>
</html>