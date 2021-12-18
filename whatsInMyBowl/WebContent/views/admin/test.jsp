<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<body>

    <div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">로그인 실패</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					아이디 또는 패스워드가 일치 하지 않습니다.
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

    <script>
        $('#login-submit').click(function(e) {
		if($('[name="userid"]').val() == 0 || $('[name="userpwd"]').val() == 0){
			alert("ID 또는 패스워드를 입력해주세요");
		}else{
			/*$('#login-form').submit();*/
			var param = $("form[name=loginuser]").serialize();
			console.log(param);
			$.ajax({
				url: "loginuser",
				type: "GET",
				data: param,
				success:function(data){
					/*console.log(data);
					alert(data);*/
					if(data == 1){
						console.log("로그인 실패");
						$('div.modal').modal();
					}else{
						window.location.href = "Index";
					}
				},
				error:function(data){
					alert("error");
				}
			});
		}
	});
    </script>


</body>
</html>