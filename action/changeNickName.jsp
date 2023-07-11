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
    String str = "SELECT * FROM MyInfo WHERE nickName = ?";
    PreparedStatement sql = connect.prepareStatement(str);
    sql.setString(1, nick);

    //SQL 전송
    ResultSet rs = sql.executeQuery();

    boolean isFail;

    if(rs.next())
        isFail = true;
    else{
        isFail = false;
        str = "UPDATE MyInfo SET nickname = ? WHERE id = ?";
        sql = connect.prepareStatement(str);
        sql.setString(1, nick);
        sql.setString(2, request.getParameter("id"));
        
        sql.execute();

        nick = "\""+nick+"\"";
        ArrayList<String>culums = (ArrayList)session.getAttribute("MEMBERID");
        culums.set(0, nick);
        session.setAttribute("MEMBERID", culums);
    }
%>

<script>
    if(<%=isFail%> == true){
        var temp  = opener.document.getElementById("myNickNameCheckRes")
        temp.innerHTML = "중복된 닉네임입니다."
        temp.style.color = "red"
        temp.value = 0
    }
    else{
        opener.document.getElementById("loginText").innerHTML = <%=nick%>+"님 환영합니다."
        opener.document.getElementById("myInfo0").remove()
        opener.document.getElementById("cancelChangeNickBtn").remove()
        var newNode = document.createElement("span")
        newNode.id = "myInfo0"
        
        newNode.innerHTML = <%=nick%>
        opener.document.getElementById("changeNickBtn").before(newNode)
        var temp  = opener.document.getElementById("myNickNameCheckRes")
        opener.document.getElementById("myNickNameCheckRes").innerHTML = ""


        temp = opener.document.getElementById("changeNickBtn")
        temp.value = "닉네임 변경"
        temp.setAttribute("onclick", "ChangeNickEvent(this)")

        alert("닉네임 변경 완료")
    }
    self.close();
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
