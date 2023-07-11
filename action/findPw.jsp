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
    String phoneNumber = request.getParameter("phoneNumber");

    //SQL 만들기
    String str = "SELECT * FROM MyInfo WHERE id = " + "\"" + id + "\"" + " AND phoneNumber = " + "\"" + phoneNumber + "\"";  
    PreparedStatement sql = connect.prepareStatement(str);

    boolean isSucc = false;
    ResultSet rs = null;
    //SQL 전송
    rs = sql.executeQuery();

    if(rs.next()){
        isSucc = true;
    }
    else{
        isSucc = false;
    }
%>

<script>
    if(<%=isSucc%> == false){
        opener.document.getElementById("findPwRes").innerHTML = "일치하는 계정정보가 존재하지 않습니다."
        opener.document.getElementById("findPwRes").style.color = "red"
        opener.document.getElementById("changePw").style.display = "none"
    }   
    else{
        opener.document.getElementById("findPwRes").innerHTML = "비밀번호 변경"
        opener.document.getElementById("findPwRes").style.color = "black"

        opener.document.getElementById("changePw").style.display = "block"
    }
    self.close()
</script>