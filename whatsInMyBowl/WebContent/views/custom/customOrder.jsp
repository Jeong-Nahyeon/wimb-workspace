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
                        <form action="" method="">
                            <div class="customlist_name">
                                <span>샐러드 이름</span>
                                <input type="text" name="saladName" id="saladName">
                            </div>
                            
                            <table>
                                <tr>
                                    <th colspan="2" style="text-align: left;">채소</th>
                                </tr>
                                <tr>
                                    <td style="width: 220px; padding-left: 10px;">양상추</td>
                                    <td style="width: 100px; text-align: right;">1000원</td>
                                </tr>
                                
                            </table>
                            <table>
                                <tr>
                                    <th colspan="2" style="text-align: left;">메인 토핑</th>
                                </tr>
                                <tr>
                                    <td style="width: 220px; padding-left: 10px;">양상추</td>
                                    <td style="width: 100px; text-align: right;">1000원</td>
                                </tr>
                                
                            </table>
                            <table>
                                <tr>
                                    <th colspan="2" style="text-align: left;">사이드 토핑</th>
                                </tr>
                                <tr>
                                    <td style="width: 220px; padding-left: 10px;">양상추</td>
                                    <td style="width: 100px; text-align: right;">1000원</td>
                                </tr>
                                
                            </table>
                            <table>
                                <tr>
                                    <th colspan="2" style="text-align: left;">드레싱</th>
                                </tr>
                                <tr>
                                    <td style="width: 220px; padding-left: 10px;">양상추</td>
                                    <td style="width: 100px; text-align: right;">1000원</td>
                                </tr>
                                
                            </table>

                            <div class="customlist_price" align="right">
                                <span style="padding: 0 70px 0 20px;">총 금액</span>
                                <span style="padding: 0 15px 0 0;">20,000</span>
                            </div>

                            <div class="customlist_btn" align="right">
                                <button type="reset" id="customlist_btn_reset"><i class="fas fa-times fa-lg"></i></button>
                                <button type="submit" id="customlist_btn_submit">샐러드 추가</button>
                            </div>

                        </form>
                    </div>

                    <div class="custom_order">
                        <table>
                            <tr>
                                <th colspan="3" style="text-align: left;">나만의 샐러드</th>
                                <th style="text-align: right;"><button id="customOrder_btn_cancle"><i class="fas fa-times fa-lg"></i></button></th>
                            </tr>
                            <tr>
                                <td style="width: 100px; padding-left: 10px;">채소</td>
                                <td colspan="3" style="width: 220px; text-align: right;">가가가/나나나나/가가가/나나나나/나나나</td>
                            </tr>
                            
                        </table>
                        <table>
                            <tr>
                                <th colspan="3" style="text-align: left;">나만의 샐러드</th>
                                <th style="text-align: right;"><button id="customOrder_btn_cancle"><i class="fas fa-times fa-lg"></i></button></th>
                            </tr>
                            <tr>
                                <td style="width: 100px; padding-left: 10px;">채소</td>
                                <td colspan="3" style="width: 220px; text-align: right;">가가가/나나나나/가가가/나나나나/나나나</td>
                            </tr>
                            
                        </table>

                        <div class="customlist_price" align="right">
                            <span style="padding: 0 70px 0 20px;">총 금액</span>
                            <span style="padding: 0 15px 0 0;">20,000</span>
                        </div>

                        <div class="customOrder_btn" align="right">
                            <button id="customOrder_order">주문하기</button>
                            <button id="customOrder_cart">장바구니</button>
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
		                                            <button class="pro_btn_up"><i class="fas fa-plus fa-xs " style="margin: 0 0 6px 0;"></i></button>
		                                            <input type="text" name="" class="count_text" value="0">
		                                            <button class="pro_btn_down"><i class="fas fas fa-minus fa-xs fa-fw" style="margin: 0 0 6px 0;"></i></button>
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
		                                            <button class="pro_btn_up"><i class="fas fa-plus fa-xs " style="margin: 0 0 6px 0;"></i></button>
		                                            <input type="text" name="" class="count_text" value="0">
		                                            <button class="pro_btn_down"><i class="fas fas fa-minus fa-xs fa-fw" style="margin: 0 0 6px 0;"></i></button>
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
		                                            <button class="pro_btn_up"><i class="fas fa-plus fa-xs " style="margin: 0 0 6px 0;"></i></button>
		                                            <input type="text" name="" class="count_text" value="0">
		                                            <button class="pro_btn_down"><i class="fas fas fa-minus fa-xs fa-fw" style="margin: 0 0 6px 0;"></i></button>
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
		                                        <div class="dressing_btn">
		                                            <button class="pro_btn_up"><i class="fas fa-plus fa-xs " style="margin: 0 0 6px 0;"></i></button>
		                                        </div>
		                                    </div>
		                                </li>
	                                <% } %>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

        <div id="footer">
        	<%@ include file="../common/footer.jsp" %>
        </div>
    </div>

</body>
</html>