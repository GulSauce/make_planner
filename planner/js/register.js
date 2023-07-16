MakeBirth()

function MakeBirth(){
    var now = new Date();	// 현재 날짜 및 시간
    var year = now.getFullYear();
    var month = now.getMonth()+1;
    var day = now.getDate();

    var temp = document.createElement("select")
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
