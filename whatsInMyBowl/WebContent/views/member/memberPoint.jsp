<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.wimb.member.model.vo.Point, java.util.ArrayList, 
				com.wimb.common.model.vo.PageInfo"
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/10f565a9d5.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .main{
        width:600px;
        height: 800px;
        margin:auto;
    }
    #title-area{border-bottom: 1px solid black; text-align: left;}
    #currentPoint-area>div{
        display: inline-block;
        width: 200px;
        margin-top: 30px;
        margin-left: 30px;
        margin-right: 30px;
    }
    #currentPoint-area{
        border: 1px solid black;
        width: 100%;
        height: 100px;
        margin-top: 50px;
    }
    #lookupPeriod{border: 1px solid black; margin-bottom:50px;}
    #lookupPeriod ul{padding:0; margin-top:20px;}
    #lookupPeriod li{
        list-style-type: none;
        display:inline;
        font-size: 12px;
        margin:5px;
    }
    #lookupPeriod button{
        width:45px;
        font-size: 11px;
        background-color:rgb(155, 213, 189);
        color: white;   
        border:none; 
    }
    #lookupPeriod button:hover{opacity:0.5;}
    #lookupPeriod input{
        width: 115px;
        font-size: 12px;
    }
    #pointListTable{width:100%; font-size: 12px;}
    #pointListTable td{width: 100px;}
    #LitsTbody {
    	overflow-y: scroll;
    	height: 300px;
    }
    #listTbody td{
    	width:100px;
    	
    }
</style>
</head>
<body style="height:100%">

	<%@ include file="../common/myPage.jsp" %>
    <% 
		String userId = loginUser.getmId();
        Point ttp = (Point)request.getAttribute("ttp");
        
        int userPoint = ttp.getTtlPoint();
	%>
	

    <div class="main">
            <div id="title-area" >
                <p>
                    <h4>적립금조회</h4>
                </p>
            </div>
            <div id="currentPoint-area">
                <div>
                    현재 적립금
                </div>
                <div style="color:rgb(155, 213, 189); font-weight: 900; font-size: 24px;">
                    <%= userPoint %>원
                </div>
            </div>
            <br clear="both">
            <form action="" id="periodForm" onsubmit="return false">
	            <div id="lookupPeriod" width="600">
	                <ul>
	                    <li>
	                        조회기간
	                    </li>
	                    <li>
	                        <button id="day7" name="period" onclick="dateSub(7);">7일</button>
	                        <button id="month1" name="period" onclick="dateSub(30);">1개월</button>
	                        <button id="month3" name="period" onclick="dateSub(90);">3개월</button>
	                        <button id="year1" name="period" onclick="dateSub(365);">1년</button>
	                    </li>
	                    <li>
	                        <input type="date" id="startDate" name="startDate">
                            <span>&nbsp;&nbsp;~</span>
	                    </li>
	                    <li>
	                        <input type="date" id="endDate" name="endDate">
	                    </li>
	                    <li>
	                    	<input type="hidden" id="userId" name="userId" value="<%= userId%>">
	                        <button id="searchBtn" onclick="pointChk();">조회</button>
	                    </li>
	                </ul>
	            </div>
	        </form>
            <div id="pointListTable">
               
                <table id="pointListTable">
                    <thead>
                        <tr style="background-color:rgba(231, 231, 231, 0.438);" height="30" align="center">
                            <th width="120">날짜</td>
                            <th width="200" colspan="2">내용</th>
                            <th width="120">포인트내역</th>
                        </tr>
                    </thead>
                    
                    <tbody id="nonListTbody">
                		<tr align="center">
                       		<td colspan="5" width="600" height="250" style="border-bottom: 1px solid lightgrey;">
                       			조회된 포인트 내역이 없습니다.
                       		</td>
                  		</tr>
                    </tbody>
                    
                    
	                <tbody id="listTbody">
	                        	
	                </tbody>
	               
                   
                </table>
            </div>
    </div>
   

    <script>
       
		// 포인트 조회용 ajax  
        
	    function pointChk(){
			
	    	const $userId = $("#periodForm input[name=userId]");
			let $startDate = $("#lookupPeriod input[name=startDate]");
            let $endDate = $("#lookupPeriod input[name=endDate]");
          

           	var list = [];
           	
			$.ajax({
				url:"pointCheck.me",
				data:{
                    userId:$userId.val(),
                    startDate:$startDate.val(),
                    endDate:$endDate.val() 
                },
				type:"post",
				success:function(list){
                    var content = "";

                   
                        for(var i = 0; i<list.length; i++){
                           
                            	
                           		content += "<tr align='center'>" +
		                                    "<td>" + list[i].modifyDate + "</td>" + 
		                                    "<td colspan='2'>" + list[i].pointName + "</td>" +
		                                    "<td>" + list[i].point + "</td>" + 
		                                "</tr>";
		                
		
				                $("#nonListTbody").attr("style", "display:none");
				                $("#listTbody").html(content);

                    	}
	
				},error:function(){
					console.log("ajax 통신 실패");
				}
	
			})
		}
        
        // 조회기간 버튼  
    	// 조회기간 1 구하기
    	
    	// 1. 버튼으로 기간 클릭시
    	function dateSub(day) {
    		
    		// 오늘날짜 
    		var today = new Date();
    		
    		// 선택한날짜 == startDay
    		var sday = today - day*24*60*60*1000; // n일 전
    		var startDay = new Date(sday);
    		
		    var stYear = startDay.getFullYear();
			var stMonth = ('0' + (startDay.getMonth() + 1)).slice(-2);
			var stDay = ('0' + startDay.getDate()).slice(-2);
			
			var startDateString = stYear + '-' + stMonth  + '-' + stDay;
    		$("#startDate").val(startDateString);
    		// console.log($("#startDate").val());
    	}
    	
    	// 3. inputDate 시작날짜 미입력시! == 기본 7일
    	$('#startDate').ready(function(){
    		var today = new Date();
			var sevenDay = new Date(today - 7*24*60*60*1000);
			
			var svYear = sevenDay.getFullYear();
			var svMonth = ('0' + (sevenDay.getMonth() + 1)).slice(-2);
			var svDay = ('0' + sevenDay.getDate()).slice(-2);
			
			var startDateString = svYear + '-' + svMonth  + '-' + svDay;
			
			if(startDay != null) {
				var startDay = '<%= request.getAttribute("startDay")%>'
			}else {
    			$("#startDate").val(startDateString);
			}
    		// console.log($("#startDate").val());
		
		})
		
		
		// 3. inputDate 끝날짜 미입력시! == 오늘날짜
		$('#endDate').ready(function(){
		
			var today = new Date();
		
			var edYear = today.getFullYear();
			var edMonth = ('0' + (today.getMonth() + 1)).slice(-2);
			var edDay = ('0' + today.getDate()).slice(-2);
			
			var endDateString = edYear + '-' + edMonth + '-' + edDay;
			
			$("#endDate").val(endDateString);
    		console.log($("#endDate").val());
		
		})
		
		
    		
    
    </script>
    <footer>
    <%@ include file="../common/footer.jsp" %>
	</footer>
</body>
</html>