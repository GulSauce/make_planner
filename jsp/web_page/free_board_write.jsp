<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!--콘텍스트명 얻어오기-->
<% String ctx = request.getContextPath(); %>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx %>/smart_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script>
    var oEditors = [];
    $(function(){
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
            //SmartEditor2Skin.html 파일이 존재하는 경로
            sSkinURI: "/smart_editor/SmartEditor2Skin.html",  
            htParams : {
                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseToolbar : true,             
                // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseVerticalResizer : true,     
                // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true,         
            }, 
            fCreator: "createSEditor2"
        });
        
        //저장버튼 클릭시 form 전송
        $("#add").click(function(){
            if(title.value.length == 0)
                alert("제목을 입력해주세요")
            else{
                var url = "/action/web_page/free_board_write.jsp"
                var target = "writeArticle"
                window.open(url, target, "width=500, height=250")
                var form = document.getElementById("frm")
                form.action = url
                form.target = target
                oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
                form.submit()
            }
        });    
    });
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/nav.css">
    <link rel="stylesheet" type="text/css" href="/css/web_page/free_board_write.css">
    <title>Document</title>
</head>

<%@ include file="/nav.jsp"%>

<body>
    <script>
        window.addEventListener('load', function(){
            if(<%=login%> == false){
                alert("로그인해주세요.") 
                window.location.href = '/jsp/web_page/free_board.jsp';
            }
            else{
                var culums = <%=culums%>
                document.getElementById("writer").innerHTML = "작성자 : " + culums[0];
                document.getElementById("writerId").value = culums[1];
            }   
        });

        function GoBackEvent(){
            location.href = '/jsp/web_page/free_board.jsp';
        }
    </script>
    <main>
        <h1>자유게시판</h1>
        <div id="writer"></div>
        <form id="frm" method="post">
            <input id="title" name="title" type="text" placeholder="제목을 입력해주세요." maxlength="50">
            <textarea id="ir1" name="content" type="text"></textarea>
            <div class="btns">
                <input id="cancel" class="btn" type="button" value="취소" onclick="GoBackEvent()">
                <input id="add" class="btn" type="button" value="등록">
            </div>
            <input id="writerId" name="id">
        </form>
    </main>
    <script src="/js/nav.js"></script>
    <script src="/js/web_page/free_board_write.js"></script>
</body>
</html>