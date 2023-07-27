<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.Date" %>

<!-- 데이터베이스 탐색및 설정해주는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>

<!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.Connection" %>

<!-- 데이터베이스로 sql전송해주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>

<!-- 데이터베이스에서받아온 값을 저장하는 라이브러리 -->
<%@ page import="java.sql.ResultSet" %>

<!-- 리스트 라이브러리 -->
<%@ page import="java.util.ArrayList" %>

<!-- jsp의 영역 -->
<%
    String isSafe = (String)request.getAttribute("email");
    request.removeAttribute("email");
%>

<script>
    CheckVaild()
    function CheckVaild(){
        if(<%=isSafe%> == null){
            alert("일치하는 정보가 존재하지 않습니다")
            self.close()
            location.href= "/planner/index.jsp"
        }
        else{
            window.onload = function () {
                document.getElementById("email").value = <%=isSafe%>
            }   
        }
    }
</script>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/loginCommon.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/login/changePw.css">
    <title>스테이지어스</title>
</head>

<body>
    <form id="form" class="contain">
        <img class="logo" src="/planner/source/logo.png">
        <span class="title">비밀번호 변경</span>
        <hr class="hr">
        <input id="pw" name="pw" class="stdIn" type="password" maxlength="30" placeholder="비밀번호" oninput="ValidPwEvent()">
        <input id="pwAgain" class="stdIn" type="password" maxlength="30"placeholder="비밀번호 확인" oninput="ValidPwEvent()">
        <div id="pwCheckRes">비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다.</div>
        <input id="email" name="email" type="text"> 
        <input class="stdIn loginBtn" type="button" value="입력완료" onclick="GoLoginEvent()">
    </form>
    <script src="/planner/js/login/changePw.js"></script>
</body>

</html>