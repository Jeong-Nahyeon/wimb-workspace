<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
    }

    .outer{
        width: 1000px;
        box-sizing: border-box;
        margin: auto;
        margin-top: 130px;
    }

    .noticeSideBar{
        float: left;
        width: 200px;
    }

    .noticeSideBar-Top>h2{
        text-align: center;
        font-size: 25px;
        font-weight: 600;
    }

    .noticeSideBar ul li{
        text-align:center;
        margin: 25px 0;
        list-style: none;
        padding: 12px;
    }
    .noticeSideBar ul li a{
        color: black;
        text-decoration: none;
        font-weight: bold;
    }

    .noticeSideBar-Top ul li:hover{
        background-color: rgb(155, 213, 189);
        text-decoration-line: none;
    }

    .noticeDetail{
        margin-left: 230px;
        text-align: center;
        position: relative;
    }

    .noticeDetail table tr td{
        padding: 10px;
    }

    input{width: 600px;}
    #list-btn button{ 
        color: rgb(155, 213, 189);
        padding: 5px;
        border: none;
        border: 1px solid rgb(155, 213, 189);
        background-color: white;
        border-radius: 5px;
        font-size: 15px;
        position: absolute;
        right: 10%;
    }

    p{position: relative;}
    

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <div class="noticeSideBar">

            <div class="noticeSideBar-Top">
                <h2>고객센터</h2>
                <ul>
                    <li>
                        <a href="">공지사항</a>
                    </li>
                    <li>
                        <a href="">자주묻는 질문</a>
                    </li>
                    <li style="margin-bottom: 80px;">
                        <a href="">1:1문의</a>
                    </li>
                </ul>
            </div>

            <div class="noticeSidebar-Bottom" align="center" style="border-top: 1px solid black; padding-top: 30px;">
                <p style="font-weight: bold;">고객상담센터</p>
                <p style="font-size: 28px; font-weight: 600; color: rgb(155, 213, 189);">1234-1234</p>
                <p style="font-size: 12px; font-weight: bold;">
                    월 ~ 금 : 오전 9시 오후 4시<br>
                    점심시간 : 오후 12시 30분<br>
                    ~ 오후 1시 30분<br>
                    토요일/일요일/공휴일 휴무<br>
                </p>
            </div>

        </div>

        <div class="noticeDetail">
            <h3 style="font-weight: 800; margin-bottom: 30px;">공지사항</h3>
            <table style="padding: 10px;">
                <tr style="border-top: 2px solid gray">
                    <th>제목</th>
                    <td colspan="3">
                        <input type="text" name="title" required value="공지사항41">
                    </td>
                </tr>
                <tr style="border-top: 1px solid gray">
                    <th style="width: 90px;">작성일</th>
                    <td style="text-align: left;">2021.11.14</td>
                    <th style="width: 90px;">조회수</th>
                    <td style="text-align: left;">100</td>
                </tr>
                <tr style="border-top: 1px solid gray">
                    <td colspan="4" style="padding: 0;">
                        <p style="height: 150px; border-bottom: 2px solid gray; height: auto; padding: 20px 20px; text-align: left;">
                            찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다<br>
                            이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 <br>
                            낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴?<br>

                            찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다 <br>
                            이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 <br>
                            낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴?<br>

                            찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다 <br>
                            이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 <br>
                            낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴?<br>
                        </p>
                    </td>
                </tr>

            </table>
            <div id="list-btn" align="center">
                <button style="font-weight: 900;">목록가기</button>
            </div>



    </div>
</body>
</html>