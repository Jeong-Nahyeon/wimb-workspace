<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.wimb.admin.model.vo.Terms"%>
<%
	Terms t = (Terms)request.getAttribute("t");
	// 글번호, 내용이 담김

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 수정</title>
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
    #termsTable-Title{padding: 10px 0px;}

    #termsTable th{
        width: 150px;
        vertical-align: top;
    }

    input{
        width: 881px;
        padding: 11px 12px 10px;
        margin-bottom: 20px;
    }

    textarea{
        padding: 11px 12px 10px;
        color: gray;
    }
   
    .addTerms{
        border: none;
        border-radius: 3px;
    }

    #addTermsbtns{
        padding-top: 30px;
        padding-left: 38%;
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
            <h2 id="mainTitle1">홈페이지관리 > 이용약관</h2>
            <h2>> 이용약관 수정</h2>
        </div>

        <div id="content">
            <form action="<%= contextPath %>/update.terms" id="update-form" method="post">
            	<input type="hidden" name="num" value="<%= t.getTermsCode() %>">
                <table id="termsTable">
                    <tr id="contentOuter">
                        <th id="termsTable-Content">내용</th>
                        <td>
                            <textarea name="termsContent" id="terms_textarea " cols="114" rows="20" style="resize: none;" required onkeyup="terms_checkByte(this)"><%= t.getTermsContent() %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:end"><span id="nowByte">0</span>/1300bytes</td>
                    </tr>
                </table>

                <div id="addTermsbtns">
                    <button type="button" class="addTerms" style="margin-right: 20px; background-color: lightgray;">취소하기</button>
                    <button type="submit" class="addTerms" style="background-color: #ffee58;">수정하기</button>
                </div>



            </form>
        </div>

    </main>
    <script>
    	// textarea 바이트 수 체크하는 함수
    	function terms_checkByte(obj){
    		const maxByte = 1300;                // 최대 1300바이트
    		const text_val = obj.value;          // 입력한 문자
    		const text_len = text_val.length;    // 입력한 문자 수
    		
    		let totalByte=0;
    		for(let i=0; i<text_len; i++){
    			const each_char = text_val.charAt(i);
    	        const uni_char = escape(each_char)   //유니코드 형식으로 변환
    	        if(uni_char.length>4){
    	        	// 한글 : 2Byte
    	            totalByte += 2;
    	        }else{
    	        	// 영문,숫자,특수문자 : 1Byte
    	            totalByte += 1;
    	        }
    		}
    		
    		if(totalByte>maxByte){
    	    	alert('최대 1300Byte까지만 입력가능합니다.');
    	        	document.getElementById("nowByte").innerText = totalByte;
    	            document.getElementById("nowByte").style.color = "red";
    	        }else{
    	        	document.getElementById("nowByte").innerText = totalByte;
    	            document.getElementById("nowByte").style.color = "green";
    	        }
    	}
    	
    
    </script>
	

</body>
</html>