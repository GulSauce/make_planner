<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- 리스트 라이브러리 -->
<%@ page import="java.util.ArrayList" %>

<%
    ArrayList<String>culums = (ArrayList)session.getAttribute("MEMBERID");
    boolean login = culums == null ? false : true;
%>

<script>
    window.onload = function(){
        if(<%=login%> == true){
            var culums = <%=culums%>
            document.getElementById("loginId").value = ""
            document.getElementById("loginPw").value = ""
            document.getElementById("loginText").innerHTML = culums[0]+"님 환영합니다."
            document.getElementById("loginSeg").style.display = "none"
            document.getElementById("registerAndFind").style.display = "none"
            document.getElementById("userSector").style.display = "block"
            document.getElementById("logout").style.display = "block"
            document.getElementById("myInfo0").innerHTML = culums[0]
            document.getElementById("myInfo1").innerHTML = culums[1]
            document.getElementById("myInfo3").innerHTML = culums[3]
            document.getElementById("myInfo4").innerHTML = culums[4]
            document.getElementById("myInfo5").innerHTML = culums[5]
            document.getElementById("myInfo6").value = culums[1]
        }
    };
    var pwSync = 0;
    var myPwSync = 0;
    var idNotEmpty = 0; 
    var nickNameNotEmpty = 0;
    var alphaFlag = false;
    var numFlag = false;
    var specialFlag = false;

    //----------------닉네임 유효성-------------------

    function ValidNickNameEvent(elem){
        nickNameNotEmpty = 0;

        var temp = document.getElementById("nickNameCheckRes")
        temp.innerHTML = "닉네임은 한글, 영문, 숫자 조합으로 2자 이상 15자 이하 가능합니다."
        temp.style.color = "blue"

        var str = elem.value
        str = str.replace(/[^(ㄱ-하)(ㅏ-ㅣ)(가-힣)(a-z)(A-Z)(0-9)]/g, '');
        elem.value = str;
    }

    function CheckNickNameEvent(){
        var flag = document.getElementById("nickName")
        var temp = document.getElementById("nickNameCheckRes")
        if(flag.value.length <= 1){
            nickNameNotEmpty = 0
            temp.innerHTML = "닉네임은 한글, 영문, 숫자 조합으로 2자 이상 15자 이하 가능합니다."
            temp.style.color = "blue"    
        }
        else{
            nickNameNotEmpty = 1
            var url = "/action/nickNameCheck.jsp"
            var target = "nickCheck"
            window.open(url, target, "width=10, height=10")
            var form = document.getElementById("register")
            form.action = url
            form.target = target
            form.submit()
        }
    }

    //----------------아이디 유효성-------------------
    
    function ValidIdEvent(elem){
        idNotEmpty = 0
        
        var temp = document.getElementById("idCheckRes")
        temp.innerHTML = "아이디는 영문, 숫자, 특수문자 조합으로 7자 이상 30자 이하 가능합니다."
        temp.style.color = "blue"

        var str = elem.value
        str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
        elem.value = str;
    }

    function CheckIdEvent(){
        var flag = document.getElementById("id")
        var temp = document.getElementById("idCheckRes")
        if(flag.value.length <= 6){
            idNotEmpty = 0
            temp.innerHTML = temp.innerHTML = "아이디는 영문, 숫자, 특수문자 조합으로 7자 이상 30자 이하 가능합니다."
            temp.style.color = "blue"
        }
        else{
            var alphaFlag = false;
            for(var i = 0; i < flag.value.length; i++){
                var temp = flag.value.substr(i,1)
                if((("a" <= temp) && (temp <= "z")) ||  (("A" <= temp) && (temp <= "Z" ))){
                    alphaFlag = true;
                }
            }
            if(alphaFlag){
                idNotEmpty = 1
                var url = "/action/idCheck.jsp"
                var target = "idCheck"
                window.open("", target, "width=10, height=10")
                var form = document.getElementById("register")
                form.action = url
                form.target = target
                form.submit()
            }
            else
                alert("알파벳은 반드시 포함되어야합니다.")
        }
    }

    //----------------비밀번호 유효성-------------------

    function ValidPwEvent(){
        var flag = document.getElementById("pw")
        var pwAgain = document.getElementById("pwAgain")
        var temp = document.getElementById("pwCheckRes")

        var str = flag.value
        str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
        flag.value = str;

        str = pwAgain.value
        str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
        pwAgain.value = str;

        pwSync = 0
        temp.innerHTML = "비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
        temp.style.color = "blue"

        if(flag.value.length >= 7){
            alphaFlag = false;
            numFlag = false;
            specialFlag = false;

            for(var i = 0; i < flag.value.length; i++){
                var tempStr = flag.value.substr(i,1)
                if((("a" <= tempStr) && (temp <= "z")) ||  (("A" <= tempStr) && (tempStr <= "Z" )))
                    alphaFlag = true;

                else if(("1" <= tempStr) && (tempStr <= "9"))
                    numFlag = true;
        
                else
                    specialFlag = true;

                if(alphaFlag && numFlag && specialFlag){
                    if(flag.value == pwAgain.value){
                        pwSync = 1  
                        temp.innerHTML = "비밀번호가 일치합니다."
                        temp.style.color = "blue"
                    }
                    else{
                        pwSync = 0;
                        temp.innerHTML = "비밀번호가 일치하지않습니다."
                        temp.style.color = "red"
                    }
                }
                else{
                    temp.innerHTML = "비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
                    temp.style.color = "blue"
                }
            }
        }
    }

    //----------------연락처 유효성-------------------

    function ValidPhoneNumberEvent(elem) {
        var temp = document.getElementById("phoneCheckRes");
        temp.value = "0";
        temp.innerHTML = "";
        var str = elem.value
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';

        if (str.length < 4) {
            elem.value = str;
        }
        else if (str.length < 7) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            elem.value = tmp;
        } 
        else if (str.length < 11) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            elem.value = tmp;
        } 
        else {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            elem.value = tmp;
        }
    }

    function CheckPhoneNumberEvent(){
        if(document.getElementById("phoneNumber").value.length < 13){
            document.getElementById("phoneCheckRes").value = "0"
            var temp = document.getElementById("phoneCheckRes");
            temp.innerHTML = "전화번호를 정확하게 입력해주세요"
            temp.style.color = "red"
        }
        else{
            document.getElementById("phoneCheckRes").value = "1"
            var url = "/action/checkPhoneNumber.jsp"
            var target = "checkPhone"
            window.open("", target, "width=500, height=250")
            var form = document.getElementById("register")
            form.action = url
            form.target = target
            form.submit()
        }
    }

    //----------------회원가입 유효성-------------------

    function CheckRegisterEvent(){
        var nickNameFlag = document.getElementById("nickNameCheckRes").value
        var idFlag = document.getElementById("idCheckRes").value
        if(nickNameFlag == 0 || nickNameNotEmpty == 0)
            alert("닉네임 중복확인을 해주세요")
        else if(idFlag == 0 || idNotEmpty == 0) 
            alert("아이디 중복확인을 해주세요")
        else if(document.getElementById("pw").value.length <= 6 || !(alphaFlag&&numFlag&&specialFlag))
            alert("비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다")
        else if(pwSync == 0)
            alert("비밀번호가 일치하지 않습니다")
        else if(document.getElementById("phoneCheckRes").value == "0")
            alert("연락처 중복확인을 해주세요")
        else if(document.getElementById("birth").value == "")
            alert("생년월일을 입력해주세요")
        else{
            var flag = 0;
            var temp = document.getElementsByName("gender")
            for(g of temp){
                if(g.checked){
                    flag = 1
                    break
                }
            }
            if(flag == 0)
                alert("성별을 선택해주세요")
            else{
                var url = "/action/goRegister.jsp"
                var target = "register"
                window.open("", target)
                var form = document.getElementById("register")
                form.action = url
                form.target = target
                form.submit()
                window.location.reload()  
            }
        }
    }

    //----------------로그인-------------------

    function LoginEvent(){  
        var url = "/action/goLogin.jsp"
        var target = "goLogin"
        window.open("", target, "width=500, height=250")
        var form = document.getElementById("loginSeg")
        form.action = url
        form.target = target
        form.submit()
    }

    //----------------아이디 찾기-------------------
    
    function FindIdEvent(){
        if(document.getElementById("findIdPhoneNumber").value.length < 13)
            alert("연락처를 정확하게 입력해주세요")
        else{
            var url = "/action/findId.jsp"
            var target = "findId"
            window.open("", target, "width=10, height=10")
            var form = document.getElementById("findId")
            form.action = url
            form.target = target
            form.submit()
        }
    }

    //----------------비밀번호 찾기-------------------

    function FindPwEvent(){
        if(document.getElementById("findPwId").value.length <= 2){
            alert("비밀번호를 정확하게 입력해주세요")
        }
        else if(document.getElementById("findPwPhoneNumber").value.length < 13)
            alert("연락처를 정확하게 입력해주세요")
        else{
            var url = "/action/findPw.jsp"
            var target = "findPw"
            window.open("", target, "width=10, height=10")
            var form = document.getElementById("findPw")
            form.action = url
            form.target = target
            form.submit()
        }
    }

    function ValidNewPwEvent(){
        var flag = document.getElementById("newPw")
        var pwAgain = document.getElementById("newPwAgain")
        var temp = document.getElementById("newPwCheckRes")

        var str = flag.value
        str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
        flag.value = str;

        str = pwAgain.value
        str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
        pwAgain.value = str;

        temp.innerHTML = "비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
        temp.style.color = "blue"

        myPwSync = 0;
        if(flag.value.length >= 7){
            alphaFlag = false;
            numFlag = false;
            specialFlag = false;

            for(var i = 0; i < flag.value.length; i++){
                var tempStr = flag.value.substr(i,1)
                if((("a" <= tempStr) && (temp <= "z")) ||  (("A" <= tempStr) && (tempStr <= "Z" )))
                    alphaFlag = true;

                else if(("1" <= tempStr) && (tempStr <= "9"))
                    numFlag = true;
        
                else
                    specialFlag = true;

                if(alphaFlag && numFlag && specialFlag){
                    if(flag.value == pwAgain.value){
                        myPwSync = 1
                        temp.innerHTML = "비밀번호가 일치합니다."
                        temp.style.color = "blue"
                    }
                    else{
                        myPwSync = 0;
                        temp.innerHTML = "비밀번호가 일치하지않습니다."
                        temp.style.color = "red"
                    }
                }
                else{
                    temp.innerHTML = "비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
                    temp.style.color = "blue"
                }
            }
        }
    }

    function ChangeNewPwEvent(){
        if(myPwSync){
             var url = "/action/changePw.jsp"
        var target = "changePw"
        window.open("", target, "width=500, height=250")
        var form = document.getElementById("findPw")
        form.action = url
        form.target = target
        form.submit()
        window.location.reload()
        }
        else{
            alert("비밀번호가 일치하지 않습니다.")
        }
    }

    //--------------닉네임 변경-------------------

    function ChangeNickEvent(elem){
        var oldNode = document.getElementById("myInfo0")
        var newNode = document.createElement("input")
        newNode.id = "myInfo0"
        newNode.name = "nickName"
        newNode.setAttribute("oninput", "ValidMyNickNameEvent(this)")
        newNode.maxLength="15"
        newNode.value = oldNode.innerHTML

        var newBtn = document.createElement("button")
        newBtn.id = "cancelChangeNickBtn"
        newBtn.value = oldNode.innerHTML
        newBtn.style.marginLeft = "10px"
        newBtn.setAttribute("onclick", "CancelChangeNickEvent()")
        newBtn.innerHTML = "취소"

        oldNode.remove();

        document.getElementById("changeNickBtn").before(newNode)
        var checkRes = document.getElementById("myNickNameCheckRes")
        checkRes.innerHTML="닉네임은 한글, 영문, 숫자 조합으로 2자 이상 15자 이하 가능합니다."
        checkRes.style.color = "blue"

        elem.value = "변경완료"
        elem.setAttribute("onclick", "CheckMyNickNameEvent()")
        elem.after(newBtn)
    }

    function CancelChangeNickEvent(){
        var newNode = document.createElement("span")
        newNode.innerHTML = document.getElementById("cancelChangeNickBtn").value
        document.getElementById("myInfo0").remove()
        newNode.id = "myInfo0"
        document.getElementById("changeNickBtn").before(newNode)
        
        var temp  = document.getElementById("myNickNameCheckRes")
        temp.innerHTML = ""

        temp = document.getElementById("changeNickBtn")
        temp.value = "닉네임 변경"
        temp.setAttribute("onclick", "ChangeNickEvent(this)")

        document.getElementById("cancelChangeNickBtn").remove();
    }

    function ValidMyNickNameEvent(elem){
        nickNameNotEmpty = 0;

        var temp = document.getElementById("myNickNameCheckRes")
        temp.innerHTML = "닉네임은 한글, 영문, 숫자 조합으로 2자 이상 15자 이하 가능합니다."
        temp.style.color = "blue"

        var str = elem.value
        str = str.replace(/[^(ㄱ-하)(ㅏ-ㅣ)(가-힣)(a-z)(A-Z)(0-9)]/g, '');
        elem.value = str;
    }

    function CheckMyNickNameEvent(){
        var flag = document.getElementById("myInfo0")
        var temp = document.getElementById("myNickNameCheckRes")
        if(flag.value.length <= 1){
            nickNameNotEmpty = 0
            temp.innerHTML = "닉네임은 한글, 영문, 숫자 조합으로 2자 이상 15자 이하 가능합니다."
            alert("닉네임은 한글, 영문, 숫자 조합으로 2자 이상 15자 이하 가능합니다.")
            temp.style.color = "blue"    
        }
        else{
            nickNameNotEmpty = 1
            var url = "/action/changeNickName.jsp"
            var target = "nickCheck"
            window.open(url, target, "width=500, height=250")
            var form = document.getElementById("myInfo")
            form.action = url
            form.target = target
            form.submit()
        }
    }

    //--------------비밀번호 변경-------------------
    function ShowChangeMyPwEvent(){
        document.getElementById("changeMyPw").style.display = "block"
    }

    function ValidMyPwEvent(){
        var flag = document.getElementById("myCurPw")

        var str = flag.value
        str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
        flag.value = str;
    }

    function ValidMyNewPwEvent(){
        var flag = document.getElementById("myNewPw")
        var pwAgain = document.getElementById("myNewPwAgain")
        var temp = document.getElementById("myPwCheckRes")


        var str = flag.value
        str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
        flag.value = str;

        str = pwAgain.value
        str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
        pwAgain.value = str;

        temp.innerHTML = "비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
        temp.style.color = "blue"

        myPwSync = 0;

        if(flag.value.length >= 7){
            alphaFlag = false;
            numFlag = false;
            specialFlag = false;

            for(var i = 0; i < flag.value.length; i++){
                var tempStr = flag.value.substr(i,1)
                if((("a" <= tempStr) && (temp <= "z")) ||  (("A" <= tempStr) && (tempStr <= "Z" )))
                    alphaFlag = true;

                else if(("1" <= tempStr) && (tempStr <= "9"))
                    numFlag = true;
        
                else
                    specialFlag = true;

                if(alphaFlag && numFlag && specialFlag){
                    if(flag.value == pwAgain.value){
                        myPwSync = 1
                        temp.innerHTML = "비밀번호가 일치합니다."
                        temp.style.color = "blue"
                    }
                    else{
                        myPwSync = 0;
                        temp.innerHTML = "비밀번호가 일치하지않습니다."
                        temp.style.color = "red"
                    }
                }
                else{
                    temp.innerHTML = "비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
                    temp.style.color = "blue"
                }
            }
        }
    }

    function ChangeMyPwEvent(){
        if(myPwSync){
            var url = "/action/changeMyPw.jsp"
            var target = "changeMyPw"
            window.open("", target, "width=500, height=250")
            var form = document.getElementById("myInfo")
            form.action = url
            form.target = target
            form.submit()
        }
        else{
            alert("비밀번호가 일치하지 않습니다.")
        }
    }

    function CancelChangeMyPwEvent(){
        document.getElementById("changeMyPw").style.display = "none"
        document.getElementById("myCurPw").value = ""
        document.getElementById("myNewPw").value = ""
        document.getElementById("myNewPwAgain").value = ""
        var temp = document.getElementById("myPwCheckRes")
        temp.innerHTML = "비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
        temp.style.color = "blue"
    }

    //--------------연락처 변경-------------------
    function ChangeMyPhoneNumber(elem){
        var oldNode = document.getElementById("myInfo3")
        var newNode = document.createElement("input")
        newNode.maxLength = "13"
        newNode.placeholder = "예) 010-1234-5678"
        newNode.id = "myInfo3"
        newNode.name = "phoneNumber"
        newNode.class = "stdInput"
        newNode.type = "text"
        newNode.value = oldNode.innerHTML
        newNode.setAttribute("oninput", "ValidPhoneNumberEvent(this)")

        var newBtn = document.createElement("button")
        newBtn.id = "cancelChangePhoneBtn"
        newBtn.value = oldNode.innerHTML
        newBtn.style.marginLeft = "10px"
        newBtn.setAttribute("onclick", "CancelChangePhoneEvent()")
        newBtn.innerHTML = "취소"

        oldNode.remove()

        document.getElementById("myPhoneNumberBtn").before(newNode)

        elem.value = "변경 완료"
        elem.setAttribute("onclick", "CheckMyPhoneNumberEvent()")
        elem.after(newBtn)
    }

    function CancelChangePhoneEvent(){
        var newNode = document.createElement("span")
        newNode.innerHTML = document.getElementById("cancelChangePhoneBtn").value
        document.getElementById("myInfo3").remove()
        newNode.id = "myInfo3"
        
        document.getElementById("myPhoneNumberBtn").before(newNode)
        
        var temp = document.getElementById("myPhoneNumberBtn")
        temp.value = "연락처 변경"
        temp.setAttribute("onclick", "ChangeMyPhoneNumber(this)")

        document.getElementById("cancelChangePhoneBtn").remove();
    }

    function CheckMyPhoneNumberEvent(){
        var flag = document.getElementById("myInfo3")
        if(flag.value.length <= 12)
            alert("연락처를 확인해주세요")  
        else{
            var url = "/action/changeMyPhoneNumber.jsp"
            var target = "phoneCheck"
            window.open(url, target, "width=500, height=250")
            var form = document.getElementById("myInfo")
            form.action = url
            form.target = target
            form.submit()
        }
    }

    //--------------생일 변경-------------------
    function ChangeMyBirth(elem){
        var oldNode = document.getElementById("myInfo4")
        var newNode = document.createElement("input")
        newNode.id = "myInfo4"
        newNode.name = "birth"
        newNode.class = "stdInput"
        newNode.type = "date"
        newNode.value = oldNode.innerHTML

        var newBtn = document.createElement("button")
        newBtn.id = "cancelChangeBirthBtn"
        newBtn.value = oldNode.innerHTML
        newBtn.style.marginLeft = "10px"
        newBtn.setAttribute("onclick", "CancelChangeBirthEvent()")
        newBtn.innerHTML = "취소"

        oldNode.remove()

        elem.before(newNode)

        elem.value = "변경 완료"
        elem.setAttribute("onclick", "CheckMyBirthEvent()")
        elem.after(newBtn)
    }

    function CancelChangeBirthEvent(){
        var newNode = document.createElement("span")
        newNode.innerHTML = document.getElementById("cancelChangeBirthBtn").value
        document.getElementById("myInfo4").remove()
        newNode.id = "myInfo4"
        
        var temp = document.getElementById("changeBirthBtn")

        temp.before(newNode)
        temp.value = "생일 변경"
        temp.setAttribute("onclick", "ChangeMyBirth(this)")

        document.getElementById("cancelChangeBirthBtn").remove();
    }

    function CheckMyBirthEvent(){
        var url = "/action/changeMyBirth.jsp"
        var target = "birthCheck"
        window.open(url, target, "width=500, height=250")
        var form = document.getElementById("myInfo")
        form.action = url
        form.target = target
        form.submit()
    }

    //--------------성별 변경-------------------
    function ChangeMyGender(elem){
        /*<div id="gender">
                성별 선택<br>
                남성<input name="gender" type="radio" value="남성">
                여성<input name="gender" type="radio" value="여성">
                비공개<input name="gender" type="radio" value="비공게">
        </div>*/

        var oldNode = document.getElementById("myInfo5")
        var newNodeContain = document.createElement("div")
        newNodeContain.id = "myInfo5"
        for(var i = 0; i < 3; i++){
            var newSpan = document.createElement("span")
            var newNode = document.createElement("input")
            newNode.name = "gender"
            newNode.type = "radio"
            if(i == 0){
                if(oldNode.innerHTML == "남성")
                    newNode.checked = true
                newNode.value = "남성"
                newSpan.innerHTML = "남성"
            }
            if(i == 1){
                if(oldNode.innerHTML == "여성")
                    newNode.checked = true
                newNode.value = "여성"
                newSpan.innerHTML = "여성"
            }
            if(i == 2){
                if(oldNode.innerHTML == "비공개")
                    newNode.checked = true
                newNode.value = "비공개"
                newSpan.innerHTML = "비공개"
            }
            newSpan.appendChild(newNode)
            newNodeContain.appendChild(newSpan)
        }
        newNodeContain.style.marginBottom = "5px"

        var newBtn = document.createElement("button")
        newBtn.id = "cancelChangeGenderBtn"
        newBtn.value = oldNode.innerHTML
        newBtn.style.marginLeft = "10px"
        newBtn.setAttribute("onclick", "CancelChangeGenderEvent()")
        newBtn.innerHTML = "취소"

        oldNode.remove()

        elem.before(newNodeContain)

        elem.value = "변경 완료"
        elem.style.marginLeft = "0"
        elem.setAttribute("onclick", "CheckMyGenderEvent()")
        elem.after(newBtn)
    }

    function CancelChangeGenderEvent(){
        var newNode = document.createElement("span")
        newNode.innerHTML = document.getElementById("cancelChangeGenderBtn").value
        document.getElementById("myInfo5").remove()
        newNode.id = "myInfo5"
        
        var temp = document.getElementById("changeGenderBtn")

        temp.before(newNode)
        temp.value = "성별 변경"
        temp.style.marginLeft = "10px"
        temp.setAttribute("onclick", "ChangeMyGender(this)")

        document.getElementById("cancelChangeGenderBtn").remove();
    }

    function CheckMyGenderEvent(){
        var url = "/action/changeMyGender.jsp"
        var target = "genderCheck"
        window.open(url, target, "width=500, height=250")
        var form = document.getElementById("myInfo")
        form.action = url
        form.target = target
        form.submit()
    }

    function LogoutEvent(){
        var url = "/action/logout.jsp"
        var target = "logout"
        window.open(url, target, "width=10, height=10")
    }
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./css/nav.css">
    <title>Document</title>
