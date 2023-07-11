<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/nav.css">
    <link rel="stylesheet" type="text/css" href="../../css/baseball/baseball_start.css">
    <title>숫자야구</title>
</head>
<body>
    <audio id="bgm" autoplay onloadstart="this.volume=0.3" loop>
        <source src="../../source/baseball/start_bgm.mp3">
    </audio>

    <%@ include file="../../nav.jsp"%>
   
    <div class="MainMenu">
        <header>
            <h1>
                숫자야구
            </h1>
        </header>
        <div id="level">
            <h1>난이도 선택</h1>
            <input class="btn" type="button" value="어려움"  onclick="StartEvent(1)" onmouseover="ExpEvent(1)" onmouseout="ClearEvent()">
            <input class="btn" type="button" value="보통"  onclick="StartEvent(2)" onmouseover="ExpEvent(2)" onmouseout="ClearEvent()">
            <input class="btn" type="button" value="쉬움" onclick="StartEvent(3)" onmouseover="ExpEvent(3)" onmouseout="ClearEvent()">
            <audio class="btn" id="start" onloadstart="this.volume=0.3">
                <source src="../../source/baseball/start.mp3">
            </audio>
        </div>
        <div id="exp">난이도를 선택하세요.</div>
    </div> 
    <script src="../../js/nav.js"></script>
    <script src="../../js/baseball/baseball_start.js"></script>
</body>
</html>