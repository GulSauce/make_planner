var sideMenuOpen = false

MakeDate()

function MakeDate(){
    var now = new Date();	// 현재 날짜 및 시간
    var year = now.getFullYear();
    var month = now.getMonth()+1;
    var day = now.getDate();

    var temp = document.createElement("select")
    temp.id = "year"
    temp.style.width = "100px"
    temp.style.height = "40px"
    temp.style.fontSize = "20px"
    temp.style.fontFamily = "nav"
    temp.style.marginRight = "20px"

    for(var i = year; i >= 1905; i--){
        var temp1 = document.createElement("option")
        if(i == year)
            temp1.selected = true;
        temp1.value = i
        temp1.innerHTML = i
        temp.appendChild(temp1)
    }
   

    document.getElementById("dateSelect").appendChild(temp)
    
    var temp = document.createElement("select")
    temp.id = "month"
    temp.style.width = "100px"
    temp.style.height = "40px"
    temp.style.fontSize = "20px"
    temp.style.fontFamily = "nav"
    temp.style.marginRight = "20px"

    for(var i = 1; i <= 12; i++){
        var temp1 = document.createElement("option")
        if(i == month)
            temp1.selected = true;
        temp1.value = i
        temp1.innerHTML = i
        temp.appendChild(temp1)
    }
    document.getElementById("dateSelect").appendChild(temp)
}

function ShowMenuEvent(){
    var temp = document.getElementById("sideMenu")
    if(sideMenuOpen == false){
        sideMenuOpen = true
        temp.style.display = "block"
    }
    else{
        sideMenuOpen = false
        temp.style.display = "none"
    }
}