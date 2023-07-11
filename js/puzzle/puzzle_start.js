//브라우저 자체 전역변수 한프로젝트 안에서만 교환한다
localStorage.clear()

function ProcessImg(){
    localStorage.clear()
    let selectFile = document.querySelector(".upload").files[0];
    var fReader = new FileReader()
    fReader.readAsDataURL(selectFile)
    fReader.onloadend=function(event){
        console.log(event.target.result)
        localStorage.setItem("href", event.target.result)
        document.getElementById("uploadImage").src = event.target.result
    }
}

function CustomNext(){
    var cnt = document.getElementById("customRowCnt")
    var tm = document.getElementById("customTime")
    if(localStorage.length == 0){
        alert("사진을 선택해 주세요")
        return
    }
    //예외처리 문자처리는 못함
    if(cnt.value == 0 || tm.value == 0) 
        return
    localStorage.setItem("cnt", cnt.value)
    localStorage.setItem("time", tm.value)
    location.href = "puzzle_main.jsp"
}

function MakeLineEvent(cnt){
    for(var i = 0; i < parseInt(cnt)+1; i++){
        var block = document.createElement("hr") 
        block.id = "Row"
        document.getElementById("RowLine").appendChild(block)

        block = document.createElement("hr")
        block.id = "Column"
        document.getElementById("ColumnLine").appendChild(block)
    }
}

function MakeCustomLineEvent(){
    var parm = document.getElementById("customRowCnt")
    MakeLineEvent(parm.value)
}

function DelLineEvent(){
    document.getElementById("RowLine").replaceChildren();
    document.getElementById("ColumnLine").replaceChildren();
}

function MakeExpEvent(cnt){
    var temp =  document.getElementById("exp")
    if(cnt == -1)
        temp.innerHTML = "원하는 칸수와 시간을 설정할 수 있습니다."
    else
        temp.innerHTML = (cnt)+"x"+(cnt)+" 퍼즐입니다."
}

function EreaseExpEvent(){
    document.getElementById("exp").innerHTML = ""
}


function Next(cnt, time){
    if(localStorage.length == 0){
        alert("사진을 선택해 주세요")
        return
    }
    location.href = "puzzle_main.jsp"  
    localStorage.setItem("cnt", cnt)
    localStorage.setItem("time", 30)
}
