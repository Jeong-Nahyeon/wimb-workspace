<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $(document).ready(function(){

        $("#report tr:odd").addClass("odd");
        $("#report tr:not(.odd)").hide(); 
        $("#report tr:first-child").show(); //열머리글 보여주기

        $("#report tr.odd").click(function(){
            $(this).next("tr").toggle();
        });
    });
</script>
<style>
  .outer{
  width: 1000px;
  height: 550px;
  margin: auto;
  margin-top: 50px;
  }
  #bt{
      background-color: white;
      width: 90px;
      height: 30px;
      margin-bottom: 5px;
      border: 2px solid black;
      border-radius: 5px;
  }
  a { text-decoration:none}
  #num, #productName, #title, #type, #writeDate, #status{
    border-top: 2px solid black;
  }
  #bt a{
    color: black;
  }
  .modal-body button{
    color: white;
    background: rgb(155,213,188);
    border-radius: 5px;
    text-align: center;
    width: 100px;
    height: 40px;
    margin-left: 30px;
  }
  .modal-content{
    width: 350px;
  }
</style>

</head>
<body>
    <div class="outer">
        <!-- 상품문의가 있을때 시작-->
        <div class="container">
            <h5>상품 문의</h5>
            <hr style="border-color: gray;">
            <table id="report" class="table">
              <thead class="thead-light" align="center">
                <tr>
                  <th id="num">번호</th>
                  <th id="productName">상품명</th>
                  <th id="title">제목</th>
                  <th id="type">문의유형</th>
                  <th id="writeDate">작성일</th>
                  <th id="status">답변상태</th>
                </tr>
              </thead>
              <tbody >
                <tr align="center">
                  <td>1</td>
                  <td><a href="">샐러드명</a></td>
                  <td>해당상품 알러지정보가 궁금해요</td>
                  <td>상품</td>
                  <td>21.10.27</td>
                  <td style="color: rgb(155,213,188);">답변완료</td>
                </tr>
                <tr>
                    <td colspan="6">             
                        <h6>문의내용 : 해당상품 알러지정보가 궁금해요</h6> <br>
                        답변내용 : <br><br>
                        알레르기를 유발할 수 있는 주요 원료로 난류, 우유, 대두, 밀, 토마토, 닭고기, 견과류 등이 있습니다.
                        알레르기는 개인 체질 등에 따라 발생하는 식품이 다를 수 있으니, 해당 여부를 꼭 확인하여 주시기 바랍니다. <br><br>
                        21.10.30 
                    </td>
                </tr>
                <tr align="center">
                  <td>2</td>
                  <td>샐러드명</td>
                  <td>해당상품 재입고는 언제쯤 될까요?</td>
                  <td>기타</td>
                  <td>21.12.30</td>
                  <td><button id="bt" type="button"><a href="">수정</a></button><br>
                    <button id="bt" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><a>삭제</a></button>
                  </td>
                   <!-- The Modal 시작-->
                   <div class="modal fade" id="myModal">
                    <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header" style="width: 350px; margin-left: 20px;" >
                      <h6 class="modal-title">등록하신 상품문의를 삭제하시겠습니까?</h6>
                    </div>
                  
                    <!-- Modal body -->
                    <div class="modal-body" style="width: 350px;">
                      <button><a href="">취소</a></button>
                      <button>삭제</button>
                    </div>
                  
                    <!-- Modal footer -->
                    <div class="modal-footer" style="width: 200px;">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                  
                    </div>
                    </div>
                    </div>
                     <!-- The Modal 끝 -->
                </tr>
                <tr>
                    <td colspan="6">             
                        <h6>문의내용 : 해당상품 재입고는 언제쯤 될까요?</h6><br>
                        답변내용 : <br><br>
                        문의주신 상품은 2~3일이내 재입고 예정입니다.<br><br>
                        21.01.02                    
                    </td>
                </tr>
            
              </tbody>
            </table>
          </div>
          <!-- 상품문의가 있을때 끝-->
    
          <!-- 상품문의가 없을때 시작-->
          <div class="container">
            <h5>상품 문의</h5>
            <hr style="border-color: gray;">
            <table id="report" class="table">
              <thead class="thead-light" align="center">
                <tr>
                  <th id="num">번호</th>
                  <th id="productName">상품명</th>
                  <th id="title">제목</th>
                  <th id="type">문의유형</th>
                  <th id="writeDate">작성일</th>
                  <th id="status">답변상태</th>
                </tr>
              </thead>
              <tbody align="center">
                <tr >
                  <td colspan="6" style="padding-top: 100px;">상품문의 내역이 없습니다.</td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- 상품문의가 없을때 끝-->
      </div>    
    
</body>
</html>