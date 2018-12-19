$(function () {
    var windowH = $(window).outerHeight();
    $('.container').css('min-height',windowH-330+'px')

    $(window).resize(function () { 
        var windowH = $(window).outerHeight();
        $('.container').css('min-height',windowH-330+'px');
        
    });


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
    else if(nowurl.indexOf("/skincare") > 0){
        $('.m_m2').css("color","#646EAB");
        $('.m_m2').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/faceup") > 0){
        $('.m_m3').css("color","#646EAB");
        $('.m_m3').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/hair") > 0){
        $('.m_m4').css("color","#646EAB");
        $('.m_m4').css("border-bottom","4px solid #646EAB");
    }
    else if(nowurl.indexOf("/body") > 0){
        $('.m_m5').css("color","#646EAB");
        $('.m_m5').css("border-bottom","4px solid #646EAB");
    }

    $('.signup_1').fadeIn(1000);
});
