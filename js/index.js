var cur = 0;
var max = 5;
var nameNotDouble = 0;
var idNotDouble = 0;
var pwSync = 0;

ArticleInit()
ArticleCycle()

function ArticleInit(){
    document.getElementById("bg").style.backgroundImage = 'url("../source/web_page/과제0.png")'
    for(var i = 1; i < max; i++){
        document.getElementById("art"+i).style.opacity = 0;
        document.getElementById("art"+i).style.display = "none";
    }    
}

function ArticleCycle(){
    var aniEvent = document.getElementById("timerBar")
    aniEvent.addEventListener("animationend", function(){
        // 애니메이션 재시작을 위한 classList제거
        aniEvent.classList.remove("effect")

        var temp0 = document.getElementById("art"+cur);
        temp0.style.opacity = 0;

        var bg =  document.getElementById("bg");
        bg.style.opacity = 0;

        var temp1 = document.getElementById("art"+(cur+1)%max);
        temp1.style.display = "block"

 
        temp0.addEventListener("transitionend", ChangeArt)
    })    
}

function ChangeArt(){
    var temp0 = document.getElementById("art"+cur);
    var temp1 = document.getElementById("art"+(cur+1)%max);
    var bg =  document.getElementById("bg");
    
    temp0.style.display = "none"
    temp1.style.opacity = 1;
    bg.style.backgroundImage= 'url("../source/web_page/과제'+(cur+1)%max+'.png")'
    bg.style.opacity = 0.5; 

    temp0.removeEventListener("transitionend", ChangeArt)
    temp1.addEventListener("transitionend", TimerStart)
}

function TimerStart(){
    var aniEvent = document.getElementById("timerBar")
    aniEvent.classList.add("effect")
    var temp1 = document.getElementById("art"+(cur+1)%max);
    temp1.removeEventListener("transitionend", TimerStart)
    cur = (cur+1)%max
}

