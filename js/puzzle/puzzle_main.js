var isFill = 0
var block
var pos
var endFlag = 0;
var cnt = localStorage.getItem("cnt")
console.log(localStorage.getItem("href"))
var imgUrl = localStorage.getItem("href")

MakeBoardEvent(cnt)
MakeTakeEvent(cnt)
ClockCnt()

function delay(ms = 1000) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}  

const end = document.getElementById("bar");
    end.addEventListener("animationend", async function(){
        await delay(200);
        alert("GAME OVER!");
})

async function ClockCnt(){
    var GEBI =  document.getElementById("clock")
    var time = localStorage.getItem("time")
    // 우선순위 자바스크립트 > CSS

    document.getElementById("bar").style.animationDuration = time+"s"
    for(var i = time; i >= 0; i--){
        if(endFlag == 1) return
        if(i<=10)
            GEBI.style.color = "red";
        GEBI.innerHTML = i
        await delay(1000)
    }
}

function MakeBoardEvent(cnt){
    for(var i = 0; i < cnt; i++){
        var row = document.createElement("div")
        row.id="row"+i
        for(var j = 0; j < cnt; j++){
            var block = document.createElement("div")
            //문자열 "false"말고 bool형 false 줘야됨
            block.draggable = false;
            block.addEventListener('dragstart', function(){if(this.draggable != false) MakeDragEvent(this)})
            block.addEventListener('dragover', function(){DragOverEvent(event)})
            block.addEventListener('drop', function(){DropEvent(this)})
            block.id = "destBlock"+(i*(cnt)+j)
            block.className = "boardBlock"
            block.style.width = 500/cnt+"px";
            block.style.height = 500/cnt+"px";
            // getElemenyByID 말고 멤버함수로
            row.appendChild(block) 
        }
        row.style.height = 500/cnt+"px";
        document.getElementById("dropPos").appendChild(row)
    }
}

function MakeTakeEvent(cnt){
    for(var i = 0; i < cnt; i++){
        var row = document.createElement("div")
        for(var j = 0; j < cnt; j++){
            block = document.createElement("div")
            //직접 outer html에 추가하는 법은 없을까? 
            block.id = "block"+(i*(cnt)+j)
            block.draggable = "true"
            block.addEventListener('dragstart', function(){if(this.draggable != false) MakeDragEvent(this)})
            block.addEventListener('dragover', function(){DragOverEvent(event)})
            block.addEventListener('drop', function(){DropEvent(this)})
            block.className = "boardBlock"
            block.style.backgroundImage = "url("+imgUrl+")"
            block.style.backgroundSize = "500px 500px"
            block.style.backgroundPosition = Math.round(-j*500/cnt)+"px " + Math.round(-i*500/cnt) +"px" 
            block.style.width = 500/cnt+"px";
            block.style.height = 500/cnt+"px";
            // getElemenyByID 말고 멤버함수로
            row.appendChild(block)
            
        }
        row.style.height = 500/cnt+"px";
        document.getElementById("takePos").appendChild(row)
    }
    MakeRand(cnt)
}

function MakeRand(cnt){
    var iter = 10000
    while(iter--){
        rand1 = Math.floor(Math.random()*cnt*cnt);
        rand2 = Math.floor(Math.random()*cnt*cnt);
        var source = document.getElementById("block"+rand1);
        var dest = document.getElementById("block"+rand2);
        //그냥 dest로 하면 dest 바뀌면 바뀐다 절대참조인 것으로 추정
        var tempPos = source.style.backgroundPosition
        source.style.backgroundPosition = dest.style.backgroundPosition
        dest.style.backgroundPosition = tempPos
    }
}

//이벤트리스너 지정 없이 함수를 호출할 경우에 이벤트가 발생하지 않아도 해당 함수가 호출돼버림
function MakeDragEvent(elem){
    pos = elem.style.backgroundPosition
    //이렇게 하면 undefined 됨 왜? position 출력 형식이 정의되지않았다!
    //console.log(pos)
    block = elem
}

function DragOverEvent(elem){
    elem.preventDefault()
}

// 이미지 태그자체를 교환하는 것이 낫다
// 캔버스 태그 공부 필요
function DropEvent(dest){
    //인라인 스타일로 적용하자
    if(block.style.backgroundImage != ""){//빈칸이 아닌 곳에서 가져옴
        var tempPos = block.style.backgroundPosition
        if(dest.draggable == true)
            block.style.backgroundPosition = dest.style.backgroundPosition
        else{//빈 곳으로 사진을 놓음
            if(dest.parentNode.parentNode.id.substr(0,4) != block.parentNode.parentNode.id.substr(0,4)){
                if(dest.parentNode.parentNode.id.substr(0,4)=="drop"){
                    isFill++
                }
                else
                    isFill--
            }
            Empty(block)
        }
        dest.style.backgroundImage = "url("+imgUrl+")"
        dest.style.backgroundPosition = tempPos
        dest.draggable = true
        dest.style.backgroundSize = "500px 500px"
        console.log(isFill)
        if(isFill==cnt*cnt)
            Check()
    }
    else{
        console.log("ERR")
    }
}

function Empty(elem){
    elem.draggable = false;
    elem.style.backgroundImage = ""
    elem.style.backgroundPosition = ""
}

async function Check(elem){
    for(var i = 0; i < cnt; i++){
        for(var j = 0; j < cnt; j++){
            console.log(document.getElementById("destBlock"+(i*cnt+j)).style.backgroundPosition == Math.round(-j*500/cnt)+"px " + Math.round(-i*500/cnt) +"px") 
            if(document.getElementById("destBlock"+(i*cnt+j)).style.backgroundPosition != Math.round(-j*500/cnt)+"px " + Math.round(-i*500/cnt) +"px"){
                
                return
            }
        }
    }
    //사진바뀌기도 전에실행되버림, synchronous하게 실행되니까 따라서 부모함수를 비동기적함수로 정의
    await delay(10)
    document.getElementById("bar").style.animationPlayState = "paused"
    endFlag = 1
    alert("succ")  
}
