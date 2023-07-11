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
    //Connecter 파일 불러와서 MariaDB 연결
    Class.forName("com.mysql.jdbc.Driver");

    //데이터베이스 연결, //localhost : 내 서버 안에 설치되어있으니까
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/web", "stageus", "1234");

    String id = request.getParameter("id");
    String newPw = request.getParameter("newPw");

    id = "\"" + id + "\"";
    newPw = "\"" + newPw + "\"";

    //SQL 만들기
    String str = "UPDATE MyInfo SET pw = " + newPw + "WHERE id = " + id;
    PreparedStatement sql = connect.prepareStatement(str);
    
    sql.execute();
%>

<script>
    var temp = opener.document.getElementById("myBanner")
    temp.style.width = "40%"
    temp.style.opacity = 1
    alert("변경이 완료되었습니다.")
    self.close()
</script>