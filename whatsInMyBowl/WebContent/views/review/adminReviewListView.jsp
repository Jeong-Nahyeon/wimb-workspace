<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰관리</title>
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

    #review-list{
        text-align: center;
        border-bottom: 2px solid lightgray;
    }

    #review-list>thead th{
        background:lightgray;
        font-size:13px;
    }

    #review-list>tbody td{
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
                <h2 style="color:gray; font-weight: bold;">상품관리</h2>
                <h2 style="font-weight: bold;">&gt; 리뷰관리</h2>
            </div>

        <div id="list" align="center">    
            <div id="list-1">
                <!-- 등록 개수 -->
                <div align="left">
                    총 <span style="color:orange; font-weight:bold;">20</span> 건
                </div>
                <!-- 상품등록 버튼 -->
                <div align="right">
                    <button type="button" id="insert-product" class="btn btn-sm btn-warning" style="background:rgb(255, 225, 90);" data-toggle="modal" data-target="#insert-modal" data-backdrop="static" data-keyboard="false">선택삭제</button>
                </div>
            </div>

            <!-- 상품 리뷰 목록 -->
            <table id="review-list" height="400px" class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th>번호</th>
                        <th>ID</th>
                        <th>구매 상품</th>
                        <th>최종등록일</th>
                        <th>리뷰 제목</th>
                        <th>적립금 지급</th>
                        <th>메인노출여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="8">등록된 리뷰가 업습니다.</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td><a>맛있어요</a></td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>user01</td>
                        <td>닭가슴살샐러드</td>
                        <td>2021.12.11</td>
                        <td>맛있어요</td>
                        <td>
                            <!-- 적립금 지금 전 -->
                            <!-- 대기 <a href="" class="btn btn-sm btn-warning">적립금지급</a> -->
                            <!-- 적립금 지급 후 -->
                            지급완료
                        </td>
                        <td>N</td>
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

            <!-- 상품 검색 -->
            <form id="select-form" action="" method="get">
                <table id="product-search">
                    <tr>
                        <td>
                            <span>상품명</span>
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