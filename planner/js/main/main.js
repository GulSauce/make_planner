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
    document.getElementById("miniDateSelect").appendChild(temp.cloneNode(true))
    
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
    document.getElementById("miniDateSelect").appendChild(temp.cloneNode(true))
}

function ShowMenuEvent(){
    var temp = document.getElementById("sideMenu")
    if(sideMenuOpen == false){
        sideMenuOpen = true
        if (matchMedia("screen and (max-width: 1024px)").matches){
            document.getElementById("sideMenu").style.transitionDuration = "0s"
            temp.style.width = "100%"   
        }
        else{
            document.getElementById("sideMenu").style.transitionDuration = "0.5s"
            temp.style.width = "30%"
        }        
    }
    else{
        sideMenuOpen = false
        temp.style.width = "0px"
    }
}

function GoLoginEvent(){
    location.href = "/planner/jsp/login/login.jsp"
}

function OpenAddScheduleEvent(){
    var popupWidth = 800;
    var popupHeight = 400;

    var popupX = (window.screen.width / 2) - (popupWidth / 2);
    // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

    var popupY= (window.screen.height / 2) - (popupHeight / 2);

    window.open("/planner/jsp/main/addSchedule.jsp", "_blank", "width=800,height=400"+
    ', left='+ popupX + ', top='+ popupY);
}