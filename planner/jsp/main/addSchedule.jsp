<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/main/addSchedule.css">
    <title>일정 추가</title>
</head>
<body>
    <div class="dateContain">
        <span>날짜</span>
        <input class="date" type="date">
    </div>
    <div class="timeContain">
        <span>시작시간</span>
        <div>
        <input class="time" type="time"><span>부터</span>
        </div>
    </div>
    <div class="textContain">
        <span>내용</span>
        <textarea maxlength="200" class="textarea"></textarea>
    </div>
    <div class="selectContain">
        <input class="okBtn" type="button" value="확인">
        <input class="cancelBtn" type="button" value="취소">
    </div>
</body>
</html>