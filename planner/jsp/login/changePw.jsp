<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/login_common.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/login/changePw.css">
    <title>스테이지어스</title>
</head>
<body>
    <div class="contain">
        <img class="logo" src="/planner/source/logo.png">
        <span class="title">비밀번호 변경</span>
        <hr class="hr">
        <input id="pw" class="stdIn" type="password" maxlength="30" placeholder="비밀번호" oninput="ValidPwEvent()">
        <input id="pwAgain" class="stdIn" type="password" maxlength="30"placeholder="비밀번호 확인" oninput="ValidPwEvent()">
        <div id="pwCheckRes">비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다.</div>
        <input class="stdIn loginBtn" type="button" value="입력완료" onclick="GoLoginEvent()">
    </div>
    <script src="/planner/js/login/changePw.js"></script>
</body>
</html>