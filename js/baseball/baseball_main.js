var check = [];
var isRun = false;
var tryCnt = 0;

// 자바스크립트는 자바스크립트안에서만 쓰자
function init(){
    temp = location.href.split("?");
    levelFlag=temp[1]

    var cnt = document.getElementById("leftCnt")

    if(levelFlag  == '1')
        cnt.innerHTML = 10;
    else if(levelFlag  == '2')
        cnt.innerHTML = 20;
    else if(levelFlag  == '3')
        cnt.innerHTML = 99;
    else
        cnt.innerHTML = "ERR";

    var rand;
    var done = 0;

    while(done == 0){
        rand = Math.floor(Math.random()*1000);
        var temp = rand;
        for(var i = 0; i <= 2; i++){
            check[2-i] = temp % 10;
            temp = Math.floor(temp / 10);
        }

        if(check[0] == check[1] || check[0] == check[2] || check[1] == check[2])
            continue;
            
        done = 1;
    }
    console.log(rand);
}

async function playEvent(){
    if(isRun == true){
        return;
    }

    isRun = true;

    if(cnt < 3){
        alert("숫자를 3개 선택하세요.")
        isRun = false;
        return;
    }

    document.getElementById('bg').play()
    
    var leftCnt = document.getElementById("leftCnt")
    leftCnt.innerHTML--;
    tryCnt++;

    const timer = ms => new Promise(res=>setTimeout(res, ms))
    
    await timer(3500)

    var strikeCnt = 0;
    var ballCnt = 0;
    var outCnt = 0;

    for(var i = 0; i <= 2; i++){
        for(var j = 0; j <= 2; j++){
            if(selectNum[i] == check[j]){
                if(i == j)
                    strikeCnt++;
                else
                    ballCnt++;
                break;
            }
            else if (j == 2){
                outCnt++;
            }
        }
    }

    if(strikeCnt > 0)
        document.getElementById('strikeSound').play()

    else if(ballCnt > 0)
        document.getElementById('ballSound').play() 

    else 
        document.getElementById('outSound').play() 

    var strike = document.getElementById("strike")
    strike.innerHTML = strikeCnt + " S"

    var ball = document.getElementById("ball")
    ball.innerHTML = ballCnt + " B"

    var out = document.getElementById("out")
    out.innerHTML = outCnt + " O"

    var log = document.getElementById("log")
    log.innerHTML = 
    "<div class='information'>" + tryCnt + ". " +selectNum[0]+selectNum[1]+selectNum[2]+" "+strikeCnt + "S " + ballCnt + "B " +outCnt + "O"+"</div> <br>"  + log.innerHTML;

    ChooseEventClear();
    
    if(strikeCnt == 3){
        await timer(1000)
        var ending = document.getElementById("ending")
        ending.style.display = 'block'
        ending.innerHTML = "<div>클리어했습니다!" + "<br>" + "<font color='red'>" + tryCnt + "번</font> 만에 성공했습니다.</div>"+ending.innerHTML
        document.getElementById('clearSound').play()
        return;
    }

    else if(leftCnt.innerHTML == 0){
        var ending= document.getElementById("ending")
        ending.innerHTML = "<div>GAME OVER!!" + "<br>" + "<font color='red'>" + tryCnt + "번</font> 시도했으나 실패했습니다.</div>"+ending.innerHTML
        ending.style.display = 'block'
    }

    isRun = false;
}

var cnt = 0;
var selectNum = [];

function ChooseEvent(num){
    if(cnt >= 3)
        return

    for(var i = 0; i < 3; i++){
        if(selectNum[i] == num){
            alert("이미 존재하는 숫자입니다!")
            return
        }
    }
    if(cnt == 0){
        document.getElementById('first').innerHTML = num;
        selectNum[0] = num;
    }
    if(cnt == 1){
        document.getElementById('second').innerHTML = num;
        selectNum[1] = num;
    }
    if(cnt == 2){
        document.getElementById('third').innerHTML = num;
        selectNum[2] = num;
    }
    cnt++;
}


function ChooseEventClear(){
    document.getElementById('first').innerHTML = "";
    document.getElementById('second').innerHTML = "";
    document.getElementById('third').innerHTML = "";
    cnt= 0;
    for(var i = 0; i<=2; i++)
        selectNum[i] = "-1";
}

function EraseEvent(){
    if(cnt == 1){
        document.getElementById('first').innerHTML = "";
        selectNum[0] = -1;
    }
    if(cnt == 2){
        document.getElementById('second').innerHTML = "";
        selectNum[1] = -1;
    }
    if(cnt == 3){
        document.getElementById('third').innerHTML = "";
        selectNum[2] = -1;
    }
    if(cnt >= 1)
        cnt--;
}

function MenuCallEvent(){
    var menu = document.getElementById("baseball_menu")
    menu.style.display = 'block'
}

function MenuCloseEvent(){
    var menu = document.getElementById("baseball_menu")
    menu.style.display = 'none'
}

function GoStartEvent(){
    location.replace("baseball_start.jsp")
}

function RetryEvent(){
    location.reload();
}



