<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/nav.css">
    <link rel="stylesheet" type="text/css" href="../../css/baseball/baseball_main.css">
    <title>숫자야구</title>
</head>
<body onload="init()">
    <audio autoplay onloadstart="this.volume=0.01" loop>
        <source src="../../source/baseball/ground_bgm.mp3">
    </audio>
    <!-- bg와 다른 버튼들 동기화 위한 UI클래스 -->
    <%@ include file="../../nav.jsp"%>

    <main class="UI">
        <video id="bg" controls muted poster="" preload="auto">
            <source src="../../source/baseball/throwing.mp4" type="video/mp4">
        </video>
        <input id ="throw" type="button" value="던져!" onclick="playEvent()">
        <div class="selectArea">
            <span id="first" class="select" onclick="EraseEvent()"></span>
            <span id="second" class="select" onclick="EraseEvent()"></span>
            <span id="third" class="select" onclick="EraseEvent()"></span>
        </div>
        <div class="chooseArea">
            <button id="0" class="chooseBall" onclick="ChooseEvent(0)">0</button>
            <button id="1" class="chooseBall" onclick="ChooseEvent(1)">1</button>
            <button id="2" class="chooseBall" onclick="ChooseEvent(2)">2</button>
            <button id="3" class="chooseBall" onclick="ChooseEvent(3)">3</button>
            <button id="4" class="chooseBall" onclick="ChooseEvent(4)">4</button>
            <button id="5" class="chooseBall" onclick="ChooseEvent(5)">5</button>
            <button id="6" class="chooseBall" onclick="ChooseEvent(6)">6</button>
            <button id="7" class="chooseBall" onclick="ChooseEvent(7)">7</button>
            <button id="8" class="chooseBall" onclick="ChooseEvent(8)">8</button>
            <button id="9" class="chooseBall" onclick="ChooseEvent(9)">9</button>
        </div>
    </main>

    <header>
        <div class = "left">
            <span class="leftCntText">남은<br>횟수 </span>
            <span id = "leftCnt"></span>
        </div>

        <div class = "mid">
            <span id = "strike" class="resultBox">S</span>
            <span id = "ball" class="resultBox">B</span>
            <span id = "out" class="resultBox">O</span>
        </div>
        
        <div id = "right"  onclick="MenuCallEvent()">
            <svg class="menuLogo" viewbox="0 0 24 24">
                <path d="M21 6H3V5h18v1zm0 5H3v1h18v-1zm0 6H3v1h18v-1z"></path>
            </svg>
        </div>   
    </header>
    
    <div id="baseball_menu">
        <span class="menuTitle">메뉴</span>
        <button id="X" onclick="MenuCloseEvent()">X</button>
        <button id="goStart" onclick="GoStartEvent()">시작화면으로</button>
        <button id="retry" onclick="RetryEvent()">다시하기</button>
    </div>

    <div id="ending">
        <span id ="title"></span>
        <button id="goStart" onclick="GoStartEvent()">시작화면으로</button>
    </div>

    <nav id= "log"> </nav>

    <audio id="strikeSound" onloadstart="this.volume=0.2">
        <source src="../../source/baseball/strike.mp3">
    </audio>
    <audio id="ballSound" onloadstart="this.volume=0.5">
        <source src="../../source/baseball/ball.mp3">
    </audio>
    <audio id="outSound" onloadstart="this.volume=0.5">
        <source src="../../source/baseball/out.mp3">
    </audio>
    <audio id="clearSound" onloadstart="this.volume=0.1">
        <source src="../../source/baseball/clear.m4a">
    </audio>

    <script src="../../js/nav.js"></script>
    <script src="../../js/baseball/baseball_main.js"></script>
</body>
</html>