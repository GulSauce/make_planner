function ExpEvent(flag){
    if(flag == 1)
        document.getElementById("exp").innerHTML = "어려움 난이도입니다.<br>기회는 <font color='red'>10번</font>입니다."
    
    if(flag == 2)
        document.getElementById("exp").innerHTML = "보통 난이도입니다.<br>기회는 <font color='red'>20번</font>입니다."

    if(flag == 3)
    document.getElementById("exp").innerHTML = "쉬움 난이도입니다.<br>기회는 <font color='red'>99번</font>입니다."
}

function ClearEvent(){
    document.getElementById("exp").innerHTML = ""
}

var levelFlag = -1;

async function StartEvent(flag){
    var start = document.getElementById("start")
    start.play()
    var bgm = document.getElementById("bgm")

    const timer = ms => new Promise(res=>setTimeout(res, ms))
    for(var i = 0; i < 100; i++){
        //부동소숫점 연산의 부정확성 때문에 정수레벨에서 연산 수행
        var temp = bgm.volume*1000
        temp = temp - 3
        bgm.volume = temp/1000
        console.log(bgm.volume)
        await timer(30)
    }
    levelFlag = flag;
    location.href="baseball_main.jsp?" + flag
}

