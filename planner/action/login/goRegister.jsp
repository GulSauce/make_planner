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

    //SQL 만들기
    String email = request.getParameter("email");
    //SQL 만들기
    String emailStr = "SELECT * FROM UserInfo WHERE email = ?";
    PreparedStatement emailSql = connect.prepareStatement(emailStr);
    emailSql.setString(1, email);
    
    ResultSet emailRs = emailSql.executeQuery();
    
    boolean isEmailSucc = false;
    boolean isPhoneSucc = false;

    if(emailRs.next()){
        isEmailSucc = true;
    }  
    else{
        String phone = request.getParameter("phoneNumber");

        String phoneStr = "SELECT * FROM UserInfo WHERE phoneNumber = ?";
        PreparedStatement phoneSql = connect.prepareStatement(phoneStr);
        phoneSql.setString(1, phone);

        ResultSet phoneRs = phoneSql.executeQuery();
        if(phoneRs.next()){
            isPhoneSucc = true;
        }  
    }

    if(isEmailSucc == false && isPhoneSucc == false){
        ArrayList<String>sqlList = new ArrayList<String>();
        sqlList.add(request.getParameter("name"));
        sqlList.add(request.getParameter("email"));
        sqlList.add(request.getParameter("phoneNumber"));
        sqlList.add(request.getParameter("pw"));
        sqlList.add(request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day"));
        sqlList.add(request.getParameter("class"));

        //SQL 만들기
        String reg = "INSERT INTO UserInfo VALUES(?, ?, ?, ?, ?, ?, DEFAULT)" ;
        PreparedStatement regSql = connect.prepareStatement(reg);
        for(int i = 0; i < 6; i++){
            regSql.setString(i+1, sqlList.get(i));
        }
        //SQL 전송
        regSql.execute();
    }
%>

<script>
    if(<%=isEmailSucc%> == true){
        alert("중복된 이메일입니다")
        self.close()
    }
    else if(<%=isPhoneSucc%> == true){
        alert("중복된 전화번호입니다")
        self.close()
    }
    else{
        opener.window.location.reload()
        opener.location.href = "/planner/index.jsp"
        alert("회원가입완료")
        self.close()
    }
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
