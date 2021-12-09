<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
    .outer{
        /* border:1px solid red; */
        margin-top:200px;
        margin-left:210px;
        width:800px;
        height:1000px;
    }
    #menu-title h2{
        display:inline;
        font-size:25px;
    }

    #product-custom-button{
        box-sizing: border-box;
        /* border:1px solid red;  */
        width:750px;
        height:50px;
        margin:auto;
        margin-top:20px;
    }

    #left, #right{
        box-sizing: border-box;
        /* border:1px solid red;  */
        width:50%;
        height:100%;
        float:left;
    }

    #product-button, #custom-button{
        box-sizing: border-box;
        width:99%;
        height:100%;
        border:1px solid lightgray;
        border-bottom:none;
        background-color:rgb(245, 245, 245);
        line-height:50px;
        text-align: center;
    }

    #list{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:750px;
        margin:auto; 
    }

    #list-1{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:100%;
    }

    #list-2{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:100%;
        height:30px;
        line-height:30px;
        margin-bottom: 5px;
    }

    #list-2 div{
        box-sizing: border-box;
        /* border:1px solid red; */
        width:50%;
        height:100%;
        float:left;
    }

    #product-list>thead th{
        background:lightgray;
        font-size:13px;
    }

    #product-list>tbody td{
        font-size:12px;
    }

    form span{
        border:1px solid lightgray;
        border-radius:3px;
        padding:4px 15px;
    }

    form input{
        border:1px solid lightgray;
        border-radius:3px;
        width:250px;
        height:30px;
    }

    form button{
        /* border-radius:3px; */
        padding:5px 15px;
        
    }

    /* 상품등록 모달창 */
    .insert-modal{
        box-sizing:border-box;
        width:700px; 
        height:1000px;
        background:#fff; border: 1px solid black;
    }

  .title-area{
      box-sizing:border-box;
      border:1px solid red;
      width:95%;
      height:5%
  }

  .content-area{
      box-sizing:border-box;
      border:1px solid red;
      width:95%;
      height:91%;
  }

  #main{
      box-sizing: border-box;
      border:1px solid red;
      width:100%;
      height:40%;
  }

  #detail{
      box-sizing: border-box;
      border:1px solid red;
      width:100%;
      height:60%; 
  }

  .content-area table{
      box-sizing:border-box;
      width:100%;
      height:100%;
  }

  .content-area table th{
      text-align:center;
  }

  .content-area table input{
      width:100%;
  }


  .button-area{
      box-sizing:border-box;
      border:1px solid red;
      width:95%;
      height:4%;
  }

  .button-area>div{
    box-sizing:border-box;
    border:1px solid red;
    width:50%;
    height:100%;
    float:left;
  }



