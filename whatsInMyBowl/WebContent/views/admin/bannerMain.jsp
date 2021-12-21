<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.wimb.admin.model.vo.Banner, com.wimb.common.model.vo.PageInfo" %>
<%
	ArrayList<Banner> list = (ArrayList<Banner>)request.getAttribute("list");

%>
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
        display: inline-block;
    }
    .paddingnone img{padding: 0px;}
    .banner img{
        width: 390px;
        height: 150px;
    }
    .banner table{
        width: 100%;
        margin: 50px 30px 20px 0px;
        border: 1px solid gray;
    }
    .banner_box{
        display: inline-block;
        margin: 20px;
    }

    .checkboxandbtn button{
        border: none;
        background-color: #ffee58;
        border-radius: 4px;
        padding: 2px 13px;
        margin-left: 3px;
    }
    .mainName{
        font-size: 17px;
        font-weight: bold;
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
    .bannerList{
        margin-top: 140px;
        width: 1300px;
    }
    .bannerListbtn{
        border: none;
        border-radius: 5px;
        background-color: #bdbdbd;
        padding: 3px 17px;
        font-size: 15px;
    }
    .cls1{
        font-size: 25px;
        font-weight: bold;
    }

    /*메인1 변경하기 클릭 시 생성되는 모달창 내부 css*/
     .mainBanner_Outer{
        border: 1px solid black;
        width: 970px;
        height: auto;
        padding: 30px;
    }
    .inputMainImg{
        border: 1px solid black;
        width: 300px;
        padding: 0px;
    }
    .mainBanner_box table{
        width: 300px;
        height: 230px;
        display: inline-block;
        text-align: center;
        border: 1px solid black;
        margin: 30px 10px;
    }
    .mainBanner_btn{text-align: right;}
    .mainBanner_btn button{
        border: none;
        padding: 4px 16px;
        border-radius: 5px;
        font-size: 15px;
    }
    .mainBanner_btn button:focus{outline: none;}
    .mainBanner_btn_right{
        margin-left: 10px;
        background-color: #fdd835;
    }
    .mainBanner_btn_left{background-color: #8e8e8e;}
    
    /*메인1 변경하기 클릭 시 생성하는 모달창 css*/
    .mainmodal_wrap{
        display: none;
        width: 1040px;
        height: auto;
        position: absolute;
        top:50%;
        left: 40%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
        padding: 30px
    }
    .mainblack_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .mainmodal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .mainmodal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
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
        
        <div class="bannerList">
            <div class="two_btn" style="text-align: end;">
                <button type=submit class="bannerListbtn" onclick="location.href='<%= contextPath %>/list.banner?cpage=1';">배너 관리</button>
            </div>
        </div>
        
        <div class="banner-area">

            <div class="banner">
				
        	<div class="cls1">현재 등록중인 배너</div><br>
        	<div class="">* 배너 등록은 최대 3개까지 가능합니다.</div>
				<!-- 배너 메인 1 영역 -->
                <% for(Banner b : list) { %>
                    <div class="banner_box" align="center">     
                        <table>
                            <tr>
                                <td colspan="3" class="titleImg paddingnone">
                                    <img src="<%= contextPath %>/<%=b.getMainImg()%>">
                                </td>
                            </tr>
                            <tr>
                                <td class="tableheader">상태</td>
                                <td class="tableheader">배너명</td>
                            </tr>
                            <tr>
                                <td class="FirstStatus"><%= b.getStatus() %></td>
                                <td class="FirstName"><%= b.getbName() %></td>
                            </tr>
                            <tr>
                                <td class="tableheader">게시일</td>
                                <td class="tableheader">배너번호</td>
                            </tr>
                            <tr>
                                <td class="FirstStartdate"><%= b.getStartDate() %></td>
                                <td class="FirstCode"><%= b.getbCode() %></td>
                            </tr>
                        </table>
                        
                    </div>
                <% } %>   
				
            </div>
            
        </div>
        
    </div>
    



    <script>

    </script>
    
    

</body>
</html>