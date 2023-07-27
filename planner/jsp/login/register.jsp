<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/loginCommon.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/login/register.css">
    <title>스테이지어스</title>
</head>
<body>
    <form class="contain" id="regForm">
        <span class="title">가입하기</span>
        <hr class="hr">
        <div class="inAndBtn">
            <input id="name" name="name" class="stdIn" type="text" maxlength="10" placeholder="이름" oninput="ValidNickNameEvent(this)">
        </div>
        <div class="inAndBtn">
            <input id="email" name="email" class="stdIn" type="text" maxlength="30" placeholder="이메일">
            <input class="stdBtn" type="button" value="중복체크" onclick="CheckEmailEvent()">
        </div>
        <div class="inAndBtn">
            <input id="phoneNumber" name="phoneNumber" class="stdIn" type="text" placeholder="전화번호" maxlength="13" oninput="ValidPhoneNumberEvent(this)">
            <input class="stdBtn" type="button" value="중복체크" onclick="CheckPhoneEvent()">
        </div>
        <div class="inAndBtn">
            <input id="pw" name="pw" class="stdIn" type="password" maxlength="30" placeholder="비밀번호" oninput="ValidPwEvent()">
        </div>
        <div class="inAndBtn">
            <input id="pwAgain" class="stdIn" type="password" maxlength="30" placeholder="비밀번호 확인" oninput="ValidPwEvent()">
        </div>
        <div id="pwCheckRes">비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다.</div>
        <div>
            <span class="selectTitle">생일</span>
            <div id="birthSelect" class="boxContain"></div>   
        </div>
        
        <div>
            <span class="selectTitle">직급</span>
            <div class="boxContain">
                <div class="radio" onclick="RadioSelectEvent(0)">
                    사원 <input name="class" type="radio" value="사원">
                </div>
                <div class="radio" onclick="RadioSelectEvent(1)">
                    팀장 <input name="class" type="radio" value="팀장">
                </div>
            </div>   
        </div>
        
        <input class="checkRegisterBtn" type="button" value="가입하기" onclick="GoRegEvent()">
    </form>
    <script src="/planner/js/login/register.js"></script>
</body>
</html>