<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <title>로그인</title>
</head>
<body>
    <div class="contain">
        <img class="logo" src="../source/logo.png">
        <input class="stdIn" type="text" placeholder="이메일">
        <input class="stdIn" type="password" placeholder="비밀번호">
        <input class="stdIn loginBtn" type="button" value="로그인">
        <script src="./js/index.js"></script>
        <span class="autoLogin">자동로그인</span>
        <div class="find">
            <span>회원가입 ㅣ</span>
            <span>이메일 찾기 ㅣ</span>
            <span>비밀번호 찾기</span>
        </div>
    </div>
</body>
</html>