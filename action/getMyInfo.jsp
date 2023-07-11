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

<!-- jsp의 영역 -->
<%
    //Connecter 파일 불러와서 MariaDB 연결
    Class.forName("com.mysql.jdbc.Driver");

    //데이터베이스 연결, //localhost : 내 서버 안에 설치되어있으니까
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/web", "stageus", "1234");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    //SQL 만들기
    String str = "SELECT * FROM MyInfo WHERE ID = " + "\""+ id + "\"" + "AND PW = " + "\""+ pw + "\"";  
    PreparedStatement sql = connect.prepareStatement(str);

    boolean isSucc;
    ResultSet rs = null;
    String nick = "";
    //SQL 전송
    rs = sql.executeQuery();
    if(rs.next()){
        isSucc = true;
        nick = rs.getString("NickName");
        nick = "\"" + nick + "\"";
    } 
    else{
        isSucc = false;
    }
%>

<script>
    if(<%=isSucc%> == false)
        alert("ID 또는 비밀번호를 확인해주세요.")
    else{
        opener.document.getElementById("loginText").innerHTML = <%=nick%>+"님 환영합니다."
        opener.document.getElementById("loginSeg").style.display = "none"
        opener.document.getElementById("registerAndFind").style.display = "none"
        opener.document.getElementById("userSector").style.display = "block"
        opener.document.getElementById("logout").style.display = "block"
    }
    self.close();
</script>