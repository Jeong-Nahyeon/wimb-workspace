<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.outer{
    width: 1000px;
    height: auto;
    margin: auto;
    margin-top: 50px;
}
#th1{
    border-top: none;
}
.table{
    width: 600px;
}
#ftr2{
    border-top: 3px solid lightgray;
}
#fb1{
    border: 1px solid rgb(155, 213, 188);
    color: rgb(155, 213, 188);
    background-color: white;
    border-radius: 5px;
    height: 35px;
}
#fb2{
    background-color: rgb(155, 213, 188);
    border-color: rgb(155, 213, 188);
}
#ftd{
    border-bottom: 1px solid lightgray;
}
</style>
</head>
<body>
    <div class="outer">  
        <!--첫번째 테이블 시작-->  
        <div class="container">
            <h5 style="text-align: center;">비회원 주문 조회</h5><br>
            <table class="table" align="center">
                
              <thead  class="thead-light" style="text-align: center;">
                <tr >
                    <td style="border-top: none;">주문/배송 상세</td>
                    <td colspan="3" style="border: none; color: rgb(155, 213, 188); text-align: left;">주문번호:
                    <span>주문번호</span>
                </td>
                </tr>
                <tr id="ftr2">
                  <th>날짜/주문번호</th>
                  <th colspan="2">상품명/옵션</th>
                  <th>금액/수량</th>
                  <th>주문상태</th>
                </tr>
              </thead>
              <tbody style="text-align: center;">
                <tr>
                  <td id="ftd" rowspan="4"><span>날짜</span><br>
                    <span>주문번호</span><br>
                    <button type="button" id="fb1">취소/환불 신청</button>
                  </td>
                
                  <td id="ftd" rowspan="4" >이미지자리</td>
                  <td id="ftd" rowspan="4" style="padding-top: 30px;"><a href="">상품명</a><br>
                    <span>옵션명</span>
                  </td>
                  <td id="ftd" rowspan="4" style="padding-top: 30px;"><span>35,000</span>원<br>
                    <span>3</span>개
                  </td>
    
                  <td id="ftd" rowspan="5"  style="padding-top: 30px;"><span>배송시작</span><br>
                    <button id="fb2" type="button" class="btn btn-success">배송조회</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--첫번째 테이블 끝--> 
    
          <!--두번째 테이블 시작-->   
        <div class="container">
            <table class="table" align="center">
            <thead >
                <tr>
                <th id="th1" colspan="2" >주문자 정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <td style="text-align: right;" width="120">주문자</td>
                <td>홍길동</td>
                </tr>
                <tr>
                <td style="text-align: right;">전화번호</td>
                <td></td>
                </tr>
                <tr>
                <td style="text-align: right;">휴대폰번호</td>
                <td>010-0000-1111</td>
                </tr>
                <tr>
                    <td id="ftd" style="text-align: right;">이메일</td>
                    <td id="ftd">gest01@gmail.com</td>
                </tr>
            </tbody>
            </table>
        </div>
        <!--두번째 테이블 끝--> 
    
        <!--세번째 테이블 시작-->   
        <div class="container">
            <table class="table" align="center">
            <thead>
                <tr>
                <th id="th1" colspan="2">배송지 정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <td style="text-align: right;" width="120">배송자</td>
                <td>홍길동</td>
                </tr>
                <tr>
                <td style="text-align: right;" >주소</td>
                <td>서울 강남구 테헤란로14길6 2층</td>
                </tr>
                <tr>
                <td style="text-align: right;" >휴대폰번호</td>
                <td>010-0000-1111</td>
                </tr>
                <tr>
                    <td id="ftd" style="text-align: right;" >요청사항</td>
                    <td id="ftd">집 앞에 놔둬주세요</td>
                </tr>
            </tbody>
            </table>
        </div>
        <!--세번째 테이블 끝-->  
    
        <!--네번째 테이블 시작-->  
        <div class="container">
            <table class="table" align="center">
            <thead>
                <tr>
                <th id="th1" colspan="2">결제 정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <td style="text-align: right;" width="120">상품합계금액</td>
                <td><a href="">34,000원</a></td>
                </tr>
                <tr>
                <td style="text-align: right;" >배송비</td>
                <td>3,000원</td>
                </tr>
                <tr>
                <td style="text-align: right;" >할인금액</td>
                <td>-</td>
                </tr>
                <tr>
                <td id="ftd" style="text-align: right;" >결제수단</td>
                <td id="ftd">카드결제</td>
                </tr>
                <tr>
                <td colspan="2" style="text-align: right;">문의가 필요하다면? <a href=""><span style="color: rgb(155, 213, 188);">고객센터</span></a></td>
                </tr>
            </tbody>
            </table>
        </div>
        <!--네번째 테이블 끝-->  
    
</body>
</html>