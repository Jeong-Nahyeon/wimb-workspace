<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고내역</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .outer{
        /* border:1px solid red; */
        margin:auto;
        margin-top:100px;
        width:800px;
        height:1000px;
    }
    #menu-title h2{
        display:inline;
        font-size:25px;
    }

    #list{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:790px;
        margin:auto; 
    }

    #list-1{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:100%;
        height:30px;
        line-height:30px;
        margin-bottom: 10px;
    }

    #list-1 div{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:50%;
        height:100%;
        float:left;
    }

    #report-list{
        text-align: center;
        border-bottom: 2px solid lightgray;
    }

    #report-list>thead th{
        background:lightgray;
        font-size:13px;
    }

    #report-list>tbody td{
        font-size:12px;
    }

    /* 내용 텍스트 길 경우 뒷부분 생략 되는 스타일 */
    .report-content{
        /* border:1px solid red; */
        width: 200px;
        height: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .reported{color:red;}

    #select-form span{
        border:1px solid lightgray;
        border-radius:3px;
        padding:4px 15px;
    }

    #select-form input{
        border:1px solid lightgray;
        border-radius:3px;
        width:250px;
        height:30px;
    }

    #select-form button{
        /* border-radius:3px; */
        padding:5px 15px;
    }
</style>
</head>
<body>

	<%@ include file="../common/adminBar.jsp" %>

    <div class="outer">

        <div id="menu-title">
            <h2 style="color:gray; font-weight: bold;">회원관리</h2>
            <h2 style="font-weight: bold;">&gt; 신고내역</h2>
        </div>

        <div id="list" align="center">    
            <div id="list-1">
                <!-- 등록 개수 -->
                <div align="left">
                    총 <span style="color:orange; font-weight:bold;">20</span> 건
                </div>
                <!-- 블랙리스트 추가 및 신고내역 삭제 버튼 -->
                <div align="right">
                    <!-- [고려사항]
                        체크박스로 블랙리스트 추가용이랑 삭제용을 둘 다 쓸 수 없을 것 같음...
                        블랙리스트 등록 시 로그인 안되게 해야 함
                    -->
                    <!-- <button type="button" id="insert-blackList" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);" data-toggle="modal" data-target="#insert-modal" data-backdrop="static" data-keyboard="false">블랙리스트추가</button> -->
                    <button type="button" id="delete-report" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);" data-toggle="modal" data-target="#insert-modal" data-backdrop="static" data-keyboard="false">선택삭제</button>
                </div>
            </div>

            <!-- 신고내역 목록 -->
            <table id="report-list" height="500px" class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>신고시간</th>
                        <th>신고사유</th>
                        <th>신고내용</th>
                        <th>신고작성회원</th>
                        <th>신고당한회원</th>
                        <th>누적신고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="8">등록된 신고내역이 없습니다.</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="user01">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>욕설</td>
                        <td><div class="report-content">신고합니다. 해당 리뷰글에 욕설이 심하네요. 게다가 다른 회원 비방도 하고 있습니다.</div></td>
                        <td>user01</td>
                        <td class="reported">user10</td>
                        <td class="reported">4회</td>
                    </tr>
                </tbody>
            </table>

            <!-- 페이징바 -->
            <div id="paging-bar">
                <a href="">&lt;</a>
                <a href="">1</a>
                <a href="">&gt;</a>
            </div>
            <br>

            <!-- 회원아이디로 신고내역 검색 -->
            <form id="select-form" action="" method="get">
                <table id="product-search">
                    <tr>
                        <td>
                            <span>회원ID</span>
                        </td>
                        <td>
                            <input type="search">
                        </td>
                        <td>
                            <button type="submit" class="btn btn-sm btn-warning" style="background-color:rgb(255, 225, 90); margin-left:5px;">조회</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>    

    </div>
	

</body>
</html>