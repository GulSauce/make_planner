var pwValid = false

function ValidPwEvent(){
    pwValid = false;
    var flag = document.getElementById("pw")
    var pwAgain = document.getElementById("pwAgain")
    var temp = document.getElementById("pwCheckRes")

    var str = flag.value
    str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
    flag.value = str;

    str = pwAgain.value
    str = str.replace(/[^(!@\#$%^&*\(\)\-+\=)(a-z)(A-Z)(0-9)]/g, '');
    pwAgain.value = str;

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
                    pwValid = true
                    temp.innerHTML = "비밀번호가 일치합니다."
                    temp.style.color = "blue"
                }
                else{
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

function GoLoginEvent(){
    if(pwValid == false)
        alert("비밀번호를 확인해주세요.")
    else {
        alert("비밀번호 변경이 완료되었습니다.")
        location.href = "login.jsp"
    }
}
