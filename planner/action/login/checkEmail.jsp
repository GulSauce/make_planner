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
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/planner", "stageus", "1234");

    String email = request.getParameter("email");

    //SQL 만들기
    String str = "SELECT * FROM UserInfo WHERE email = ?";
    PreparedStatement sql = connect.prepareStatement(str);
    sql.setString(1, email);

    boolean isFail;

    //SQL 전송
    ResultSet rs = sql.executeQuery();
    if(rs.next())
        isFail = true;  
    else
        isFail = false;
%>

<script>
    var temp = opener.document.getElementById("emailChecked");
    if(<%=isFail%> == true){
       alert("중복된 이메일입니다")
    }
    else{
        alert("사용가능한 이메일입니다")
        var email =  opener.document.getElementById("email");
        email.readOnly = true;
        email.style.backgroundColor = "rgb(217,217,217)";
    }
    self.close();
</script>