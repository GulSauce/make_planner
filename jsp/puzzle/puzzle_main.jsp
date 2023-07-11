<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/nav.css">
    <link rel="stylesheet" type="text/css" href="../../css/puzzle/puzzle_main.css">
    <title>Document</title>
</head>
<body>
    <%@ include file="../../nav.jsp"%>
    
    <div class="sort"> 
        <div id="timer">
        <span id="clock" >

        </span>

        <span id="bar">

        </span>

        </div>

        <div id="dropPos">
        </div>
        
        <div id="takePos">
        </div>
    </div>
    <audio autoplay onloadstart="this.volume=0.2" loop>
        <source src="../../source/puzzle/bgm.mp3">
    </audio>
    <script src="../../js/nav.js"></script>
    <script src="../../js/puzzle/puzzle_main.js"></script>
</body>
</html>