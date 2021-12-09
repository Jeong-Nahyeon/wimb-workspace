<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터-공지사항리스트(고객센터메인)</title>
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

    body{
        box-sizing: border-box;
    }

    .noticeSideBar{
        position: fixed;
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

    .noticeList{
        margin-left: 230px;
        text-align: center;
    }

    .noticeList table tr td{
        padding: 10px;
    }

    .paging-area button{
        margin-top: 20px;
        border: 0;
    }

    
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
</head>
<body>
    <main>
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
            
            <div class="noticeList">
                <h3 style="font-weight: 800; margin-bottom: 30px;">공지사항</h3>
                <table style="padding: 10px;">
                    <tr style="background-color: rgb(234, 234, 234); border-top: 2px solid gray; border-bottom: 1px solid gray;">
                        <th class="tableNum" style="width: 70px; padding: 10px; border-bottom: 1px solid gray;">번호</th>
                        <th class="tableTitle" style="width: 450px; padding: 10px;">제목</th>
                        <th class="tableDate" style="width: 120px; padding: 10px;">날짜</th>
                        <th class="tableCount" style="width: 90px; padding: 10px;">조회수</th>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">41</td>
                        <td class="tableTitle">공지사항41</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">40</td>
                        <td class="tableTitle">공지사항40</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">39</td>
                        <td class="tableTitle">공지사항39</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">38</td>
                        <td class="tableTitle">공지사항38</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">37</td>
                        <td class="tableTitle">공지사항37</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">36</td>
                        <td class="tableTitle">공지사항36</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">35</td>
                        <td class="tableTitle">공지사항35</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">34</td>
                        <td class="tableTitle">공지사항34</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 1px solid gray;">
                        <td class="tableNum">33</td>
                        <td class="tableTitle">공지사항33</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr style="border-bottom: 2px solid gray;">
                        <td class="tableNum">32</td>
                        <td class="tableTitle">공지사항32</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
    
    
                </table>

                <div class="paging-area">
                    <button>&lt;</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>&gt;</button>
                </div>



            </div>

        </div>


    </main>
</body>
</html>