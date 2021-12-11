<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 관리</title>
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

    #black-list{
        text-align: center;
        border-bottom: 2px solid lightgray;
    }

    #black-list>thead th{
        background:lightgray;
        font-size:13px;
    }

    #black-list>tbody td{
        font-size:12px;
    }

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
            <h2 style="font-weight: bold;">&gt; 블랙리스트 관리</h2>
        </div>

        <div id="list" align="center">    
            <div id="list-1">
                <!-- 등록 개수 -->
                <div align="left">
                    총 <span style="color:orange; font-weight:bold;">20</span> 건
                </div>
                <!-- 블랙리스트 삭제 버튼 -->
                <div align="right">
                    <button type="button" id="delete-blackList" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);" data-toggle="modal" data-target="#insert-modal" data-backdrop="static" data-keyboard="false">블랙리스트 해제</button>
                </div>
            </div>

            <!-- 블랙리스트 목록 -->
            <table id="black-list" height="500px" class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>회원명</th>
                        <th>연락처</th>
                        <th>등록일</th>
                        <th>사유</th>
                        <th>누적신고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="8">등록된 블랙리스트가 없습니다.</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="" value="">
                        </td>
                        <td>10</td>
                        <td>21-12-11 18:45</td>
                        <td>user10</td>
                        <td>김트롤</td>
                        <td>user01</td>
                        <td>회원비방</td>
                        <td>15회</td>
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

            <!-- 회원아이디로 블랙리스트 검색 -->
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