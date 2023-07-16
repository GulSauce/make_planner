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
        <div>
            <span class="selectTitle">생일</span>
            <div id="birthSelect"></div>   
        </div>
        <div>
            <span class="selectTitle">성별</span>
            <div id="genderSelect">
                <div class="radioSelect">
                    남자 <input type="radio" name="gender">
                </div>
                <div class="radioSelect">
                    여자 <input type="radio" name="gender">
                </div>
                <div class="radioSelect">
                    비공개 <input type="radio" name="gender">
                </div>
            </div>
        </div>
        <input class="checkRegisterBtn" type="button" value="가입하기">
    </div>
    <script src="../js/register.js"></script>
</body>
</html>