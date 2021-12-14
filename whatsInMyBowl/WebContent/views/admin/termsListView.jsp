<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 리스트</title>
<style>

    main{
        margin-top: 100px;
        margin-left: 25%;
    }
    #mainTitle>h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }

    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    table{border-collapse: collapse;}

    .title-btn>td{
        border-bottom: 1px solid black;
        padding-bottom: 10px;
    }

    .termsTitle{
        font-weight: 600;
        width: 1000px;
    }

    .termsContent{
        width: 1000px;
        padding-bottom: 80px;
    }

    #addTerms{margin-left: 35%;}

    .btnColor{
        background-color: #ffee58;
        border: none;
        border-radius: 3px;
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
    <%@ include file="../common/adminBar.jsp"%>

    <main>

        <div id="mainTitle">
            <h2 id="mainTitle1">홈페이지관리 </h2>
            <h2>> 이용약관</h2>
        </div>

        <div id="content">
            <form action="test.do" method="post">
                <table>
                    	<!-- case1. 이용약관이 없을 경우 -->
                    	<!-- 
                    	
                    	<tr>
                    		<td colspan="2">존재하는 이용약관이 없습니다.</td>
                    	</tr>
                    	
                    	 -->
                    	
                    	
                		<!-- case2. 이용약관이 있을 경우 -->
                        <tr class="title-btn">
                            <td class="termsTitle">제 1조(목적)</td>
                            <td><button type="submit" class="termsUpdateBtn btnColor">수정</button></td> <!-- 기존에 있던 이용약관 수정하는 버튼-->
                        </tr>
                        <tr>
                            <td colspan="2" class="termsContent">
                                이 약관은 (주)What's in my Bowl(전자상거래 사업자)가 운영하는 What's in my Bowl 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다. <br>
                                ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
                            </td>
                        </tr>
    
                        <tr class="title-btn">
                            <td class="termsTitle">제 2조(정의)</td>
                            <td><button type="submit" class="termsUpdateBtn btnColor">수정</button></td> <!-- 기존에 있던 이용약관 수정하는 버튼-->
                        </tr>
                        <tr>
                            <td colspan="2" class="termsContent">
                                ① “몰”이란 (주)샐러드판다가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
                                ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
                                ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
                                ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br>
                            </td>
                        </tr>
                    	
                </table>
    
                <div>
                    <button id="addTerms" class="btnColor" type="submit">등록하기</button>
                </div>
            </form>
        </div>

    </main>


</body>
</html>