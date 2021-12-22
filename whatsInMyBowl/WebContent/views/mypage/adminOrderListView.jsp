<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.wimb.mypage.model.vo.Orders, com.wimb.common.model.vo.PageInfo" %>
<%
	ArrayList<Orders> olist = (ArrayList<Orders>)request.getAttribute("olist");
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
<title>취소내역 리스트</title>
<script src="https://kit.fontawesome.com/10f565a9d5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

    main{
        margin-top: 100px;
        margin-left: 25%;
        width: 1500px;
    }
    #mainTitle>h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}

    .menus > button {
        width: 329px;
        height: 55px;
        border: 1px solid rgba(182, 178, 178, 0.719);
        border-bottom: none;
        color: rgba(119, 110, 110, 0.829);
        background-color: rgba(240, 239, 233, 0.445);;
    }
    .menus {
        height: 60px; 
        width: 1000px;
        font-size: large;
        margin-bottom: 5px;
    }
    .list th {
        font-size: 13px;
        text-align: center;
        padding: 8px 2px;
        background-color: rgba(204, 204, 204, 0.486);
        border: 1px solid lightgray;
    }
    .list td {
        font-size: 13px;
        text-align: center;
        padding: 8px 2px;
        border: 1px solid lightgray;
    }
    .list {border:1px solid lightgray;}
    div > label{
        margin: 0px; 
        font-size: 15px;
        color: rgba(94, 93, 93, 0.87);
    }
    .list {margin: 5px 0px 15px 0px;}
    #countNo {  color: orange; }
    #cancel {
        float: right;
        border: none;
        background-color: #ffee58;
        color: rgba(94, 93, 93, 0.87);
        font-weight: bold;
        font-size: 14px;
        width: 80px;
        height: 25px;
        border-radius: 2px;
    }
    .paging-area > button {
        padding: 0px;
        font-size: small;
        height: 23px;
        width: 23px;
        border-radius: 4px;
        border: 0px;
        background-color: lightgray;
    }
    button:disabled {background-color: #ffee58; color: black;}
    .search-area button {
        height: 27px;
        width: 70px;
        border: 1px solid black;
        border-radius: 2px;
        background-color: white;
        font-size: smaller;
        margin-left: 20px;
        background-color: lightgray;
    }
    label {margin: 0px;}
    u:hover {cursor: pointer;}
    .modal-body th {
        width: 120px;
        font-size: 15px;
        padding: 10px 0px;
    }
    .modal-body td {
        font-size: 15px;
    }
    .modal-footer {
        height: 0px;
        margin: 0px 100px 60px 0px;
    }
    .modal-footer button {
        border: 0px;
        border-radius: 4px;
        width: 70px;
        height: 30px;
        margin-right: 40px;
    }
</style>
</head>
<body>
    <%@ include file="../common/adminBar.jsp"%>

    <main>

        <div id="mainTitle">
            <h2 id="mainTitle1">상품관리 </h2>
            <h2>> 상품 배송관리</h2>
        </div>

        <div class="menus">
            <button type="button" id="orderLIst"><b>주문내역</b></button>
            <button type="button" id="refundLIst"><b>환불내역</b></button>
            <button type="button" id="cancelList"><b>취소내역</b></button>
        </div>
        
        <div>
            <div style="width:1000px">
                <label><b>총</b></label>
                <label id="countNo"><b>87</b></label>
                <label><b>건</b></label>
                <button type="button" id="cancel">주문 취소</button>
            </div>
            <table class="list" width="1000">
                <thead>
                    <tr>
                        <th width="25">/</th>
                        <th width="35">번호</th>
                        <th width="110">주문번호</th>
                        <th width="75">주문자</th>
                        <th width="225">상품명</th>
                        <th width="70">상품금액</th>
                        <th width="70">결제금액</th>
                        <th width="50">배송비</th>
                        <th width="60">결제유형</th>
                        <th width="70">택배사</th>
                        <th width="135">운송장번호</th>
                        <th width="75">배송상태</th>
                    </tr>
                </thead>
                <tbody>
                <% if(olist == null) { %>
                	<tr>
                        <td colspan="12" style="height:300px;">조회내역이 없습니다.</td>
                    </tr>
                
                
                <% }else { %>
                	<% for(Orders od : olist) { %>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <td>1</td>
	                        <td><%= od.getOrderCode() %></td>
	                        <td><%= od.getmName() %></td>
	                        <td>상품명</td>
	                        <td>상품금액</td>
	                        <td>결제금액</td>
	                        <td>3000원</td>
	                        <td>결제유형</td>
	                        <td><%= od.getCompany() %></td>
	                        <td><%= od.getInvoice() %></td>
	                        <td><%= od.getStatus() %></td>
	                    </tr>
                    <% } %>
                <% } %>
                </tbody>    
            </table>

            <div class="paging-area" style="width:1000px; padding-bottom:40px;" align="center">
			
				<% if (currentPage != 1) { %>
                <button onclick="location.href='<%= contextPath %>/orderList.admin?cpage=<%= currentPage -1 %>';"> &lt; </button>
                <% } %>
					
				<% for(int p=startPage; p<=endPage; p++) { %>
                    <% if(p == currentPage) { %>
                    <button disabled><%= p %></button>
                    <% }else { %>
                    <button onclick="location.href='<%= contextPath %>/orderList.admin?cpage=<%= p %>';"><%= p %></button>
                	<% } %>
                <% } %>
                
                <% if(currentPage != maxPage) { %>
                <button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage +1%>';"> &gt; </button>
            	<% } %>
            </div>

            <div style="width:1000px" align="center">
                <form action="">
                    <table class="search-area">
                        <tr>
                            <td>
                                <select name="searchType" style="height: 30px; width: 95px;">
                                    <option value="userName">주문자명</option>
                                    <option value="pName">상품명</option>
                                    <option value="payment">결제유형</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="search" placeholder="내용을 입력해주세요">
                            </td>
                            <td>
                                <button type="button"><i class="fas fa-search">조회</i></button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>


        </div>


        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header" style="font-size:large; background-color: rgba(240, 239, 233, 0.445);">
                        <div>
                            <b>주문 상세 정보</b>
                        </div>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                            <table class="modal-body">
                                <tr>
                                    <th>주문일자</th>
                                    <td>2021.12.11</td>
                                </tr>
                                <tr>
                                    <th>주문번호</th>
                                    <td>2021121112345</td>
                                </tr>
                                <tr>
                                    <th>주문자</th>
                                    <td>김말똥말똥</td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>010-1234-5678</td>
                                </tr>
                                <tr>
                                    <th>주문번호</th>
                                    <td>2021121112345</td>
                                </tr>
                                <tr>
                                    <th>배송요청사항</th>
                                    <td>문앞에 두고가세요.</td>
                                </tr>
                                <tr>
                                    <th style="vertical-align: top;">주문내역</th>
                                    <td>
                                        <ul style="padding: 3px 18px;">
                                            <li>닭가슴살샐러드</li>
                                            <li>닭가슴살샐러드</li>
                                            <li>닭가슴살샐러드</li>
                                            <li>닭가슴살샐러드</li>
                                            <li>닭가슴살샐러드</li>
                                        </ul>
                                    <td>
                                </tr>
                            </table>
                    </div>
                    <!-- Modal Header -->
                    <div class="modal-header" style="font-size:large; background-color: rgba(240, 239, 233, 0.445);">
                        <div>
                            <b>배송 정보 등록</b>
                        </div>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <table>
                            <tr>
                                <th>택배사</th>
                                <td><input type="text" placeholder="택배사 입력"></td>
                            </tr>
                            <tr>
                                <th>운송장번호</th>
                                <td><input type="text" placeholder="운송장번호 입력"></td>
                            </tr>
                        </table>
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer" style="border:0px;">
                        <button type="submit" data-dismiss="modal" style="background-color: #ffee58;">등록</button>
                        <button type="reset" data-dismiss="modal">취소</button>
                    </div>

                </div>
            </div>
        </div>





        
    </main>


</body>
</html>