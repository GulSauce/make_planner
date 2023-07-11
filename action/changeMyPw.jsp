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
    String curPw = request.getParameter("curPw");
    String newPw = request.getParameter("newPw");

    String str = "SELECT * FROM MyInfo WHERE id = ? AND pw = ?";
    PreparedStatement sql = connect.prepareStatement(str);
    sql.setString(1, id); 
    sql.setString(2, curPw);

    ResultSet rs = sql.executeQuery();

    
    boolean isSucc;

    if(rs.next()){
        isSucc = true;
        str = "UPDATE MyInfo SET pw = ? WHERE id = ?";
        sql = connect.prepareStatement(str);
        sql.setString(1, newPw); 
        sql.setString(2, request.getParameter("id"));
        
        sql.execute();

        newPw = "\"" + newPw + "\"";
        ArrayList<String>culums = (ArrayList)session.getAttribute("MEMBERID");
        culums.set(2, newPw);
        session.setAttribute("MEMBERID", culums);
    }
    else
        isSucc = false;
%>

<script>
    if(<%=isSucc%> == true){
        opener.document.getElementById("changeMyPw").style.display = "none"
        opener.document.getElementById("myCurPw").value = ""
        opener.document.getElementById("myNewPw").value = ""
        opener.document.getElementById("myNewPwAgain").value = ""
        var temp = opener.document.getElementById("myPwCheckRes")
        temp.innerHTML = "비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
        temp.style.color = "blue"
        alert( "비밀번호 변경 완료")
    }
    else{
        alert("현재 비밀번호가 일치하지 않습니다")
    }
    self.close();
</script>