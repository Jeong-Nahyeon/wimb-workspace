<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/10f565a9d5.js" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    /* 교환|환불조회 전체영역 */
    .cancelList {
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
        font-size: smaller;
    }
    .selectDate button {
        background-color: white;
        border: 1px solid lightgrey;
        height: 35px;
        width: 55px;
    }
    button:hover {
        cursor: pointer;
        background-color: rgb(155, 213, 189);
    }
    input {
        height: 35px;
        width: 120px;
        margin-left: 5px;
    }
    input:hover {cursor: pointer;}
    #submit {
        background-color: rgb(155, 213, 189);
        border: 0px;
        color: white;
        width: 90px;
        float: right;
    }
    /* 교환|환불 내역 리스트 영역 */
    .orderList th {
        border-top: 2px solid rgba(133, 136, 139, 0.548);
        border-bottom: 1px solid rgba(179, 174, 174, 0.384);
        padding: 10px 0px 10px 0px;
        font-size: 12px;
        background-color: rgba(240, 239, 233, 0.445);
    }
    .orderList td {
        border-bottom: 2px solid rgba(133, 136, 139, 0.548);
        padding: 18px 0px 18px 0px;
        font-size: 13px;
    }
    .orderList {
        width: 700px;
        text-align: center;
        border-spacing: 0px;
        box-sizing: border-box;
        margin-bottom:30px;
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

    <%@ include file="../mypage/myPageMain.jsp" %>

    <div class="cancelList">

        <label style="font-size: 18px;"><b>취소/환불내역</b></label>
        <div>
            <form action="" method="get" class="selectDate">
                <p style="margin-bottom: 5px; font-size: 15px;"><b>조회기간</b></p>
                <div class="selectBtn" style="display: inline-block;">
                    <div>
                        <button type="button" value="7" name="week" style="margin-right: -6px;">7일</button>
                        <button type="button" value="15" name="halfMonth" style="margin-right: -6px;">15일</button>
                        <button type="button" value="30" name="month" style="margin-right: -6px;">1개월</button>
                        <button type="button" value="90" name="threeMonth" style="margin-right: -6px;">3개월</button>
                        <button type="button" value="365" name="year">1년</button>
                    </div>
                </div>
                <div class="selectCalendar" style="display: inline-block;">
                    <input type="date">
                    <label>~</label>
                    <input type="date">
                </div>
                <button type="submit" id="submit" namd="submit">조회&nbsp;<i class="fas fa-search"></i></button>
            </form>

            <label style="font-size: 13px;"><b>취소/환불내역 조회 총 3건</b></label>
            <div class="listView">
                    <table class="orderList">
                         <!--case1. 취소/환불내역이 없을 때-->
                        <tr>
                            <th width="130">주문일자<br>[주문번호]</th>
                            <th>상품명</th>
                            <th width="100">상품금액/수량</th>
                            <th width="80">진행상태</th>
                            <th width="80">처리일자</th>
                            <th width="80">상세보기</th>
                        </tr>
                        <tr>
                            <td colspan="6" height="180">조회 내역이 없습니다.</td>
                        </tr>
                    </table>
                    <table class="orderList">
                       <!--case2. 취소/환불내역이 있을 때 (if(취소상태 == 처리X))-->
                        <tr>
                            <th width="130">주문일자<br>[주문번호]</th>
                            <th>상품명</th>
                            <th width="100">상품금액/수량</th>
                            <th width="80">진행상태</th>
                            <th width="80">처리일자</th>
                            <th width="80">상세보기</th>
                        </tr>
                     
                        <tr>
                            <td>2021-11-15<br>[20211115131234]</td>
                            <td><a href="상품상세페이지">닭가슴살 샐러드</a></td>
                            <td>7,900원/1개</td>
                            <td>취소/환불<br>진행중</td>
                            <td>-</td>
                            <td><button>상세보기</button></td>
                        </tr>
                    </table>
                    <table class="orderList">
                         <!--case2. 취소/환불내역이 있을 때 (if(취소상태 == 처리O))-->
                         <tr>
                            <th width="130">주문일자<br>[주문번호]</th>
                            <th>상품명</th>
                            <th width="100">상품금액/수량</th>
                            <th width="80">진행상태</th>
                            <th width="80">처리일자</th>
                            <th width="80">상세보기</th>
                         </tr>
                        <tr>
                            <td>2021-11-15<br>[20211115131234]</td>
                            <td><a href="상품상세페이지">닭가슴살 샐러드</a></td>
                            <td>7,900원/1개</td>
                            <td>취소/환불<br>진행중</td>
                            <td>-</td>
                            <td><button>상세보기</button></td>
                        </tr>
                    </table>
                    <table class="orderList">
                        <!--case2. 주문내역이 있을 때 (if(sysdate-30일))-->
                         <tr>
                            <th width="130">주문일자<br>[주문번호]</th>
                            <th>상품명</th>
                            <th width="100">상품금액/수량</th>
                            <th width="80">진행상태</th>
                            <th width="80">처리일자</th>
                            <th width="80">상세보기</th>
                         </tr>
                        <tr>
                            <td>2021-11-15<br>[20211115131234]</td>
                            <td><a href="상품상세페이지">닭가슴살 샐러드</a></td>
                            <td>7,900원/1개</td>
                            <td>취소/환불<br>진행중</td>
                            <td>-</td>
                            <td><button>상세보기</button></td>
                        </tr>
                    </table>   
                   
            </div>


        </div>




    </div>

  
</body>
</html>