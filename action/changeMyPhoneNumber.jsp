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
    

    //SQL 만들기
    String str = "SELECT * FROM MyInfo WHERE phoneNumber = ?";
    PreparedStatement sql = connect.prepareStatement(str);

    sql.setString(1, phone); 

    boolean isFail;
    //SQL 전송

    ResultSet rs = sql.executeQuery();

    if(rs.next())
        isFail = true;
    else{
        isFail = false;
        str = "UPDATE MyInfo SET phoneNumber = ? WHERE id = ?";
        sql = connect.prepareStatement(str);
        sql.setString(1, phone);
        sql.setString(2, request.getParameter("id"));
        
        phone = "\""+ phone + "\"";
        ArrayList<String>culums = (ArrayList)session.getAttribute("MEMBERID");
        culums.set(3, phone);
        session.setAttribute("MEMBERID", culums);
        sql.execute();
    }
%>

<script>
    if(<%=isFail%> == true){
        alert("중복된 전화번호입니다.")
    }
    else{
        opener.document.getElementById("myInfo3").remove()
        opener.document.getElementById("cancelChangePhoneBtn").remove()
        var newNode = document.createElement("span")
        newNode.id = "myInfo3"

        newNode.innerHTML = <%=phone%>
        opener.document.getElementById("myPhoneNumberBtn").before(newNode)

        temp = opener.document.getElementById("myPhoneNumberBtn")
        temp.value = "연락처 변경"
        temp.setAttribute("onclick", "ChangeMyPhoneNumber(this)")

        alert("연락처 변경 완료")
    }
    self.close();
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
