var imgCnt = 0;

function ProcessImg(){
    let selectFile = document.querySelector(".upload").files[0];
    var fReader = new FileReader()
    fReader.readAsDataURL(selectFile)
    fReader.onloadend=function(event){
        console.log(event.target.result)
        var imgContain =  document.createElement("img")
        imgContain.id = "uploadImage"+imgCnt
        document.getElementById("uploadImage"+imgCnt).src = event.target.result
    }
}