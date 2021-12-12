<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin-top: 100px;
        margin-left: 18%;
        width: 1500px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .list-area{
        width: 1500px;
        margin: auto;
    }
    .banner{
        margin-top: 130px;
        width: 1500px;
        margin: 14px;
    }
    .banner img{
        width: 390px;
        height: 150px;
    }
    .banner table{
        width: 100%;
        margin: 50px 30px 20px 0px;
        border: 1px solid gray;
    }
    .banner_box{display: inline-block;}
    #updatebtn{
        border: none;
        background-color: #ffee58;
        border-radius: 4px;
        padding: 2px 13px;
        margin-left: 10px;
    }
    .banner_box table{
        width: 400px;
        text-align: center;
    }
    .banner_box table td{
        border: 1px solid gray;
    }
    .tableheader{
        font-weight: bold;
        background-color: lightgray;
    }
    .checkboxandbtn{margin-top: 20px;}
    .bannerList{
        margin-top: 100px;
        width: 100%;
    }
    .bannerList table{
        width: 600px;
        height: 100%;
        margin-top: 10px;
        text-align: center;
    }
    .bannerList table td{border: 1px solid gray;}
    .bannerList_header{
        font-weight: bold;
        background-color: lightgray;
    }
    .two_btn button{
        border: none;
        border-radius: 5px;
        background-color: #ffee58;
        padding: 2px 11px;
        font-size: 13px;
    }
    #deletebanner{background-color: lightgray;}
    .paging-area button{
        margin-top: 20px;
        border: 0;
    }


    /*모달창 만드는 css*/
    .insert_banner_area{
        display: none;
        width: 450px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:white;
        z-index: 2;
        align-items: center;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 1200px;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }

    /*모달창에 속한 테이블 css*/
    .insert_banner_area table{
        text-align: center;
        width: 400px;
        height: 400px;
    }
    .insert_banner_area table tr, .insert_banner_area table th{border: 1px solid gray;}
    .insert_banner_area table td{
        text-align: left;
        padding-left: 20px;
    }
    .insert_banner_area table input{border: none;}
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

    <%@ include file="../common/adminBar.jsp" %>
    <div class="outer">
        <div id="mainTitle">
            <h2 id="mainTitle1">홈페이지관리</h2>
            <h2>> 배너</h2>
        </div>

        <div class="banner-area">

            <div class="banner">

                <div class="banner_box" align="center">
                    <table>
                        <tr>
                            <td colspan="3">
                                <img src="" alt="">
                            </td>
                        </tr>
                        <tr>
                            <td class="tableheader">상태</td>
                            <td colspan="2" class="tableheader">게시일</td>
                        </tr>
                        <tr>
                            <td>게시중</td>
                            <td colspan="2">2021-11-02</td>
                        </tr>
                        <tr>
                            <td class="tableheader">배너명</td>
                            <td class="tableheader">배너번호</td>
                            <td class="tableheader">위치</td>
                        </tr>
                        <tr>
                            <td>이벤트배너임</td>
                            <td>10</td>
                            <td>메인1</td>
                        </tr>
                    
                    </table>
                    <div class="checkboxandbtn">
                        <input type="checkbox">
                        <button type="button" id="updatebtn">수정하기</button>
                    </div>

                </div>

                <div class="banner_box" align="center">
                    <table>
                        <tr>
                            <td colspan="3">
                                <img src="" alt="">
                            </td>
                        </tr>
                        <tr>
                            <td class="tableheader">상태</td>
                            <td colspan="2" class="tableheader">게시일</td>
                        </tr>
                        <tr>
                            <td>게시중</td>
                            <td colspan="2">2021-11-02</td>
                        </tr>
                        <tr>
                            <td class="tableheader">배너명</td>
                            <td class="tableheader">배너번호</td>
                            <td class="tableheader">위치</td>
                        </tr>
                        <tr>
                            <td>이벤트배너임</td>
                            <td>9</td>
                            <td>메인2</td>
                        </tr>
                    
                    </table>
                    <div class="checkboxandbtn">
                        <input type="checkbox">
                        <button type="button" id="updatebtn">수정하기</button>
                    </div>

                </div>

                <div class="banner_box" align="center">
                    <table>
                        <tr>
                            <td colspan="3">
                                <img src="" alt="">
                            </td>
                        </tr>
                        <tr>
                            <td class="tableheader">상태</td>
                            <td colspan="2" class="tableheader">게시일</td>
                        </tr>
                        <tr>
                            <td>게시중</td>
                            <td colspan="2">2021-11-02</td>
                        </tr>
                        <tr>
                            <td class="tableheader">배너명</td>
                            <td class="tableheader">배너번호</td>
                            <td class="tableheader">위치</td>
                        </tr>
                        <tr>
                            <td>이벤트배너임</td>
                            <td>8</td>
                            <td>메인3</td>
                        </tr>
                    
                    </table>
                    <div class="checkboxandbtn">
                        <input type="checkbox">
                        <button type="button" id="updatebtn">수정하기</button>
                    </div>

                </div>

            </div>
            
        </div>
        
    </div>
    
    <!-- 하단의 배너목록 테이블 -->
    <div class="bannerList">

        
        <table style="margin-left: auto; margin-right: auto; width: 800px;" >

            <div>
                <select name="sorting_banner" id="sorting_banner" style="position: absolute; top:77%; right: 455px;">
                    <option value="">전체보기</option>
                    <option value="">게시중</option>
                    <option value="">게시종료</option>
                </select>
            </div>
            <div style="margin-left: 68%;" class="two_btn">
                <button type="button" id="deletebanner">선택삭제</button>
                <button type="button" id="insertbannerbtn">등록하기</button>
            </div>
            <tr>
                <td class="bannerList_header" style="position: relative;"></td>
                <td class="bannerList_header">배너번호</td>
                <td class="bannerList_header">배너명</td>
                <td class="bannerList_header">위치</td>
                <td class="bannerList_header">게시일</td>
                <td class="bannerList_header">상태</td>
            </tr>

            <tr>
                <td><input type="checkbox"></td>
                <td>10</td>
                <td>배너이름10</td>
                <td>메인1</td>
                <td>2021-11-02</td>
                <td>게시중</td>
            </tr>

            <tr>
                <td><input type="checkbox"></td>
                <td>10</td>
                <td>배너이름9</td>
                <td>메인2</td>
                <td>2021-11-02</td>
                <td>게시중</td>
            </tr>

            <tr>
                <td><input type="checkbox"></td>
                <td>10</td>
                <td>배너이름8</td>
                <td>메인3</td>
                <td>2021-11-02</td>
                <td>게시중</td>
            </tr>

            <tr>
                <td><input type="checkbox"></td>
                <td>10</td>
                <td>배너이름7</td>
                <td>메인1</td>
                <td>2021-11-02</td>
                <td>게시종료</td>
            </tr>

            <tr>
                <td><input type="checkbox"></td>
                <td>10</td>
                <td>배너이름6</td>
                <td>메인2</td>
                <td>2021-11-02</td>
                <td>게시종료</td>
            </tr>
        </table>

        <div class="paging-area" align="center">
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>&gt;</button>
        </div>
        
    </div>

    <!-- 등록하기 버튼 클릭 시 생성되는 '배너 등록' 모달창 -->
    <div class="black_bg"></div>
    <div class="insert_banner_area">
        <div class="modal_close"><a href="#">close</a></div>
        <div align="center" style="margin-top: 30px;">
            <form action="">
                <table>
                    <tr>
                        <th>배너번호</th>
                        <td>10</td>
                    </tr>
                    <tr>
                        <th>배너명</th>
                        <td><input type="text" id="bannerTitle" placeholder="배너명 입력" required style="width: 90%;"></td>
                    </tr>
                    <tr>
                        <th>상태</th>
                        <td>
                            <select name="" id="">
                                <option value="">게시중</option>
                                <option value="">게시종료</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>위치</th>
                        <td>
                            <select name="" id="">
                                <option value="">메인1</option>
                                <option value="">메인2</option>
                                <option value="">메인3</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>게시일</th>
                        <td>2021-11-02</td>
                    </tr>
                    <tr>
                        <th>이미지</th>
                        <td><input type="file" id="bannerFile" required></td>
                    </tr>
                </table>
                <div class="two_btn" align="center" style="margin-top: 20px;">
                    <button type="button" style="background-color:lightgray; margin-right: 10px;">취소</button>
                    <button type="submit">등록</button>
                </div>

            </form>

        </div>
    </div>



    <script>
        window.onload = function() {
     
        function onClick() {
            document.querySelector('.insert_banner_area').style.display ='block';
            document.querySelector('.black_bg').style.display ='block';
        }   
        function offClick() {
            document.querySelector('.insert_banner_area').style.display ='none';
            document.querySelector('.black_bg').style.display ='none';
        }
     
        document.getElementById('insertbannerbtn').addEventListener('click', onClick);
        document.querySelector('.modal_close').addEventListener('click', offClick); 
    };
    </script>
    
    

</body>
</html>