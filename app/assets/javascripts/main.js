$(function () {
    var nowurl = $(location).attr('href');

    if(nowurl.indexOf("/contents") > 0){
        $('.m1').css("color","#646EAB");
        $('.m1').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/products") > 0){
        $('.m2').css("color","#646EAB");
        $('.m2').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/ranking") > 0){
        $('.m3').css("color","#646EAB");
        $('.m3').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/store") > 0){
        $('.m4').css("color","#646EAB");
        $('.m4').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/creatures") > 0){
        $('.m5').css("color","#646EAB");
        $('.m5').css("border-bottom","4px solid #646EAB");
    }


    if(nowurl.indexOf("/all") > 0){
        $('.m_m1').css("color","#646EAB");
        $('.m_m1').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/%EC%8A%A4%ED%82%A8%EC%BC%80%EC%96%B4") > 0){
        $('.m_m2').css("color","#646EAB");
        $('.m_m2').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/%ED%8E%98%EC%9D%B4%EC%8A%A4%EC%97%85") > 0){
        $('.m_m3').css("color","#646EAB");
        $('.m_m3').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/%ED%97%A4%EC%96%B4") > 0){
        $('.m_m4').css("color","#646EAB");
        $('.m_m4').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/%EB%B0%94%EB%94%94") > 0){
        $('.m_m5').css("color","#646EAB");
        $('.m_m5').css("border-bottom","4px solid #646EAB");
    }
    else{
        console.log("안됨 "+nowurl);
    }
});
