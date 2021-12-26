<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wimb.custom.model.vo.Item, java.util.ArrayList" %>    
<%
	ArrayList<Item> list = (ArrayList<Item>)request.getAttribute("list");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 폰트 -->
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

<style>
    * {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box; margin: auto;}
    ul, li{list-style: none; padding: 0 5px 0 10px;}
    button{padding: 0; }
    .fas{vertical-align: middle;}
    input[type="text"]{padding: 0 5px 1px 4px; outline: none; box-sizing: border-box;}
    .wrap{
        /*border: 2px solid red;*/
        width: 100%; 
        height: auto;
        margin: auto;
    }
    #header, #footer{
        /*border: 1px solid lightcoral;*/
        width: 100%;
        height: 300px;
    }
    #content_main  {
        /*border: 1px solid skyblue;*/
        width: 1000px;
        height: auto;
        overflow: hidden;
    }
    #main_custom>div{
        height: 1555px;
        float: left;
    }
    #main_blank{
        /*border: 1px solid pink;*/
        width: 1000px;
        height: 105px;
    }
    
    #main_line{
        border: 1px solid #dddddd ;
        width: 0.1px;
        height: 100%;
        margin: 0 4.5px 0 4.5px;
    }
    #custom_left, #custom_right{
        /*border: 1px solid purple;*/
        width: 450px;
        height: 100%;
        margin: 0 20px 0 20px;
    }
    .menu_list{
        border: 1px solid #dddddd;
        padding: 5px;
        height: 230px;
        width: 380px;
        overflow-y: scroll;
    }
    #select{
        border: 1px solid #dddddd;
        padding: 5px;
        height: 230px;
        width: 380px;
    }

    /* 재료선택 div 관련*/
    #vegetable, #topping_main, #topping_side{
        margin-bottom: 20px;
        padding-bottom: 30px;
        border-bottom: 1px solid rgb(207, 203, 203);
    }
    /* 재료선택 텍스트 부분(제목)*/
    .custom_text{overflow: hidden;}
    .custom_text>div{
        float: left;
    }
    .text_main{
        font-weight: 900;
        margin: 20px 150px 10px 40px;
    }
    .text_sub{
        font-size: 11px;
        color: rgb(158, 158, 158);
        padding: 3px 0 3px 0;
        margin: 20px 0 10px 0;
    }

    /* 재료선택 내용 부분*/
    .menu_list li{
        border-bottom: 1px solid rgb(207, 203, 203); 
        padding: 8px 0 8px 0; 
        margin-left: 5px;
        width: 320px;
    }
    .custom_pro{position: relative;}
    .custom_pro div{display: inline-block;}
    .pro_subject{
        position: relative;
        padding-left: 10px;
        font-size: 13px;
    }
    .pro_btn, .dressing_btn{
        position: absolute;
        left: 245px; 
        border: 1px solid rgb(207, 203, 203);
        line-height: 20px;
    }
    .pro_btn button{
        width: 20px;
        height: 20px;
        margin: auto;
        padding: 2px 0;
        float: left;
        border: none;
    }
    .count_text{
        width: 25px;
        height: 20px;
        font-size: 8px;
        float: left;
        text-align: center;
        border: none;
    }
    /*드레싱 부분 관련*/
    #select>input{
        font-size: 10px;
    }
    .dressing_btn{width: 40px; left: 260px;}
    .dressing_btn button{
        width: 100%;
        height: 23px;
        border: none;
        box-sizing: border-box;
    }
    /*왼쪽 - 상단 이미지*/
    .custom_head{overflow: hidden;}
    .custom_head>div{
        float: left;
        margin: 20px 10px 20px 34px; 
    }
    #custom_image{
        width: 120px; 
        height: 120px; 
        border: 1px solid black;
    }
    #custom_guide{
        width: 210px;
        height: 120px;
        /*border: 1px solid black;*/
    }
    #custom_guide>span{font-size: 10px;}
    /*왼쪽 - 샐러드 목록1*/
    .custom_list, .custom_order, .customlist_btn, .customlist_price{width: 380px;}
    .custom_list, .custom_order, .customlist_name>input {background-color: rgb(250,250,250);}
    .custom_list, .custom_order{
        height: auto;
        padding-bottom: 20px;
        margin-bottom: 30px;
        
    }
    .custom_list table, .custom_order table{
        display: block;
        margin: auto;
        margin: 0 30px 25px 30px;
        padding-bottom: 5px;
    }
    .custom_list td, .custom_list th, .custom_order td, .custom_order th{
        border: none;
        
    }
    .custom_list td, .custom_order td{
        font-size: 13px;
        /*padding: 0 15px 0 15px;*/
    }
    /*왼쪽 - 샐러드 이름, table의 border 설정*/
    .custom_list table, .customlist_name>input, .custom_order table{
        border: none;
        border-bottom: 2px solid rgb(219, 216, 216);
    }
    /*왼쪽 - 샐러드 이름*/
    .customlist_name{padding: 20px 20px; text-align: center;}
    .customlist_name>span{
        padding-right: 15px;
        font-weight: 700;
    }
    /*왼쪽 - 샐러드 총 가격*/
    .customlist_price span{
        font-size: 20px;
        font-weight: 800;
    }
    /*왼쪽 - 샐러드 목록 버튼*/
    .customlist_btn, .customlist_price, .customOrder_btn{
        padding: 20px 40px;
    }
    .customlist_btn button[type="reset"]{
        width: 35px;
        height: 35px;
        border-radius: 50%;
        border: none;
        background-color: rgb(223,223,223);
        margin-right: 20px;
    }
    .customlist_btn button[type="submit"]{
        width: 120px;
        height: 35px;
        font-size: 15px;
        background-color: rgb(155, 213, 189) ;
        border-radius: 5%;
        border: none;
    }
    /*왼쪽 - 샐러드 주문 목록 버튼*/
    #customOrder_btn_cancle{
        background-color: rgb(250,250,250);
        border: none;
    }
    #customOrder_order, #customOrder_cart{
        width: 80px;
        height: 35px;
        border-radius: 5%;
    }
    #customOrder_order{
        background-color: rgb(155, 213, 189);
        border: none;
    }
    #customOrder_cart{
        background-color: white;
        border: 1px solid rgb(155, 213, 189);
    }
    /*왼쪽 - 샐러드 주문 목록 테이블*/
    .custom_order{padding-top: 20px;}
    .custom_order th{padding-bottom: 10px;}

    .itemCustom_table span{
        display: block;
    }
