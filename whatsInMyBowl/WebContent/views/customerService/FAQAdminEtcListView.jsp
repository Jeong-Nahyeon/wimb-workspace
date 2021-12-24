<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.wimb.customerService.model.vo.FAQ, com.wimb.common.model.vo.PageInfo"%>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 자주묻는 질문 리스트</title>
<style>
    .outer{
        margin-top: 100px;
        margin-left: 25%;
        width: 1000px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .FAQ_Box_top{text-align: end;}
    .FAQ_Box_top button{
        border: none;
        background-color: #ffee58;
        border-radius: 4px;
        font-size: 15px;
        padding: 3px 10px;
        margin-bottom: 10px;
    }
    .FAQ_Box_top button:focus{outline: none;}
    .FAQ_Box_top button:hover{background-color: #fdd835;}
    .FAQ_Category{
        width: 1000px;
        margin: 20px 0px;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 15px;
        font-weight: bold;
    }
    .FAQ_Category_box{
        display: inline-block;
        padding: 5px 40px;
    }
    .FAQ_Category_box a{color: black;}
    .FAQ_Box table{
        width: 1000px;
        border-collapse: collapse;
        margin-top: 100px;
    }
    .FAQ_Box table .check1{width: 3%;}
    .FAQ_Box table .FAQ_title{
        width: 90%;
        font-weight: bold;
        border-bottom: 1px solid gray;
    }
    .FAQ_Box table .FAQ_Update_btn{
        border-bottom: 1px solid gray;
        text-align: end;
    }
    .FAQ_Update_btn button{
        border-radius: 3px;
        border: none;
        background-color: #ffee58;
        margin-bottom: 3px;
        padding: 2px 8px;
        font-size: 14px;
    }
    .FAQ_Update_btn button:focus{outline: none;}
    .FAQ_Update_btn button:hover{background-color: #fdd835;}
    .FAQ_answer{margin-bottom: 1100px;}
    .FAQ_title, .FAQ_answer{
        padding: 10px 0;
    }
    .FAQ_answer{padding-bottom: 80px}
    /* 페이징바 */
    .paging-area button{
        margin-top: 20px;
        border: 0;
    }
    .paging-area{
        /*border: 1px solid coral;*/
        width: 100%;
        text-align: center;
        margin-top: 20px;
        padding-bottom: 50px;     
    }
    .paging-area>button{
        width: 20px;
        height: 20px;
        font-size: 10px;
        border: none;
        border-radius: 5%;
    }
	.noticeList tr:hover{
    	background: lightgrey;
    	cursor: pointer;
    }
 	/*자주묻는질문 삭제 모달*/

     .delete_text{
         text-align: center;
      }
     .delete_text span{
         display: block;
         margin: 10px 0;
     }
     .delete_btn{
         margin: 40px 5px 5px 5px;
         text-align: center;
     }
     .delete_btn button{
         margin: 0 10px;
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
    <%@ include file="../common/adminBar.jsp" %>

    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">고객센터관리</h2>
            <h2>> 자주묻는 질문</h2>
        </div>
        
        <div class="FAQ_Box">

            <div class="FAQ_Box_top">
                <button class="notice_Box_top_left" type="button" onclick="location.href='<%= contextPath %>/adminEnrollForm.faq';">새 글 등록</button>
                <button class="notice_Box_top_bottom" data-toggle="modal" data-target="#banner_delete_Modal">선택삭제</button>
            </div>
            
            <div class="FAQ_Category" align="center">
                <div class="FAQ_Category_box"><a href="<%= contextPath %>/adminList.faq?cpage=1">전체</a></div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;"><a href="<%= contextPath %>/adminDeliveryList.faq?cpage=1">배송</a></div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;"><a href="<%= contextPath %>/adminPointList.faq?cpage=1">적립금</a></div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;"><a href="<%= contextPath %>/adminOrderPaymentList.faq?cpage=1">주문/결제</a></div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;"><a href="<%= contextPath %>/adminCancelRefundList.faq?cpage=1">취소/환불</a></div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;"><a href="<%= contextPath %>/adminProductList.faq?cpage=1">상품</a></div>
                <div class="FAQ_Category_box" style="border-left: 1px solid gray;"><a href="<%= contextPath %>/adminEtcList.faq?cpage=1">이용/기타</a></div>
            </div>

            <table>
            	<% for(FAQ f:list) { %>
                <tr>
                	<input type="hidden" name="faqCode" value="<%= f.getFaqCode() %>" class="faqCode">
                    <td class="check1"><input type="checkbox" name="check"></td>
                    <td class="FAQ_title"><%= f.getFaqTitle() %></td>
                    <td class="FAQ_Update_btn"><button type="button">수정</button></td>
                </tr>
                <tr>
                    <td class="check1"></td>
                    <td colspan="2" class="FAQ_answer"><%= f.getFaqContent() %></td>
                </tr>
                <% } %>
            </table>
            
		        <div class="paging-area" align="center">
		            
		            <% if(currentPage != 1) { %>
		            	<button onclick="location.href='<%= contextPath %>/adminList.faq?cpage=<%=currentPage-1%>';">&lt;</button>
		            <% } %>
		            
		            <% for(int p=startPage; p<=endPage; p++) { %>
		            	<% if(p == currentPage) { %>
		            		<button disabled><%= p %></button>
		            	<% } else { %>
		            		<button onclick="location.href='<%= contextPath %>/adminList.faq?cpage=<%= p %>';"><%= p %></button>
		            	<% } %>
		            <% } %>
		            
		            <% if(currentPage != maxPage) { %>
		            <button onclick="location.href='<%= contextPath %>/adminList.faq?cpage=<%=currentPage+1%>';">&gt;</button>
		        	<% } %>
		        </div>		
        </div>

    </div>

         	<!-- 자주묻는질문 삭제 관련 모달-->
            <!-- The Modal -->
            <div class="modal" id="banner_delete_Modal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <!-- <form action="" >  -->
                            <div class="delete_text">
                                <span>선택하신 자주묻는질문을 삭제합니다.</span>
                                <span>정말 삭제하시겠습니까?</span>
                                <span>(삭제 후 복구불가)</span>
                            </div>
                            <div class="delete_btn">
                                <button class="btn btn-sm btn btn-outline-warning" data-toggle="modal" onclick="deletecheck();">삭제</button>
                                <button type="reset" class="btn btn-sm btn-outline-secondary" data-dismiss="modal">취소</button>
                            </div>
                        <!-- </form>  -->
                    </div>
                </div>
                </div>
            </div>

	 	<script>
		// 수정 시 필요한 게시판 번호를 넘기는 함수 ------------------------------------------
		$(function(){
			$(".updateBox td:nth-child(4) button").click(function(){
				location.href="<%= contextPath %>/adminUpdateForm.faq?num=" + $(this).parent().siblings('.faqCode').val();
				
			})
		})       	
		// ----------------------------------------------------------------------	
		
        	
        	// 선택 삭제 ------------------------------------------------------------------
	        function deletecheck(){
	    		promise1()
	    		.then(successCheck)
	    		.catch(failCheck);
	    	}
	    	
	    	function promise1(){
	    		var count = $("input[name='check']:checked").length;
	    		var checkArr = new Array();
	    		 $("input[name='check']:checked").each(function(){
	                 checkArr.push($(this).parent().siblings(".faqCode").val())
	             });
	    		 
	             return new Promise(function(resolve, reject){
	                 $.ajax({
	                     url:"delete.faq",
	                     dataType:"json",
	                     traditional:true,
	                     data:{
	                         count:count,
	                         checkArr:checkArr
	                     },
	                     success:function(result){
	                         console.log("프로미스1 성공")
	                         resolve(result);
	                     },
	                     error:function(){
	                         console.log("ajax 통신 실패");
	                     }
	                 })
	             })
	    	}
	    	  function successCheck(){
	              alert("자주묻는질문 삭제 완료")
	              location.reload();
	          }
	
	          function failCheck(){
	              alert("삭제에 실패하였습니다.")
	          }    	
	    	  // ------------------------------------------------------------------------     	
 		</script>

</body>
</html>