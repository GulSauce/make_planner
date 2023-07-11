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

    String no = request.getParameter("no");

    //SQL 만들기
    String str = "SELECT * FROM FreeBoardArticles WHERE articleNo = ?";  
    PreparedStatement sql = connect.prepareStatement(str);
    sql.setString(1, no);

    ResultSet rs = null;
    ArrayList<String>article = new ArrayList<String>();
    //SQL 전송
    rs = sql.executeQuery();
    while(rs.next()){
        for(int i = 1; i <= 5; i++){
            String colum = rs.getString(i);
            article.add(colum); 
        }   
    }
%>

<script>
  
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/nav.css">
    <link rel="stylesheet" type="text/css" href="/css/web_page/free_board_article.css">
    <title>Document</title>
</head>

<%@ include file="/nav.jsp"%>

<body>
    <main>
        <h1>자유게시판</h1>
        <div class="head">
            <div id="title"><%=article.get(2)%></div>
            <div class="writerDate">    
                <span id="writer"><%=article.get(1)%></span>
                <span id="date"><%=article.get(4)%></span>
            </div>
            <div class="viewComment">
                <div id="view">
                    <span>조회</span>
                    <span>0</span>
                </div>
                <div id="comment">
                    <span>댓글</span>
                    <span>0</span>
                </div>
            </div>
        </div>
        <article id ="article">
            <%=article.get(3)%>
        </article>
        <div id="commentBox">
            전체 댓글 0개
            <div id="comments">
                
            </div>
            <div id="writeComments">
                <textarea id="contents" type="text"></textarea>
                <input id="add" class="btn" type="button" value="등록">
            </div>
        </div>
    </main>
    <script src="/js/nav.js"></script>
</body>
</html>

<script>

</script>