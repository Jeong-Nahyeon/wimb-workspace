<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.wimb.custom.model.vo.Item, java.util.ArrayList, com.wimb.common.model.vo.PageInfo" %>     
<%
	ArrayList<Item> list = (ArrayList<Item>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/fca98d1848.js" crossorigin="anonymous"></script>
	
	<!-- Latest compiled and minified CSS -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  -->
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        /* * {font-family: 'Noto Sans KR', sans-serif;}*/
        div{box-sizing: border-box;}
        .fas{vertical-align: middle;}
        .outer{
            /*border:1px solid red;*/
            margin: auto;
            margin-top:100px;
            margin-left:300px;
            /*margin-left: 20px;*/
            width:1800px;
            height:auto;
        }
        .menu_categoty h2{
            display:inline;
            font-size: 25px;
            font-weight: 800;
        }
        .custom_admin{
            /*width: 750px;*/
            width: 1500px;
            /*margin: auto;*/
            
        }
        .product_category{
            height: 50px;
            margin: 20px 0 0 0;
            /*border: 1px solid blue;*/
        }
        .custom_category{
            height: 30px;
            margin: 10px 0 5px 0;
            /*border: 1px solid purple;*/
        }
        /* 완제품, 커스텀 버튼*/
        #product_category{
            box-sizing: border-box;
            /* border:1px solid red;  */
            width:99%px;
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

        #product-button>a, #custom-button>a{
            display: block;
            /* border:1px solid red; */
            width:100%;
            height:100%;
            color:black;
            text-decoration-line:none;
        }
        /*custom 총 개수, 등록 버튼*/
        .custom_manage{
            /*border: 1px solid green;*/
            width: 100%;
            height: 30px;
            overflow: hidden;
            margin-bottom: 5px;
        }
        .custom_manage>div{
            /*border: 1px solid pink;*/
            float: left;
            width: 50%;
            height: 100%;
            
        }
        /*.custom_info>span, .custom_btn>button{
            font-size: 13px;
        }*/
        .custom_btn>button{
            width: auto;
            height: 30px;
            background-color: rgb(247,223,125);
            border: none;
            border-radius: 5%;
            font-size: 13px;
        }
        /*커스텀 재료 목록 테이블*/
        #custom_table{
            border: 1px solid lightgrey;
            width: 100%;
           
        }
        #custom_table th, #custom_table td{
            text-align: center;
        }
        #custom_table td{
        	font-size: 13px;
        }
        /*페이징 바*/
        .paging_area{
            /*border: 1px solid coral;*/
            width: 100%;
            text-align: center;
        }
        .paging_area>button{
            width: 20px;
            height: 20px;
            font-size: 10px;
            border: none;
            border-radius: 5%;
        }
        /*검색창*/
        #product-list{text-align: center; margin-top: 15px;}
        #product-list span{
            border: 1px solid lightgrey;
            border-radius: 5%;
            padding: 0 10px;
            height: 25px;
        }
        #product-list input{
            border:1px solid lightgray;
            border-radius:3px;
            width:250px;
            height:25px;
        }
        #product-list button{
            border:1px solid lightgray;
            border-radius:3px;
            padding:0 10px;
            margin-left:10px;
            background-color:white;
        }
        #product-list>thead th{background:lightgray}

        /*노출 여부 영역*/
        .status{
            margin: auto;
            margin-top: 15px;
            width: 120px;
            height: 140px;
            padding-top: 10px;
            text-align: center;
        }
        .status>span{font-weight: 700;}
        .status select{
            display: block;
            margin: auto;
            margin-top: 20px;
            width: 50px;
        }
        .status button{
            margin-top: 25px;
            padding: 5px 5px;
            width: 50px; height: 25px;
            font-size: 13px; vertical-align: middle;
            border: none;
            background-color: rgb(247,223,125);
            border-radius: 5%;
        }

        /* 대표 이미지 관리*/
        .image_manage{
            width: 400px;
            height: 300px;
            padding: 10px 20px;
        }
        .image_manage>form>span{font-size: 13px; margin-right: 5px;}
        .image_manage input[type="file"]{
            position: absolute;
            width: 0; height: 0; padding: 0; border: 0;
            overflow: hidden; 
        }
        .image_manage .upload_name{
            display: inline-block;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 60%;
            height: 30px;
            font-size: 13px;
            color: #999999;
        }
        .image_manage label{
            padding: 5px 10px;
            color: #fff;
            vertical-align: middle;
            background-color: #999999;
            cursor: pointer;
            height: 30px; font-size: 13px;
            margin: 0 0 0 10px;
        }
        #image_example{
            text-align: center;
        }
        #image_example span{
            display: block;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        #image_example img{
            border: 1px solid gray;
            width: 130px;
            height: 130px;
        }
        .image_manage button{
            border: none; border-radius: 5%;
            display: block;
            margin: auto; margin-top: 25px;
            width: 50px; height: 30px; font-size: 13px;
            background-color: rgb(247,223,125);
        }
        #titleImg_button{
            width: 400px;
        }
        /*재료 등록 폼*/
        .modal-body{height: auto;}
        .modal-body table{
            margin: auto; 
            border-collapse: separate; 
            border-spacing: 10px; 
        }
        #custom_insertTable th{
            width: 100px;
            padding-left: 10px;
        }
        #custom_insertTable input, #custom_insertTable select{
            border: 1px solid lightgrey;
        }
        /*재료 삭제 모달*/
        .delete_text{
            text-align: center;
        }
        .delete_text span{
            display: block;
            margin: 10px 0;
        }
        .delete_btn{
            margin: 40px 5px 5px 5px;
            text-align: center;
        }
        .delete_btn button{
            margin: 0 10px;
        }
    </style>
