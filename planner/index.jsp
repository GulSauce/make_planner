<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/login/index.css">
    <title>스테이지어스</title>
</head>
<body>
    <div class="contain">
        <img class="logo" src="/planner/source/logo.png">
        <input id="email" class="stdIn" type="text" maxlength="30" placeholder="이메일">
        <input id="pw" class="stdIn" type="password" maxlength="30" placeholder="비밀번호">
        <input class="stdIn loginBtn" type="button" value="로그인" onclick="GoMainEvent()">
        <div class="autoLoginContain">
            <div class="autoLogin" onclick="ChangeAutoEvent()">
                <img id="autoImg" src="/planner/source/auto_not_click.png" class="auto">&nbsp;자동로그인
            </div>
        </div>
        <div class="find">
            <span class ="moveText" onmouserover="Draw" onclick="GoRegisterEvent()">회원가입</span>
            <span>ㅣ</span>
            <span class ="moveText" onclick="GoFindEmailEvent()">이메일 찾기</span>
            <span>ㅣ</span>
            <span class ="moveText" onclick="GoFindPwEvent()">비밀번호 찾기</span>
        </div>
    </div>

    <script src="/planner/js/login/index.js"></script>
</body>
</html>