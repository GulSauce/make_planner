function ShowWideNavEvent(elem){
    var temp = document.querySelectorAll(".navBtn")
    for(var i = 0; i < temp.length; i++)
        temp[i].style.width = "400px";

    temp = document.getElementById("fullSelectArea")
    temp.style.height = "250px";
    
    ShowSvgEvent(elem, 0)
}

function HideWideNavEvent(){
    var temp = document.getElementById("fullSelectArea")
    temp.style.height = "0px";

    temp = document.querySelectorAll(".navBtn")
    for(var i = 0; i < temp.length; i++)
        temp[i].style.width = "200px";
    
}

function ShowSvgEvent(elem, flag) {
    var svg 
    if(flag == 0){
        svg = document.getElementById(elem.id+"Line")
        var temp = svg.parentNode.parentNode
        temp.style.backgroundColor = "rgb(245, 245, 245)"
    }
        
    if(flag == 1){
        var temp = elem
        temp.style.backgroundColor = "rgb(245, 245, 245)"
        svg = elem.firstChild.nextSibling.firstChild.nextSibling
    }
   
    svg.style.transform = "scaleX(100)"
    svg.nextSibling.nextSibling.style.display = "inline-block"
}

function HideSvgEvent(elem, flag){
    var svg
    if(flag == 0){
        svg = document.getElementById(elem.id+"Line")
        svg.parentNode.parentNode.style.backgroundColor = "rgb(255, 255, 255)"
    }

    if(flag == 1){
        var temp = elem
        temp.style.backgroundColor = "rgb(255, 255, 255)"
        svg = elem.firstChild.nextSibling.firstChild.nextSibling
    }
    svg.nextSibling.nextSibling.style.display = "none"
    svg.style.transform = "scaleX(0)"
}

function GoEvent(flag){
    if(flag == -1){
        location.href = "../../index.jsp"
    }

    if(flag == 0){
        location.href = "../../jsp/web_page/self_introduce.jsp"
    }

    if(flag == 1)
        location.href = "../../soruce/web_page/computer.pptx"

    if(flag == 2){
        location.href="../../jsp/yt/yt.jsp"
    }

    if(flag == 3){
        location.href="../../jsp/baseball/baseball_start.jsp"
    }

    if(flag == 4){
        location.href="../../jsp/puzzle/puzzle_start.jsp"
    }

    if(flag == 5){
        location.href="../../jsp/web_page/free_board.jsp"
    }
}

function ShowMyBannerEvent(){
    var temp = document.getElementById("myBanner")
    temp.style.width = "40%"
    temp.style.opacity = 1
}

function HideMyBannerEvent(){
    var temp = document.getElementById("myBanner")
    temp.style.width = "0%"
    temp.style.opacity = 0
    document.getElementById("loginId").innerHTML=""
    document.getElementById("loginPw").innerHTML=""
}

function ShowRegisterEvent(){
    var temp = document.getElementById("register")
    temp.style.width = "40%"
    temp.style.opacity = 1
}

function HideRegisterEvent(){
    var temp = document.getElementById("register")
    temp.style.width = "0%"
    temp.style.opacity = 0
    document.getElementById("nickName").value=""
    document.getElementById("nickNameCheckRes").innerHTML="닉네임은 한글, 영문, 숫자 조합으로 2자 이상 15자 이하 가능합니다."
    document.getElementById("id").value=""  
    document.getElementById("idCheckRes").innerHTML="아이디는 영문, 숫자, 특수문자 조합으로 7자 이상 30자 이하 가능합니다."
    document.getElementById("pw").value=""
    document.getElementById("pwAgain").value=""
    document.getElementById("pwCheckRes").innerHTML="비밀번호는 영문, 숫자, 특수문자를 반드시 포함시켜 7자 이상 30자 이하 가능합니다."
    document.getElementById("phoneNumber").value=""
    document.getElementById("phoneCheckRes").innerHTML=""
    document.getElementById("birth").value=""
    var gender = document.getElementsByName("gender");
    for (var i = 0; i < gender.length; i++) {
      	gender[i].checked = false;
    }
}

function ShowMyInfoEvent(){
    var temp = document.getElementById("myInfo")
    temp.style.width = "40%"
    temp.style.opacity = 1
}

function HideMyInfoEvent(){
    var temp = document.getElementById("myInfo")
    temp.style.width = "0%"
    temp.style.opacity = 0
}

function ShowFindIdEvent(){
    var temp = document.getElementById("findId")
    temp.style.width = "40%"
    temp.style.opacity = 1
}

function HideFindIdEvent(){
    var temp = document.getElementById("findId")
    temp.style.width = "0%"
    temp.style.opacity = 0
    document.getElementById("findIdPhoneNumber").value = ""
    document.getElementById("findIdRes").innerHTML = ""
}

function ShowFindPwEvent(){
    var temp = document.getElementById("findPwContain")
    temp.style.width = "40%"
    temp.style.opacity = 1
}

function HideFindPwEvent(){
    var temp = document.getElementById("findPwContain")
    temp.style.width = "0%"
    temp.style.opacity = 0
    document.getElementById("findPwId").value = ""
    document.getElementById("findPwPhoneNumber").value = ""
    document.getElementById("changePw").style.display = "none"
    document.getElementById("findPwRes").innerHTML = ""
    document.getElementById("newPw").value = ""
    document.getElementById("newPwAgain").value = ""
    document.getElementById("newPwCheckRes").innerHTML = ""
}