<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.wimb.mypage.model.vo.Inquiry"%>
<%
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
%>
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
  width: 800px;
  height: 550px;
  margin: auto;
  margin-top: 50px;
  }
  /* 수정, 삭제 button */
  #bt{
      background-color: white;
      width: 90px;
      height: 30px;
      margin-bottom: 5px;
      border: 2px solid black;
      border-radius: 5px;
  }
  a { text-decoration:none}
  /* table */
  .table{
    font-size: 10pt;
  }
  #num, #writer, #title, #type, #writeDate, #status{
    border-top: 2px solid black;
  }
  #bt a{
    color: black;
  }
  #num{
    width: 30px;
  }
  #writer{
    width: 50px;
  }
  #title{
    width: 200px;
  }
  #type{
    width: 80px;
  }
  #writeDate{
    width: 50px
  }
  #status{
    width: 50px;
  }

  /* modal button */
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
	<%@ include file="../common/myPage.jsp" %>
	
  <div class="outer">
      
    <div class="container" style="width: 500; margin-left: 70px;">
      <h5>1 : 1 문의</h5>
      <hr style="border-color: gray;">
      <table id="report" class="table">
        <thead class="thead-light" align="center">
          <tr>
          	<th id="num">번호</th>
            <th id="writer">작성자</th>
            <th id="title">제목</th>
            <th id="type">문의유형</th>
            <th id="writeDate">작성일</th>
            <th id="status">답변상태</th>
          </tr>
        </thead>
        <tbody>
            <% if(list.isEmpty()) { %>
              <!-- case1. 1:1 문의가  없을 경우 -->
              <tr align="center">
                  <td colspan="6" style="padding-top: 100px;">1 : 1문의 내역이 없습니다.</td>
              </tr>
            <% } else { %>
              <!-- case2. 1:1 문의가  있을 경우 -->
              <% for(Inquiry i : list) { %>
                <tr align="center">
                  <td><%= i.getiCode() %></td>
                  <td><%= loginUser.getmName() %></td>
                  <td><%= i.getiTitle() %></td>
                  <td><%= i.getiCategory() %></td>
                  <td><%= i.getiDate() %></td>
                  <td style="color: rgb(155,213,188);"><%= i.getiAnswer() %></td>
                </tr>
              <% } %>
                    
                <tr align="center">
                  <td>2</td>
                  <td>홍길동</td>
                  <td>배송이 안왔는데 도착완료라고 떠요.</td>
                  <td>배송문의</td>
                  <td>21.12.30</td>
                    <!--현재 로그인한 사용자가 해당 글을 쓴 본인일 경우-->
                       
                  <td><button id="bt" type="button" onclick="modify()">수정</a></button><br>
                    <button id="bt" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><a>삭제</a></button>
                  </td>
                     
                  <!-- The Modal 시작-->
                  <div class="modal fade" id="myModal">
                  <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                 
                  <!-- Modal Header -->
                  <div class="modal-header" style="width: 350px;">
                    <h6 class="modal-title">등록하신 1:1 문의를 삭제하시겠습니까?</h6>
                  </div>
                   
                  <!-- Modal body -->
                  <div class="modal-body" style="width: 350px;">
                    <button>취소</button>
                    <button><a href="<%= contextPath %>/delete.inquiry"></a>삭제</button>
                  </div>
                
                  <!-- Modal footer  -->
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
                    문의내용 : 배송이 안왔는데 도착완료라고 떠요.<br><br>
                    답변내용 : <br><br>
                    배송은 도착완료라고뜨는데 샐러드를 받지못했어요<br><br> 
                    22.01.02                   
                </td>
                </tr>
               
               </tbody>
              <% }  %>
               
           </table>
           
         </div>

     </div>   
          <!-- 1:1 문의가 있을때 끝-->
    
          <!-- 1:1 문의가 없을때 시작
          <div class="container">
            <h5>1 : 1 문의</h5>
            <hr style="border-color: gray;">
            <table id="report" class="table">
              <thead class="thead-light" align="center">
                <tr>
                  <th id="num">번호</th>
                  <th id="writer">작성자</th>
                  <th id="title">제목</th>
                  <th id="type">문의유형</th>
                  <th id="writeDate">작성일</th>
                  <th id="status">답변상태</th>
                </tr>
              </thead>
              <tbody>
                <tr align="center">
                  <td colspan="6" style="padding-top: 100px;">1 : 1문의 내역이 없습니다.</td>
                </tr>
            
              </tbody>
            </table>
          </div>
          -->
	<script>
		$(function(){
			document.hiddenForm.submit();
		})

		function modify(){
			location.href = "<%= contextPath %>/myPage.my" // 고객센터 1:1문의로 이동하는 링크걸기
		}
		
	

	</script>      
	        
    
</body>
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
	
	
</html>