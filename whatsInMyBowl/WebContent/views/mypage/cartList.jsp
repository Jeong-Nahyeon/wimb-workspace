<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #itemAmount{width:50px}
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
        <form action="">
            <div class="list-area">
                <table id="list-table" align="center">
                    <tr id="head-area">
                        <td colspan="2" width="140"> 
                            <input type="checkbox" id="checkAll">
                            <label for="checkAll">전체선택</label>  
                        </td>
                        <td colspan="6" width="350" align="left">
                            <a href="" style="color:black;">선택삭제</a>
                            </td>
                        <td>찜</td>
                        <td>수량</td>
                        <td>배송비</td>
                        <td>상품가격</td>
                        <td></td>
                    </tr>
                    <tr id="list-area">
                        <td colspan="2"> 
                            <input type="checkbox">
                            <div id="img-area">
                                <img src ="<%=contextPath%>/resources/images/LOGO.png">
                            </div>
                        </td>
                        <td colspan="6" width="350" align="left">상품명</td>
                        <td><a href=""><i class="far fa-heart" style="font-size:25px;" id="heartIcon"></i></a></td>
                        <td><input type="number" id="itemAmount" min="0"></td>
                        <td>3,000원</td>
                        <td>상품가격</td>
                        <td><a href=""><i class="fas fa-times" style="font-size:25px; color:black;" ></i></a></td>
                    </tr>
                    <tr id="list-area">
                        <td colspan="2"> 
                            <input type="checkbox">
                            <div id="img-area">
                                <img src ="<%=contextPath%>/resources/images/LOGO.png">
                            </div>
                        </td>
                        <td colspan="6" width="350" align="left">상품명</td>
                        <td><a href=""><i class="far fa-heart" style="font-size:25px;" id="heartIcon"></i></a></td>
                        <td><input type="number" id="itemAmount" min="0"></td>
                        <td>3,000원</td>
                        <td>상품가격</td>
                        <td><a href=""><i class="fas fa-times" style="font-size:25px; color:black;" ></i></a></td>
                    </tr>
                    <tr>
                        <th colspan="13" id="total-area">
                            <div id="total-wrap">
                                <div>
                                    <span style="font-size: small;">상품금액</span>
                                    <span>32,000원</span>
                                </div>
                                <div>
                                    <span><i class="fas fa-plus" style="font-size:25px;"></i></span>
                                </div>
                                <div>
                                    <span style="font-size: small;">배송비</span>
                                    <span>3,000원</span>
                                </div>
                                <div >
                                    <span><i class="fas fa-equals" style="font-size:25px;"></i></span>
                                </div>
                                <div>
                                    <span style="font-size: small;">결제금액</span>
                                    <span>35,000원</span>
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
                            <a href="" style="color:black;">선택삭제</a>
                        </td>
                        <td colspan="2"></td>
                        <td colspan="3"><button type="submit" id="orderBtn">주문하기</button></td>
                    </tr>
                </table>
            </div>
        </form>
        <!-- 장바구니 아무것도 없을 때-->
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
    </div>
    <footer>
        <%@ include file="../common/footer.jsp"%>
    </footer>
</body>
</html>