</head>
<body>
    <%@ include file="../common/adminBar.jsp" %>
    
    <div class="outer">
    
        <div class="menu_categoty">
            <h2 style="color:gray;">상품관리</h2>
            <h2>&gt; 상품 수정/삭제</h2>
        </div>

        <div class="custom_admin">
            <!-- 완제품 / 커스텀 버튼 -->
            <div class="product_category">
                <div id="left">
                    <div id="product-button">
                        <a href="<%= contextPath %>/updateDeleteList.apr?cpage=1"><b>완제품</b></a>
                    </div>
                </div>
                <div id="right" align="right">
                    <div id="custom-button">
                        <a href="<%= contextPath %>/aUplist.cu?update=1"><b>커스텀</b></a>
                    </div>
                </div>
            </div>

            <!-- 카테고리 선택 -->
            <div class="custom_category">
                <select name="category" >
                    <option>메뉴 선택</option>
	                <option value="채소">채소</option>
	                <option value="메인토핑">메인토핑</option>
	                <option value="사이드토핑">사이드토핑</option>
	                <option value="드레싱">드레싱</option>  
                </select>
            </div>

            <!-- 카테고리 선택시 목록 조회 -->
            <script>
                $(function(){
                    $("select[name=category]").change(function(){
                        var category = $(this).val();
                        if(category != "메뉴 선택"){
                            $.ajax({
                                url:"aitemCategorylist.cu",
                                data:{
                                    ciCategory:category
                                },
                                success:function(list){
                                    var content = "";

                                    for(var i=0; i<list.length; i++){
                                        content += "<tr>" +
                                                        "<td><input type='checkbox'></td>" +
                                                        "<td class='ajaxCiCode'>" + list[i].ciCode + "</td>" +
                                                        "<td>" + list[i].ciCategory + "</td>" +
                                                        "<td><a class='item_Name'>" + list[i].ciName + "</a></td>" +
                                                        "<td>" + list[i].ciProvider + "</td>" + 
                                                        "<td>" + list[i].ciProvidePrice + "</td>" +
                                                        "<td>" + list[i].ciPrice + "</td>" + 
                                                        "<td>" + list[i].ciStock + "</td>" +
                                                        "<td><a class='item_show'>" + list[i].ciShow + "</a></td>" + 
                                                   "</tr>"
                                    }

                                    $("#custom_table tbody").html(content);
                                    $("#totalCount").text(list.length);
                                    $(".paging_area").text("");
                                },
                                error:function(){
                                    console.log("ajax 통신 실패");
                                }
                            });
                        }else{
                            location.reload();
                        }
                        
                    })
                })
            </script>

            <!-- 총 상품(재료) 개수 / 등록 버튼 -->
            <div class="custom_manage">
                <div class="custom_info">
                    <span>총</span>
                    <span style="color: orange;" id="totalCount"><%= pi.getListCount() %></span>
                    <span>건</span>
                </div>
                <div class="custom_btn" align="right">
                    <!--<button type="button" style="margin-right: 10px;" data-toggle="modal" data-target="#title_img_Modal">대표 이미지 관리</button>-->
                    <button type="button" data-toggle="modal" data-target="#costom_delete_Modal">선택 삭제</button>
                </div>
            </div>

            <table id="custom_table" class="table table-hover">
                <thead>
                    <tr>
                        <th width="3%"></th>
                        
                        <th width="14%">상품번호</th>
                        <th width="14%">카테고리</th>
                        <th width="20%">상품명</th>
                        <th width="15%">업체명</th>
                        <th width="10%">공급가(원)</th>
                        <th width="10%">판매가(원)</th>
                        <th width="6%">재고</th>
                        <th width="8%">노출 여부</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Item i : list) { %>
                    	<tr>
	                        <td>
	                            <input type="checkbox" id="check_list" name="check">
	                        </td>
	                        <td class="ajaxCiCode"><%= i.getCiCode() %></td>
	                        <td><%= i.getCiCategory() %></td>
	                        <td>
                                <a class="item_Name"><%= i.getCiName() %></a>
                            </td>
	                        <td><%= i.getCiProvider() %></td>
	                        <td><%= i.getCiProvidePrice() %></td>
	                        <td><%= i.getCiPrice() %></td>
	                        <td><%= i.getCiStock() %></td>
	                        <td><a class="item_show"><%= i.getCiShow() %></a></td>
	                    </tr>
                    <% } %>
                </tbody>
            </table>
            <!-- 재료 수정용 모달 띄우기 -->
			<script>
				$(function(){
					$(".item_Name").click(function(){
						var ciCode = $(this).parent().siblings(".ajaxCiCode").text();
						
						$.ajax({
							url:"aitemupdate.cu",
							data:{
								"ciCode":ciCode
							},
							success:function(i){
								console.log(i);
                                $("#ci_code").val(i.ciCode);
								$("#ci_category").val(i.ciCategory).prop("selected", true);
								$("#ci_name").val(i.ciName);
                                $("#ci_price").val(i.ciPrice);
                                $("#ci_provider").val(i.ciProvider);
                                $("#ci_providePrice").val(i.ciProvidePrice);
                                $("#ci_stock").val(i.ciStock);
                                $("#ci_show").val(i.ciShow).prop("selected", true);
								$("#custom_update_Modal").modal('show');
							},
							error:function(){
								console.log("ajax 통신 실패");
							}
						});
					})
				})

			</script>

            <!-- 노출 여부 수정 -->
			<script>
                $(function(){
                    $(".item_show").click(function(){
                        var ciCode = $(this).parent().siblings(".ajaxCiCode").text();
                        var ciShow = $(this).text();
                        $("#status_select").val(ciShow).prop("selected", true);
                        $("#show_ciCode").val(ciCode);
                        $("#showModal").modal();
                    })

                    $("#update_show").click(function(){
                        $.ajax({
                            url:"aitemshowupdate.cu",
                            data:{
                                ciCode:$("#show_ciCode").val(),
                                ciShow:$("#status_select").val()
                            },
                            success:function(result){
                                if(result > 0){
                                    console.log(result);
                                    alert("노출상태를 변경했습니다.")
                                    location.reload();
                                }else{
                                    console.log(result);
                                }
                            },
                            error:function(){
                                console.log("ajax 통신 실패");
                            }
                        });
                    })
                })

            </script>

            <!-- 페이징바 -->
            <div class="paging_area">
            	<% if(currentPage != 1){ %>
                	<button onclick="location.href='<%= contextPath %>/aUplist.cu?update=<%= currentPage -1 %>';">&lt;</button>
                <% } %>
                
                <% for(int p = startPage; p<=endPage; p++){ %>
                	<% if(p == currentPage) { %>
	                	<button disabled><%= p %></button>
	                <% }else { %>
	                	<button onclick="location.href='<%= contextPath %>/aUplist.cu?update=<%= p %>';"><%= p %></button>
	                <% } %>
	            <% } %>
	            
	            <% if(currentPage != maxPage){ %>
                	<button onclick="location.href='<%= contextPath %>/aUplist.cu?update=<%= currentPage +1%>'">&gt;</button>
               	<% } %>
            </div>

            <!-- 검색창 -->
            <div class="search" id="product-list">
                <!--<form action="<%= contextPath %>/aitemSearch.cu" id="product-list">-->
                    <tr>
                        <td>
                            <span>상품명</span>
                        </td>
                        <td>
                            <input type="text" name="searchWord" id="searchWord">
                        </td>
                        <td><button id="search_btn">조회</button></td>
                    </tr>
                <!--</form>-->
            </div>

            <!-- 재료 검색 ajax -->
            <script>
                $(function(){
                    $("#search_btn").click(function(){
                        if($("#searchWord").val() == ""){
                            location.reload();
                        }else{
                            $.ajax({
                                url:"aitemSearch.cu",
                                data:{
                                    searchWord:$("#searchWord").val()
                                },
                                success:function(list){
                                    var content = "";
                                    $("#custom_table tbody").html("");
                                    for(var i=0; i<list.length; i++){
                                        content += "<tr>" +
                                                        "<td><input type='checkbox'></td>" +
                                                        "<td class='ajaxCiCode'>" + list[i].ciCode + "</td>" +
                                                        "<td>" + list[i].ciCategory + "</td>" +
                                                        "<td><a class='item_Name'>" + list[i].ciName + "</a></td>" +
                                                        "<td>" + list[i].ciProvider + "</td>" + 
                                                        "<td>" + list[i].ciProvidePrice + "</td>" +
                                                        "<td>" + list[i].ciPrice + "</td>" + 
                                                        "<td>" + list[i].ciStock + "</td>" +
                                                        "<td><a class='item_show'>" + list[i].ciShow + "</a></td>" + 
                                                    "</tr>"
                                    }

                                    $("#custom_table tbody").html(content);
                                    $("#totalCount").text(list.length);
                                    $(".paging_area").text("");
                                },
                                error:function(){
                                    console.log("ajax 통신 실패");
                                }
                            });
                        }
                        
                    });
                });
            </script>


            <!-- 노출 여부 Modal -->
            <div class="modal" id="showModal">
                <div class="modal-dialog modal-sm">
                <div class="modal-content">
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <div class="status">
                            <span>노출 여부</span>
                            <!-- <form action="" class="status_form">  -->
                                <input type="hidden" name="ciCode" id="show_ciCode">
                                <select name="status" id="status_select">
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                                <button id="update_show">수정</button>
                            <!-- </form> -->
                        </div>
                    </div>
                </div>
                </div>
            </div>

            <!-- 재료수정 모달-->
            <div class="modal fade" id="custom_update_Modal">
                <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">커스텀 재료 수정</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="<%= contextPath %>/adminitemupdate.cu" id="item_update" method="post">
                            <input type="hidden" name="ciCode" value="" id="ci_code">
                            <table id="custom_insertTable">
                                <tr>
                                    <td colspan="2">
                                        <select name="ciCategory" id="ci_category">
                                            <option>재료 구분</option>
                                            <option value="채소">채소</option>
                                            <option value="메인토핑">메인토핑</option>
                                            <option value="사이드토핑">사이드토핑</option>
                                            <option value="드레싱">드레싱</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>재료명</span></th>
                                    <td><input type="text" name="ciName" value="" id="ci_name"> </td>
                                </tr>
                                <tr>
                                    <th>판매금액</th>
                                    <td><input type="number" name="ciPrice" value="" id="ci_price" ></td>
                                </tr>
                                <tr>
                                    <th>업체명</th>
                                    <td><input type="text" name="ciProvider" value="" id="ci_provider"></td>
                                </tr>
                                <tr>
                                    <th>공급가</th>
                                    <td><input type="number" name="ciProvidePrice" value="" id="ci_providePrice"></td>
                                </tr>
                                <tr>
                                    <th>입고수량</th>
                                    <td><input type="number" name="ciStock" value="" id="ci_stock"></td>
                                </tr>
                                <tr>
                                    <th>노출여부</th>
                                    <td>
                                        <select name="ciShow" id="ci_show">
                                            <option value="Y">Y</option>
                                            <option value="N">N</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <div id="insert_btn_right">
                                    <button type="submit" class="btn btn-sm btn btn-outline-warning">등록</button>
                                </div>
                            </div>
                       </form>
                    </div>
                </div>
                </div>
            </div>

            <!-- 상품 삭제 관련 모달-->
            <!-- The Modal -->
            <div class="modal" id="costom_delete_Modal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <!-- <form action="" >  -->
                            <div class="delete_text">
                                <span>선택하신 재료를 삭제합니다.</span>
                                <span>정말 삭제하시겠습니까?</span>
                                <span>(삭제 후 복구불가)</span>
                            </div>
                            <div class="delete_btn">
                                <button class="btn btn-sm btn btn-outline-warning" data-toggle="modal" data-target="#adminPassword-Modal" >삭제</button>
                                <button type="reset" class="btn btn-sm btn-outline-secondary" data-dismiss="modal">취소</button>
                            </div>
                        <!-- </form>  -->
                    </div>
                </div>
                </div>
            </div>

            <!-- 관리자 비밀번호 입력 모달 -->
            <div class="modal" id="adminPassword-Modal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <!--<form action="" > -->
                            <div class="delete_text">
                                <span>관리자 비밀번호 입력</span>
                                <input type="password" id="adminPassword" placeholder="비밀번호 입력">
                            </div>
                            <div class="delete_btn">
                                <button class="btn btn-sm btn btn-outline-warning" onclick="pwdcheck();">삭제</button>
                                <button type="reset" class="btn btn-sm btn-outline-secondary" data-dismiss="modal">취소</button>
                            </div>
                        <!--</form>-->
                    </div>
                </div>
                </div>
            </div>

            <script>
                /*삭제안내 모달에서 비밀번호 입력 모달로 넘어갈 때 삭제안내 모달 닫아주기*/
                $("#adminPassword-Modal").on('show.bs.modal', function(e){
                    $("#costom_delete_Modal").modal("hide")
                })
                function pwdcheck(){
                    promise1()
                    .then(promise2)
                    .then(successCheck)
                    .catch(pwdcheckFail);
                }

                function promise1(){
                    return new Promise(function(resolve, reject){
                        $.ajax({
                            url:"aitempwdcheck.cu",
                            data:{
                                adminPwd:$("#adminPassword").val()
                            },
                            success:function(result){
                                if(result == 'Y'){
                                    console.log("일치");
                                    resolve(result);
                                }else{
                                    console.log("불일치");
                                    reject(result);
                                }
                            },
                            error:function(){
                                console.log("ajax 통신 실패");
                            }
                        })
                    })
                }

                function promise2(){
                    var count = $("input[name='check']:checked").length;
                    var checkArr = new Array();
                    $("input[name='check']:checked").each(function(){
                        checkArr.push($(this).parent().siblings(".ajaxCiCode").text())
                    }); 

                    console.log(checkArr);
                    console.log(count);
                    return new Promise(function(resolve, reject){
                        $.ajax({
                            url:"aitemdelete.cu",
                            dataType:"json",
                            traditional:true,
                            data:{
                                count:count,
                                checkArr:checkArr
                            },
                            success:function(result){
                                console.log("프로미스2 성공")
                                resolve(result);
                            },
                            error:function(){
                                console.log("ajax 통신 실패");
                            }
                        })
                    })
                }

                function successCheck(){
                    alert("재료를 삭제했습니다.")
                    location.reload();
                }

                function pwdcheckFail(){
                    alert("비밀번호가 일치하지 않습니다.")
                    $("#adminPassword").val("")
                    $("#adminPassword").focus();
                }

            </script>
        </div>
        
    </div>
</body>
</html>