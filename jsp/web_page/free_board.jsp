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
    String str = "SELECT articleNo, title, id, regWhen FROM FreeBoardArticles";  
    PreparedStatement sql = connect.prepareStatement(str);

    boolean isSucc;
    ResultSet rs = null;
    ArrayList<ArrayList<String>>articleList = new ArrayList<ArrayList<String>>();
    //SQL 전송
    rs = sql.executeQuery();
    while(rs.next()){
        ArrayList<String>colums = new ArrayList<String>();
        for(int i = 1; i <= 4; i++){
            String colum = rs.getString(i);
            colum = "\"" + colum + "\"";
            colums.add(colum);
        }
        articleList.add(colums);
    }
%>

<script>
    function ReadArticleEvent(elem){
        var url = "/action/web_page/readArticle.jsp"
        var target = "readArticle"
        window.open(url, target)
        var form = document.getElementById("article"+elem.value)
        form.action = url
        form.target = target
        form.submit()
    }

    window.addEventListener('load', function(){
        for(var colums of <%=articleList%>){
            var temp = document.createElement("form")
            temp.id = "article"+colums[0]
            temp.className = "tr"

            var articleNo = document.createElement("span")
            articleNo.className = "col0"
            articleNo.innerHTML = colums[0]
            temp.appendChild(articleNo)

            var title = document.createElement("span")
            title.setAttribute("onclick", "ReadArticleEvent(this)")
            title.className = "col1"
            title.innerHTML = colums[1]
            title.value = colums[0]
            temp.appendChild(title)

            var writer = document.createElement("span")
            writer.className = "col2"
            writer.innerHTML = colums[2]
            temp.appendChild(writer)

            var regWhen = document.createElement("span")
            regWhen.className = "col3"
            regWhen.innerHTML = colums[3]
            temp.appendChild(regWhen)

            var hiddenInput = document.createElement("input")
            hiddenInput.id = "no"+colums[0]
            hiddenInput.name = "no"
            hiddenInput.value = colums[0]
            hiddenInput.style.display = "none"
            temp.appendChild(hiddenInput)

            var parent = document.getElementById("table")
            parent.insertBefore(temp, parent.firstChild);
        }
    });
    
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/nav.css">
    <link rel="stylesheet" type="text/css" href="/css/web_page/free_board.css">
    <title>자유게시판</title>
</head>

<%@ include file="/nav.jsp"%>

<body>
    <main>
        <h1>자유게시판</h1>
        <input id="writeBtn" type="button" value="글쓰기" onclick="GoWriteEvent()">
        <div class="header tr">
            <span class="col0">
                번호
            </span>
            <span class="col1" style="text-align:center;">
                제목
            </span>
            <span class="col2">
                글쓴이
            </span>
            <span class="col3">
                작성일
            </span>
            <span class="col4">
                조회
            </span>
        </div>
        <div id="table">
            <form id="article0" class="tr">
                <span class="col0">
                    글번호 
                </span>
                <span class="col1" onclick="ReadArticleEvent(this)">
                    제목
                </span>
                <span class="col2">
                    닉네임
                </span>
                <span class="col3">
                    날짜
                </span>
                <span class="col4">
                    조회수
                </span>
                <input id="no0" name="no" style="display:none;">
            </form>
        </div>
    </main>
    <script src="/js/nav.js"></script>
    <script src="/js/web_page/free_board.js"></script>
</body>
</html>