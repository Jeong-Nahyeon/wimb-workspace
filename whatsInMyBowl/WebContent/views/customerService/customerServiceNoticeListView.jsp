<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터-공지사항리스트</title>
<style>

    .outer{
        width: 100%;
        height: 100%;
        margin-top: 200px;
       
    }

    main ul{
        list-style-type: none;
        margin: 0;
        padding: 20px;
    }

    main li a{
        text-decoration: none;
        color: grey;
    }

    .noticeSideBar{
        float: left;
        margin-left: 23%;
        margin-right: 50px;
    }
    
    .noticeList{
        position: relative;

    }

    .tableNum{
        width: 80px;
        text-align: center;
    }

    .tableTitle{
        width: 450px;
        text-align: center;
    }

    .tableDate{
        width: 130px;
        text-align: center;
    }

    .tableCount{
        width: 130px;
        text-align: center;
    }
     
    h1{
        position: absolute;
        top: -100px;
        left: 1000px;
    }
    



</style>
</head>
<body>
    <main>
        <%@ include file="../common/menubar.jsp" %>

        <div class="outer">

            <div class="noticeSideBar" align="center">

                <div class="noticeSideBar-top">
                    <ul>
                        <li class="noticeSideBar-Title">고객센터</li>
                        <li><a class="noticeSideBar-Text" href="">공지사항</a></li>
                        <li><a class="noticeSideBar-Text" href="">자주묻는 질문</a></li>
                        <li><a class="noticeSideBar-Text" href="">1:1문의</a></li>
                    </ul>
                </div>
    
                <div class="noticeSideBar-bottom">
                    <p>고객상담센터</p>
                    <p>1234-1234</p>
                    <p>
	                        월 ~ 금 : 오전 9시 ~ 오후 4시<br>
	                        점심시간 : 오후 12시 30분<br>
	                        ~ 오후 1시 30분<br>
	                        토요일/일요일/공휴일 휴무
                    </p>
                </div>
    
            </div>
            
            <div class="noticeList">
                <h1>공지사항</h1>
                <table>
                    <tr>
                        <th class="tableNum">번호</th>
                        <th class="tableTitle">제목</th>
                        <th class="tableDate">날짜</th>
                        <th class="tableCount">조회수</th>
                    </tr>
                    <tr>
                        <td class="tableNum">41</td>
                        <td class="tableTitle">공지사항41</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">40</td>
                        <td class="tableTitle">공지사항40</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">39</td>
                        <td class="tableTitle">공지사항39</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">38</td>
                        <td class="tableTitle">공지사항38</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">37</td>
                        <td class="tableTitle">공지사항37</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">36</td>
                        <td class="tableTitle">공지사항36</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">35</td>
                        <td class="tableTitle">공지사항35</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">34</td>
                        <td class="tableTitle">공지사항34</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">33</td>
                        <td class="tableTitle">공지사항33</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
                    <tr>
                        <td class="tableNum">32</td>
                        <td class="tableTitle">공지사항32</td>
                        <td class="tableDate">2021.12.07</td>
                        <td class="tableCount">100</td>
                    </tr>
    
    
                </table>
            </div>

        </div>


    </main>
</body>
</html>