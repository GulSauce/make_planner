<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/loginCommon.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/login/findEmail.css">
    <title>스테이지어스</title>
</head>
<body>
    <form id= "findForm" class="contain">
        <img class="logo" src="/planner/source/logo.png">
        <span class="title">이메일 찾기</span>
        <hr class="hr">
        <input id="name" name="name" class="stdIn" type="text" maxlength="10" placeholder="이름">
        <input id="phoneNumber" name="phoneNumber" class="stdIn" type="text" maxlength="13" placeholder="전화번호" oninput="ValidPhoneNumberEvent(this)">
        <input class="stdIn loginBtn" type="button" value="입력완료" onclick="FindEmailEvent()">
    </form>
    <script src="/planner/js/login/findEmail.js"></script>
</body>
</html>