</style>
</head>
<body>

   <%@ include file="../common/adminBar.jsp" %>

    
    <div class="outer">

        <div id="menu-title">
            <h2 style="color:gray;">상품관리</h2>
            <h2>&gt; 상품등록</h2>
        </div>

        <!-- 완제품/커스텀 버튼 -->
        <div id="product-custom-button">
            <div id="left">
                <div id="product-button">
                    <b>완제품</b>
                </div>
            </div>
            <div id="right" align="right">
                <div id="custom-button">
                    <b>커스텀</b>
                </div>
            </div>
        </div>

        <div id="list" align="center">
            <!-- 카테고리 -->
            <div id="list-1"  align="left" style="margin-top:10px; margin-bottom:5px;">
                <select name="productCategory">
                    <option>카테고리 선택</option>
                    <option>비건</option>
                    <option>육류</option>
                    <option>해산물</option>
                </select>
            </div>

            <div id="list-2">
                <!-- 등록 개수 -->
                <div align="left">
                    총 <span style="color:orange; font-weight:bold;">20</span> 건
                </div>
                <!-- 상품등록 버튼 -->
                <div align="right">
                    <button type="button" id="insert-product" class="btn btn-sm btn" style="background:rgb(255, 225, 90);">상품등록</button>
                    <script>
                        $(function(){
                            $("#insert-product").click(function(){
                                $(".modal_content").fadeIn();
                            });
        
                            $(".modal_content").click(function(){
                                // $(".modal_content").fadeOut();
                            });
                        });
                    </script>
                </div>
            </div>


            <!-- 완제품 리스트 -->
            <table id="product-list" width="750px" height="300px"class="table table-bordered" style="text-align: center;" >
                <thead>
                    <tr>
                        <th></th>
                        <th width="55px">번호</th>
                        <th width="100px">상품번호</th>
                        <th width="150px">상품명</th>
                        <th width="100px">업체명</th>
                        <th width="95px">공급가(원)</th>
                        <th width="95px">판매가(원)</th>
                        <th width="55px">재고</th>
                        <th width="85px">노출여부</th>
                    </tr>
                </thead>
                <tbody >
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="" id="">
                        </td>
                        <td>10</td>
                        <td>PM0001</td>
                        <td>닭가슴살샐러드</td>
                        <td>업체명</td>
                        <td>3000</td>
                        <td>6000</td>
                        <td>155</td>
                        <td>Y</td>
                    </tr>
                </tbody>
            </table>
            <br>

            <!-- 페이징바 -->
            <div id="paging-bar">
                <button>1</button>
            </div>
            <br>

            <!-- 상품 검색 -->
            <form action="" method="get">
                <table id="product-search">
                    <tr>
                        <td>
                            <span>상품명</span>
                        </td>
                        <td>
                            <input type="search">
                        </td>
                        <td>
                            <button type="submit" class="btn btn-sm" style="background-color:rgb(255, 225, 90); margin-left:5px;">조회</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <!-- 상품 등록버튼 클릭 시 생기는 모달창 -->
      <div class="insert-modal" align="center">
          <div class="title-area">
              <h2 style="font-size:25px; margin: 10px;">상품 등록</h2>
          </div>
          <div class="content-area">
                <form action="">
                    <!-- 상품 설명 영역 -->
                        <div id="main">
                            <table border="1">
                                    <tr>
                                        <th style="text-align:center">상품 설명</th>
                                        <td colspan="2">회원이 상품 클릭 시 맨 위에 보여지는 화면입니다.</td>
                                    </tr>
                                    <tr>
                                        <th style="text-align:center">카테고리</th>
                                        <td colspan="2">
                                            <select name="" id="">
                                                <option>카테고리 선택</option>
                                                <option>비건</option>
                                                <option>육류</option>
                                                <option>해산물</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="text-align:center">사진등록</th>
                                        <td colspan="2">
                                            <input type="file" name="" id="">
                                        </td>
                                    </tr>
                            </table>
                            <table border="1">       
                                    <tr>
                                        <td rowspan="8" width="300">메인사진자리</td>
                                        <th style="text-align:center">제품명</th>
                                        <td><input type="text" name="productName"></td>
                                    </tr>
                                    <tr>
                                        <th style="text-align:center">판매가격</th>
                                        <td><input type="number" name="productPrice"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align:center; font-size:12px;"> -- 아래 영역은 실제 회원에게 보여지지 않는 부분입니다 --</td>
                                    </tr>
                                    <tr>
                                        <th style="text-align:center">공급업체</th>
                                        <td><input type="text" name="provider"></td>
                                    </tr>
                                    <tr>
                                        <th style="text-align:center">공급가격</th>
                                        <td><input type="number" name="supplyPrice"></td>
                                    </tr>
                                    <tr>
                                        <th style="text-align:center">재고수량</th>
                                        <td><input type="number" name="amount"></td>
                                    </tr>
                                    <tr>
                                        <th style="text-align:center">키워드</th>
                                        <td><input type="text" name="keyword"></td>
                                    </tr>
                                    <tr>
                                        <th style="text-align:center">노출여부</th>
                                        <td>
                                            <select name="" id="">
                                                <option value="">Y</option>
                                                <option value="">N</option>
                                            </select>
                                        </td>
                                    </tr>
                            </table>
                        </div>

                        <!-- 상품 상세 설명 영역 -->
                        <div id="detail">
                            <table border="1" id="detail-1">
                                <tr>
                                    <th>상품 상세 설명</th>
                                    <td>상품에 대한 상세 설명을 작성하는 화면입니다.</td>
                                </tr>
                                <tr>
                                    <th>사진등록</th>
                                    <td><input type="file" name="" id=""></td>
                                </tr>
                            </table>
                            <table border="1" id="detail-2">
                                <tr>
                                    <td>상세이미지보이는영역</td>
                                </tr>
                                <tr>
                                    <td>
                                        <textarea name="" cols="90" rows="9" style="resize:none;">

                                        </textarea>
                                    </td>
                                </tr>
                            </table>
                        </div>
                </form>
            </div>    
            <!-- 버튼 영역 -->
            <div class="button-area">
                <div id="button-left-area">
                    <button>취소하기</button>
                </div>
                <div id="button-right-area">
                    <button>등록하기</button>
                </div>
            </div>
      </div> 
          
      </div>
    
</body>
</html>