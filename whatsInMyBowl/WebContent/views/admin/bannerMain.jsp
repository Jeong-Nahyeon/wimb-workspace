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
                                <td colspan="2" class="tableheader">게시일</td>
                            </tr>
                            <tr>
                                <td class="FirstStatus"><%= b.getStatus() %></td>
                                <td colspan="2" class="FirstStartdate"><%= b.getStartDate() %></td>
                            </tr>
                            <tr>
                                <td class="tableheader">배너명</td>
                                <td class="tableheader">배너번호</td>
                                <td class="tableheader">위치</td>
                            </tr>
                            <tr>
                                <td class="FirstName"><%= b.getbName() %></td>
                                <td class="FirstCode"><%= b.getbCode() %></td>
                                <td class="FirstPosition"><%= b.getbPostion() %></td>
                            </tr>
                        </table>
                        <div class="checkboxandbtn">
                            <button type="button" id="updatebtn1">변경하기</button>
                        </div>
                        
                        
                    </div>
                <% } %>   
				
            </div>
            
        </div>
        
    </div>
    

    <!-- 메인 베너에서 메인1 변경하기 클릭 시 나타나는 등록된 베너 리스트 모달창 -->
        <div class="mainblack_bg"></div>
        <div class="mainmodal_wrap">

            <div class="mainmodal_close"><a href="#">close</a></div>
            <div class="mainBanner_box">
                <div class="mainBanner_btn">
                    <button type="button" class="mainBanner_btn_left">취소</button>
                    <button type="button" class="mainBanner_btn_right" onclick="selectMain();">등록</button>
                </div>
                <div class="innerAjax">
                
                <!-- ajax로 메인1에 등록하고자 하는 리스트 목록 띄워주는 위치 -->
                
                </div>
		    
            </div>



    <script>
    	
    	// 변경하기 버튼 시 띄워지는 메인등록1에 사용될 등록될 메인 리스트를 띄워줄 모달창
    	var main1 = document.getElementById('updatebtn1');
    	if(main1.addEventListener){
    		function onClick() {
                document.querySelector('.mainmodal_wrap').style.display ='block';
                document.querySelector('.mainblack_bg').style.display ='block';
            }   
            function offClick() {
                document.querySelector('.mainmodal_wrap').style.display ='none';
                document.querySelector('.mainblack_bg').style.display ='none';
            }
         
            document.getElementById('updatebtn1').addEventListener('click', onClick);
            document.querySelector('.mainmodal_close').addEventListener('click', offClick); 	
            document.querySelector('.mainBanner_btn_left').addEventListener('click', offClick); 
    	}  	
    	
		
    	// AJAX구문의 success:function()의 값을 담을 전역변수 생성
    	var ajaxlist = [];
    	
    	//'변경하기'버튼 클릭 시 메인등록1에 띄워줄   AJAX 구문
		$('#updatebtn1').click(function(){
			madeajaxlist();
		});
		
    	// 페이지 로딩 후 실행되는 ajax구문
		$(document).ready(function selectFirstMainList(){
			$.ajax({
				url:"firstMainlist.banner",
				data:{},
				asynf:false,
				success:function(Firstlist){
					
				ajaxlist = Firstlist;
				
				
				
				},error:function(){
					console.log("메인1 리스트 조회용 ajax 통신 실패");
				}
				
			});
		});
		
		// AJAX구문의 success:function()의 값을 담은 전역변수 ajaxlist를 가지고 리스트를 만드는 함수
		function madeajaxlist(){
			
			let result = ""
			if(ajaxlist.length == 0) return;
				
				for(let i=0; i<ajaxlist.length; i++){
					result += "<table>"
								+ "<tr>" 
			            			+	"<td colspan='2'><img src='" + ajaxlist[i].bOriginName + "' class='inputMainImg' height='180' width='250px'></td>" 
								+ "</tr>"
								+ "<tr>"
									+	"<td style='width:5px;'><input type='radio' name='selectMainImg' value='"+ ajaxlist[i].bCode +"' style='margin: 0px 10px;'></td>"
									+	"<td style='text-align:center;'>" + ajaxlist[i].bName + "</td>"
								+ "</tr>" +
						  	"</table>";
						  	
				$(".innerAjax").html(result);
			
			
				
				
			}
		}
			
		madeajaxlist(ajaxlist);
		
		// 메인1에 등록하고자 하는 메인의 라디오버튼 선택 후 '등록'버튼 클릭 시 실행할 함수
		function selectMain(){
			var selectMainNum = $('input[name=selectMainImg]:checked').val();
			
			$.ajax({
				url:"selectFirstMain.banner",
				data:{selectMainNum:selectMainNum},
				success:function(FirstMain){
          	
					let FirstMainImg = FirstMain.mainImg;
					let FirstStatus = FirstMain.status;
					let FirstStartdate = FirstMain.startDate;
					let FirstName = FirstMain.bName;
					let FirstCode = FirstMain.bCode;
					let FirstPosition = FirstMain.bPostion;
					
					
					$(".titleImg img").attr("src", FirstMainImg);  // 메인이미지
					$(".FirstStatus").html(FirstStatus);           // 게시여부
					$(".FirstStartdate").html(FirstStartdate);     // 게시일
					$(".FirstName").html(FirstName);               // 배너명
					$(".FirstCode").html(FirstCode);               // 배너번호
					$(".FirstPosition").html(FirstPosition);       // 위치
					
					
				}, error:function(){
					console.log("통신 실패");
				}
				
			})
		}
    </script>
    
    

</body>
</html>