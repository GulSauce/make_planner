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

    String phone = request.getParameter("phoneNumber");
    phone = "\""+ phone + "\"";

    //SQL 만들기
    String str = "SELECT * FROM MyInfo WHERE phoneNumber = " + phone;
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
    var temp = opener.document.getElementById("phoneCheckRes");
    if(<%=isFail%> == true){
        temp.value = "0";
        temp.innerHTML="중복된 전화번호입니다."
        temp.style.color = "red";
    }
    else{
        temp.value = "1"
        temp.innerHTML="중복되지 않은 전화번호입니다."
        temp.style.color = "blue";
    }
    self.close();
</script>