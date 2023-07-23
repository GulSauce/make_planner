var autoClick = false

function GoRegisterEvent(){
    location.href = "/planner/jsp/login/register.jsp"
}

function GoFindEmailEvent(){
    location.href = "/planner/jsp/login/findEmail.jsp"
}

function GoFindPwEvent(){
    location.href = "/planner/jsp/login/findPw.jsp"
}

function ChangeAutoEvent(){
    var autoImg = document.getElementById("autoImg")
    if(autoClick == false){
        autoImg.src = "/planner/source/auto_click.png"
        autoClick = true
    }
    else if(autoClick == true){
        autoImg.src = "/planner/source/auto_not_click.png"
        autoClick = false
    }
}

function GoMainEvent(){
    var email = document.getElementById("email")
    var pw = document.getElementById("pw")

    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');

    if(!regex.test(email.value))
        alert("이메일을 확인해주세요")
    else if(pw.value == "")
        alert("비밀번호를 입력해주세요")
    else
        location.href="/planner/jsp/main/main.jsp"
}