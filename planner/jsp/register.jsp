<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/register.css">
    <title>Document</title>
</head>
<body>
    <div class="contain">
        <span class="title">가입하기</span>
        <hr class="hr">
        <div class="inAndBtn">
            <input class="stdIn" type="text" placeholder="이름">
        </div>
        <div class="inAndBtn">
            <input class="stdIn" type="text" placeholder="이메일">
            <input class="stdBtn" type="button" value="중복체크">
        </div>
        <div class="inAndBtn">
            <input class="stdIn" type="text" placeholder="전화번호">
            <input class="stdBtn" type="button" value="중복체크">
        </div>
        <div class="inAndBtn">
            <input class="stdIn" type="text" placeholder="비밀번호">
        </div>
        <div class="inAndBtn">
            <input class="stdIn" type="text" placeholder="비밀번호 확인">
        </div>
        <div class="inAndBtn">
            생일
            
        </div>
        <div class="inAndBtn">
            성별
        </div>
        <input class="checkRegisterBtn" type="button" value="가입하기">
    </div>
</body>
</html>