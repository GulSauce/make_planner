function GoLoginEvent(){
    var name = document.getElementById("name")
    var phoneNumber = document.getElementById("phoneNumber")
    if(name.value == "")
        alert("이름을 입력해주세요")
    else if(phoneNumber.value == "")
        alert("전화번호를 입력해주세요")
    else{
        alert("해당하는 이메일 : 입니다.")
        location.href = "login.jsp"
    }
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