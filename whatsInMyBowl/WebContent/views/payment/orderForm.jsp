<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wimb.payment.model.vo.*, java.util.ArrayList" %> 
<%
    ArrayList<PaymentCustom> customList = (ArrayList<PaymentCustom>)request.getAttribute("customList");
    ArrayList<PaymentProduct> productList = (ArrayList<PaymentProduct>)request.getAttribute("productList");
%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://kit.fontawesome.com/fca98d1848.js" crossorigin="anonymous"></script>

<!-- 주소 API -->
<!-- https: 붙이니까 팝업창은 뜬다..! 정확한 테스트는 서버 구동 후 가능 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
    * {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;}
    .wrap{
        /*border: 1px solid red;*/
        width: 1000px;
        padding-top: 20px;
        margin: auto;
    }
    /*가장 상단, 과정(작은글씨)*/
    #order-process{
        /*border: 1px solid blue;*/
        width: 100%;
        padding-right: 30px;
        text-align: right;
    }
    #order-process span{font-size: 10px;}
    /*제목*/
    #order-header{text-align: center;}
    #order-header h3{font-weight: 800;}
    /*주문상품 목록*/
    #order-list, #order-form-area{
        padding: 0 20px; 
        margin-bottom: 50px;
        vertical-align: middle;
        width: 100%;
    }
    #order-list img{
        width: 70px;
        height: 70px;
        margin: 0 150px 10px 20px;
    }
    #order-list span{ display: inline-block;}
    .product-name{
        width: 300px;
        margin-right: 100px;
    }
    .product-num{
        width: 50px;
        margin-left: 120px;
    }
    .product-price{
        width: 100px;
        text-align: right;
    }

    /*주문서 form 영역*/
    #order-form table{
        border-collapse: separate;
        border-spacing: 0 10px;
        margin-left: 10px;
    }
    #order-form th{
        width: 130px;
    }
    #order-form td{
        width: 500px;
    }
    .orderer-info, #address-info{
        margin-bottom: 70px;
    }
    #order-form input{
        border: 1px solid lightgray;
        border-radius: 5%;
    }
    #order-form input[type="text"]{
        width: 220px;
        height: 28px;
        line-height: 24px;
        font-size: 13px;
    }
    #order-form input::placeholder{font-size: 10px;}
    /*input요소 focus시 placeholder 안보이게*/
    #order-form input:focus::-webkit-input-placeholder{color: transparent;}
    /*input 요소 클릭시 박스 제거*/
    #order-form input:focus{outline: none;}
    .order-address{margin-bottom: 3px;}
    
    /*기본 배송지 불러오기*/
    #get-address-input, #get-address{
        vertical-align: middle;
    }
    /*적립금 설명*/
    .point-sub span{
        display: block;
        font-size: 10px;
    }
    /*결제수단 영역*/
    .pay-area{overflow: hidden; margin-top: 30px;}
    .pay-area i{
        display: block;
        font-size: 40px;
        color: gray;
        margin-left: 13px;
    }
    .pay-area label{font-size: 13px;}
    #credit, #cash{margin: 10px 25px;}
    #credit{float: left;}
    #cash{
        float: left;
        text-align: center;
    }
    /*총 금액*/
    #total-payment{
        border: 1px solid lightgray;
        width: 800px;
        height: 100px;
        margin: auto; margin-top: 70px;
        text-align: center; 
    }
    #total-payment span{
        font-size: 25px;
        font-weight: 700;
        line-height: 100px;
    }
    /*약관동의*/
    #terms{
        margin: auto;
        text-align: center;
    }
    #terms label{
        font-size: 10px;
        vertical-align: middle;
    }
    /*결제버튼*/
    #submit-but{
        display: block;
        background:rgb(155,213,189);
        width: 150px; height: 40px;
        font-size: 13px; 
        color: gray;
        margin: auto; margin-top: 30px;
    }
    /*무통장 입금*/
    #cash-area{
        border-top: 1px solid lightgray;
        margin: 50px 0 30px 0;
        padding: 20px 20px;
    }
    #cash-area div{margin: 10px 0;}
    #cash-area label{
        font-size: 13px;
        margin-right: 15px;
    }
    #cash-area select{
        border: 1px solid lightgray;
        width: 220px; height: 28px; 
        font-size: 13px;
    }