</style>
</head>
<body>

    <div class="wrap">

        <div id="header">
            <%@ include file="../common/menubar.jsp" %>
        </div>

        <div id="content_main">
            <div id="main_blank" style="position: relative;">
                <h2 style="position: absolute; bottom: 0; padding: 0 20px; margin-bottom: 10px;">나만의 DIY 샐러드</h2>
            </div>
            <div id="main_custom">
                <hr>
                <!-- 왼쪽 데이터 영역-->
                <div id="custom_left">
                    <div class="custom_head">
                        <div id="custom_image">이미지 자리</div>
                        <div id="custom_guide">
                            <span>채소, 토핑의 구성은 변경될 수 있습니다.</span> <br>
                            <span>채소, 토핑의 구성은 변경될 수 있습니다.</span> <br>
                            <span>채소, 토핑의 구성은 변경될 수 있습니다.</span> <br>
                        </div>
                    </div>

                    <div class="custom_list">
                        <!--<form action="" method="">-->
                            <div class="customlist_name">
                                <span>샐러드 이름</span>
                                <input type="text" name="saladName" id="saladName" required>
                                <input type="hidden" name="userNum" id="userNum" value="<%= loginUser.getmCode() %>">
                            </div>
                            
                            <table class="itemCustom_table">
                                <tr>
                                    <th colspan="2" style="text-align: left;">채소</th>
                                </tr>
                                <tr>
                                    <td id="vagetable_name" style="width: 220px; padding-left: 10px;">
                                        <!-- <span>양상추</span>  -->
                                        
                                    </td>
                                    <td id="vagetable_price" style="width: 100px; text-align: right;">
                                        <!-- <span>1000원</span>  -->
                                        
                                    </td>
                                </tr>
                                
                            </table>
                            <table class="itemCustom_table">
                                <tr>
                                    <th colspan="2" style="text-align: left;">메인 토핑</th>
                                </tr>
                                <tr>
                                    <td id="maintopping_name" style="width: 220px; padding-left: 10px;"></td>
                                    <td id="maintopping_price" style="width: 100px; text-align: right;"></td>
                                </tr>
                                
                            </table>
                            <table class="itemCustom_table">
                                <tr>
                                    <th colspan="2" style="text-align: left;">사이드 토핑</th>
                                </tr>
                                <tr>
                                    <td id="sidetopping_name" style="width: 220px; padding-left: 10px;"></td>
                                    <td id="sidetopping_price" style="width: 100px; text-align: right;"></td>
                                </tr>
                                
                            </table>
                            <table class="itemCustom_table">
                                <tr>
                                    <th colspan="2" style="text-align: left;">드레싱</th>
                                </tr>
                                <tr>
                                    <td id="dressing_name" style="width: 220px; padding-left: 10px;"></td>
                                    <td id="dressing_price" style="width: 100px; text-align: right;"></td>
                                </tr>
                                
                            </table>

                            <div class="customlist_price" align="right">
                                <span style="padding: 0 70px 0 20px;">총 금액</span>
                                <span id="total_sum" style="padding: 0 15px 0 0;"></span>
                            </div>

                            <div class="customlist_btn" align="right">
                                <button type="reset" id="customlist_btn_reset"><i class="fas fa-times fa-lg"></i></button>
                                <button type="submit" id="customlist_btn_submit" onclick="insertCustomOrder();">샐러드 추가</button>
                            </div>

                        <!--</form>-->
                    </div>

                    <div class="custom_order">
                        <!--<form action="<%=contextPath%>/order.pay" method="post" id="orderEnroll-form">-->
                            <div class="customOrder_table">

                            </div>
                            
                            <div class="customlist_price" align="right">
                                <span style="padding: 0 70px 0 20px;">총 금액</span>
                                <span id="total_price" style="padding: 0 15px 0 0;"> </span>
                            </div>
    
                            <div class="customOrder_btn" align="right">
                                <button id="customOrder_order" onclick="orderCustom();">주문하기</button>
                                <button type="button" id="customOrder_cart" onclick="addCartCustom();">장바구니</button>
                            </div>
                        <!--</form>-->

                    </div>
                </div>
                <!-- 장바구니 클릭 시 ajax  -->
                <script>

                    function addCartCustom(){
                        var arrCustomCode = [];
                        var arrCustomCount = [];
                        var itemPrice = $("#total_sum").text();
                        var saladName = $("#saladName").val();
                        var userNum = $("#userNum").val();
                
                        $(".order_ciCode").each(function(){
                            arrCustomCode.push($(this).val());
                        });
                        $("input[name='saladCount']").each(function(){
                            arrCustomCount.push($(this).val());
                        })
                        $.ajax({
                            url:"addcartcu.cart",
                            dataType:"json",
                            traditional:true,
                            data:{
                                arrCustomCode:arrCustomCode,
                                arrCustomCount:arrCustomCount
                            },
                            success:function(result){
                                console.log(result);
                                if(result == 1 ){
                                    $("#cart-success-modal").modal("show");
                                }else {
                                    alert("이미 담겨있는 상품입니다.");
                                }
                            },
                            error:function(){

                            }
                        })
                    }

                    // 주문하기 버튼 클릭시 form 처리
                    function orderCustom(){
                        var arrCustomCode = [];
                        var arrCustomCount = [];
                        var itemPrice = $("#total_sum").text();
                        $(".order_ciCode").each(function(){
                            arrCustomCode.push($(this).val());
                        });
                        $("input[name='saladCount']").each(function(){
                            arrCustomCount.push($(this).val());
                        })
                        console.log(arrCustomCode);
                        console.log(arrCustomCode.length)

                        var form = $('<form></form>');
                        form.attr('action', '<%= contextPath %>/order.pay');
                        form.attr('method', 'post');
                        form.appendTo('body');
                        for(var i=0;i<arrCustomCode.length;i++){
                            form.append($('<input type="hidden" value="' + arrCustomCode[i] + '"name="saladCode">'));
                            form.append($('<input type="hidden" value="' + arrCustomCount[i] + '"name="saladCount">'));
                            form.append($('<input type="hidden" value="' + itemPrice[i] + '"name="saladPrice">'));
                        }
                        form.submit();
                    }

                    
                 
                </script>

                <!-- 장바구니 담기 성공 모달창  -->
                <div class="modal fade" id="cart-success-modal">
                    <div class="modal-dialog" role="document" style="width:500px; height:350px;">
                        <div class="modal-content success-cart-modal">
                            
                            <!-- Modal Header -->
                            <div class="modal-header title-area">
                                <h6 class="modal-title">장바구니 담기</h6>
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body content-area">
                                <div class="cart-success-img" align="center" style=" height:40%;">
                                    <i class="fas fa-cart-plus fa-4x" style="color:#9BD5BD;"></i>
                                </div>

                                <div class="cart-success-content" align="center" style=" height:60%;">
                                    <br>
                                    <b>상품이 장바구니에 담겼습니다.</b>
                                    <br>
                                    바로 확인하시겠습니까?
                                </div>

                            </div>
                            
                            <!-- Modal footer -->
                            <div class="modal-footer button-area">
                                <div class="cart-success-btns" align="center" style="width:100%;">
                                    <button type="button" class="btn btn-sm" style="border:1px solid lightgray; margin:0px 5px;" data-dismiss="modal">취소</button>
                                    <button type="submit" id="cart-page-btn" class="btn btn-sm" style="background:#9BD5BD; margin:0px 5px;" onclick="location.href='<%= contextPath%>/cartlist.cart'">
                                        확인
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>	

                <!-- 가운데 세로선-->
                <div id="main_line"></div>


                <!-- 오른쪽 데이터 영역-->
                <div id="custom_right">
                    <div id="vegetable">
                        <div class="custom_text">
                            <div class="text_main" >채소 선택</div>
                            <div class="text_sub">추가 채소는 기본 중량 10g 입니다. </div>
                        </div>

                        <div class="menu_list">
                            <ul>
                            	<% for(Item i : list) { %>
                            		<% if(i.getCiCategory().equals("채소")) { %>
		                                <li>
		                                    <div class="custom_pro">
		                                        <div class="pro_subject"><%= i.getCiName() %></div>
		                                        <div class="pro_btn" >
		                                            <button class="pro_btn_up vagetable-up">
		                                            	<i class="fas fa-plus fa-xs " style="margin: 0 0 6px 0;"></i>
		                                            </button>
		                                            <input type="text" name="" class="count_text" value="0" readonly>
                                                    <input class="ci_name" type="hidden" value="<%= i.getCiName() %>">
                                                    <input class="ci_price" type="hidden" value="<%= i.getCiPrice() %>">
                                                    <input class="ci_code" type="hidden" value="<%= i.getCiCode()%>">
                                                    <input class="ci_category" type="hidden" value="<%= i.getCiCategory() %>">
		                                            <button class="pro_btn_down vagetable-down">
		                                            	<i class="fas fas fa-minus fa-xs fa-fw" style="margin: 0 0 6px 0;"></i>
		                                            </button>
		                                        </div>
		                                    </div>
		                                </li>
	                                <% } %>
                                <% } %>
                            </ul>
                        </div>
                    </div>

                    <div id="topping_main">
                        <div class="custom_text" >
                            <div class="text_main" >메인 토핑 선택</div>
                            <div class="text_sub">가나다 가나다</div>
                        </div>

                        <div class="menu_list">
                            <ul>
                            	<% for(Item i : list) { %>
                            		<% if(i.getCiCategory().equals("메인토핑")) {%>
		                                <li>
		                                    <div class="custom_pro">
		                                        <div class="pro_subject"><%= i.getCiName() %></div>
		                                        <div class="pro_btn" >
		                                            <button class="pro_btn_up mainTopping-up">
		                                            	<i class="fas fa-plus fa-xs " style="margin: 0 0 6px 0;"></i>
		                                            </button>
		                                            <input type="text" name="" class="count_text" value="0" readonly>
                                                    <input class="ci_name" type="hidden" value="<%= i.getCiName() %>">
                                                    <input class="ci_price" type="hidden" value="<%= i.getCiPrice() %>">
                                                    <input class="ci_code" type="hidden" value="<%= i.getCiCode()%>">
                                                    <input class="ci_category" type="hidden" value="<%= i.getCiCategory() %>">
		                                            <button class="pro_btn_down mainTopping-down">
		                                            	<i class="fas fas fa-minus fa-xs fa-fw" style="margin: 0 0 6px 0;"></i>
		                                            </button>
		                                        </div>
		                                    </div>
		                                </li>
	                                <% } %>
                                <% } %>
                            </ul>
                        </div>
                    </div>

                    <div id="topping_side">
                        <div class="custom_text">
                            <div class="text_main">사이드 토핑 선택</div>
                            <div class="text_sub">최대 5개 선택 가능</div>
                        </div>

                        <div class="menu_list">
                            <ul>
                            	<% for(Item i : list){ %>
	                            	<% if(i.getCiCategory().equals("사이드토핑")){ %>
		                                <li>
		                                    <div class="custom_pro">
		                                        <div class="pro_subject"><%= i.getCiName() %></div>
		                                        <div class="pro_btn" >
		                                            <button class="pro_btn_up sideTopping-up">
		                                            	<i class="fas fa-plus fa-xs " style="margin: 0 0 6px 0;"></i>
		                                            </button>
		                                            <input type="text" name="" class="count_text" value="0" readonly>
                                                    <input class="ci_name" type="hidden" value="<%= i.getCiName() %>">
                                                    <input class="ci_price" type="hidden" value="<%= i.getCiPrice() %>">
                                                    <input class="ci_code" type="hidden" value="<%= i.getCiCode()%>">
                                                    <input class="ci_category" type="hidden" value="<%= i.getCiCategory() %>">
		                                            <button class="pro_btn_down sideTopping-down">
		                                            	<i class="fas fas fa-minus fa-xs fa-fw" style="margin: 0 0 6px 0;"></i>
		                                            </button>
		                                        </div>
		                                    </div>
		                                </li>
	                                <% } %>
                                <% } %>
                            </ul>
                        </div>
                    </div>

                    <div id="dressing">
                        <div class="custom_text">
                            <div class="text_main">드레싱 선택</div>
                            <div class="text_sub">최대 5개 선택 가능</div>
                        </div>

                        <div class="menu_list">
                            <ul>
                             	<% for(Item i : list) { %>
	                             	<% if(i.getCiCategory().equals("드레싱")){ %>
		                                <li>
		                                    <div class="custom_pro">
		                                        <div class="pro_subject"><%= i.getCiName() %></div>
		                                        <div class="pro_btn" >
		                                            <button class="pro_btn_up dressing-up">
		                                            	<i class="fas fa-plus fa-xs " style="margin: 0 0 6px 0;"></i>
		                                            </button>
		                                            <input type="text" name="" class="count_text" value="0" readonly>
                                                    <input class="ci_name" type="hidden" value="<%= i.getCiName() %>">
                                                    <input class="ci_price" type="hidden" value="<%= i.getCiPrice() %>">
                                                    <input class="ci_code" type="hidden" value="<%= i.getCiCode()%>">
                                                    <input class="ci_category" type="hidden" value="<%= i.getCiCategory() %>">
		                                            <button class="pro_btn_down dressing-down">
		                                            	<i class="fas fas fa-minus fa-xs fa-fw" style="margin: 0 0 6px 0;"></i>
		                                            </button>
		                                        </div>
		                                    </div>
		                                </li>
	                                <% } %>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                    
                </div>

                <!-- 재료 선택시 왼쪽 화면에 띄우기 -->
                <script>
                    $(".pro_btn_up").click(function(){
                        //console.log("플러스클릭됨");
                        var itemClass = "." + $(this).attr("class").substring(11,);
                        setCustomlist($(this), ".pro_btn_up", itemClass);
                    });

                    $(".pro_btn_down").click(function(){
                        //console.log("마이너스클릭됨");
                        var itemClass = "." + $(this).attr("class").substring(13,);
                        setCustomlist($(this), ".pro_btn_down", itemClass);
                    });

                    // 선택된 재료의 총 합 구하기
                    function sum(itemPrice){
                        var vagetable_sum = 0;
                        var mainTopping_sum = 0;
                        var sideTopping_sum = 0;
                        var dressing_sum = 0;
                        var itemTotal_sum = 0;

                        $(".vagetable_sum").each(function(){
                            vagetable_sum += parseInt($(this).val());
                        });
                        
                        $(".mainTopping_sum").each(function(){
                            mainTopping_sum += parseInt($(this).val());
                        });
                        $(".sideTopping_sum").each(function(){
                            sideTopping_sum += parseInt($(this).val());
                        });
                        $(".dressing_sum").each(function(){
                            dressing_sum += parseInt($(this).val());
                        });

                        itemTotal_sum = vagetable_sum + mainTopping_sum + sideTopping_sum + dressing_sum;
                        $("#total_sum").text(itemTotal_sum);
                    }
                    

                    function setCustomlist(obj, action, itemClass){
                        var count = 0;
                        var itemNameStr = "";
                        var itemNamePrice = "";
                        var itemTotalPrice = "";
                        itemPrice = 0;
                        

                        // 재료 수량버튼 클릭 시 input태그안의 수량 증감
                        if(action == ".pro_btn_up"){
                            count = parseInt(obj.siblings(".count_text").val()) +1;
                            obj.siblings(".count_text").val(count);

                            
                        }else{
                            count = parseInt(obj.siblings(".count_text").val()) -1;
                            if(count <= 0) {
                                count = 0;
                            }
                            obj.siblings(".count_text").val(count);
                        }

                        // 재료 정보
                        
                        if(obj.siblings(".ci_category").val() == "채소"){
                            //console.log("앗싸");
                            //console.log(action2);
                            
                            $(itemClass).each(function(){
                                //console.log("each실행");
                                if($(this).siblings(".count_text").val() != "0"){
                                    itemPrice = parseInt($(this).siblings(".count_text").val()) * parseInt($(this).siblings(".ci_price").val());

                                    //console.log(itemTotalPrice);
                                    //console.log(parseInt($(this).siblings(".count_text").val()))
                                    //console.log(parseInt($(this).siblings(".ci_price").val()))

                                    itemNameStr += "<span>" + $(this).siblings(".ci_name").val() + "</span>" +
                                                   "<input type='hidden' class='ci_getCode' value='"+$(this).siblings(".ci_code").val()+"'></input>" + 
                                                   "<input type='hidden' class='ci_getCount' value='"+$(this).siblings(".count_text").val()+"'></input>";
                                    itemNamePrice += "<span>" + itemPrice + "</span>" + 
                                                     "<input type='hidden' class='vagetable_sum' value='"+itemPrice+"'></input>"; 
                                    //itemTotalPrice += "<input type='hidden' class='vagetable_sum' value='"+itemPrice+"'></input>";
                                    //console.log($(this).val);
                                    //sum(itemPrice);
                                    //console.log(itemNameStr)
                                }
                                
                            });
                            $("#vagetable_name").html(itemNameStr);
                            $("#vagetable_price").html(itemNamePrice);
                            //$(".customlist_price").html(itemTotalPrice);
                            sum();
                            
                        
                        } else if(obj.siblings(".ci_category").val() == "메인토핑"){
                
                            $(itemClass).each(function(){
                                if($(this).siblings(".count_text").val() != "0"){
                                    itemPrice = parseInt($(this).siblings(".count_text").val()) * parseInt($(this).siblings(".ci_price").val());

                                    itemNameStr += "<span>" + $(this).siblings(".ci_name").val() + "</span>" +
                                                   "<input type='hidden' class='ci_getCode' value='"+$(this).siblings(".ci_code").val()+"'></input>" + 
                                                   "<input type='hidden' class='ci_getCount' value='"+$(this).siblings(".count_text").val()+"'></input>";
                                    itemNamePrice += "<span>" + itemPrice + "</span>" + 
                                                     "<input type='hidden' class='vagetable_sum' value='"+itemPrice+"'></input>"; 
                                    
                                }
                                
                            });
                            
                            $("#maintopping_name").html(itemNameStr);
                            $("#maintopping_price").html(itemNamePrice);
                            sum();
                        
                        } else if(obj.siblings(".ci_category").val() == "사이드토핑"){
                            $(itemClass).each(function(){
                                
                                if($(this).siblings(".count_text").val() != "0"){
                                    itemPrice = parseInt($(this).siblings(".count_text").val()) * parseInt($(this).siblings(".ci_price").val());

                                    itemNameStr += "<span>" + $(this).siblings(".ci_name").val() + "</span>" +
                                                   "<input type='hidden' class='ci_getCode' value='"+$(this).siblings(".ci_code").val()+"'></input>" + 
                                                   "<input type='hidden' class='ci_getCount' value='"+$(this).siblings(".count_text").val()+"'></input>";
                                    itemNamePrice += "<span>" + itemPrice + "</span>" + 
                                                     "<input type='hidden' class='vagetable_sum' value='"+itemPrice+"'></input>"; 
                                    
                                }
                                
                            });
                            
                            $("#sidetopping_name").html(itemNameStr);
                            $("#sidetopping_price").html(itemNamePrice);
                            sum();

                        } else{
                            
                            $(itemClass).each(function(){
                                
                                if($(this).siblings(".count_text").val() != "0"){
                                    itemPrice = parseInt($(this).siblings(".count_text").val()) * parseInt($(this).siblings(".ci_price").val());

                                    itemNameStr += "<span>" + $(this).siblings(".ci_name").val() + "</span>" +
                                                   "<input type='hidden' class='ci_getCode' value='"+$(this).siblings(".ci_code").val()+"'></input>" + 
                                                   "<input type='hidden' class='ci_getCount' value='"+$(this).siblings(".count_text").val()+"'></input>";
                                    itemNamePrice += "<span>" + itemPrice + "</span>" + 
                                                     "<input type='hidden' class='vagetable_sum' value='"+itemPrice+"'></input>"; 
                                    
                                }
                                
                            });
                            
                            $("#dressing_name").html(itemNameStr);
                            $("#dressing_price").html(itemNamePrice);
                            sum();
                        }
                        
                    }

                    /* 커스텀 DB 등록, 화면에 뿌리기 */
                    function insertCustomOrder(){

                        insertCoustomItemPRo()
                        .then(selectCustom)
                        .then(successSelect)
                    }

                    function insertCoustomItemPRo(){
                        var arrItemCode = [];
                        var arrItemCount = [];
                        var itemPrice = $("#total_sum").text();
                        var saladName = $("#saladName").val();
                        var userNum = $("#userNum").val();

                        $(".ci_getCode").each(function(){
                            arrItemCode.push($(this).val());
                        });
                        $(".ci_getCount").each(function(){
                            arrItemCount.push($(this).val());
                        })

                        return new Promise(function(resolve, reject){
                            $.ajax({
                                url:"customInsert.cu",
                                dataType:"json",
                                traditional:true,
                                data:{
                                    arrItemCode:arrItemCode,
                                    arrItemCount:arrItemCount,
                                    itemPrice:itemPrice,
                                    saladName:saladName,
                                    userNum:userNum
                                },
                                success:function(result){
                                    //console.log("통신성공")
                                    //console.log(result);
                                    if(result != null){
                                        resolve(result);
                                    }else{
                                        reject(result);
                                    }
                                },
                                error:function(){
                                    console.log("ajax 통신 실패");
                                }
                            });
                        })
                    }

                    /* 조회 */
                    function selectCustom(result){
                        return new Promise(function(resolve, rejext){
                            //console.log(result);

                            $.ajax({
                                url:"selectCustom.cu",
                                data:{
                                    cuCode:result
                                },
                                dataType:"json",
                                traditional:true,
                                success:function(list){
                                    resolve(list);
                                },
                                error:function(){
                                    console.log("ajax 통신 실패");
                                }
                            })
                        })
                    }

                    function successSelect(list){
                        console.log(list)

                        var vagetable_text = "";
                        var main_text = "";
                        var side_text = "";
                        var dressing_text = "";
                        var total_price = 0;
                        
                        for(var i=0;i<list.length;i++){
                            if(list[i].ciCategory == '채소'){
                                vagetable_text += list[i].ciName + "/";
                            }else if(list[i].ciCategory == '메인토핑'){
                                main_text += list[i].ciName + "/";
                            }else if(list[i].ciCategory == '사이드토핑'){
                                side_text += list[i].ciName + "/";
                            }else{
                                dressing_text += list[i].ciName + "/";
                            }         
                        }
                        

                        var contentTh = "<table class='customlist_table'>"+
                                            "<tr>" +
                                                    "<th colspan='3' style='text-align: left;'>"+ list[0].cuName +"</th>" +
                                                    " <th style='text-align: right;''><button id='customOrder_btn_cancle'><i class='fas fa-times fa-lg'></i></button></th>"+
                                            "</tr>" +
                                            "<tr>" +
                                                    "<td style='width: 100px; padding-left: 10px;'>" + "채소" + "</td>" +
                                                    "<td colspan='3' style='width: 220px; text-align: right;'' class='listVagetagle'>"+ vagetable_text +"</td>"+
                                            "</tr>" +
                                            "<tr>" +
                                                    "<td style='width: 100px; padding-left: 10px;'>" + "메인토핑" + "</td>" +
                                                    "<td colspan='3' style='width: 220px; text-align: right;'' class='listMain'>"+ main_text +"</td>"+
                                            "</tr>" +
                                            "<tr>" +
                                                    "<td style='width: 100px; padding-left: 10px;'>" + "사이드토핑" + "</td>" +
                                                    "<td colspan='3' style='width: 220px; text-align: right;'' class='listSide'>"+ side_text +"</td>"+
                                            "</tr>" +
                                            "<tr>" +
                                                    "<td style='width: 100px; padding-left: 10px;'>" + "드레싱" + "</td>" +
                                                    "<td colspan='3' style='width: 220px; text-align: right;'' class='listDressing'>"+ dressing_text +"</td>"+
                                            "</tr>" +
                                            "<input type='hidden' class='order_ciCode' name='saladCode' value='"+ list[0].cuCode +"'>" +
                                            "<input type='hidden' class='custom_price' name='saladPrice' value='"+ list[0].cuPrice +"'>" +
                                            "<input type='hidden' name='saladCount' value='1'>" +
                                       "</table>"
                                            
                        $(".customOrder_table").append(contentTh);
                        

                        // 선택부분 초기화
                        $(".count_text").val(0);
                        $("#saladName").val("");
                        $("#vagetable_name").html("");
                        $("#vagetable_price").html("");
                        $("#maintopping_name").html("");
                        $("#maintopping_price").html("");
                        $("#sidetopping_name").html("");
                        $("#sidetopping_price").html("");
                        $("#dressing_name").html("");
                        $("#dressing_price").html("");
                        $("#total_sum").text("");
                        
                        $(".custom_price").each(function(){
                            total_price += parseInt($(this).val());
                        });
                        console.log(total_price);
                        $("#total_price").text(total_price);
                        
                    }

                    
                </script>
                
                

                
                
            </div>
        </div>

        <div id="footer">
        	<%@ include file="../common/footer.jsp" %>
        </div>
    </div>

</body>
</html>