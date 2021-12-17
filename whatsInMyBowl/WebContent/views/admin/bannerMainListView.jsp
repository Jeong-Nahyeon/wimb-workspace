<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .mainBanner_Outer{
        border: 1px solid black;
        width: 970px;
        height: auto;
        padding: 30px;
    }
    .inputMainImg{
        border: 1px solid black;
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
        background-color: #ffee58;
    }

</style>

</head>
<body>

    <!-- 메인 베너에서 변경하기 클릭 시 나타나는 등록된 베너 리스트들 -->
    <div class="mainBanner_Outer">
        
        <div class="mainblack_bg"></div>
        <div class="mainmodal_wrap">

            <div class="mainmodal_close"><a href="#">close</a></div>
            <div class="mainBanner_box">
                <div class="mainBanner_btn">
                    <button type="button" class="mainBanner_btn_left">취소</button>
                    <button type="button" class="mainBanner_btn_right">등록</button>
                </div>
                <form action="">
    
                    <table>
                        <tr>
                            <td colspan="4">
                                <img class="inputMainImg" height="180" width="290px">
                            </td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="selectMainImg" style="margin: 0px 10px;"></td>
                            <td>배너명</td>
                            <td style="width: 3px;">-</td>
                            <td>원본파일명</td>
                        </tr>
                    </table>
                </form>
            </div>



        </div>






    </div>

</body>
</html>