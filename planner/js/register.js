var pwValid = false

MakeBirth()

function MakeBirth(){
    var now = new Date();	// 현재 날짜 및 시간
    var year = now.getFullYear();
    var month = now.getMonth()+1;
    var day = now.getDate();

    var temp = document.createElement("select")
    temp.id = "year"
    temp.style.width = "140px"
    temp.style.height = "40px"
    temp.style.fontSize = "20px"
    temp.style.fontFamily = "nav"

    for(var i = year; i >= 1905; i--){
        var temp1 = document.createElement("option")
        if(i == year)
            temp1.selected = true;
        temp1.value = i
        temp1.innerHTML = i
        temp.appendChild(temp1)
    }
   

    document.getElementById("birthSelect").appendChild(temp)
    
    var temp = document.createElement("select")
    temp.id = "month"
    temp.style.width = "140px"
    temp.style.height = "40px"
    temp.style.fontSize = "20px"
    temp.style.fontFamily = "nav"

    for(var i = 1; i <= 12; i++){
        var temp1 = document.createElement("option")
        if(i == month)
            temp1.selected = true;
        temp1.value = i
        temp1.innerHTML = i
        temp.appendChild(temp1)
    }
    temp.style.width = "140px"
    document.getElementById("birthSelect").appendChild(temp)

    var temp = document.createElement("select")
    temp.id = "day"
    temp.style.width = "140px"
    temp.style.height = "40px"
    temp.style.fontSize = "20px"
    temp.style.fontFamily = "nav"

    for(var i = 1; i <= 31; i++){
        var temp1 = document.createElement("option")
        if(i == day)
            temp1.selected = true;
        temp1.value = i
        temp1.innerHTML = i
        temp.appendChild(temp1)
    }
    temp.style.width = "140px"
    document.getElementById("birthSelect").appendChild(temp)
}

function ValidPhoneNumberEvent(elem) {
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

function ValidNickNameEvent(elem){
    var str = elem.value
    str = str.replace(/[^(ㄱ-하)(ㅏ-ㅣ)(가-힣)(a-z)(A-Z)(0-9)]/g, '');
    elem.value = str;
}

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

function GoRegEvent(){
    var name = document.getElementById("name")
    var email = document.getElementById("email")
    var phoneNumber = document.getElementById("phoneNumber")
    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    if(name.value == "" || name.value.length < 2)
        alert("이름을 확인해주세요")
    else if(!regex.test(email.value))
        alert("이메일을 확인해주세요")
    else if(phoneNumber.value == "" || phoneNumber.value.length < 13)
        alert("전화번호를 확인해주세요")
    else if(pwValid == false)
        alert("비밀번호를 확인해주세요")
    else{
        var now = new Date()	
        var year = now.getFullYear()
        var month = now.getMonth()+1;
        var day = now.getDate();
        if(year == document.getElementById("year").value){
            if(month == document.getElementById("month").value){
                if(day < document.getElementById("day").value)
                    alert("생일을 확인해주세요")
                else
                    CheckGender()
            }
            else if(month < document.getElementById("month").value)
                alert("생일을 확인해주세요")
            else
                CheckGender()
        }
        else
            CheckGender()
    }
   
}

function CheckGender(){
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
        alert("회원가입 완료")
        location.href = "./login.jsp"
    }
}