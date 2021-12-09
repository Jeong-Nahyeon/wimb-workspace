<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box;}
    .wrap{
        border: 2px solid red;
        width: 100%; 
        height: 2000px;
        margin: auto;
    }
    #header, #footer{
        border: 1px solid lightcoral;
        width: 100%;
        height: 170px;
    }
    .content{height: 1660px;}
    .content>div{
        height: 100%;
        float: left;
    }
    #content_left, #content_right{
        border: 1px solid green;
        width: 441.5px;
    }
    #content_main  {
        border: 1px solid skyblue;
        width: 1000px;
        height: 100%;
    }
    #main_custom>div{
        height: 1555px;
        float: left;
    }
    #main_blank{
        border: 1px solid pink;
        width: 1000px;
        height: 105px;
    }
    #main_custom{
        
    }
    #main_line{
        border: 1px solid #333 ;
        width: 0.1px;
        height: 100%;
        margin: 0 4.5px 0 4.5px;
    }
    #custom_left, #custom_right{
        border: 1px solid purple;
        width: 450px;
        height: 100%;
        margin: 0 20px 0 20px;

    }
</style>
</head>
<body>

    <div class="wrap">

        <div id="header"></div>

        <div class="content">
            <div id="content_left"></div>

            <div id="content_main">
                <div id="main_blank"></div>
                <div id="main_custom">
                    <!-- 왼쪽 데이터 영역-->
                    <div id="custom_left"></div>
                    

                    <!-- 가운데 세로선-->
                    <div id="main_line"></div>

                    <!-- 오른쪽 데이터 영역-->
                    <div id="custom_right"></div>
                </div>
            </div>

            <div id="content_right"></div>
        </div>
        

        <div id="footer"></div>
    </div>

</body>
</html>