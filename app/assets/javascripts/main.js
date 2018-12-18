$(function () {
    var nowurl = $(location).attr('href');

    if(nowurl.indexOf("contents") == 22){
        $('.m1').css("color","#646EAB");
        $('.m1').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("products") == 22){
        $('.m2').css("color","#646EAB");
        $('.m2').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("ranking") == 22){
        $('.m3').css("color","#646EAB");
        $('.m3').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("store") == 22){
        $('.m4').css("color","#646EAB");
        $('.m4').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("creatures") == 22){
        $('.m5').css("color","#646EAB");
        $('.m5').css("border-bottom","4px solid #646EAB");
    }
    else{
        console.log(nowurl.indexOf("contents"));
    }
});