</head>

<body>
    <!-- onmouseout은 태그가 변경되면 out됐다고  판정하므로 사용불가 -->
    <nav onmouseleave="HideWideNavEvent()">

        <span id="goMain" onclick="GoEvent(-1)"></span>
        <span id="introduceBtn" class="navBtn" onmouseover="ShowWideNavEvent(this)" onmouseout="HideSvgEvent(this, 0)">자기소개</span>
        <span id="hwBtn" class="navBtn" onmouseover="ShowWideNavEvent(this)" onmouseout="HideSvgEvent(this, 0)">과제들 </span>
        <span id="boardBtn" class="navBtn" onmouseover="ShowWideNavEvent(this)" onmouseout="HideSvgEvent(this, 0)">게시판</span>

        <div id="fullSelectArea">
            <div class="fullSelectSeg"  onmouseover="ShowSvgEvent(this, 1)" onmouseout="HideSvgEvent(this, 1)">
                <div class="svgContain">
                    <p id="introduceBtnLine" class="btnLine"></p>
                    <svg id="introduceBtnSvgTri" class="svgTri">
                        <path d="M 10 10 L 20 0 L 0 0"></path>
                    </svg>
                </div>
                <div class="fullBtn" onclick="GoEvent(0)">자기소개</div>
            </div>
            
            <div class="fullSelectSeg" onmouseover="ShowSvgEvent(this, 1)" onmouseout="HideSvgEvent(this, 1)">
                <div class="svgContain">
                    <p id="hwBtnLine" class="btnLine"></p>
                    <svg id="hwBtnSvgTri" class="svgTri">
                        <path d="M 10 10 L 20 0 L 0 0"></path>
                    </svg>
                </div>
                <div class="fullBtn" onclick="GoEvent(1)">컴퓨터 견적</div>
                <div class="fullBtn" onclick="GoEvent(2)">유튜브</div>
                <div class="fullBtn" onclick="GoEvent(3)">숫자야구</div>
                <div class="fullBtn" onclick="GoEvent(4)">사진퍼즐</div>
            </div>
            <div class="fullSelectSeg fullSelectSegEnd" onmouseover="ShowSvgEvent(this, 1)" onmouseout="HideSvgEvent(this, 1)">
                <div class="svgContain">
                    <p id="boardBtnLine" class="btnLine"></p>
                    <svg id="hwBtnSvgTri" class="svgTri">
                        <path d="M 10 10 L 20 0 L 0 0"></path>
                    </svg>
                </div>
                <div class="fullBtn" onclick="GoEvent(5)">자유게시판</div>
            </div>
        </div>

        <div id="menu" onclick="ShowMyBannerEvent()">=</div>
    </nav>

    <div id = "myBanner">
        <div id="menu" onclick="HideMyBannerEvent()">X</div>
        <span id="loginText">로그인하셔야합니다.</span>
        <form method="post" id="loginSeg">
            <div>
                <input type="text" id="loginId" name ="id" class="loginInput">
                <input type="password" id="loginPw" name="pw" class="loginInput">
            </div>
            <input type="button" id="loginBtn" value="로그인" onclick="LoginEvent()">
        </form>
        <div id="registerAndFind">
            <span id="registerBtn" onclick="ShowRegisterEvent()">
                회원가입
            </span>
            <span id="loginFindSeg">
                <span onclick="ShowFindIdEvent()">ID찾기</span>
                <span onclick="ShowFindPwEvent()">비밀번호 찾기</span>
            </span>
        </div>

        <div id="userSector">
            <div class="userSeg" onclick="ShowMyInfoEvent()">
                내 정보
            </div>
            <div class="userSeg">
                내가 쓴 글
            </div>
            <div class="userSeg userSegLast">
                내가 쓴 댓글
            </div>
        </div>

        <div id="logout" onclick="LogoutEvent()">로그아웃</div>
    </div>

    <form id="findId">
        <span id="loginText">ID찾기</span>
        <div id="menu" onclick="HideFindIdEvent()">X</div>
        <div class = "infoBox">
            <span><br>연락처를 입력해주세요</span>
            <div id="phoneNumberAndBtn">
                <input maxlength="13" placeholder="예) 010-1234-5678" 
                id = "findIdPhoneNumber" name="phoneNumber" class="stdInput" type="text" oninput="ValidPhoneNumberEvent(this)">
                <input class="idCheckBtn" type="button" value="입력" onclick="FindIdEvent()">
            </div>
        </div>
        <div>
            <span id="findIdRes"></span>
        </div>
    </form>

    <div id="findPwContain">
        <form id="findPw">
            <span id="loginText">비밀번호 찾기</span>
            <div id="menu" onclick="HideFindPwEvent()">X</div>
            <div class = "infoBox">
                <span><br>아이디를 입력해주세요</span>
                <input id = "findPwId" name="id" class="stdInput" maxlength="30" type="text" oninput="ValidIdEvent(this)">
            </div>
            <div class = "infoBox">
                <span><br>연락처를 입력해주세요</span>
                <input maxlength="13" placeholder="예) 010-1234-5678"
                id = "findPwPhoneNumber" name="phoneNumber" class="stdInput" type="text" oninput="ValidPhoneNumberEvent(this)">
            </div>
            <input class="checkRegisterBtn" type="button" value="입력" onclick="FindPwEvent()">

            <div class="findPwResContain">
                <div id="findPwRes"></div>

                <div id="changePw">
                    <div class="regMargin">
                        비밀번호<br>
                        <input  id="newPw" name="newPw" class="stdInput" maxlength="30" type="password" oninput="ValidNewPwEvent()">
                    </div>
                    <div class="regMargin">
                        비밀번호 재입력<br>
                        <input id="newPwAgain" class="stdInput" type="password" oninput="ValidNewPwEvent()">
                    </div>
                    <div id="newPwCheckRes" class="checkRes">
                    비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다
                    </div>
                    <input class="checkRegisterBtn" type="button" value="입력" onclick="ChangeNewPwEvent()">
                </div>

            </div>
        </form>
    </div>

    <form id="myInfo">
        <span id="loginText">내 정보</span>
        <div id="menu" onclick="HideMyInfoEvent()">X</div>
        <div class = "infoBox">
            <span>닉네임 : </span>
            <span id = "myInfo0"></span>
            <input id = "changeNickBtn" class="infoBtn" type="button" value="닉네임 변경" onclick="ChangeNickEvent(this)">
            <div id="myNickNameCheckRes" class="checkRes"></div>
        </div>
        <div class = "infoBox">
            <span>ID : </span>
            <span id = "myInfo1"></span>
        </div>
        <div class = "infoBox">
            <span>비밀번호 : </span>
            <input type="button" class="infoBtn" value="비밀번호 변경"onclick="ShowChangeMyPwEvent()">
            <div id="changeMyPw" style="display: none;">
                <div class="regMargin"> 
                    현재 비밀번호<br>
                    <input id = "myCurPw" name="curPw" class="stdInput" maxlength="30" type="password" oninput="ValidMyPwEvent()">
                </div>
                <div class="regMargin">
                    새 비밀번호<br>
                    <input id = "myNewPw" name="newPw" class="stdInput" maxlength="30" type="password" oninput="ValidMyNewPwEvent()">
                </div>
                <div class="regMargin">
                    새 비밀번호 재입력<br>
                    <input id = "myNewPwAgain" class="stdInput" maxlength="30" type="password" oninput="ValidMyNewPwEvent()">
                </div>
                <div id="myPwCheckRes" class="checkRes">
                    비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다
                </div>
                <div>
                    <input class="checkRegisterBtn" type="button" value="입력" onclick="ChangeMyPwEvent()"> 
                    <input class="checkRegisterBtn" type="button" value="취소" onclick="CancelChangeMyPwEvent()">
                </div>
            </div>
        </div>
        <div class = "infoBox">
            <span>연락처 : </span>
            <span id = "myInfo3"></span>
            <input type="button" id="myPhoneNumberBtn" name="phoneNumber" class="infoBtn" value="연락처 변경" onclick="ChangeMyPhoneNumber(this)">
        </div>

        <div class = "infoBox">
            <span>생일 : </span>
            <span id = "myInfo4"></span>
            <input id = "changeBirthBtn" type="button" class="infoBtn" value="생일 변경" onclick="ChangeMyBirth(this)">
        </div>

        <div class = "infoBox">
            <span>성별 : </span>
            <span id = "myInfo5"></span>
            <input id="changeGenderBtn" type="button" class="infoBtn" value="성별 변경" onclick="ChangeMyGender(this)">
        </div>
        <input id= "myInfo6" name="id" style="display:none;">
    </form>

    <form method="post" id="register">
        <div id="menu" onclick="HideRegisterEvent()">X</div>

        <span id="loginText">회원가입</span>

        <div class="regMargin">
            닉네임<br>
            <div class="idInputSector">
                <input  id="nickName" name="nickName" maxlength="15" class="stdInput" type="text" oninput="ValidNickNameEvent(this)">
                <input class="idCheckBtn" type="button" value="중복확인" onclick="CheckNickNameEvent()">
            </div>
            <div id="nickNameCheckRes" class="checkRes" value = "0">
                닉네임은 한글, 영문, 숫자 조합으로 2자 이상 15자 이하 가능합니다.
            </div>
        </div>

        <div class="regMargin">
            아이디<br>
            <div class="idInputSector">
                <input  id="id" name="id" class="stdInput" maxlength="30" type="text" oninput="ValidIdEvent(this)">
                <input class="idCheckBtn" type="button" value="중복확인" onclick="CheckIdEvent()">
            </div>
            <div id="idCheckRes" class="checkRes" value = "0">
                아이디는 영문, 숫자, 특수문자 조합으로 7자 이상 30자 이하 가능합니다.   
            </div>
        </div>

        <div class="regMargin">
            비밀번호<br>
            <input  id="pw" name="pw" class="stdInput" maxlength="30" type="password" oninput="ValidPwEvent()">
        </div>
        <div class="regMargin">
            비밀번호 재입력<br>
            <input  id="pwAgain" class="stdInput" type="password" oninput="ValidPwEvent()">
        </div>
        <div id="pwCheckRes" class="checkRes">
            비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다
        </div>

        <div class="regMargin">
            연락처 입력<br>
            <div class="idInputSector">
                <input maxlength="13" placeholder="예) 010-1234-5678"
                id="phoneNumber" name="phoneNumber" class="stdInput" type="text" oninput="ValidPhoneNumberEvent(this)">
                <input class="idCheckBtn" type="button" value="중복확인" onclick="CheckPhoneNumberEvent()">
             </div>
             <div id="phoneCheckRes" class="checkRes"></div>
        </div>
        <div class="regMargin">
            생년월일 입력<br>
            <input id="birth" name="birth" class="stdInput" type="date">
        </div>
        <div class="regMargin">
            <div id="gender">
                성별 선택<br>
                남성<input name="gender" type="radio" value="남성">
                여성<input name="gender" type="radio" value="여성">
                비공개<input name="gender" type="radio" value="비공게">
            </div>
        </div>
        <input class="checkRegisterBtn" type="button" value="회원가입" onclick="CheckRegisterEvent()">
    </form>

    <script src="/js/nav.js"></script>
</body>