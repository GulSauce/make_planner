<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./css/nav.css">
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <title>Main</title>
</head>
<body>
    <%@ include file="nav.jsp"%>
    <div id="banners">
        <article id="art0" class="art">
            <h1>자기소개</h1>
            <button class="bannerBtn" onclick="GoEvent(0)">바로가기</button>
        </article>

        <article id="art1" class="art">
            <h1>컴퓨터 견적</h1>
            <button class="bannerBtn" onclick="GoEvent(1)">바로가기</button>
        </article>

        <article id="art2" class="art">
            <h1>유튜브</h1>
            <button class="bannerBtn" onclick="GoEvent(2)">바로가기</button>
        </article>

        <article id="art3" class="art">
            <h1>숫자야구</h1>
            <button class="bannerBtn" onclick="GoEvent(3)">바로가기</button>
        </article>

        <article id="art4" class="art">
            <h1>사진퍼즐</h1>
            <button class="bannerBtn" onclick="GoEvent(4)">바로가기</button>
        </article>

        <div id="bg"></div>
    </div>

    <div id="timerBar" class="effect"></div>
    <div id="emptyBar"></div>

    <script src="./js/index.js"></script>
</body>
</html>