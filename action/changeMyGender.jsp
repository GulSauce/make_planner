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
    String gender = request.getParameter("gender");

    String str = "UPDATE MyInfo SET gender = ? WHERE id = ?";
    PreparedStatement sql = connect.prepareStatement(str);

    sql.setString(1, gender); 
    sql.setString(2, request.getParameter("id"));

    gender = "\""+gender+"\"";
    ArrayList<String>culums = (ArrayList)session.getAttribute("MEMBERID");
    culums.set(5, gender);
    session.setAttribute("MEMBERID", culums);

    sql.execute();
%>

<script>
    var newNode = document.createElement("span")
    newNode.innerHTML = <%="\""+request.getParameter("gender")+"\""%>
    opener.document.getElementById("myInfo5").remove()
    newNode.id = "myInfo5"

    var temp = opener.document.getElementById("changeGenderBtn")

    temp.before(newNode)
    temp.value = "성별 변경"
    temp.style.marginLeft = "10px"
    temp.setAttribute("onclick", "ChangeMyGender(this)")

    opener.document.getElementById("cancelChangeGenderBtn").remove();
    alert( "성별 변경 완료")
    self.close();
</script>