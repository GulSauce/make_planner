<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

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

<% request.setCharacterEncoding("UTF-8"); %>

<!-- jsp의 영역 -->
<%
    //Connecter 파일 불러와서 MariaDB 연결
    Class.forName("com.mysql.jdbc.Driver");

    //데이터베이스 연결, //localhost : 내 서버 안에 설치되어있으니까
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/web", "stageus", "1234");

    String nick = request.getParameter("nickName");

    //SQL 만들기
    String str = "SELECT * FROM MyInfo WHERE nickName = " + "\""+ nick + "\"";
    PreparedStatement sql = connect.prepareStatement(str);

    boolean isFail;
    //SQL 전송

    ResultSet rs = sql.executeQuery();

    if(rs.next())
        isFail = true;
    else
        isFail = false;
%>

<script>
    if(<%=isFail%> == true){
        var temp  = opener.document.getElementById("nickNameCheckRes")
        temp.innerHTML = "중복된 닉네임입니다."
        temp.style.color = "red"
        temp.value = 0
    }
    else{
        var temp  = opener.document.getElementById("nickNameCheckRes")
        temp.innerHTML = "사용가능한 닉네임입니다."
        temp.style.color = "blue"
        temp.value = 1
    }
    self.close();
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
