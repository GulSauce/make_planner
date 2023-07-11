<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/nav.css">
    <link rel="stylesheet" type="text/css" href="../../css/puzzle/puzzle_start.css">
    <title>Document</title>
</head>
<body>
    <%@ include file="../../nav.jsp"%>

    <header>
        <h1>DRAG & DROP 이벤트를 이용한 사진 퍼즐</h1>
    </header>
    
    <div class="mainAndNav">
        <main>
            <h1>난이도 선택</h1>
            <!-- 이벤트 함수 1대1 매핑 -->
            <button onclick="Next(5)" onmouseover="MakeLineEvent(5); MakeExpEvent(5)" onmouseout="DelLineEvent(); EreaseExpEvent()">어려움</button>
            <button onclick="Next(4)" onmouseover="MakeLineEvent(4); MakeExpEvent(4)" onmouseout="DelLineEvent(); EreaseExpEvent()">중간  </button>
            <button onclick="Next(3)" onmouseover="MakeLineEvent(3); MakeExpEvent(3)" onmouseout="DelLineEvent(); EreaseExpEvent()">쉬움</button>
            <button onmouseover="MakeCustomLineEvent(); MakeExpEvent(-1)" onmouseout="DelLineEvent(); EreaseExpEvent()" onclick="CustomNext()">커스텀</button>
            <div class="customInputBox">
                <span class="jule">줄</span>
                <span class="cho">초</span>
                <input id="customRowCnt" class="input"  oninput="DelLineEvent();  MakeLineEvent(this.value)">
                <input id="customTime" class="input">
            </div>
        </main>

        <div class="imgProcess">
            <input type="file" class="upload" accept="image/*" onchange="ProcessImg()">
            <span id="a">
             
                <img id="uploadImage">
 
                <span id="RowLine">
                </span>

                <span id="ColumnLine">
                </span>
                
            </span>
            <article id="exp"></article>
        </div>
    </div>
    <script src="../../js/nav.js"></script>
    <script src="../../js/puzzle/puzzle_start.js"></script>
</body>
</html>