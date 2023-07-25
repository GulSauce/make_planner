<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/login_common.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/login/findPw.css">
    <title>스테이지어스</title>
</head>
<body>
    <div class="contain">
        <img class="logo" src="/planner/source/logo.png">
        <span class="title">비밀번호 찾기</span>
        <hr class="hr">
        <input id="name" class="stdIn" type="text" maxlength="10" placeholder="이름">
        <input id="email" class="stdIn" type="text" maxlength="30" placeholder="이메일">
        <input id="phoneNumber" class="stdIn" type="text" maxlength="13" placeholder="전화번호" oninput="ValidPhoneNumberEvent(this)">
        <input class="stdIn loginBtn" type="button" value="입력완료" onclick="GoChangePwEvent()">
    </div>
     <script src="/planner/js/login/findPw.js"></script>
</body>
</html>