</style>
</head>
    <body>
        <div id="header">
            <%@ include file="../common/menubar.jsp" %>
        </div>
        <div class="wrap">
            <div id="order-process">
                <span>01장바구니 &gt; </span>
                <span style="color: rgb(52,206,117);">02주문서/결제 &gt;</span>
                <span>03주문완료</span>
            </div>
            <div id="order-header">
                <h3>주 &nbsp; 문 &nbsp;서</h3>
            </div>
    
            <!-- 주문 상품 정보-->
            <div id="order-list">
                <span style="font-size: 15px; font-weight: 800;">주문상품</span>
                <hr style="margin-top: 5px;">
                <% for(PaymentProduct ppro : productList){ %>
	                <div>
	                    <img src="<%= ppro.getFilePath() %><%= ppro.getpMainImg() %>">
	                    <span class="product-name"><%= ppro.getpName() %></span>
	                    <span class="product-num"><%= ppro.getpCount() %>개</span>
	                    <span class="product-price"><%= ppro.getpPrice() %>원</span>
	                    <hr style="width: 930px; ">
	                </div>
                <% } %>
                <% for(PaymentCustom pcu : customList ){ %>
	                <div>
	                    <img src="<%= pcu.getCuMainImg() %>">
	                    <span class="product-name"><%= pcu.getCuName() %></span>
	                    <span class="product-num"><%= pcu.getCuCount() %>개</span>
	                    <span class="product-price"><%= pcu.getCuPrice() %>원</span>
	                    <hr style="width: 930px; ">
	                </div>
                <% } %>
            </div>
            
            <!-- 본격적인? 주문서 Form-->
            <div id="order-form-area">
                <span style="font-size: 15px; font-weight: 800;">주문자 정보</span>
                <hr style="margin-top: 5px;">
    
                <form action="" id="order-form">
                	<% if(loginUser != null){ %>
	                    <table class="orderer-info">
	                        <tr>
	                            <th>주문자 성함 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td>
	                                <input type="text" name="" placeholder="이름을 입력해주세요." value="">
	                                <input type="hidden" name="mCode" value="<%= loginUser.getmCode() %>">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>전화번호</th>
	                            <td><input type="text" name=""></td>
	                        </tr>
	                        <tr>
	                            <th>휴대폰 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td><input type="text" placeholder="숫자만 입력해주세요." ></td>
	                        </tr>
	                        <tr>
	                            <th>이메일 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td><input type="text" name="oEmail"></td>
	                        </tr>
	                    </table>
                    <% } else {%>
                    	<table class="orderer-info">
	                        <tr>
	                            <th>주문자 성함 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td>
	                                <input type="text" name="" placeholder="이름을 입력해주세요." >
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>전화번호</th>
	                            <td><input type="text" name=""></td>
	                        </tr>
	                        <tr>
	                            <th>휴대폰 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td><input type="text" placeholder="숫자만 입력해주세요." ></td>
	                        </tr>
	                        <tr>
	                            <th>이메일 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td><input type="text" name="oEmail"></td>
	                        </tr>
	                    </table>
                    <% } %>
                    
    
                    <!-- 배송지 정보 영역-->
                    <span style="font-size: 15px; font-weight: 800; margin-right: 15px;">배송지 정보</span>
                    <% if(loginUser != null){ %>
                    	<input type="checkbox" name="" id="get-address-input"> 
                    	<span  id="get-address" style="font-size: 10px;">기본 배송지 불러오기</span> 
                    <% } %>
                    <hr style="margin-top: 5px;">
    
                    <table id="address-info">
                        <tr>
                            <th>
                                받으실 분<span style="color: red; vertical-align: middle;">*</span>
                            </th>
                            <td>
                                <input type="text" name="oName" placeholder="이름을 입력해주세요." >
                            </td>
                        </tr>
                        <tr>
                            <th>
                                받으실 곳<span style="color: red; vertical-align: middle;">*</span>
                            </th>
                            <td>
                                <div class="order-address">
                                    <input type="text" name="oZipCode" id="address-code">
                                    <button class="btn btn-sm btn-secondary" onclick="addressSearch()">
                                        우편번호 검색
                                    </button>
                                </div>
                                <div class="order-subAddress">
                                    <input type="text" name="oAddress" id="address-main">
                                    <input type="text" name="oSubAddress" id="address-sub" placeholder="상세주소">
                                </div>
                                
                            </td>
                        </tr>
                        <tr>
                            <th>
                                휴대폰<span style="color: red; vertical-align: middle;">*</span>
                            </th>
                            <td><input type="text" name="oPhone" placeholder="숫자만 입력해주세요." ></td>
                        </tr>
                        <tr>
                            <th>이메일 <span style="color: red; vertical-align: middle;">*</span></th>
                            <td><input type="text" name="oEmail"></td>
                        </tr>
                        <tr>
                            <th>배송요청사항</th>
                            <td><input type="text" name="oRequest"></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td></td>
                        </tr>
                    </table>
    
                    <!-- 적립금 영역 -->
                    <% if(loginUser != null){ %>
                        <span style="font-size: 15px; font-weight: 800;">적립금 사용</span>
                        <hr style="margin-top: 5px;">
                        <table id="point-table">
                            <tr>
                                <th>적립금 사용</th>
                                <td>
                                    <input type="number" name="oPoint">
                                    <button class="btn btn-sm btn-secondary">모두사용</button>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="point-sub">
                                        <span style="font-size: 13px; margin-bottom: 7px;">보유적립금 : 3,000원</span>
                                        <span>* 보유적립금 1천원 이상부터 사용가능</span>
                                        <span>* 적립금내역 : 마이페이지 - 적립금조회</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
    				<% } %>

                    <!-- 결제수단 영역 -->
                    <div class="pay-area">
                        <span style="font-size: 15px; font-weight: 800;">결제 수단</span>
                        <hr style="margin-top: 5px;">
                        <div id="credit">
                            <i class="far fa-credit-card"></i>
                            <input type="radio" name="payment" id="credit-check"> <label for="credit-check">신용카드</label> 
                        </div>
                        <div id="cash">
                            <i class="fas fa-wallet"></i>
                            <input type="radio" name="payment" id="cash-check"> <label for="cash-check">무통장입금</label> 
                        </div>
                    </div>
    
                    <!-- 무통장입금 선택시 보여질 영역 -->
                    <div id="cash-area">
                        <div>
                            <label>입금자명</label> 
                            <input type="text" name="">
                        </div>
                        <div>
                            <label>입금은행</label>
                            <select name="" id="">
                                <option>은행선택</option>
                                <option value="">국민은행 11122223334445 wimb</option>
                                <option value="">신한은행 11122223334445 wimb</option>
                            </select>
                        </div>   
                    </div>
    
                    <script>
                        $(function(){
                            $("#cash-area").hide();
                            $("input[type='radio'][id='cash-check']").on('click',function(){
                                if($("input[type='radio'][id='cash-check']:checked")){
                                    $("#cash-area").css('display', 'none');
                                }else{
                                    $("#cash-area").css('display','block');
                                }
                            })
                        })

                    </script>
    
                    <!-- 총 금액, 약관동의 -->
                    <div id="total-payment">
                        <span>최종 결제금액 :</span>
                        <span>32,000</span>
                    </div>
                    <div id="terms">
                        <input type="checkbox" id="terms-check">
                        <label for="terms-check" style="color: red;">(필수)</label>
                        <label for="terms-check">구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                    </div>
    
                    <button type="submit" class="btn" id="submit-but">결제하기</button>
                </form>
    
                
            </div>
        </div>
        <div id="footer">
        	<%@ include file="../common/footer.jsp" %>
        </div>
    
        <!-- script -->
        <!-- 다음 주소 API 스크립트 -->
        <script>
            function addressSearch(){
                new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                    var addr = '';
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    document.getElementById('address-code').value = data.zonecode;
                    document.getElementById('address-main').value = addr;
    
                    // 커서를 상세주소 필드로 이동
                    document.getElementById("address-sub").focus();
                }
                }).open();
            }
    
        </script>
        
    </body>
    </html>