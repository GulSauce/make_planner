<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/main/main.css">
    <title>스테이지어스</title>
</head>
<body>
    <div id="sideMenu">

    </div>
    <nav>
        <img class="logo" src="/planner/source/logo.png">
        <div class="dateContain">
            <span class="today">TODAY</span>
            <span class="yearChange">&lt;</span>
            <span class="yearChange"> &gt;</span>
            <div id="dateSelect"></div>
        </div>
        <svg id="menu" viewBox="0 0 30 30" onclick="ShowMenuEvent()">
            <path d="M 3 7 A 1.0001 1.0001 0 1 0 3 9 L 27 9 A 1.0001 1.0001 0 1 0 27 7 L 3 7 z M 3 14 A 1.0001 1.0001 0 1 0 3 16 L 27 16 A 1.0001 1.0001 0 1 0 27 14 L 3 14 z M 3 21 A 1.0001 1.0001 0 1 0 3 23 L 27 23 A 1.0001 1.0001 0 1 0 27 21 L 3 21 z"/>
        </svg>
    </nav>
    <hr>
    <div class="addAndName">
        <input class="addSchedule" type="button" value="일정추가">
        <span class="userName">오영제의 일정</span>
    </div>
    <article id="myScheduleContain">
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
        </div>
    </article>
    <script src="/planner/js/main/main.js"></script>
</body>
</html>