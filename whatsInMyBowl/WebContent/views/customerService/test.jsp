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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <!-- + 버튼 누르면 파일 업로드 갯수 늘어나고 - 누르면 삭제되는 부분 테스트 중 -->
	
		
		<!-- 
		<div class="fileBox" style="display: inline-block;">
			<div class="fileBox_first" style="margin-bottom: 10px;">
				<div style="padding: 0px 30px; display: inline-block; text-align: start;">첨부파일</div>
				<input type="text" class="fileName" readonly="readonly">
				<label for="uploadBtn" class="btn_file" style="vertical-align: middle;">찾아보기</label>
				<button type="button" class="btnAdd"">+</button>
				<input type="file" id="uploadBtn" class="uploadBtn">
			</div>
		</div>
		
		 -->
	<!-- 예제 시작 -->
	<!-- 
	
	
	
	 -->
	<table id="preset" style="display:none;">
		<tr name="tr_attach_file">
			<th>첨부파일</th>
			<td>
				<input type="file" name="attachFile" />
			</td>
		</tr>
	</table>
	
	<form name="form1" method="post" action="">
		<table cellpadding="5" cellspacing="0" border="1">
			<tr>
				<th>제목</th>
				<td>.</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>.</td>
			</tr>
			<tr name="tr_attach_file">
				<th>첨부파일</th>
				<td>
					<input type="file" name="attachFile" /> <input type="button" value="추가" onclick="addInput();" />
					<div id="parah"></div>
				</td>
			</tr>
			<!-- 추가 버튼을 누르면 위 숨겨진 테이블의 tr 을 가져다가 추가할 겁니닷 -->
		</table>
		
		<input type="button" value="삭제" onclick="deleteInput();"/>
		<input type="submit" value="전송"/>
		
        <div class="two_btn" align="center">
            <button type="button">목록으로</button>
            <button type="submit" id="insert">등록</button>
        </div>	
	</form>

	<script type="text/javascript">
	
		// 첨부파일 추가, 삭제 버튼으로 확장, 삭제하기 기능 -----------------------------------------------------------------------
		var arrInput = new Array(0);
		var arrInputValue = new Array(0);
		 
		function addInput() {
		  arrInput.push(arrInput.length);
		  arrInputValue.push("");
		  display();
		}
		 
		function display() {
		  document.getElementById('parah').innerHTML="";
		  for (intI=0;intI<arrInput.length;intI++) {
		    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
		  }
		}
		 
		function saveValue(intId,strValue) {
		  arrInputValue[intId]=strValue;
		}  
		 
		function createInput(id,value) {
		  return "<input type='file' id='test "+ id +"' onChange='javascript:saveValue("+ id +",this.value)' value='"+ value +"'>\
		  		<input type='button' value='삭제' onclick='deleteInput();'/><br>";
		}
		 
		function deleteInput() {
		  if (arrInput.length > 0) { 
		     arrInput.pop(); 
		     arrInputValue.pop();
		  }
		  display(); 
		}	
		
		//-----------------------------------------------------------------------------------------------------
	/*
		function addFile(){
			$('[name=form1] [name=tr_attach_file]:last').after( $('#preset tr').clone() );
			// $('#preset tr').clone() : id=preset 에서 tr 요소 셀렉트 하여 복제 !!
			// form1 안에 이름이 tr_attach_file 인것 중 마지막 것 다음에 추가합니다.
			// 이렇게 하면 실행때 마다 동적으로 하나씩 추가됩니다.
		}
	
	*/
	
	
	/*
		$(document).ready(function(){
			$('.btnAdd').click(function(){
				$('.addInput').append(
					"<input type='type' name='test' value=''>\
					 <button type='button' class='btnRemove'>tag삭제하기</button><br>"
				); //input tag 추가
				$('.btnRemove').on('click', function(){

					$(this).prev().remove();  // .pre()로 input tag 가리키고 remove() 한다.
					$(this).next().remove();  // <br> 삭제
					$(this).remove();         // 버튼삭제

				});
			});
		});
	*/
	
	

	/*
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
        */
	</script>



</body>
</html>