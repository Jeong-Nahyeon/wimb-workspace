<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form action="test.do" method="post">
                <table id="termsTable">
                    <tr>
                        <th id="termsTable-Title">제목</th>
                        <td><input type="text" placeholder="제목을 입력해주세요."  style="margin-bottom: 20px;" required></td>
                    </tr>

                    <tr id="contentOuter">
                        <th id="termsTable-Content">내용</th>
                        <td>
                            <textarea name="" id="" cols="114" rows="20" style="resize: none;" required>내용을 입력해주세요.</textarea>
                        </td>
                    </tr>
                </table>

                <div id="addTermsbtns">
                    <button type="button" class="addTerms" style="margin-right: 20px; background-color: lightgray;">취소하기</button>
                    <button type="submit" class="addTerms" style="background-color: #ffee58;">수정하기</button>
                </div>



            </form>
        </div>

    </main>
	

</body>
</html>