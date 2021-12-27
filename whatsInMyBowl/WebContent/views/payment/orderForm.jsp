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

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/fca98d1848.js" crossorigin="anonymous"></script>

<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  -->

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 주소 API -->
<!-- https: 붙이니까 팝업창은 뜬다..! 정확한 테스트는 서버 구동 후 가능 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
        text-align: right;
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
            <form action="<%= contextPath %>/cashComplete.pay" id="order_form" method="post"></form>
            <div id="order-list">
                <span style="font-size: 15px; font-weight: 800;">주문상품</span>
                <hr style="margin-top: 5px;">
                <% for(PaymentProduct ppro : productList){ %>
	                <div>
	                    <img src="<%= ppro.getFilePath() %><%= ppro.getpMainImg() %>">
	                    <span class="product-name"><%= ppro.getpName() %></span>
	                    <span class="product-num"><%= ppro.getpCount() %></span><span>개</span>
	                    <span class="product-price"> <label class="price_num"><%= ppro.getpPrice() %></label> 원</span>
                        <input type="hidden" name="productCode" value="<%= ppro.getpCode() %>">
	                    <hr style="width: 930px; ">
	                </div>
                <% } %>
                <% for(PaymentCustom pcu : customList ){ %>
	                <div>
	                    <img src="<%= contextPath %>/resources/images/LOGO.png">
	                    <span class="product-name"><%= pcu.getCuName() %></span>
	                    <span class="product-num"><%= pcu.getCuCount() %></span><span>개</span>
	                    <span class="product-price"><label class="price_num"><%= pcu.getCuPrice() %></label>원</span>
	                    <input type="hidden" name="productCode" value="<%= pcu.getCuCode() %>">
	                    <hr style="width: 930px; ">
	                </div>
                <% } %>
            </div>
            
            <!-- 본격적인? 주문서 Form-->
            <div id="order-form-area">
                <span style="font-size: 15px; font-weight: 800;">주문자 정보</span>
                <hr style="margin-top: 5px;">
    
                <!--<form action="<%= contextPath %>/cashComplete.pay" id="order-form" method="post">-->
                <div id="order-form">
                	<% if(loginUser != null){ %>
	                    <table class="orderer-info">
	                        <tr>
	                            <th>주문자 성함 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td>
	                                <input type="text" name="mName" placeholder="이름을 입력해주세요." value="<%= loginUser.getmName() %>">
	                                <input type="hidden" name="mCode" value="<%= loginUser.getmCode() %>">
                                    <input type="hidden" name="mPostCode" value="<%= loginUser.getPostcode() %>">
                                    <input type="hidden" name="mAddress" value="<%= loginUser.getmAddress() %>">
                                    <input type="hidden" name="mSubAddress" value="<%= loginUser.getSubAddress() %>">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>전화번호</th>
	                            <td><input type="text" value=""></td>
	                        </tr>
	                        <tr>
	                            <th>휴대폰 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td><input type="text" name="mPhone" value="<%= loginUser.getmPhone() %>"></td>
	                        </tr>
	                        <tr>
	                            <th>이메일 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td><input type="text" name="mEmail" value="<%= loginUser.getmEmail() %>" ></td>
	                        </tr>
	                    </table>
                    <% } else {%>
                    	<table class="orderer-info">
	                        <tr>
	                            <th>주문자 성함 <span style="color: red; vertical-align: middle;">*</span></th>
	                            <td>
	                                <input type="text" name="" placeholder="이름을 입력해주세요." >
                                    <input type="hidden" name="mCode" value="1">
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
                    	<input type="checkbox" name="" id="get-address-input" onclick="memberInfo();"> 
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
                                    <input type="text" name="oZipCode" id="address_code">
                                    <button type="button" class="btn btn-sm btn-secondary" onclick="addressSearch();">
                                        우편번호 검색
                                    </button>
                                </div>
                                <div class="order-subAddress">
                                    <input type="text" name="oAddress" id="address_main">
                                    <input type="text" name="oSubAddress" id="address_sub" placeholder="상세주소">
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
                            <td><input type="text" name="oRequest" value="없음"></td>
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
                                    <input type="number" name="oPoint" value="0" id="usePoint">
                                    <button type="button" class="btn btn-sm btn-secondary" onclick="pointAll();">모두사용</button>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <div class="point-sub">
                                        <span style="font-size: 13px; margin-bottom: 7px;">
                                            보유적립금 : <label id="allPoint">2000</label>원
                                        </span>
                                        <span>* 보유적립금 1천원 이상부터 사용가능</span>
                                        <span>* 적립금내역 : 마이페이지 - 적립금조회</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
    				<% } else{%>
                        <div>
                            <input type="hidden" name="oPoint" value="0">
                        </div>
                    <% } %>

                    <!-- 결제수단 영역 -->
                    <div class="pay-area">
                        <span style="font-size: 15px; font-weight: 800;">결제 수단</span>
                        <hr style="margin-top: 5px;">
                        <div id="credit">
                            <i class="far fa-credit-card"></i>
                            <input type="radio" name="payment" id="credit-check" value="credit"> <label for="credit-check">신용카드</label> 
                        </div>
                        <div id="cash">
                            <i class="fas fa-wallet"></i>
                            <input type="radio" name="payment" id="cash-check" value="cash"> <label for="cash-check">무통장입금</label> 
                        </div>
                    </div>
    
                    <!-- 무통장입금 선택시 보여질 영역 -->
                    <div id="cash-area" style="display: none;">
                        <div>
                            <label>입금자명</label> 
                            <input type="text" name="cashName">
                        </div>
                        <div>
                            <label>입금은행</label>
                            <select name="cashBank" id="">
                                <option>은행선택</option>
                                <option value="국민">국민은행 11122223334445 wimb</option>
                                <option value="신한">신한은행 11122223334445 wimb</option>
                            </select>
                        </div>   
                    </div>
    
                    <script>
                        $(function(){
                            $("input[type='radio'][id='cash-check']").on('click',function(){
                                var check = $("input[type='radio'][name='payment']:checked").val()
                                //console.log(check);
                                $("#cash-area").css('display', 'block');
                                 //$("#cash-area").css('display','none');
                            });
                            $("input[type='radio'][id='credit-check']").on('click', function(){
                                $("#cash-area").css('display','none');
                                
                            })
                        })

                    </script>
    
                    <!-- 총 금액, 약관동의 -->
                    <div id="total-payment">
                        <span>최종 결제금액 :</span>
                        <span id="total_price"></span><span>원</span>
                        <input type="hidden" name="total_count">
                        <input type="hidden" name="total_price">
                    </div>
                    <div id="terms">
                        <input type="checkbox" id="terms-check">
                        <label for="terms-check" style="color: red;">(필수)</label>
                        <label for="terms-check">구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                    </div>
    
                    <button type="button" class="btn" id="submit-but" onclick="paymentclick();">결제하기</button>
                </form>
                </div>
                
            </div>
        </div>
        <div id="footer">
        	<%@ include file="../common/footer.jsp" %>
        </div>
    
        <!-- script -->
        <!-- 다음 주소 API 스크립트 -->
        <script>
            function addressSearch() {
                new daum.Postcode({
                    submitMode: false,
                    popupKey: 'popup1',
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수
        
                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
        
                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            //document.getElementById("sample6_extraAddress").value = extraAddr;
                        
                        } else {
                            //document.getElementById("sample6_extraAddress").value = '';
                        }
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        console.log(data.zonecode);
                        console.log(addr);
                        document.getElementById('address_code').value = data.zonecode;
                        document.getElementById("address_main").value = addr + extraAddr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("address_sub").focus();
                    }
                }).open();
            }
            
        </script>

        <script>
            //체크박스 클릭 시 데이터 뿌리기
            
            function memberInfo(){
                
                if($("input[type='checkbox'][id='get-address-input']").prop("checked")){
                    $("input[name='oName']").val($("input[name='mName']").val());
                    $("input[name='oZipCode']").val($("input[name='mPostCode']").val());
                    $("input[name='oAddress']").val($("input[name='mAddress']").val());
                    $("input[name='oSubAddress']").val($("input[name='mSubAddress']").val());
                    $("input[name='oPhone']").val($("input[name='mPhone']").val());
                    $("input[name='oEmail']").val($("input[name='mEmail']").val());
                }else{
                    $("input[name='oName']").val('');
                    $("input[name='oZipCode']").val('');
                    $("input[name='oAddress']").val('');
                    $("input[name='oSubAddress']").val('');
                    $("input[name='oPhone']").val('');
                    $("input[name='oEmail']").val('');
                }
            }

            // 적립금 모두사용 클릭 시 값 변경
            function pointAll(){
                var allPoint = $("#allPoint").text()
                var total_price = $("#total_price").text();
                $("input[name='oPoint']").val(allPoint);
                $("#total_price").text(total_price - allPoint);
            }

            // 총 결제 금액, 총 수량
            $(function(){
                var total_price = 0;
                var total_count = 0;
                var usePoint = $("#usePoint").val();
                $(".price_num").each(function(){
                    total_price += parseInt($(this).text());
                    //total_price -= userPoint;
                });

                // 총 수량
                $(".product-num").each(function(){
                    total_count += parseInt($(this).text());
                })

                //console.log(total_price)
                //console.log(total_count)
                $("#total_price").text(total_price);
                $("input[name='total_price']").val(total_price);
                $("input[name='total_count']").val(total_count);

                

                // 적립금 실시간 적용
                $("#usePoint").on("propertyChange change keyup paste input", function(){
                    var currentPoint = $(this).val();
                    var max = parseInt($("#allPoint").text());
                    var usePointTotal = 0;
                    if(currentPoint > max){
                        usePointTotal = total_price - max;
                        $(this).val(max);
                        $("#total_price").text(usePointTotal);
                    }else{
                        usePointTotal = total_price - currentPoint;
                        $("#total_price").text(usePointTotal);
                    }
                    //usePoint = currentPoint;
                });

                
            })
        </script>

        <!-- 결제 관련 -->
        <script>
            function paymentclick(){
                var paycheck = $("input[name='payment']:checked").val()
                //if($("input[type='radio'][id='credit-check']"))
                //console.log(paycheck);
                var price = $("#total_price").text();
                var mCode = $("input[name='mCode']").val();
                var name = $("input[name='oName']").val();
                var address = $("input[name='oAddress']").val()
                var subAddress = $("input[name='oSubAddress']").val()
                var zipCode = $("input[name='oZipCode']").val()
                var email = $("input[name='oEmail']").val()
                var phone = $("input[name=oPhone]").val()
                var request = $("input[name='oRequest']").val()
                var saladCode = new Array();
                $($("input[name='productCode']")).each(function(){
                    saladCode.push($(this).val())
                    console.log(saladCode);
                });
                var saladCount = new Array();
                $(".product-num").each(function(){
                    saladCount.push($(this).text());
                });
                var point = 0;
                if(parseInt($("input[name='mCode']").val()) != 1){
                    console.log(mCode);
                    point = $("input[type='number'][name='oPoint']").val()
                }else{
                    point = $("input[type='hidden'][name='oPoint']").val()
                }
                var total_count = $("input[name='total_count']").val();

                if(paycheck == "credit"){
                    // 카드결제
                    IMP.init('imp28444469');
                    IMP.request_pay({
                        pay_method : 'card',
                        merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
                        name : '주문명: WIMB결제테스트',
                        amount : price,
                        buyer_email : email,
                        buyer_name : name,
                        buyer_tel : phone,
                        buyer_addr : address + subAddress,
                        buyer_postcode : zipCode
                        
                    }, function(rsp) {
                        if ( rsp.success ) {
                            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                            jQuery.ajax({
                                url: "paycheck.pay", 
                                type: 'POST',
                                data: {
                                    imp_uid : rsp.imp_uid,
                                    paid_amount:rsp.paid_amount,
                                    apply_num:rsp.apply_num,
                                    card_name:rsp.card_name,
                                    card_number:rsp.card_number,
                                    card_quota:rsp.card_quota,
                                    originPrice:price
                                },
                                success:function(data){
                                    console.log(data);
                                    console.log("성공")
                                },
                                error:function(){
                                    console.log("실패")
                            }
                            }).done(function(data) {
                                var msg = '결제가 완료되었습니다.';
                                msg += '\n고유ID : ' + rsp.imp_uid;
                                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                                msg += '\결제 금액 : ' + rsp.paid_amount;
                                msg += '카드 승인번호 : ' + rsp.apply_num;
                                
                                alert(msg);

                                jQuery.ajax({
                                    url: "orderinsert.pay", 
                                    type: 'POST',
                                    dataType:'json',
                                    traditional:true,
                                    data: {
                                        pmCode:data,
                                        mCode:mCode,
                                        saladCode:saladCode,
                                        saladCount:saladCount,
                                        name:name,
                                        address:address,
                                        subAddress:subAddress,
                                        zipCode:zipCode,
                                        phone:phone,
                                        email:email,
                                        request:request,
                                        point:point,
                                        totalCount:total_count
                                    },
                                    success:function(result){
                                        console.log(result);
                                        location.href = "<%= contextPath %>/ordercomplete.pay?ono="+result;
                                    },
                                    error:function(){
                                        console.log("실패")
                                    }
                                })

                            });
                        } else {
                            var msg = '결제에 실패하였습니다.';
                            msg += '에러내용 : ' + rsp.error_msg;
                            
                            alert(msg);
                        }
                    });

                }else{
                    // 무통장입금
                    //document.getElementById('order_form').submit();
                    promise1()
                    .then(promise2)


                    function promise1(){
                        var cashBank = $("select[name='cashBank']").val();
                        var cashName = $("input[name='cashName']").val();
                        return new Promise(function(resolve, reject){
                            $.ajax({
                                url:"cashpay.pay",
                                data:{
                                    cashBank:cashBank,
                                    cashName:cashName,
                                    totalPrice:price
                                },
                                success:function(data){
                                    console.log(data);
                                    resolve(data);
                                },
                                error:function(){
                                    console.log("ajax 통신 실패");
                                }
                            })
                        })
                    }

                    function promise2(data){
                        var data = data
                        console.log(data)
                        return new Promise(function(resolve, reject){
                            //console.log(data);
                            jQuery.ajax({
                                url: "ordercashComplete.pay", 
                                type: 'POST',
                                dataType:'json',
                                traditional:true,
                                data: {
                                    pmCode:data,
                                    mCode:mCode,
                                    saladCode:saladCode,
                                    saladCount:saladCount,
                                    name:name,
                                    address:address,
                                    subAddress:subAddress,
                                    zipCode:zipCode,
                                    phone:phone,
                                    email:email,
                                    request:request,
                                    point:point,
                                    totalCount:total_count
                                },
                                success:function(result){
                                    console.log(result);
                                    location.href = "<%= contextPath %>/ordercomplete.pay?ono="+result;
                                },
                                error:function(){
                                    console.log("실패")
                                }
                            })
                        })
                    }
                    
                }
            }

        </script>
        
    </body>
    </html>