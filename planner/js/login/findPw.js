function GoChangePwEvent(){
    var name = document.getElementById("name")
    var email = document.getElementById("email")
    var phoneNumber = document.getElementById("phoneNumber")
    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    if(name.value.length < 2)
        alert("이름을 입력해주세요")
    else if(email.value == "")
        alert("이메일을 입력해주세요")
    else if(!regex.test(email.value))
        alert("이메일을 확인해주세요")
    else if(phoneNumber.value.length < 13)
        alert("전화번호를 입력해주세요")
    else
        location.href = "changePw.jsp"
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