<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기신고</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

</style>
</head>
<body>

	<!-- 후기신고 모달창 -->
    <div class="modal fade" id="report-insert-modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content insert-report-modal" style="width:800px; height:800px;">
                
                <!-- Modal Header -->
                <div class="modal-header title-area">
                    
                    <h6 class="modal-title" style="margin-left:350px; font-weight:bolder;">후기신고</h6>
                    
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body content-area" align="center">

                    <form action="" id="report-insert-form" method="post" enctype="multipart/form-data">

                       <div class="report-insert-content" style="box-sizing:border-box; width:750px;">

                            <div class="report-review">

                                <div class="reprot-review-img">
                                        <!-- case1. 등록된 리뷰사진 없을 경우  -->
                                        <!-- <i class="fas fa-image" width="100px" height="100px"></i> -->
                                        <!-- case2. 등록된 리뷰사진 있을 경우 => 첫번째 사진 표시 -->
                                        <img src="" width="100px" height="100px">
                                </div>
                                <div class="report-review-content">
                                        욕설 리뷰 내용
                                </div>
                            </div>

                           <hr>

                           <table class="report-form-content" id="reportInsertForm">
                                <tr>
                                    <th>작성자</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><textarea name="" id="" rows="15" style="resize:none;"></textarea></td>
                                </tr>
                                <tr>
                                    <th>파일첨부</th>
                                    <td><input type="file" name="" id=""></td>
                                </tr>
                           </table>

                       </div>

                    </form>

                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer button-area">
                    <div class="btns" align="center" style="width:100%;">
						<button type="reset" class="report-form-close-btn" class="btn btn-sm" data-dismiss="modal">취소</button>
					
						<button type="submit" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;" form="report-insert-form">등록</button>
					</div>
                </div>
            
            </div>
        </div>
        </div>        


</body>
</html>