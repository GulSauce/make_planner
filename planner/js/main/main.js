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
    var duration
    if (matchMedia("screen and (max-width: 700px)").matches)
        duration = 0;
    else
        duration = 250;

    if(sideMenuOpen == false){
        sideMenuOpen = true
        temp.animate(
            {
                transform: [
                'translateX(0%)',  // 시작 값
                'translateX(-100%)'  // 종료 값
                ]
            },
            {
                duration: duration,  // 밀리초 지정
                fill: 'forwards',  // 종료 시 속성을 지님
                easing: 'linear'  // 가속도 종류
            }
        );
    }
    else{
        sideMenuOpen = false
        temp.animate(
            {
                transform: [
                'translateX(-100%)',  // 시작 값
                'translateX(0%)'  // 종료 값
                ]
            },
            {
                duration: duration,  // 밀리초 지정
                fill: 'forwards',  // 종료 시 속성을 지님
                easing: 'linear'  // 가속도 종류
            }
        );
    }
}

function GoLoginEvent(){
    location.href = "/planner/index.jsp"
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