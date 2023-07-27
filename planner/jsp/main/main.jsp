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
    ArrayList<String>culums = (ArrayList)session.getAttribute("MEMBERID");
    boolean login = culums == null ? false : true;
    
    ArrayList<ArrayList<String>>employees = new ArrayList<ArrayList<String>>();

    boolean flag = false;
    if(culums != null && culums.get(5).equals("\""+"팀장"+"\"")){
        flag = true;
        //Connecter 파일 불러와서 MariaDB 연결
        Class.forName("com.mysql.jdbc.Driver");

        //데이터베이스 연결, //localhost : 내 서버 안에 설치되어있으니까
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/planner", "stageus", "1234");

        //SQL 만들기
        String str = "SELECT name, email FROM UserInfo WHERE class = ?";
        PreparedStatement sql = connect.prepareStatement(str);
        sql.setString(1, "사원");

        ResultSet rs = null;
        //SQL 전송
        rs = sql.executeQuery();

        if(rs.next()){
            do{
                ArrayList<String>employee = new ArrayList<String>();
                employee.add("\""+rs.getString(1)+"\"");
                employee.add("\""+rs.getString(2)+"\"");
                 employees.add(employee);
            }while(rs.next());
        }
    } 
%>

<script>
    init()

    function init(){
        if(<%=login%> == false){
            alert("로그인이 필요합니다")
            location.href = "/planner/index.jsp"
        }
        else{
            window.onload = function () {
                var culums = <%=culums%>
                document.getElementById("classAndName").innerHTML = culums[5] + " " + culums[0];
                document.getElementById("email").innerHTML = culums[1]
                document.getElementById("phoneNumber").innerHTML = culums[2]
                document.getElementById("birth").innerHTML = culums[4].substr(2,2)+". "+culums[4].substr(5,2)+". "+culums[4].substr(8,2)
                if(culums[5] != "팀장")
                    document.getElementById("admin").style.display = "none";
            }
        }
    }

    window.addEventListener('load', function(){
        for(var employee of <%=employees%>){
            var contain = document.createElement("div")
            contain.className = "officer"

            var name = document.createElement("div")
            name.className = "officerName"
            name.innerHTML = employee[0]

            var email = document.createElement("div")
            email.className = "officerEmail"
            email.innerHTML = employee[1]

            contain.appendChild(name)
            contain.appendChild(email)
            document.getElementById("officerList").appendChild(contain)
        }
    })
    
</script>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/planner/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="/planner/css/main/main.css">
    <title>스테이지어스</title>
</head>

<body>
    <div id="sideMenu">
        <div class="myInfoContain">
            <div id="myInfo">
                <div id ="classAndName" class="nameInfo">직급 이름</div>
                <div id="email" class="otherInfo">이메일</div>
                <div id="phoneNumber" class="otherInfo">전화번호</div>
                <div id="birth" class="otherInfo">생일</div>
            </div>
        </div>
        <div id="admin">
            <span class="adminText">사원조회</span>
            <div id="officerList">
            </div>
        </div>
        <div class="logoutBtn" onclick="LogOutEvent()"> 
            <img class="logutBtnImg" src="/planner/source/logout_btn.png">
            <span>로그아웃</span>
        </div>
    </div>
    <nav>
        <img class="logo" src="/planner/source/logo.png">
        <div class="dateContain">
            <span class="today">TODAY</span>
            <span class="yearChange">&lt;</span>
            <span class="yearChange"> &gt;</span>
            <div id="dateSelect"></div>
        </div>
        <svg id="menu" viewBox="0 0 30 30" onclick="ShowMenuEvent()">
            <path d="M 3 7 A 1.0001 1.0001 0 1 0 3 9 L 27 9 A 1.0001 1.0001 0 1 0 27 7 L 3 7 z M 3 14 A 1.0001 1.0001 0 1 0 3 16 L 27 16 A 1.0001 1.0001 0 1 0 27 14 L 3 14 z M 3 21 A 1.0001 1.0001 0 1 0 3 23 L 27 23 A 1.0001 1.0001 0 1 0 27 21 L 3 21 z"/>
        </svg>
    </nav>
    <hr>
    <div id = "miniDateSelect">
    </div>
    <div class="addAndName">
        <input class="addSchedule" type="button" value="일정추가" onclick="OpenAddScheduleEvent()">
        <span class="userName">오영제의 일정</span>
    </div>
    <article id="myScheduleContain">
        <div class="mySchedule">
            <div>7월 11일 부터</div>
            <div>일정</div>
            <div class="editAndRemove">
                <span>수정</span>
                <span>&nbsp|&nbsp</span>
                <span>삭제</span>
            </div>
        </div>
    </article>
    <script src="/planner/js/main/main.js"></script>
</body>
</html>