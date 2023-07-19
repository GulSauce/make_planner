function GoChangePwEvent(){
    var name = document.getElementById("name")
    var email = document.getElementById("email")
    var phoneNumber = document.getElementById("phoneNumber")
    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    if(name.value == "")
        alert("이름을 입력해주세요")
    else if(email.value == "")
        alert("이메일을 입력해주세요")
    else if(!regex.test(email.value))
        alert("이메일을 확인해주세요")
    else if(phoneNumber.value == "")
        alert("전화번호를 입력해주세요")
    else
        location.href = "changePw.jsp"
}

