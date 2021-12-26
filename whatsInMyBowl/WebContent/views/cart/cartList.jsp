<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wimb.cart.model.vo.Cart, java.util.ArrayList"%>
<%
    ArrayList<Cart> cartlist = (ArrayList<Cart>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    /* 장바구니 전체 div */
    .cartOuter{
        text-align: center;
        width: 1000px;
        box-sizing: border-box;
        margin: auto;
        margin-top:20px;
        margin-bottom: 70px;
    }
    .page-title{width:100%;  margin-top:75px;}
    /* 우측상단 프로세스 안내 */
    #order-process{
        width: 100%;
        padding-right: 30px;
        text-align: right;
    }
    #order-process span{font-size: 10px;}
    /* 테이블 크기 */
    #list-table{width: 910px; }
    /* 장바구니에 추가된 이미지 */
    #img-area, img{
        width:70px; 
        height:70px; 
        display:inline;}
    /* 테이블 가격 나타내는 부분 */
    #total-area{height:80px;}
    #total-wrap{margin:0 auto;}
    #total-wrap>div{display: inline-block; width:80px;}
    #total-wrap span{display:block; height:20px;}
    /* 수량조절input 사이즈 */
    .itemAmount{
        width:30px;
        border: none;
        border-bottom: 1px solid lightgray;
        text-align: center;
    }
    #heartIcon {color:rgb(155, 213, 189);}
    #head-area{
        height: 50px; 
        border-bottom:1px solid lightgrey;}
    #total-area{
        height: 50px; 
        border-top:1px solid lightgrey; 
    }
    #foot-area{
        height: 50px;
        border-top:1px solid lightgrey; 
    }
    #head-area td, #foot-area td{
        font-size: small; 
        font-weight: 900;
    }
    #list-area{height: 100px;}
    #checkAll, #checkAll2{vertical-align: middle;}
    #checkAll+label, #checkAll2+label {margin:0;}
    #orderBtn{
        width:120px; 
        height:30px;
        color: white; 
        background: rgb(155, 213, 189);
        border: none;
        font-weight: bold;
        border-radius: 0.5ex;
    }
    #orderBtn:hover{opacity:0.5;}
    a{text-decoration: none;}
    #head-area a:hover, #foot-area a:hover, a:hover{
        opacity:0.5;
        text-decoration: none;
        
    }
    #none-area{
        height: 200px;
        width: 250px;
        margin-top:100px;
    }
    
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="cartOuter">
        <div id="order-process">
            <span style="color: rgb(155, 213, 189);">01장바구니 &gt; </span>
            <span>02주문서/결제 &gt;</span>
            <span>03주문완료</span>
        </div>
        <div class="page-title">
            <h3><b>장 바 구 니</b></h3>
        </div>
        <!-- 장바구니 상품 있을 때-->
        <% if(cartlist == null){ %>
	        <div class="list-area">
	            <table id="list-table" align="center">
	                <tr id="head-area">
	                    <td colspan="2" width="140"> 
	                        <input type="checkbox" id="checkAll">
	                        <label for="checkAll">전체선택</label>  
	                    </td>
	                    <td colspan="11" width="550" align="left">
	                        <a style="color:black;">선택삭제</a>
	                        </td>
	                </tr>
	                <tr>
	                    <td colspan="13" align="center">
	                        <div id="none-area">
	                            <i class="fas fa-shopping-cart" style="font-size:40px;"></i><br><br>
	                            <span>장바구니에 담긴 상품이 없습니다.</span>
	                        </div>
	                    </td>
	                </tr>
	               
	                <tr id="foot-area">
	                    <td colspan="2" width="140"> 
	                        <input type="checkbox" id="checkAll2">
	                        <label for="checkAll2">전체선택</label> 
	                    </td>
	                    <td colspan="11" width="550" align="left">
	                        <a style="color:black;">선택삭제</a>
	                    </td>
	                </tr>
	            </table>
	        </div>
        <% } else{ %>
        <!-- 장바구니 아무것도 없을 때-->
            <!--<form action="">-->
                <div class="list-area">
                    <table id="list-table" align="center">
                        <tr id="head-area">
                            <td colspan="2" width="140"> 
                                <input type="checkbox" id="checkAll">
                                <label for="checkAll">전체선택</label>  
                            </td>
                            <td colspan="6" width="350" align="left">
                                <a style="color:black;" class="chooseDelete">선택삭제</a>
                                </td>
                            <td>찜</td>
                            <td>수량</td>
                            <td>배송비</td>
                            <td>상품가격</td>
                            <td></td>
                        </tr>
                        <% for(Cart c : cartlist){ %>
                        	<% if(c.getCuCode() != null){ %>
                                <tr id="list-area">
                                    <td colspan="2"> 
                                        <input type="checkbox" name="check">
                                        <div id="img-area">
                                            <img src ="<%=contextPath%>/resources/images/LOGO.png">
                                        </div>
                                    </td>
                                    <td colspan="6" width="350" align="left">
                                        <%= c.getCuName() %>
                                        <input type="hidden" name="saladCode" class="saladCode" value="<%= c.getCuCode() %>">
                                        <input type="hidden" name="mCode" value="<%= loginUser.getmCode() %>">
                                    </td>
                                    <td><a href=""><i class="far fa-heart" style="font-size:25px;" id="heartIcon"></i></a></td>
                                    <td><input type="number" name="itemAmount" class="itemAmount" min="0" value="<%= c.getCaAmount() %>"></td>
                                    <td>3,000원</td>
                                    <td>
                                        <span class="price_num"><%= c.getCuPrice() %></span>원
                                        <input type="hidden" name="productPrice" class="productPrice" value="<%= c.getCuPrice() %>">
                                    </td>
                                    <td>
                                        <a href="" class="xdelete">
                                            <i class="fas fa-times" style="font-size:25px; color:black;" ></i>
                                        </a>
                                    </td>
                                </tr>
                            <% }else { %>
                            	<tr id="list-area">
                                    <td colspan="2"> 
                                        <input type="checkbox" name="check">
                                        <div id="img-area">
                                            <img src ="<%=contextPath%>/resources/images/LOGO.png">
                                        </div>
                                    </td>
                                    <td colspan="6" width="350" align="left">
                                        <%= c.getpName() %>
                                        <input type="hidden" name="saladCode" class="saladCode" value="<%= c.getpCode() %>">
                                    </td>
                                    <td><a href=""><i class="far fa-heart" style="font-size:25px;" id="heartIcon"></i></a></td>
                                    <td><input type="number" name="itemAmount" class="itemAmount" min="0" value="<%= c.getCaAmount() %>"></td>
                                    <td>3,000원</td>
                                    <td>
                                        <span class="price_num product_price"></span>원
                                        <input type="hidden" name="productPrice" class="productPrice" value="<%= c.getpPrice() %>">
                                    </td>
                                    <td>
                                        <a href="" class="xdelete">
                                            <i class="fas fa-times" style="font-size:25px; color:black;" ></i>
                                        </a>
                                    </td>
                                </tr>
                            <% } %>
                        <% } %>
                        
                        <tr>
                            <th colspan="13" id="total-area">
                                <div id="total-wrap">
                                    <div>
                                        <span style="font-size: small;">상품금액</span>
                                        <span id="total_price"></span>
                                    </div>
                                    <div>
                                        <span><i class="fas fa-plus" style="font-size:25px;"></i></span>
                                    </div>
                                    <div>
                                        <span style="font-size: small;">배송비</span>
                                        <span id="delivery_price">3,000원</span>
                                    </div>
                                    <div >
                                        <span><i class="fas fa-equals" style="font-size:25px;"></i></span>
                                    </div>
                                    <div>
                                        <span style="font-size: small;">결제금액</span>
                                        <span id="pay_price"></span>
                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr id="foot-area">
                            <td colspan="2" width="140"> 
                                <input type="checkbox" id="checkAll2">
                                <label for="checkAll2">전체선택</label> 
                            </td>
                            <td colspan="6" width="350" align="left">
                                <a style="color:black;" class="chooseDelete">선택삭제</a>
                            </td>
                            <td colspan="2"></td>
                            <td colspan="3"><button type="button" id="orderBtn" onclick="order();">주문하기</button></td>
                        </tr>
                    </table>
                </div>
            <!--</form>-->
        <% } %>
    </div>

    <!-- 가격 표시 -->
    <script>
        $(function(){
            var total_price = 0;
            var allTotal_price = 0;
            var delivery_price = parseInt($("#delivery_price").text()) * 1000;
            console.log(delivery_price)
            // 완제품 가격 표시
            var productTotalPrice = 0;
            var productPrice = $(".productPrice").val()
            var productCount = $(".productPrice").parent().siblings().children(".itemAmount").val();
            console.log(productCount)
            productTotalPrice = productPrice * parseInt(productCount);
            console.log(productTotalPrice)
            $(".product_price").text(productTotalPrice)

            // 상품 전체 금액
            $(".price_num").each(function(){
                total_price += parseInt($(this).text());
            });
            allTotal_price = total_price + delivery_price;
            $("#total_price").text(total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            $("#pay_price").text(allTotal_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))

            
        })
    </script>

    <!-- 삭제 -->
    <script>
        $(".xdelete").click(function(){
            var saladCode = $(this).parent().siblings().children(".saladCode").val();
            
        })

        $(".chooseDelete").click(function(){
            var mCode = $("input[name='mCode']").val();
            var count = $("input[name='check']:checked").length;
            var checkArr = new Array();
            $("input[name='check']:checked").each(function(){
                checkArr.push($(this).parent().siblings().children(".saladCode").val())
            }); 
            $.ajax({
                url:"deletecart.cart",
                type:"post",
                dataType:"json",
                traditional:true,
                data:{
                    mCode:mCode,
                    saladCode:checkArr
                },
                success:function(result){
                    location.reload();
                },
                error:function(){
                    console.log("ajax 통신 실패");
                }
            })
        })
    </script>




    <!-- 주문하기 -->
    <script>
        function order(){
            var arrSaladCode = [];
            var arrSaladCount = [];
            var arrSaladPrice = [];
            $(".saladCode").each(function(){
                arrSaladCode.push($(this).val());
            })
            $(".itemAmount").each(function(){
                arrSaladCount.push($(this).val());
            })
            $(".price_num").each(function(){
                arrSaladPrice.push($(this).text());
            })
            var form = $('<form></form>');
            form.attr('action', '<%= contextPath %>/order.pay');
            form.attr('method', 'post');
            form.appendTo('body');
            for(var i=0;i<arrSaladCode.length;i++){
                form.append($('<input type="hidden" value="' + arrSaladCode[i] + '"name="saladCode">'));
                form.append($('<input type="hidden" value="' + arrSaladCount[i] + '"name="saladCount">'));
                form.append($('<input type="hidden" value="' + arrSaladPrice[i] + '"name="saladPrice">'));
            }
            form.submit();
        }

    </script>


    <footer>
        <%@ include file="../common/footer.jsp"%>
    </footer>
</body>
</html>