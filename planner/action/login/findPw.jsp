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
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/planner", "stageus", "1234");

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");

    //SQL 만들기
    String str = "SELECT * FROM UserInfo WHERE name = ? AND email = ? AND phoneNumber = ?";
    PreparedStatement sql = connect.prepareStatement(str);
    sql.setString(1, name);
    sql.setString(2, email);
    sql.setString(3, phoneNumber);

    ResultSet rs = null;
    //SQL 전송
    rs = sql.executeQuery();

    boolean isSucc = false;
    if(rs.next()){
        isSucc = true;
    }
%>

<script>
    if(<%=isSucc%> == false){
        alert("일치하는 정보가 없습니다")   
    }
    else{
        opener.window.location.reload()
        opener.location.href = "/planner/jsp/login/findPw.jsp"
    }
    self.close()
</script>