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

    ArrayList<String>sqlList = new ArrayList<String>();
    sqlList.add(request.getParameter("nickName"));
    sqlList.add(request.getParameter("id"));
    sqlList.add(request.getParameter("pw"));
    sqlList.add(request.getParameter("phoneNumber"));
    sqlList.add(request.getParameter("birth"));
    sqlList.add(request.getParameter("gender"));

    //SQL 만들기
    String str = "INSERT INTO MyInfo VALUES(?, ?, ?, ?, ?, ?, DEFAULT)" ;
    PreparedStatement sql = connect.prepareStatement(str);
    for(int i = 0; i < 6; i++){
        sql.setString(i+1, sqlList.get(i));
    }

    //SQL 전송
    sql.execute();
%>

<script>
    var temp = opener.document.getElementById("myBanner")
    temp.style.width = "40%"
    temp.style.opacity = 1
    alert("회원가입 완료")
    self.close();
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
