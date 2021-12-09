<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/10f565a9d5.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    /* 주문|배송조회 전체영역 */
    .orderPostList {
        margin-left: 18px;
        margin-top: 50px;
    }
    /* 주문|배송조회 기간 선택 영역 */
    .selectDate {
        width:700px;
        padding: 35px 20px 35px 20px;
        border: 1px solid #ebebeb;
        box-sizing: border-box;
        margin-bottom: 50px;
    }
    h3 { 
        margin-bottom: 15px; 
        margin-top: 0px;
    }
    .selectDate button {
        background-color: white;
        border: 1px solid lightgrey;
        height: 35px;
        width: 50px
    }
    button:hover {
        cursor: pointer; 
        background-color: rgb(155, 213, 189);
    }
    input {
        height: 35px;
        width:130px;
        margin-left: 5px;
    }
    input:hover {cursor: pointer;}
    #submit {
        background-color : rgb(155, 213, 189); 
        border:0px;
        color: white;
        width: 90px;
        float: right;
    }
    /* 주문|배송 내역 리스트 영역 */
    .orderList th {
        border-bottom: 1px solid rgba(182, 178, 178, 0.719);
        padding: 10px 0px 10px 0px;
        font-size: 12px;
        background-color: rgba(240, 239, 233, 0.445);
    }
    .orderList td {
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        font-size: 13px;
        padding: 10px 0px 10px 0px;
    }
    .orderList {
        width: 700px;
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 2px solid rgba(133, 136, 139, 0.548);
        text-align: center;
        border-spacing: 0px;
        box-sizing: border-box;
    }
    .orderList button {
        display: block;
        margin:auto;
        background-color: white;
        border: 1px solid lightgrey;
        height: 25px;
    }
    .orderList button:hover{
        cursor: pointer; 
        background-color: rgb(155, 213, 189);

    }
    a {
        text-decoration: none;
        color:black;
    }
</style>
</head>
<body>

    <div class="orderPostList">

        <h3>주문목록 / 배송조회</h3>
        <form action="" method="get" class="selectDate">
            <div>
                <h3>조회기간<br></h3>
            </div>
            <div class="dateBtn" style="display: inline;">
                <button type="button" value="7" name="week" style="margin-right: -6px;">7일</button>
                <button type="button" value="15" name="halfMonth" style="margin-right: -6px;">15일</button>
                <button type="button" value="30" name="month" style="margin-right: -6px;">1개월</button>
                <button type="button" value="90" name="threeMonth" style="margin-right: -6px;">3개월</button>
                <button type="button" value="365" name="year">1년</button>
            </div>
            <div class="dateCalendar" style="display: inline;">
                <input type="date" name="startDate"> 
                <label>~</label> 
                <input type="date" name="endDate">
            </div>
            <button type="submit" name="submit" id="submit">조회&nbsp;<i class="fas fa-search"></i></button>
        </form>

        <div class="listView">
            <h3>주문목록 / 배송내역</h3>
               <table class="orderList">
                   <thead>
                   <tr>
                       <th>주문일자/주문번호</th>
                       <th>상품명</th>
                       <th>상품금액/수량</th>
                       <th>주문상태</th>
                       <th>확인/리뷰</th>
                   </tr>
                   </thead>

                   <!--case1. 최근 주문내역이 없을 때-->
                   <tbody>
                       <tr>
                           <td colspan="5" height="200">최근 주문 정보가 없습니다.</td>
                       </tr>
                   </tbody>
                   <!--case2. 최근 주문내역이 있을 때 (if(sysdate-30일))-->
                   <tbody>
                       <tr>
                           <td>2021-11-15<br>[20211115131234]</td>
                           <td><a href="상품상세페이지">닭가슴살 샐러드</a></td>
                           <td>7,900원/1개</td>
                           <td><a href="주문목록/배송조회 이동">배송중</a></td>
                           <td>
                               <!--주문상태가 결제완료, 상품준비중일 때만 가능-->
                               <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cancelModal">
                               즉시취소
                               </button>
                           </td>
                       </tr>
                       <tr>
                           <td>2021-11-15<br>[20211115131234]</td>
                           <td><a href="상품상세페이지">닭가슴살 샐러드</a></td>
                           <td>7,900원/1개</td>
                           <td><a href="주문목록/배송조회 이동">배송중</a></td>
                           <td>
                               <!--주문상태가 배송중일 때만 가능-->
                               <button>배송조회</button>
                           </td>
                       </tr>
                       <tr>
                           <td>2021-11-15<br>[20211115131234]</td>
                           <td><a href="상품상세페이지">닭가슴살 샐러드</a></td>
                           <td>7,900원/1개</td>
                           <td><a href="주문목록/배송조회 이동">배송중</a></td>
                           <td>
                               <!--주문상태가 배송완료일 때만 가능-->
                               <button>리뷰작성</button>
                               <button>환불요청</button>
                           </td>
                       </tr>
                   </tbody>
               </table>
        </div>

    </div>

    
    <!-- 각 모달창 만들기 -->
    
  
</body>
</html>