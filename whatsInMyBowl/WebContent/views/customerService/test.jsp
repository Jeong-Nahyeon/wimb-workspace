<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .fileBox{position: relative;}
    .fileBox .fileName {
        display:inline-block;
        width:190px;
        height:30px;
        padding-left:10px;
        margin-right:5px;
        line-height:30px;
        border:1px solid #aaa;
        background-color:#fff;
        vertical-align:middle
    }
    .fileBox .btn_file {
        display:inline-block;
        position: absolute;
        background-color: gray;
        color: white;
        width:50px;
        height:30px;
        font-size:8px;
        line-height:30px;
        border-radius: 3px;
        text-align:center;
        vertical-align:middle
    }
	.btn_file{position: relative;}
    .fileBox input[type="file"] {
        position:absolute;
        width:1px;
        height:1px;
        padding:0;
        margin:-1px;
        overflow:hidden;
        clip:rect(0,0,0,0);
        border:0
    }
	.btnAdd{
		width: 25px;
		font-size: 13px;
		position: absolute;
		right: -79px;
		text-align: center;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- + 버튼 누르면 파일 업로드 갯수 늘어나고 - 누르면 삭제되는 부분 테스트 중 -->
	<form action="" method="">

		<div class="fileBox" style="display: inline-block;">
			<div class="fileBox_first" style="margin-bottom: 10px;">
				<div style="padding: 0px 30px; display: inline-block; text-align: start;">첨부파일</div>
				<input type="text" class="fileName" readonly="readonly">
				<label for="uploadBtn" class="btn_file" style="vertical-align: middle;">찾아보기</label>
				<button type="button" class="btnAdd"">+</button>
				<input type="file" id="uploadBtn" class="uploadBtn">
			</div>
		</div>
		
		<div class="addInput">
	
		</div>
		
		<!--
			<button type="button" class="btnAdd">+</button>
			<input type="submit">


		-->
	
		
	
		
	</form>

	<script type="text/javascript">
		
		$(document).ready(function(){
			$('.btnAdd').click(function(){
				$('.addInput').append(
					'<input type="text" class="fileName" readonly="readonly">\
					<label for="uploadBtn" class="btn_file" style="vertical-align: middle;">찾아보기</label>\
					<button type="button" class="btnRemove">-</button><br>'
				); //input tag 추가
				$('.btnRemove').on('click', function(){

					$(this).prev().remove();  // .pre()로 input tag 가리키고 remove() 한다.
					$(this).next().remove();  // <br> 삭제
					$(this).remove();         // 버튼삭제

				});
			});
		});
		


		var uploadFile = $('.fileBox .uploadBtn');
        uploadFile.on('change', function(){
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $(this).siblings('.fileName').val(filename);
        });

        var uploadFile = $('.fileBox .uploadBtn2');
        uploadFile.on('change', function(){
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $(this).siblings('.fileName').val(filename);
        });
	</script>



</body>
</html>